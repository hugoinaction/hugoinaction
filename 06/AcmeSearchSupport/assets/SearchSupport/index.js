const SearchSupport = () => {
  let selected = undefined;

  // In case there text already in search box (like when you refresh the page),
  // on hover, trigger the input event.
  document.addEventListener("focusin", e=> {
    const searchBox = document.querySelector("#search input");
    if (event.target === searchBox) {
      searchBox.dispatchEvent(new Event("input", {bubbles: true}));
    }
  });

  // Keyboard handling
  document.addEventListener("keyup", e => {
    const searchBox = document.querySelector("#search input");
    if (event.target !== searchBox) {
      return;
    }
    switch (event.key) {
      case 'ArrowDown':
        if (selected) {
          selected.classList.remove("selected");
          selected = selected.nextElementSibling;
        } else {
          selected = document.querySelectorAll("#search a")[0];
        }
        if (selected) {
          selected.classList.add("selected");
        }
        break;
      case 'ArrowUp':
        if (selected) {
          selected.classList.remove("selected");
          selected = selected.previousElementSibling;
        } else {
          const x = document.querySelectorAll("#search a");
          selected = x[x.length - 1] ;
        }
        if (selected) {
          selected.classList.add("selected");
        }
        break;
      case 'Escape':
        searchBox.blur();
        break;
      case 'Enter':
        (selected || document.querySelector("#search a"))?.click();
        break;
      }
  });
};

export default SearchSupport;
