// Requires playwright and sharp; renders locally with installed Chrome.
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright'),sharp=require('sharp');
const root=__dirname,palette=JSON.parse(fs.readFileSync(path.join(root,'preview-palette.json'),'utf8').replace(/^\uFEFF/,''));
const lum=rgb=>rgb.map(v=>v/255).map(v=>v<=.04045?v/12.92:((v+.055)/1.055)**2.4).reduce((s,v,i)=>s+v*[.2126,.7152,.0722][i],0);
const hex=v=>v.match(/[a-f\d]{2}/gi).map(v=>parseInt(v,16));
const contrast=(a,b)=>(Math.max(a,b)+.05)/(Math.min(a,b)+.05);
(async()=>{
 const server=http.createServer((req,res)=>{const name=path.basename(new URL(req.url,'http://localhost').pathname);if(!['preview.html','preview-palette.json','Preview-source.png'].includes(name)){res.writeHead(404);res.end();return;}res.setHeader('Content-Type',name.endsWith('.png')?'image/png':name.endsWith('.json')?'application/json':'text/html; charset=utf-8');res.end(fs.readFileSync(path.join(root,name)));});
 await new Promise(r=>server.listen(0,'127.0.0.1',r));let browser;
 try{
  browser=await chromium.launch({executablePath:process.env.CHROME_PATH||'C:/Program Files/Google/Chrome/Application/chrome.exe',headless:true});
  const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
  await page.goto(`http://127.0.0.1:${server.address().port}/preview.html`);await page.evaluate(()=>window.previewReady);
  if(!fs.readFileSync(path.join(root,'../Mod/About/About.xml'),'utf8').includes('<li>1.6</li>'))throw Error('Unsupported badge version');
  const cdp=await page.context().newCDPSession(page);await cdp.send('DOM.enable');await cdp.send('CSS.enable');
  const {root:doc}=await cdp.send('DOM.getDocument');const {nodeId}=await cdp.send('DOM.querySelector',{nodeId:doc.nodeId,selector:'h1'});
  const fonts=await cdp.send('CSS.getPlatformFontsForNode',{nodeId});if(!fonts.fonts.length||fonts.fonts.some(f=>!/^Segoe UI(?: Semibold)?$/.test(f.familyName)))throw Error(JSON.stringify(fonts));
  const regions=await page.evaluate(()=>['.prefix','.main-title','h1 > .suffix:last-child','.tag','.summary'].map(selector=>{const r=document.querySelector(selector).getBoundingClientRect();return{selector,x:Math.floor(r.x),y:Math.floor(r.y),width:Math.ceil(r.width),height:Math.ceil(r.height)};}));
  const qa=path.join(root,'preview-qa');fs.mkdirSync(qa,{recursive:true});const png=await page.screenshot();
  await page.addStyleTag({content:'.text,.version{visibility:hidden!important}'});const bg=await page.screenshot();fs.writeFileSync(path.join(qa,'background.png'),bg);
  const {data,info}=await sharp(bg).removeAlpha().raw().toBuffer({resolveWithObject:true});
  const checks=regions.map(r=>{const ink=lum(hex(palette[r.selector==='.prefix'||r.selector==='h1 > .suffix:last-child'||r.selector==='.tag'?'inkSecondary':'inkPrimary']));let min=Infinity;for(let y=r.y;y<r.y+r.height;y++)for(let x=r.x;x<r.x+r.width;x++){const i=(y*info.width+x)*info.channels;min=Math.min(min,contrast(ink,lum([...data.subarray(i,i+3)])));}if(min<4.5)throw Error(`Contrast ${r.selector}: ${min}`);return{...r,minContrast:Number(min.toFixed(2))};});
  const badgeContrast=contrast(lum(hex(palette.badgeInk)),lum(hex(palette.accent)));if(badgeContrast<4.5)throw Error('Badge contrast');
  const output=path.join(root,'../Mod/About/Preview.png');await sharp(png).png({compressionLevel:9}).toFile(output);await sharp(png).resize({width:268}).png().toFile(path.join(qa,'thumbnail.png'));
  const result={dimensions:[896,504],bytes:fs.statSync(output).size,fonts:fonts.fonts,checks,badgeContrast:Number(badgeContrast.toFixed(2))};if(result.bytes>=900000)throw Error('Preview too large');fs.writeFileSync(path.join(qa,'results.json'),JSON.stringify(result,null,2)+'\n');console.log(JSON.stringify(result,null,2));
 }finally{if(browser)await browser.close();await new Promise(r=>server.close(r));}
})().catch(e=>{console.error(e);process.exitCode=1});
