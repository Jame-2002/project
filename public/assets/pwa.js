(()=>{
 if(window.__shifttrackPwa)return;window.__shifttrackPwa=true;
 const button=document.getElementById('install-app'),dialog=document.getElementById('install-help');let deferred;
 const installed=()=>window.matchMedia('(display-mode: standalone)').matches||window.navigator.standalone===true;
 if(installed())button.hidden=true;
 window.addEventListener('beforeinstallprompt',event=>{event.preventDefault();deferred=event;});
 window.addEventListener('appinstalled',()=>{deferred=null;button.hidden=true;dialog.close();});
 button.addEventListener('click',async()=>{if(deferred){const prompt=deferred;deferred=null;button.disabled=true;try{await prompt.prompt();await prompt.userChoice;}catch{dialog.showModal();}finally{button.disabled=false;}}else dialog.showModal();});
 if('serviceWorker' in navigator)navigator.serviceWorker.register('/sw.js',{scope:'/',updateViaCache:'none'}).catch(()=>{button.title='ดูวิธีเพิ่มไปยังหน้าจอหลัก';});
})();
