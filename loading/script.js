let images = [
  "https://hdqwalls.com/download/gta-5-mods-4k-z4-2560x1440.jpg",
  "https://i.pinimg.com/originals/d8/1d/9c/d81d9c82f1ac0944a29a3c9017d6c464.png",
  "https://i.pinimg.com/originals/df/8c/72/df8c7248abed5440f0bd540ac4ce91c1.jpg"
];

let popup = $().popup({
  title: "RULES",
  content: "Hey there!"
});

const cols=3,main=document.getElementById("main");let parts=[],current=0,playing=!1;for(let e in images)(new Image).src=images[e];for(let e=0;e<3;e++){let t=document.createElement("div");t.className="part";let n=document.createElement("div");n.className="section";let o=document.createElement("img");o.src=images[current],n.appendChild(o),t.style.setProperty("--x",-100/3*e+"vw"),t.appendChild(n),main.appendChild(t),parts.push(t)}let animOptions={duration:2.3,ease:Power4.easeInOut};function go(e){if(!playing){function t(e,t){e.appendChild(t),gsap.to(e,{...animOptions,y:-window.innerHeight}).then(function(){e.children[0].remove(),gsap.to(e,{duration:0,y:0})})}function n(e,t){e.prepend(t),gsap.to(e,{duration:0,y:-window.innerHeight}),gsap.to(e,{...animOptions,y:0}).then(function(){e.children[1].remove(),playing=!1})}playing=!0,current+e<0?current=images.length-1:current+e>=images.length?current=0:current+=e;for(let o in parts){let r=parts[o],s=document.createElement("div");s.className="section";let c=document.createElement("img");c.src=images[current],s.appendChild(c),(o-Math.max(0,e))%2?n(r,s):t(r,s)}}}function lerp(e,t,n){return(1-n)*e+n*t}window.addEventListener("keydown",function(e){["ArrowDown","ArrowRight"].includes(e.key)?go(1):["ArrowUp","ArrowLeft"].includes(e.key)&&go(-1)});const cursor=document.createElement("div");cursor.className="cursor";const cursorF=document.createElement("div");cursorF.className="cursor-f";let startY,endY,cursorX=0,cursorY=0,pageX=0,pageY=0,size=8,sizeF=36,followSpeed=.16;function loop(){cursorX=lerp(cursorX,pageX,followSpeed),cursorY=lerp(cursorY,pageY,followSpeed),cursorF.style.top=cursorY-sizeF/2+"px",cursorF.style.left=cursorX-sizeF/2+"px",requestAnimationFrame(loop)}document.body.appendChild(cursor),document.body.appendChild(cursorF),"ontouchstart"in window&&(cursor.style.display="none",cursorF.style.display="none"),cursor.style.setProperty("--size",size+"px"),cursorF.style.setProperty("--size",sizeF+"px"),window.addEventListener("mousemove",function(e){pageX=e.clientX,pageY=e.clientY,cursor.style.left=e.clientX-size/2+"px",cursor.style.top=e.clientY-size/2+"px"}),loop(),setInterval(function(){go(-1)},13e3);let scrollTimeout,clicked=!1;function mousedown(e){gsap.to(cursor,{scale:4.5}),gsap.to(cursorF,{scale:.4}),clicked=!0,startY=e.clientY||e.touches[0].clientY||e.targetTouches[0].clientY}function mouseup(e){gsap.to(cursor,{scale:1}),gsap.to(cursorF,{scale:1}),endY=e.clientY||endY,clicked&&startY&&Math.abs(startY-endY)>=40&&(go(Math.min(0,startY-endY)?-1:1),clicked=!1,startY=null,endY=null)}function wheel(e){clearTimeout(scrollTimeout),setTimeout(function(){e.deltaY<-40?go(-1):e.deltaY>=40&&go(1)})}window.addEventListener("mousedown",mousedown,!1),window.addEventListener("touchstart",mousedown,!1),window.addEventListener("touchmove",function(e){clicked&&(endY=e.touches[0].clientY||e.targetTouches[0].clientY)},!1),window.addEventListener("touchend",mouseup,!1),window.addEventListener("mouseup",mouseup,!1),window.addEventListener("mousewheel",wheel,!1),window.addEventListener("wheel",wheel,!1);