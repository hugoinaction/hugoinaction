// AcmeTheme/assets/index.js
import FormHandler from "formHandler"
import Search from "./search"
import Store from "./store"

function init() {
  FormHandler.init();
  Search.init();
  router();
}

function router() {
  const location = new URL(window.location.href);
  if (location.pathname.match(/\/store\/.*/)) {
    Store.init();
    if (location.searchParams.purchase === "success") {
      // Show success screen
    }
  }

}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}
