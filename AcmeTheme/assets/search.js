import Fuse from 'fuse.js'

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
      const index = new Fuse(data, {
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
      const searchBox = document.querySelector("#search input");
      const result = document.querySelector("#search div");

      function showResults() {
        result.style.display = "block";
        if (searchBox.value.length > 0) {
          const results = index.search(searchBox.value);
          result.innerHTML = results
            .slice(0, MAX_SEARCH_RESULTS)
            .map(x => `<a href="${x.item.url}">${x.item.title}</a>`)
            .join("");
        } else {
          result.innerHTML = '';
        }
      }

      searchBox.addEventListener("input", showResults);
      searchBox.addEventListener("keyup", event => {
        if (event.key === "Enter") {
          const results = index.search(searchBox.value);
          if (results.length > 0) {
            window.location = results[0].item.url;
          }
        }
      })
      searchBox.addEventListener("focusout", (e) => {
        setTimeout(() => result.style.display = "none", 100);

      });
      searchBox.addEventListener("focusin", showResults);
    } catch (e) {
      this.removeSearch();
    }
  },

  removeSearch() {
    document.querySelector("#search")?.remove();
  }
}
