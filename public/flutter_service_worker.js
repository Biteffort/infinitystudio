'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "37783f97a5a4aea61b9dd830e39e91ff",
"/": "37783f97a5a4aea61b9dd830e39e91ff",
"main.dart.js": "fca1fabb6175320adc2e77b4ea60ff78",
"favicon.png": "582a214fef8e937b6b69b45bba2119a9",
"icons/Icon-192.png": "582a214fef8e937b6b69b45bba2119a9",
"icons/logo_one.png": "582a214fef8e937b6b69b45bba2119a9",
"icons/Icon-512.png": "582a214fef8e937b6b69b45bba2119a9",
"manifest.json": "bb65c73f33f3ab3f859526fb405aac53",
"assets/LICENSE": "0000d255865246c9b55862d96ffd3089",
"assets/AssetManifest.json": "c3df3b384d487e7bc703c10d7cec6f55",
"assets/FontManifest.json": "f612464f10b95cce64d52adb95964172",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/images/two.png": "02d397aacd45759f2aa3bbf185ed14b6",
"assets/assets/images/logo_one.png": "582a214fef8e937b6b69b45bba2119a9",
"assets/assets/images/logo.png": "49be8373e1c51047a09f5d77bb5d1d68",
"assets/assets/images/one.png": "4f825410af4b0d81fbdf0724b2a1a6ef",
"assets/assets/fonts/SourceSansPro.ttf": "5c6c404eca1aa7c5951e05d7f2cf40eb"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
