// AcmeTheme/assets/index.js
import FormHandler from "formHandler"
import Search from "./search"

function init() {
  FormHandler.init();
  Search.init();

}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}
