import FormHandler from "formHandler"
import Search from "./search"
import Store from "./store"

function init() {
  FormHandler.init();
  Search.init();
  Store.init();
  if ('serviceWorker' in navigator && window.location.pathname !== '/offline') {
    const strings = JSON.parse(document.getElementById("js-strings") .content.textContent);
    navigator.serviceWorker.register(strings.serviceWorker, {scope: '/'});
  }
}

init();
