const CACHE='shifttrack-offline-v1';
const FALLBACK='/offline.html';
self.addEventListener('install',event=>{event.waitUntil(caches.open(CACHE).then(cache=>cache.addAll([FALLBACK,'/assets/pwa/icon-192.png'])).then(()=>self.skipWaiting()));});
self.addEventListener('activate',event=>{event.waitUntil(caches.keys().then(keys=>Promise.all(keys.filter(key=>key.startsWith('shifttrack-offline-')&&key!==CACHE).map(key=>caches.delete(key)))).then(()=>self.clients.claim()));});
self.addEventListener('fetch',event=>{
 const request=event.request,url=new URL(request.url);
 // Never cache APIs, account data, schedules, uploads, or authenticated pages.
 if(request.method!=='GET'||url.origin!==self.location.origin||url.pathname==='/api.php'||request.mode!=='navigate')return;
 event.respondWith(fetch(request).catch(()=>caches.match(FALLBACK).then(page=>page||new Response('กรุณาเชื่อมต่ออินเทอร์เน็ต',{status:503,headers:{'Content-Type':'text/plain; charset=utf-8'}}))));
});
