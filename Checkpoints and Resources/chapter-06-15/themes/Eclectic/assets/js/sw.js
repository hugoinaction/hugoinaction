(function () {

  // Update 'version' if you need to refresh the cache
  const staticCacheName = 'static';
  const version = 'v1::';
  const OFFLINE_URL = '{{"/off/" | absURL }}';

  // Store core files in a cache (including a page to display when offline)
  //  {{- $cover := partial "util/backgroundImage.html" . -}}
  // {{- $coverDark := partial "util/backgroundImageDark.html" . }}
  function updateStaticCache() {
    const urls = [
      '{{"/" | absURL}}',
      '{{"/manifest.json" | absURL}}',
      /*{{- range $.res }} /**/
      '{{.}}',
      /* {{ end }} /**/
      '{{$cover.Permalink}}',
      '{{$coverDark.Permalink}}',
      OFFLINE_URL,
      /* {{- if (fileExists "assets/image/logo.svg") -}} /**/
      '{{ (resources.Get "image/logo.svg" | resources.Minify).Permalink }}',
      /* {{- else if (fileExists "assets/image/logo.png") -}} /**/
      '{{ (resources.Get "image/logo.png").Permalink }}',
      /* {{- end -}} /**/
      '{{"/index.json" | absURL}}'
    ];
    return caches.open(version + staticCacheName)
      .then((cache) =>  cache.addAll(urls)).catch(e => {
        console.log("Error = ", e);
        console.log(e.stack);
      });
  }

  self.addEventListener('install', (event) => event.waitUntil(updateStaticCache()));

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

  function offline() {
    return caches.match(OFFLINE_URL).then(x => x.text()).then(y => new Response(y, { "status": 200, headers: { 'Content-Type': 'text/html' } }));
  }

  self.addEventListener('fetch', function (event) {
    const request = event.request;
    // Always fetch non-GET requests from the network
    if (request.method !== 'GET') {
      return event.respondWith(fetch(request).catch(offline));
    }

    // For HTML requests, try the network first, fall back to the cache, finally the offline page
    if (request.headers.get('Accept').indexOf('text/html') !== -1) {
      event.respondWith(
        fetch(request)
          .then(function (response) {
            // Stash a copy of this page in the cache
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
                return response || offline()
              })
          })
      );
      return;
    }

    // For non-HTML requests, look in the cache first, fall back to the network
    event.respondWith(
      caches.match(request)
        .then(function (response) {
          return response || fetch(request)
            .catch(function () {
              // If the request is for an image, show an offline placeholder
              if (request.url.match(/\.(jpe?g|png|gif|svg)$/)) {
                return new Response('<svg role="img" aria-labelledby="offline-title" viewBox="0 0 400 225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"><title id="offline-title">Offline</title><path fill="rgba(145,145,145,0.5)" d="M0 0h400v225H0z" /><text fill="rgba(0,0,0,0.33)" font-family="Helvetica Neue,Arial,sans-serif" font-size="27" text-anchor="middle" x="200" y="113" dominant-baseline="central">Offline</text></svg>', { headers: { 'Content-Type': 'image/svg+xml' } });
              }
              return new Response('');
            });
        })
    );
  });

})();
