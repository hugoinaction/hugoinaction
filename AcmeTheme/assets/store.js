const disk = JSON.parse(window.localStorage.getItem("store") || "[]");
const store = Array.isArray(disk) ? disk : [];
const stripe = Stripe("pk_test_51HzWldGtPsFUGVMkhc6CpV68fwK7E4dzvI6m9Q2RsTA92TBB7AD0NDxnGdgG1jbP65eWz89KTMs8x2tE8mwuS7uN003Q3yiak0");

let products = {};

export default {
  async init() {
    this.template = document.querySelector("#cart-item").innerHTML;
    this.badge = document.querySelector(".cart .badge");
    document.querySelectorAll(".addToCart").forEach(add => {
      add.addEventListener("click", () => {
        const name = add.dataset.name;
        // Find the color from the select element.
        let sibling = add.previousSibling;
        while (sibling) {
          if (sibling instanceof HTMLSelectElement) {
            break;
          }
          sibling = sibling.previousSibling;
        };
        let color = "";
        if (sibling) {
          color = sibling.value;
        }
        if (!store.find(x => x.name === name && x.color === color)) {
          store.push({ name, color });
        }
        this.render();
        this.save();
      });
    });
    await this.productInfo();
    this.render();
  },

  buyNow() {

  },

  async onCheckout() {
    try {
      const url = new URL(window.location.origin + "/.netlify/functions/checkout");
      this.store.forEach(x => url.searchParams.append("products", `${x.name},${x.color}`));

      url.searchParams.append("success", encodeURIComponent(window.location.pathname + "?purchase=success"));

      url.searchParams.append("cancel", encodeURIComponent(window.location.pathname + "?purchase=cancel"));

      if (NETLIFY === true) {
        const response = await window.fetch(url.href);

        if (response.ok) {
          const resp = await response.json();
          stripe.redirectToCheckout({ sessionId: resp.sessionId });

        }
      }
    } catch (e) {
      // TODO
      console.log("Error");
    }
  },

  async productInfo() {
    const response = await window.fetch(BASE_URL + "/store/index.json");
    if (response.ok) {
      products = await response.json();
    }
  },

  save() {
    window.localStorage.setItem("store", JSON.stringify(store));
  },

  matchTemplate(content, data) {
    for (let pair of data) {
      let key = pair[0], value = pair[1];
      content = content.replaceAll(`[[${key}]]`, value);
    }
    return content;
  },

  onDelete: function (e) {
    store.splice(store.findIndex(x =>
      x.name == e.currentTarget.dataset.name && x.color === e.currentTarget.dataset.color
    ), 1);
    this.render();
    this.save();
  },

  render() {
    this.badge.innerText = store.length;
    if (store.length === 0) {
      document.querySelector(".cart").classList.remove("visible");
    } else {
      document.querySelector(".cart").classList.add("visible");
    }

    try {

      const info = store.map(x => ({ ...x, price: parseFloat(products[x.name].price.substr(1)), cover: products[x.name].cover }));

      if (info.length > 0) {
        // Find the prices.
        document.querySelector(".cart > div").innerHTML = `
            ${info.map(x => this.matchTemplate(this.template, Object.entries(x))).join("\n")}
            <a href="${BASE_URL}/store/checkout"><button id="checkout">Checkout</button></a>
          `;
        for (let del of document.querySelectorAll(".cart .delete")) {
          del.addEventListener("click", this.onDelete.bind(this));
        }
        document.querySelector("#checkout").addEventListener("click", this.onCheckout.bind(this));
      }
    } catch (e) {
      console.error(e)
      document.querySelector(".cart > div").innerHTML = `We have an error. Please contact customer support`;
  }
  }
}
