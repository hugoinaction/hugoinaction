function addFormHandler() {
  document.addEventListener('submit', async event => {
    if (!event.target instanceof HTMLFormElement) { return; }
      event.preventDefault();
      const form = event.target;
      const data = new FormData(form);
      const action = form.action;
      const method = form.method;
      const response = await fetch(action, {
        method,
        body: data,
        headers: { 'Accept': 'application/json'}
      });
      if (response.ok) {
          form.insertAdjacentHTML('afterend',
            '<div class = "success">The form has been submitted.</div>');
      } else {
        form.insertAdjacentHTML('afterend',
          '<div class = "error">The form could not be submitted. Please try again later.</div>');
      }
      const message = form.nextElementSibling;
      form.reset();
      setTimeout(() => message.remove(), 10000);
  });
}

addFormHandler();
