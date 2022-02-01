export default {
  async init() {
    try {
      const response = await window.fetch("/index.json");
      if (!response.ok) {
        this.removeSearch();
        return;
      }
      let data = await response.json();
      // Just for debugging.
      console.log(data);
    } catch (e) {
      this.removeSearch();
    }
  },

  removeSearch() {
    document.querySelector("#search")?.remove();
  }
}
