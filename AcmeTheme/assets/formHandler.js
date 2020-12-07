export default {
  init() {
    document.querySelectorAll("[data-dynamic-form]")
      .forEach(async form => form.addEventListener('submit', async event => {
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
            for (let pair of  data) {
              let key = pair[0], value = pair[1];
              content = content.replaceAll(`[[${key}]]`,value);
            }
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
      }));
  }
};
