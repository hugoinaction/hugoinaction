import { matchTemplate } from "./util"

let cart = [];
let products = {};
let stripe = undefined;
let initialized = false;

export default {
  async init() {
    if (!initialized) {
      initialized = true;
      // Import stripe.
      const s = document.createElement('script');
      s.setAttribute('src', "https://js.stripe.com/v3/");
      s.onload = () => {
        stripe = Stripe("pk_test_51HzWldGtPsFUGVMkhc6CpV68fwK7E4dzvI6m9Q2RsTA92TBB7AD0NDxnGdgG1jbP65eWz89KTMs8x2tE8mwuS7uN003Q3yiak0");
      };
      s.defer = true;
      document.body.appendChild(s);
      document.addEventListener("click", (event) => {
        if (event.target.classList.contains("addToCart")) {
          event.preventDefault();
          this.addtoCart(event.target.form);
        } else if (event.target.classList.contains("buyNow")) {
          event.preventDefault();
          const data = new FormData(event.target.form);
          this.onCheckout([{ name: data.get("name"), color: data.get("color") }], true);
        } else if (event.target.id === "checkout") {
          this.onCheckout();
        }
      });
      await this.productInfo();
      window.addEventListener('storage', this.updateCart.bind(this));
    }
    this.updateCart();
  },

  addtoCart(form) {
    const data = new FormData(form);
    const name = data.get("name");
    const color = data.get("color");
    if (!cart.find(x => x.name === name && x.color === color)) {
      cart.push({ name, color });
    }
    this.render();
    this.save();
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
    this.render();
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
    let badge = document.querySelector(".cart .badge");
    let template = document.querySelector("#cart-item")?.innerHTML;
    if (badge) {
      badge.innerText = cart.length;
    }
    if (!products || !Object.keys(products).length) {
      return;
    }
    if (cart.length === 0) {
      document.querySelector(".cart")?.classList.remove("visible");
    } else {
      document.querySelector(".cart")?.classList.add("visible");
    }

    try {

      const info =cart.map(x => ({ ...x, price: parseFloat(products[x.name].price.substr(1)), cover: products[x.name].cover }));

      if (info.length > 0 && template) {
        // Find the prices.
        document.querySelector(".cart > div").innerHTML = `
            ${info.map(x => matchTemplate(template, Object.entries(x))).join("\n")}
            <button id="checkout">Checkout</button>
          `;
        for (let del of document.querySelectorAll(".cart .delete")) {
          del.addEventListener("click", this.onDelete.bind(this));
        }
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
