import { matchTemplate } from "./util"

let cart = [];
let products = {};
let stripe = undefined;

export default {
  async init() {
    // Import stripe.
    const s = document.createElement('script');
    s.setAttribute('src', "https://js.stripe.com/v3/");
    s.onload = () => {
      stripe = Stripe("pk_test_51HzWldGtPsFUGVMkhc6CpV68fwK7E4dzvI6m9Q2RsTA92TBB7AD0NDxnGdgG1jbP65eWz89KTMs8x2tE8mwuS7uN003Q3yiak0");
    };
    s.defer = true;
    document.body.appendChild(s);

    this.template = document.querySelector("#cart-item").innerHTML;
    this.badge = document.querySelector(".cart .badge");
    document.querySelectorAll(".addToCart").forEach(add => {
      add.addEventListener("click", (e) => {
        e.preventDefault();
        const data = new FormData(add.form);
        const name = data.get("name");
        const color = data.get("color");
        if (!cart.find(x => x.name === name && x.color === color)) {
          cart.push({ name, color });
        }
        this.render();
        this.save();
      });
    });
    document.querySelectorAll(".buyNow").forEach(buy => {
      buy.addEventListener("click", (e) => {
        e.preventDefault();
        const data = new FormData(buy.form);
        this.onCheckout([{ name: data.get("name"), color: data.get("color") }], true);
      })
    });
    await this.productInfo();
    window.addEventListener('storage', this.updateCart.bind(this));
    this.updateCart();
  },

  updateCart() {
    const disk = JSON.parse(window.localStorage.getItem("cart") || "[]");
    cart= Array.isArray(disk) ? disk : [];
    this.render();
  },

  async onCheckout(data =cart, retain = false) {
    try {
      const url = NETLIFY ? new URL(window.location.origin + "/.netlify/functions/checkout") : new URL("https://hugoinaction.herokuapp.com/checkout");
      data.forEach(x => url.searchParams.append("products", `${x.name}_${x.color}`));

      url.searchParams.append("success", encodeURIComponent(window.location.pathname + `?purchase=success&retain=${retain}`));

      url.searchParams.append("cancel", encodeURIComponent(window.location.pathname + "?purchase=cancel"));

        const response = await window.fetch(url.href);

      if (response.ok) {
        const resp = await response.json();
        stripe.redirectToCheckout({ sessionId: resp.sessionId });
      }

    } catch (e) {
      console.log("Error", e);
    }
  },

  async productInfo() {
    const response = await window.fetch(BASE_URL + "/store/index.json");
    if (response.ok) {
      products = await response.json();
    }
  },

  save() {
    window.localStorage.setItem("cart", JSON.stringify(cart));
  },

  onDelete: function (e) {
    cart.splice(cart.findIndex(x =>
      x.name == e.currentTarget.dataset.name && x.color === e.currentTarget.dataset.color
    ), 1);
    this.render();
    this.save();
  },

  render() {
    this.badge.innerText =cart.length;
    if (cart.length === 0) {
      document.querySelector(".cart").classList.remove("visible");
    } else {
      document.querySelector(".cart").classList.add("visible");
    }

    try {

      const info =cart.map(x => ({ ...x, price: parseFloat(products[x.name].price.substr(1)), cover: products[x.name].cover }));

      if (info.length > 0) {
        // Find the prices.
        document.querySelector(".cart > div").innerHTML = `
            ${info.map(x => matchTemplate(this.template, Object.entries(x))).join("\n")}
            <button id="checkout">Checkout</button>
          `;
        for (let del of document.querySelectorAll(".cart .delete")) {
          del.addEventListener("click", this.onDelete.bind(this));
        }
        document.querySelector("#checkout").addEventListener("click", () => this.onCheckout());
      }
    } catch (e) {
      console.error(e)
      document.querySelector(".cart > div").innerHTML = `We have an error. Please contact customer support`;
  }
  },

  async handleSuccess() {
    const url = new URL(window.location.href);
    if (url.searchParams.get("retain") === "false") {
      cart.length = 0;
      this.save();
    }
    (document.querySelector(".intro") || document.querySelector(".content")).insertAdjacentHTML("beforebegin", '<div class="alert"><div class="head">Order Confirmed.</div> You should receive an email within the next 10 hours with your digital purchase.<br> <small>In case of any issues please contact customer support.</small></div>');

    url.searchParams.delete("purchase");
    url.searchParams.delete("retain");
    window.history.replaceState(null, "", url);
  }
}
