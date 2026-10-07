import fs from 'node:fs';
const html=fs.readFileSync('public/shifttrack.html','utf8'),js=fs.readFileSync('public/assets/app.js','utf8');const ids=[...html.matchAll(/\bid="([^"]+)"/g)].map(m=>m[1]);if(new Set(ids).size!==ids.length)throw Error('Duplicate UI IDs');
for(const text of ['Demo87654321','DemoAdmin87654321','id="demo-init"','id="recovery-dialog"'])if(html.includes(text))throw Error('Demo credential/setup UI still present');
for(const id of ['training-personal-save','training-admin-save','recover-form','lookup-question','question-form'])if(!ids.includes(id))throw Error('Missing control '+id);
if(/setInterval\(/.test(js))throw Error('Periodic refresh restored');if(!js.includes("b=f.querySelector('button[type=submit],button:not([type])')"))throw Error('Form submit selector unsafe');
console.log('Release UI checks passed: unique controls, no public Demo credentials, explicit saves');
