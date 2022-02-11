import * as params from '@params';

(function () {
  // Update 'version' if you need to refresh the cache
  const staticCacheName = 'static';
  const version = 'v1::';

  function updateStaticCache() {
    const urls = params.pages;
    return caches.open(version + staticCacheName)
      .then((cache) => cache.addAll(urls))
      .catch(e => {
        console.log("Error", e);
      });
  }
  self.addEventListener('activate', function (event) {
    event.waitUntil(
      caches.keys()
        .then(function (keys) {
          // Remove caches whose name is no longer valid
          return Promise.all(keys
            .filter((key) => key.indexOf(version) !== 0)
            .map((key) => caches.delete(key))
          );
        })
    );
  });

  self.addEventListener('install', (event) => event.waitUntil(updateStaticCache()));

  const OFFLINE_URL = "/offline";

  function offline(status = 200) {
    return caches.match(OFFLINE_URL).then(x => x.text()).then(y => new Response(y, { status, headers: { 'Content-Type': 'text/html' } }));
  }

  self.addEventListener('fetch', function (event) {
    const request = event.request;

    if (request.method !== 'GET') {
      return event.respondWith(fetch(request).catch(() => offline(400)));
    }

    if (request.headers.get('Accept').indexOf('text/html') !== -1) {
      event.respondWith(
        fetch(request)
          .then(function (response) {
            const copy = response.clone();
            caches.open(version + staticCacheName)
              .then(function (cache) {
                cache.put(request, copy);
              });
            return response;
          })
          .catch(function () {
            return caches.match(request)
              .then(function (response) {
                return response || offline(200)
              })
          })
      );
      return;
    }

    event.respondWith(
      caches.match(request)
        .then(function (response) {
          return response || fetch(request)
            .catch(function () {
              // If the request is for an image, show an offline placeholder
              if (request.url.match(/\.(jpe?g|png|gif|svg)$/)) {
                return new Response(`<svg role="img" aria-labelledby="offline" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <defs>
        <pattern id="textstripe" patternUnits="userSpaceOnUse" width="200" height="150" patternTransform="rotate(-45)">
            <text y="100" fill="rgba(0,0,0,0.33)" font-size="40">Offline</text>
        </pattern>
    </defs>
<rect width="100%" height="100%" fill="rgba(145,145,145,0.5)" stroke="rgba(0,0,0,0.33)" stroke-width="3"/>
<rect width="100%" height="100%" fill="url(#textstripe)" />
</svg>
`, { headers: { 'Content-Type': 'image/svg+xml' } });
              }
              return new Response('');
            });
        })
    );
  });
})();
