'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "8eff1450ad5134cd1721007c1dc6eda0",
"/": "aea61929695f8ab942d0b4405dbec0c2",
"main.dart.js": "1fdf082e279545a041c69495284a48c2",
"favicon.png": "582a214fef8e937b6b69b45bba2119a9",
"icons/Icon-192.png": "582a214fef8e937b6b69b45bba2119a9",
"icons/logo_one.png": "582a214fef8e937b6b69b45bba2119a9",
"icons/Icon-512.png": "582a214fef8e937b6b69b45bba2119a9",
"manifest.json": "bb65c73f33f3ab3f859526fb405aac53",
"assets/LICENSE": "b656b1d6be297198da1be51a2dd6d466",
"assets/AssetManifest.json": "cb12ec5b041b2c3ab5f15ba83852c2bc",
"assets/FontManifest.json": "f612464f10b95cce64d52adb95964172",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/images/add.png": "bc0bda93c9ecac5dd95f3d641a2f9473",
"assets/assets/images/plus.png": "da16b791cc7074ff6f9c967f6b401ac1",
"assets/assets/images/two.png": "02d397aacd45759f2aa3bbf185ed14b6",
"assets/assets/images/buttons.png": "84ecbd799d5b9c5f46e084836e7de3c5",
"assets/assets/images/logo_one.png": "582a214fef8e937b6b69b45bba2119a9",
"assets/assets/images/3d_trans.png": "f0246830f956dc03a6ac8d7b07b3c505",
"assets/assets/images/logo.png": "49be8373e1c51047a09f5d77bb5d1d68",
"assets/assets/images/upload.png": "ffe97779662aa2599077d2b5e933cc4f",
"assets/assets/images/videos.png": "6fbd0ba19e550c3f8cd47ee2f0c48f1b",
"assets/assets/images/one.png": "4f825410af4b0d81fbdf0724b2a1a6ef",
"assets/assets/images/web.png": "436249f6440b1db953afbba7badfe416",
"assets/assets/images/texture.png": "2e711f29f608f021d255b7bfee186ca1",
"assets/assets/images/audio.png": "a1778b29e5b353c049f8cb5264a2e569",
"assets/assets/images/3dmodels.png": "d0ab627711bb0e2f4d93208dfaeebb75",
"assets/assets/images/text.png": "664f0d6e0febe15d7593f570a702a0c8",
"assets/assets/images/image.png": "fac0f23a787f9ecb16840bdaa428b63a",
"assets/assets/fonts/SourceSansPro.ttf": "5c6c404eca1aa7c5951e05d7f2cf40eb",
"app.js": "b0c561e372575a3f23bd7ec362540893",
"ThreejsSample/index.html": "aea61929695f8ab942d0b4405dbec0c2",
"ThreejsSample/js/GLTFExporter.js": "cf03a6b6c4303d54027806f6d73ba050",
"ThreejsSample/js/three.min.js": "968bded625343c81f1c60f08c21bceb0",
"ThreejsSample/js/ObjectLoader.js": "7dff276c9492c1309d415a23982d13d2",
"ThreejsSample/js/three.js": "2ae006d818a6f40bcafadb1904d228cc",
"ThreejsSample/js/TransformControls.js": "0f0cd234978ef5d5c68414d4f8ce89fb",
"ThreejsSample/js/GLTFLoader.js": "08f669c2bd8154e9701b0709386f5f94",
"ThreejsSample/js/OrbitControls.js": "8f640249670db873a352de2791bdbcd4",
"ThreejsSample/index%20-%20Copy.html": "2f202e1b9b48115974b0655f6b117707",
"ThreejsSample/.vs/slnx.sqlite": "7b3eeea5ef15445d194db4c5acea6e17",
"ThreejsSample/.vs/ProjectSettings.json": "dfea8ab09c8108ab159b6d8f203ead68",
"ThreejsSample/.vs/VSWorkspaceState.json": "9ccf670b64ef60f2d0f4912453d45389",
"ThreejsSample/Model/model.glb": "cda944139ecf0530af4ed8b687d9a118"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"/",
"index.html",
"assets/LICENSE",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(CORE);
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // If the URL is not the the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

