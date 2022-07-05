import Fuse from 'fuse.js'
import AcmeSearchSupport from "SearchSupport"

let index = null;
const MAX_SEARCH_RESULTS = 5;

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
      document.addEventListener("input", this.showResults);
      AcmeSearchSupport(); 
    } catch (e) {
      this.removeSearch();
    }
  },

  showResults(event) {
    const searchBox = document.querySelector("#search input");
    if (event.target !== searchBox) {
      return;
    }
    const result = document.querySelector("#search div");
    if (searchBox.value.length > 0) {
      const results = index.search(searchBox.value);
      result.innerHTML = results
        .slice(0, MAX_SEARCH_RESULTS)
        .map(x => `<a href="${x.item.url}">
          <img src="${x.item.cover || ""}" width="40" height="40">
          <h3>${x.item.title}</h3>
          <span>${x.item.content.substr(0,40)}</span>
        </a>`)
        .join("");
    } else {
      result.innerHTML = '';
    }
  },

  removeSearch() {
    document.querySelector("#search")?.remove();
  }
}
