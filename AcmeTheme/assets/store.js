const disk = JSON.parse(window.localStorage.getItem("store") || "[]");

const store = Array.isArray(disk) ? disk : [];
let products = {};

export default {
  async init() {
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

  render() {
    this.badge.innerText = store.length;
    if (store.length === 0) {
      this.badge.classList.remove("visible");
    } else {
      this.badge.classList.add("visible");
    }

    try {

      const info = store.map(x => ({ ...x, price: parseFloat(products[x.name].price.substr(1)), cover: products[x.name].cover }));

      if (info.length > 0) {
        // Find the prices.
        document.querySelector(".cart > div").innerHTML = `
            ${info.map(x => `<div class="item">
            <img src="${x.cover}">
            <div class="details">
              <span class="name">${x.name}</span>
              <span style="background-color:${x.color}" class="color"></span>
            </div>
            <span class="price">$ ${x.price.toFixed(2)}</span></div>`).join("\n")}
            <a href="/checkout"><button class="checkout">Checkout</button></a>
          `;
      }
    } catch (e) {
      document.querySelector(".cart > div").innerHTML = `We have an error. Please contact customer support`;
  }
  }
}
