'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets\AssetManifest.json": "b4d8bfd922da5c9dc6b7aa290d11680a",
"/assets\assets\fonts\OpenSans-ExtraBold.ttf": "fb7e3a294cb07a54605a8bb27f0cd528",
"/assets\assets\fonts\OpenSans-Regular.ttf": "3ed9575dcc488c3e3a5bd66620bdf5a4",
"/assets\assets\logo.png": "e92d75da68b0db510c0ce50855b2de47",
"/assets\FontManifest.json": "b3d1c9ea0c36fce7b56886e3213c291d",
"/assets\fonts\MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets\LICENSE": "512e08a124df968d4b5d3e09d9450e69",
"/assets\packages\cupertino_icons\assets\CupertinoIcons.ttf": "9a62a954b81a1ad45a58b9bcea89b50b",
"/index.html": "b54b58a8768c6821b4448ef7db9dfc46",
"/main.dart.js": "facc2e37994c1ec2a57b3c8eab9a56c0"
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
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
