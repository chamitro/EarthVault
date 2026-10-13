// EarthVault service worker: network-first for the page so updates and fresh data win,
// cache fallback for offline. Bump CACHE_NAME whenever the shell changes.
const CACHE_NAME = 'earthvault-v2';
const ASSETS = [
  'index.html',
  'manifest.json',
  'https://cdn.jsdelivr.net/npm/chart.js',
  'https://cdn.tailwindcss.com'
];

self.addEventListener('install', (e) => {
  self.skipWaiting();
  e.waitUntil(caches.open(CACHE_NAME).then(cache => cache.addAll(ASSETS).catch(() => null)));
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then(keys => Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (e) => {
  const req = e.request;
  if (req.method !== 'GET') return;
  const url = new URL(req.url);
  const isShell = req.mode === 'navigate' || url.pathname.endsWith('/index.html') || url.pathname.endsWith('/manifest.json') || ASSETS.includes(req.url);
  if (!isShell) return; // live API calls always go straight to the network
  e.respondWith(
    fetch(req).then(res => {
      const copy = res.clone();
      caches.open(CACHE_NAME).then(cache => cache.put(req, copy)).catch(() => null);
      return res;
    }).catch(() => caches.match(req))
  );
});
