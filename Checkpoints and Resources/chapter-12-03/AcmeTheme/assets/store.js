let cart = [];
let products = {};

export default {
  async init() {
    document.addEventListener("click", this.handleClick.bind(this));
    window.addEventListener('storage', this.updateCart.bind(this));
    await this.productInfo();
    this.updateCart();
  },

  handleClick(event) {
    if (event.target.classList.contains("addToCart")) {
      event.preventDefault();
      this.addToCart(event.target.form);
    } else if (event.target.matches("#cart .delete")) {
      this.onDelete(event);
    }
  },

  addToCart(form) {
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
      x.name == e.target.dataset.name && x.color === e.target.dataset.color
    ), 1);
    this.render();
    this.save();
  },

  render() {
    let badge = document.querySelector("#cart .badge");
    let itemList = document.querySelector("#cart > div ");
    if (badge) {
      badge.innerText = cart.length || "";
    }
    if (!products || !Object.keys(products).length) {
      return;
    }

    const info = cart.map(x => ({
      ...x, price: parseFloat(products[x.name].Price),
      cover: products[x.name].Cover
    }));

    if (itemList) {
      itemList.innerHTML = info
        .map(x => `<div class="item">
          <img src="${x.cover}" lazy="true" width="40px">
          <div class="details">
            <h3>${x.name}</h3>
            <div class="color ${x.color}"></div>
            <a class="delete" data-name="${x.name}" data-color="${x.color}">Delete</a>
          </div>
          <div class="price">$${x.price.toFixed(2)}</div>
        </div>`).join("\n")
        +
        `<div class="empty">
          Please add some items to the cart.
        </div>`;
    }
  }
}
