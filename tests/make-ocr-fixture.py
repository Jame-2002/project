from PIL import Image, ImageDraw, ImageFont
from pathlib import Path
p=Path(__file__).parent.parent/'work'
p.mkdir(exist_ok=True)
widths=[55,115,260]+[48]*31
xs=[0]
for w in widths: xs.append(xs[-1]+w)
ys=[70,105,140,180,220,260]
im=Image.new('RGB',(xs[-1]+1,261),'white'); d=ImageDraw.Draw(im)
font=ImageFont.truetype('C:/Windows/Fonts/tahoma.ttf',18)
small=ImageFont.truetype('C:/Windows/Fonts/tahoma.ttf',16)
for x in xs:d.line((x,70,x,260),fill='black')
for y in ys:d.line((0,y,xs[-1],y),fill='black')
for day in range(1,32):
 x=xs[day+2];d.text((x+12,76),str(day),font=small,fill='black');d.text((x+12,111),'TH',font=small,fill='black')
d.text((70,111),'ID',font=font,fill='black');d.text((180,111),'ชื่อ - นามสกุล',font=font,fill='black')
for i,(code,name) in enumerate([('300001','นาย สมชาย ทดสอบ'),('300002','นาย สมศักดิ์ ทดลอง'),('300003','นาง สมใจ ตัวอย่าง')]):
 y=ys[i+2];d.text((12,y+10),str(i+1),font=font,fill='black');d.text((63,y+10),code,font=font,fill='black');d.text((180,y+10),name,font=font,fill='black')
 for day in range(1,32):d.text((xs[day+2]+15,y+10),'E' if day%7 not in [2,3] else 'R',font=font,fill='black')
im.save(p/'ocr-demo.png')
print(p/'ocr-demo.png')
