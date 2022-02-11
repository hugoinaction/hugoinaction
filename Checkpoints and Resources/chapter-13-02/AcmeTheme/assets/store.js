let cart = [];
let products = {};
let stripe = undefined;

export default {
  async init() {
    const s = document.createElement('script');
    s.setAttribute('src', "https://js.stripe.com/v3/");
    s.onload = () => { 
      stripe = Stripe("pk_test_51HzWldGtPsFUGVMkhc6CpV68fwK7E4dzvI6m9Q2RsTA92TBB7AD0NDxnGdgG1jbP65eWz89KTMs8x2tE8mwuS7uN003Q3yiak0"); 
    };
    s.defer = true; 
    document.body.appendChild(s); 

    document.addEventListener("click", this.handleClick.bind(this));
    window.addEventListener('storage', this.updateCart.bind(this));
    await this.productInfo();
    this.updateCart();

    const location = new URL(window.location.href);
    if (location.searchParams.get("purchase") === "success") {
      if (!location.searchParams.get("retain")) {
        cart.length = 0; 
        this.save();
      }
      document.body.insertAdjacentHTML("beforeend", `
      <div class="alert success">
        <div class="head">Order Confirmed.</div> 
        Your product will be e-mailed soon.
        <a class="close" href="#">Close</a>
      </div>`); 
      location.searchParams.delete("purchase");
      location.searchParams.delete("retain");
      window.history.replaceState(null, "", location); 
      document.querySelector(".alert.success .close").addEventListener("click", e => {
        document.body.removeChild(document.querySelector(".alert.success"));
        e.preventDefault();
      });
      setTimeout(() => {
        document.body.removeChild(document.querySelector(".alert.success"));
      }, 5000);
    }
  },

  handleClick(event) {
    if (event.target.classList.contains("addToCart")) {
      event.preventDefault();
      this.addToCart(event.target.form);
    } else if (event.target.classList.contains("buyNow")) {
      event.preventDefault();
      const data = new FormData(event.target.form);
      this.onCheckout([{ name: data.get("name"), color: data.get("color") }], true);
    } else if (event.target.matches("#cart .delete")) {
      this.onDelete(event);
    } else if (event.target.id === "checkout") { 
      this.onCheckout();
    }
  },

  async onCheckout(data = cart, retain = false) { 
    try {
      const url = NETLIFY ? new URL(window.location.origin + "/.netlify/functions/checkout")
                          : new URL("https://hugoinaction.herokuapp.com/checkout");
      data.forEach(x => url.searchParams.append("products", `${x.name}_${x.color}`));
      url.searchParams.append("success", encodeURIComponent(window.location.pathname + `?purchase=success&retain=${retain}`));
      url.searchParams.append("cancel", encodeURIComponent(window.location.pathname + "?purchase=cancel"));
      const response = await window.fetch(url.href);
      if (response.ok) {
        const resp = await response.json(); 
        stripe.redirectToCheckout({
          sessionId: resp.sessionId
        });
      }
    } catch (e) { 
      console.log("Error", e);
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
        </div>
        <button id="checkout">Checkout</button>`;
    }
  }
}
