export default {
  init() {
    document.addEventListener('submit', async event => {
      if (event.target?.dataset?.dynamicForm === undefined) { return; }
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
          form.insertAdjacentHTML('afterend',
            document.querySelector(form.dataset.success).innerHTML);
        } else {
          form.insertAdjacentHTML('afterend',
            document.querySelector(form.dataset.error).innerHTML);
        }
        const message = form.nextElementSibling;
        form.reset();
        setTimeout(() => message.remove(), 10000);
      });
  }
};
