// AcmeTheme/assets/index.js
import FormHandler from "formHandler"

function init() {
  FormHandler.init();

}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}
