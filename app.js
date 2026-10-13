'use strict';
const $=id=>document.getElementById(id), fmt=n=>n===null||n===undefined?'—':new Intl.NumberFormat('sv-SE').format(n);
let data=null, controller=null;
function el(tag,cls,text){const n=document.createElement(tag);if(cls)n.className=cls;if(text!==undefined)n.textContent=text;return n;}
function totalAccounts(){const vals=data.apps.map(a=>a.metrics[0].total);return vals.every(n=>n===null)?null:vals.reduce((s,n)=>s+(n??0),0);}
function summary(){
 const missing=data.apps.filter(a=>a.metrics.some(m=>m.total===null)).length;
 const newAccounts=data.apps.map(a=>a.metrics[0].period);
 const items=[['Appar med data',data.apps.filter(a=>a.available).length,'Av '+data.apps.length+' identifierade appar'],['Konton totalt',totalAccounts(),'Summa konton, inte unika personer'],[data.days==='all'?'Konton · alla tider':'Nya konton · perioden',newAccounts.every(n=>n===null)?null:newAccounts.reduce((s,n)=>s+(n??0),0),'Registreringar i vald period'],['Ofullständig statistik',missing,'Appar med saknade tabeller']];
 $('summary').replaceChildren(...items.map(([label,value,note])=>{const n=el('div','stat');n.append(el('div','stat-label',label),el('div','stat-value',fmt(value)),el('small',null,note));return n;}));
}
function cards(){
 const apps=data.apps.filter(a=>a.name.toLocaleLowerCase('sv').includes($('search').value.toLocaleLowerCase('sv')));
 $('apps').replaceChildren(...apps.map(a=>{
  const card=el('article','app-card');card.style.setProperty('--accent',a.color);
  const head=el('div','app-head'), title=el('div');
  title.append(el('h3',null,a.name),el('small',null,a.available?'Databasstatistik':'Tabeller saknas'));
  head.append(el('div','icon',a.icon),title);card.append(head);
  a.metrics.forEach(m=>{const row=el('div','metric'), value=el('div','metric-values',fmt(m.total));value.append(el('small',null,m.date?fmt(m.period)+' · '+(data.days==='all'?'alla tider':'i perioden'):'Period saknas: inget datumfält'));row.append(el('span','metric-label',m.label),value);card.append(row);});
  if(a.id==='meme')card.append(el('p','app-note','SQL-filen innehåller konton men ingen lagrad statistik över skapade memes.'));
  if(a.id==='jolt')card.append(el('p','app-note','Startade spel har lämnat lobbyläget. Promenadsvar visar senaste ändring, inte hela svarshistoriken.'));
  return card;
 }));
 if(!apps.length)$('apps').append(el('p','muted','Inga appar matchar sökningen.'));
}
function chart(){
 const a=data.apps.find(a=>a.id===$('chart-app').value);if(!a)return;
 const metric=a.metrics.find(m=>m.label===a.activity_label);
 $('chart-note').textContent=(a.activity_label??'Aktivitet saknas')+' per dag'+(data.days==='all'?' • senaste 30 dagarna':'');
 if(!metric||metric.total===null){$('chart').replaceChildren(el('div','empty','Ingen tillgänglig aktivitetsstatistik.'));$('chart').setAttribute('aria-label',a.name+': Ingen tillgänglig aktivitetsstatistik.');$('chart-footer').replaceChildren();return;}
 const points=a.series,max=Math.max(1,...points.map(p=>p.value)),w=1000,h=220,pad=35;
 const ns='http://www.w3.org/2000/svg', svg=document.createElementNS(ns,'svg');svg.setAttribute('viewBox', '0 0 1000 240');svg.setAttribute('preserveAspectRatio','none');
 function node(tag,attrs,text){const n=document.createElementNS(ns,tag);Object.entries(attrs).forEach(([k,v])=>n.setAttribute(k,v));if(text!==undefined)n.textContent=text;svg.append(n);return n;}
 [0,.5,1].forEach(f=>{const y=h-f*(h-20);node('line',{x1:pad,y1:y,x2:w,y2:y,stroke:'#e1e4e8'});node('text',{x:0,y:y-5,fill:'#646b73','font-size':11},fmt(Math.round(max*f)));});
 const bw=(w-pad)/points.length;
 points.forEach((p,i)=>{const bh=p.value/max*(h-20);const rect=node('rect',{x:pad+i*bw+bw*.15,y:h-bh,width:Math.max(.7,bw*.7),height:bh,rx:2,fill:'#0078d4'});const title=document.createElementNS(ns,'title');title.textContent=p.date+': '+fmt(p.value);rect.append(title);});
 $('chart').replaceChildren(svg);
 $('chart').setAttribute('aria-label',a.name+': '+a.activity_label+'. '+fmt(points.reduce((s,p)=>s+p.value,0))+' under visad period.');
 $('chart-footer').replaceChildren(el('span',null,points[0]?.date),el('span',null,fmt(points.reduce((s,p)=>s+p.value,0))+' '+a.activity_label.toLowerCase()),el('span',null,points.at(-1)?.date));
}
async function refresh(){
 controller?.abort();const request=new AbortController();controller=request;$('refresh').disabled=true;$('message').className='';$('message').textContent='Hämtar statistik…';
 try{
  const response=await fetch('api.php?days='+encodeURIComponent($('period').value),{signal:request.signal,cache:'no-store'});
  if(!response.ok){let error='Statistiken kunde inte hämtas (HTTP '+response.status+').';try{error=(await response.json()).error??error;}catch{}throw new Error(error);}
  const result=await response.json();if(controller!==request)return;
  data=result;const selected=$('chart-app').value;
  $('chart-app').replaceChildren(...data.apps.map(a=>{const o=el('option',null,a.name);o.value=a.id;return o;}));
  if(data.apps.some(a=>a.id===selected))$('chart-app').value=selected;
  summary();cards();chart();$('message').textContent='Uppdaterad • '+data.apps.length+' appar';
  $('updated').textContent='Senast hämtad '+new Date(data.generated_at).toLocaleString('sv-SE')+' · databasens tidszon '+data.timezone;
 }catch(e){if(controller===request&&e.name!=='AbortError'){$('message').className='error';$('message').textContent=e.message+(data?' Tidigare siffror ligger kvar.':'');}}
 finally{if(controller===request)$('refresh').disabled=false;}
}
$('refresh').addEventListener('click',refresh);$('period').addEventListener('change',refresh);$('search').addEventListener('input',()=>data&&cards());$('chart-app').addEventListener('change',chart);refresh();
