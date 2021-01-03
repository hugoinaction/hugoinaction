import { matchTemplate } from "./util"

export default {
  init() {
    document.addEventListener('submit', this.listener);
  },

  async listener(event) {
    if (event.target?.dataset?.dynamicForm === undefined) {
      return;
    }
    event.preventDefault();
    const form = event.target;
    const data = new FormData(form);
    const action = form.action;
    const method = form.method;
    const response = await fetch(action, {
      method,
      body: data,
      headers: { "Accept": "application/json" }
    });
    if (response.ok) {
      if (form.dataset.pre) {
        let content = document.querySelector(form.dataset.pre).innerHTML;
        content = matchTemplate(data, content);
        form.insertAdjacentHTML('beforebegin', content);
      }
      form.insertAdjacentHTML('afterend',
        document.querySelector(form.dataset.success).innerHTML);
    } else {
      form.insertAdjacentHTML('afterend',
        document.querySelector(form.dataset.error).innerHTML);
    }
    const message = form.nextElementSibling;
    if (REMOVE_FORM_ON_SUBMISSION) {
      form.remove();
    } else {
      form.reset();
      setTimeout(() => message.remove(), 10000);
    }
  }
};
