
const disk = JSON.parse(window.localStorage.getItem("store") || "[]");

const store = Array.isArray(disk) ? disk : [];

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
            <a href="${BASE_URL}/store/checkout"><button class="checkout">Checkout</button></a>
          `;
        for (let del of document.querySelectorAll(".cart .delete")) {
          del.addEventListener("click", this.onDelete.bind(this));
        }
      }
    } catch (e) {
      console.error(e)
      document.querySelector(".cart > div").innerHTML = `We have an error. Please contact customer support`;
  }
  }
}
