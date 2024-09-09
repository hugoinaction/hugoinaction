// Wrap in an IFFE.
(() => {
  ///////////////////////////////////////////
  // Remove the no-js class from the html tag that is meant for the noscript mode.
  ///////////////////////////////////////////
  document.getElementsByTagName('html')[0].classList.remove('no-js');

  ///////////////////////////////////////////
  // Log for fellow developers.
  ///////////////////////////////////////////
  console.info(`%c Welcome to ${document.location.hostname}`, "padding:20px;  font: 38px Impact, sans-serif; color: #ddd; text-shadow: 0 1px 1px #bbb,0 2px 0 #999, 0 3px 0 #888, 0 4px 0 #777, 0 5px 0 #666, 0 6px 0 #555, 0 7px 0 #444, 0 8px 0 #333, 0 9px 7px #302314;");
  console.info("If you find something cool and would like to learn more, please contact me using the contact page. Will love to hear from a fellow developer");

  ///////////////////////////////////////////
  // Convert date to hours from now
  ///////////////////////////////////////////
  function getAgoTime(value) {
    if (!value) { return ""; }
    const d = new Date(value.trim());
    const now = new Date();
    const seconds = Math.round(Math.abs((now.getTime() - d.getTime()) / 1000));
    const minutes = Math.round(Math.abs(seconds / 60));
    const hours = Math.round(Math.abs(minutes / 60));
    const days = Math.round(Math.abs(hours / 24));
    const months = Math.round(Math.abs(days / 30.416));
    const years = Math.round(Math.abs(days / 365));
    if (seconds <= 45) {
      return 'a few seconds ago';
    } else if (seconds <= 90) {
      return 'a minute ago';
    } else if (minutes <= 45) {
      return minutes + ' minutes ago';
    } else if (minutes <= 90) {
      return 'an hour ago';
    } else if (hours <= 22) {
      return hours + ' hours ago';
    } else if (hours <= 36) {
      return 'a day ago';
    } else if (days <= 25) {
      return days + ' days ago';
    } else if (days <= 45) {
      return 'a month ago';
    } else if (days <= 345) {
      return months + ' months ago';
    } else if (days <= 545) {
      return 'a year ago';
    } else { // (days > 545)
      return years + ' years ago';
    }
  }
  document.addEventListener("DOMContentLoaded", () => {
    Array.from(document.getElementsByTagName('time')).forEach((x) => {
      if (x.className === 'now') {
        x.innerText = new Date().getFullYear();
      } else {
        x.innerText = getAgoTime(x.getAttribute('datetime'));
      }
      // TODO: Attach event listener to update the string here.
    });
  });

  ///////////////////////////////////////////
  // Contact Us form
  ///////////////////////////////////////////
  const contact = document.getElementById("contact-us-form");
  if (contact) {
    contact.addEventListener("submit", (e) => {
      e.preventDefault();
      fetch(contact.getAttribute("action") || window.location.pathname, {
        method: 'POST',
        body: new FormData(contact)
      }).then(response => {
        // Remove contact and add Thank You.
        const div = document.createElement('div');
        div.className = "contact-response";
        if (response.ok) {
          div.innerHTML = 'Thank you';
        } else {
          div.innerHTML = 'There was an error sending this message. Please try again later'
        }
        contact.parentNode && contact.parentNode.replaceChild(div, contact);
      })
    })
  }

  ///////////////////////////////////////////
  // Header
  ///////////////////////////////////////////
  // Inspired by https://www.sysleaf.com/js-toggle-header-on-scroll/
    const consideredTop = 200;
    const height = document.documentElement.clientHeight;
    let lastKnownScrollY = 0;
    let currentScrollY = 0;
    let ticking = false;
    let eleHeader = null;
    let eleCheckbox = null;
    let eleScroll = null;
    let eleSearch = null;
    let hitCount = 0;
    const classes = {
      pinned: 'header-pin',
      unpinned: 'header-unpin',
    };
    function updateScrollPosition() {
      let winScroll = document.body.scrollTop || document.documentElement.scrollTop;
      let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
      let scrolled = (winScroll / height) * 100;
      document.getElementById("scroll-indicator").style.width = scrolled + "%";
    }
    function onScroll() {
      currentScrollY = window.pageYOffset;
      requestAnimationFrame(updateScrollPosition);
      requestTick();
    }
    function requestTick() {
      if (eleCheckbox.checked || eleSearch === document.activeElement) {
        return;
      }
      if (!ticking) {
        requestAnimationFrame(update);
      }
      ticking = true;
    }
    function update() {
      ticking = false;
      if (eleCheckbox.checked) {
        return;
      }
      // Scroll to top hiding.
      if (currentScrollY > 2 * height) {
        if (!eleScroll.classList.contains('visible')) {
          eleScroll.classList.add('visible');
        }
      } else {
        if (eleScroll.classList.contains('visible')) {
          eleScroll.classList.remove('visible');
        }
      }
      // Header hiding
      // Ignore first 2 hits for safari reload in the center of the page
      // It is good enough with 2. First is the Js load,
      // Second is safari's scroll to position.
      if (hitCount > 2) {
        if (currentScrollY + height >= document.documentElement.scrollHeight || currentScrollY < consideredTop) {
          pin();
        } else if (currentScrollY < lastKnownScrollY) {
          pin();
        } else if (currentScrollY > lastKnownScrollY) {
          unpin();
        }
      }
      lastKnownScrollY = currentScrollY;
      hitCount++;
    }
    function pin() {
      if (eleHeader.classList.contains(classes.unpinned)) {
        eleHeader.classList.remove(classes.unpinned);
        eleHeader.classList.add(classes.pinned);
        eleScroll.classList.remove('unpin');
      }
    }
    function unpin() {
      if (eleHeader.classList.contains(classes.pinned) || !eleHeader.classList.contains(classes.unpinned)) {
        eleHeader.classList.remove(classes.pinned);
        eleHeader.classList.add(classes.unpinned);
        eleScroll.classList.add('unpin');
      }
    }

    document.addEventListener("DOMContentLoaded", () => {
      eleCheckbox = document.getElementsByClassName('hamburger')[0];
      eleSearch = document.querySelector('#searchbox input');
      eleHeader = document.getElementById('header');
      eleScroll = document.querySelector('.scroll-up');
      document.addEventListener('scroll', onScroll, false);
    });

  ///////////////////////////////////////////
  // Color Picker
  ///////////////////////////////////////////
  let color = window.localStorage.color || '#DC2626';
  function setColor(hex) {
    color = hex;
    window.localStorage.color = color;
    document.documentElement.style.setProperty("--theme-color", hex);
  }
  document.querySelectorAll('.theme-choice').forEach(s => {
    s.addEventListener('click', e => {
      const color = e.target.getAttribute('data-color');
      setColor("#" + color);
    });
  });

  const colorSelector = document.querySelector('.custom-color');
  if (colorSelector) {
    colorSelector.addEventListener('click', evt => {
      evt.preventDefault();
      const x = document.createElement("input");
      x.setAttribute("type", "color");
      x.value = color;
      x.click();
      x.addEventListener('input', () => {
        setColor(x.value);
      })
    });
  }

  const checkbox = document.querySelector('#color-switch');
  if (checkbox) {
    checkbox.checked = document.documentElement.classList.contains("dark");
    const handler = () => {
      if (checkbox.checked) {
        document.documentElement.classList.add("dark");
      } else {
        document.documentElement.classList.remove("dark");
      }
      window.localStorage.dark = checkbox.checked ? "true" : "false";
    };
    checkbox.addEventListener("change", handler);
  }

  ///////////////////////////////////////////
  // Search
  ///////////////////////////////////////////
  //
  ///////////////////////////////////////////
  // Service Worker
  ///////////////////////////////////////////
  /**/

  ////////////////////////////////////////////////////////
  // Link Pre-fetching to improve perceptible load times.
  ////////////////////////////////////////////////////////
  Array.from(document.querySelectorAll('a')).forEach((link) => {
    let prefetchComplete = false;

    const prefetch = () => {
      if (prefetchComplete) {
        return;
      }
      prefetchComplete = true;
      if (link.href.includes('mailto')) {
        return;
      }
      if (link.href.includes('http') && new URL(link.href).host !== new URL(window.location.href).host) {
        return;
      }
      if (link.href === window.location.href) {
        return;
      }
      const loader = document.createElement("link");
      loader.rel = "prefetch";
      loader.as = "document";
      loader.type = "text/html";
      loader.href = link.href;
      document.head.appendChild(loader);
    };
    link.addEventListener("mouseenter", prefetch, { passive: true });
    link.addEventListener("touchstart", prefetch, { passive: true });
  });

  ///////////////////////////////////////////
  // Intersection Observer for animations
  ///////////////////////////////////////////
  // Scroll animations for iPad and bigger
  if (window.innerWidth >= 768) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(x => {
        if (x.isIntersecting && !x.target.classList.contains('visible')) {
          x.target.classList.add('visible');
        }
        if (x.target.classList.contains('visible')) {
          observer.unobserve(x.target);
        }
      });
    });
    ['.left-image', '.meta.default .item', '.item-icon-left .item', '.meta.default', '.max-2', '.max-2 .item', '.filter', '.filter .item',
      '.blog', '.blog .item', 'footer .items', '.contact', '.more', '.comments', '.comments form',
      '.item-icon-left', '.full-width', '.full-width .item'].forEach(s => {

        document.querySelectorAll(s).forEach(x => {
          const rect = x.getBoundingClientRect();
          // All elements above the scroll are visible by default.
          //  We only animate and scroll down.
          if (rect.y < 0) {
            x.classList.add('visible');
          } else {
            observer.observe(x);
          }
        });
      });
  } else {
    // For mobile the hover animations
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(x => {
        if (x.isIntersecting && !x.target.classList.contains('hover')) {
          x.target.classList.add('hover');
        } else if (!x.isIntersecting && x.target.classList.contains('hover')) {
          x.target.classList.remove('hover')
        }
      });
    }, {
        rootMargin: "-20% 0px -70% 0px"
      });
    ['p', 'li', '.meta .content', '.meta .item-cover', '.item-icon', '.main-icon', '.banner-holder', '.img-container', '.tex', '.i-tex', '.post aside svg', '.meta.carousel .item'].forEach(s => {
      document.querySelectorAll(s).forEach(x => {
        observer.observe(x);
      });
    });
  }
})();


