# ShiftTrack

เว็บตารางกะสำหรับทีม พร้อมค่ากะ อบรม เพื่อนร่วมกะ การนำเข้าภาพด้วย Tesseract และ PWA

เว็บปัจจุบัน: https://shifttrack-team.damatajanajuliae6762.chatgpt.site/

## ชุดสำรองนี้

เป็นสำเนาโค้ดฉบับที่เผยแพร่ (commit 29b637a229ab2cd9b06f0a8bf3c2559aa520b181) พร้อมเอกสารสำหรับเก็บใน GitHub ไม่รวมประวัติ Git เดิม ข้อมูลสมาชิก ตารางกะจริง เซสชัน รหัสผ่านผู้ดูแล หรือไฟล์เครื่องมือภายในเครื่อง

## โครงสร้าง

- app/ : หน้าเว็บและ API ฝั่งเซิร์ฟเวอร์ รวมสิทธิ์บัญชีและ prepared statements
- db/ และ drizzle/ : โครงสร้างฐานข้อมูลและ migrations
- public/ : หน้าเว็บ CSS JavaScript ไอคอน PWA manifest service worker และไฟล์ Tesseract
- tests/ : การทดสอบระบบและ PWA โดยใช้ข้อมูลจำลอง
- scripts/ และ vendor/ : เครื่องมือรันและสร้างโครงการ
- package.json และ package-lock.json : รายการ dependency และเวอร์ชัน
- .openai/hosting.json : ตัวระบุ Sites เดิมและ logical database binding ไม่ใช่ API key
- TEAM-GUIDE.md : คู่มือสมาชิก

## เทคโนโลยีฉบับออนไลน์

ฉบับนี้ใช้ JavaScript/TypeScript, React/vinext และ Cloudflare Worker/D1 (SQLite) ผ่าน Sites ไม่ใช่ฉบับ PHP/MySQL เดิม

ต้องมี Node.js 22.13 ขึ้นไปและ npm ติดตั้ง dependency ด้วย npm ci เครื่องมือ Sites ที่ใช้เผยแพร่เป็นส่วนหนึ่งของ Codex Sites plugin; เก็บโค้ดใน GitHub ไม่ได้ทำให้เว็บ deploy อัตโนมัติ การย้ายไปโฮสต์อื่นต้องตั้ง Worker, database binding และ migrations ให้เหมาะสม

## สำรองฐานข้อมูลแยกต่างหาก

ไฟล์ ZIP และ GitHub นี้ไม่รวมข้อมูลใน D1 ฐานข้อมูลจริงยังอยู่กับโฮสต์ สำรองฐานข้อมูลผ่านเครื่องมือของโฮสต์และเก็บในพื้นที่ส่วนตัวที่เข้ารหัส แยกจาก repository แม้ repository จะเป็น Private ก็ไม่ควรเก็บ password, token, .env, session หรือ export ข้อมูลส่วนบุคคลลง Git

## อัปโหลดเข้า repository เดิมด้วย GitHub Desktop

1. เข้าสู่ GitHub Desktop ด้วยบัญชี Jame-2002
2. Clone repository https://github.com/Jame-2002/project
3. คัดลอกทุกไฟล์และโฟลเดอร์จากชุดนี้ไปในโฟลเดอร์ที่ Clone โดยเก็บ .git ของ repository ปลายทางไว้ หากมีโครงการอื่นอยู่แล้วให้ใส่ชุดนี้ในโฟลเดอร์ shifttrack/ เพื่อไม่ทับงานเดิม
4. ตรวจรายการ Changes ไม่ให้มีไฟล์ลับหรือฐานข้อมูล
5. Commit แล้ว Push origin
6. เปิด GitHub เพื่อตรวจว่ามี app/, public/, db/, drizzle/, tests/ และ package-lock.json ครบ

ควรใช้ repository แบบ Private สำหรับโครงการทีม สามารถเก็บไฟล์ README เดิมเป็น STARTER-README.md ได้ คู่มือวิธีรัน starter อยู่ในไฟล์นั้น
