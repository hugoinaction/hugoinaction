import Fuse from 'fuse.js'
import AcmeSearchSupport from "SearchSupport"

let index = null;
export default {
  async init() {
    try {
      const response = await window.fetch(BASE_URL + "/index.json");
      if (!response.ok) {
        this.removeSearch();
        return;
      }
      let data = await response.json();
      index = new Fuse(data, {
        keys: [{
          name: 'title',
          weight: 20
        }, {
          name: 'tag',
          weight: 5
        }, {
          name: 'content'
        }]
      });
      // Just to test. Do not leave in code.
      console.log(index.search('acme'));
    } catch (e) {
      this.removeSearch();
    }
  },

  removeSearch() {
    document.querySelector("#search")?.remove();
  }
}
