﻿function getScrollTop() {
	if(document.documentElement.scrollTop > 0) return document.documentElement.scrollTop;
	else return document.body.scrollTop; // 由于chrome不支持document.documentElement.scrollTop
}

function showBox(id) {
	var Idiv=document.getElementById(id);
	Idiv.style.display="block";
	Idiv.style.zIndex=1000;
	//以下部分要将弹出层居中显示
	Idiv.style.left=(document.documentElement.clientWidth-Idiv.clientWidth)/2+document.documentElement.scrollLeft+"px";
	Idiv.style.top=(document.documentElement.clientHeight-Idiv.clientHeight)/2+getScrollTop()+"px";
	
	//以下部分使整个页面至灰不可点击
	var procbg = document.createElement("div"); //首先创建一个div
	procbg.setAttribute("id","mybg"); //定义该div的id
	procbg.style.cssText="background:#A9A9A9;width:100%;height:100%;position:fixed;top:0;left:0;zIndex:500;opacity:0.6;filter:Alpha(opacity=70);";
	document.body.appendChild(procbg); //背景层加入页面
	
	//以下部分实现弹出层的拖拽效果
	var posX;
	var posY;
	Idiv.onmousedown=function(e) {
		if(!e) e = window.event; //IE
		posX = e.clientX - parseInt(Idiv.style.left);
		posY = e.clientY - parseInt(Idiv.style.top);
		document.onmousemove = mousemove;
	}
	document.onmouseup = function() {
		document.onmousemove = null;
	}
	function mousemove(ev) {
		if(ev==null) ev = window.event;//IE
		var curX = ev.clientX - posX;
		var curY = ev.clientY - posY;
		if(curX >= 0 && document.documentElement.clientWidth >= curX+Idiv.clientWidth+4)
			Idiv.style.left = curX + "px";
		if(curY >= 0 && document.documentElement.clientHeight+getScrollTop() >= curY+Idiv.clientHeight+4)
			Idiv.style.top = curY + "px";
	}
}

function showBox(id,cusId) {
	var Idiv=document.getElementById(id);
	var Iform=document.getElementById("form1");
	Idiv.style.display="block";
	Idiv.style.zIndex=1000;
	Iform.action="insertUserMsg?cusId="+cusId;
	//以下部分要将弹出层居中显示
	Idiv.style.left=(document.documentElement.clientWidth-Idiv.clientWidth)/2+document.documentElement.scrollLeft+"px";
	Idiv.style.top=(document.documentElement.clientHeight-Idiv.clientHeight)/2+getScrollTop()+"px";
	
	//以下部分使整个页面至灰不可点击
	var procbg = document.createElement("div"); //首先创建一个div
	procbg.setAttribute("id","mybg"); //定义该div的id
	procbg.style.cssText="background:#A9A9A9;width:100%;height:100%;position:fixed;top:0;left:0;zIndex:500;opacity:0.6;filter:Alpha(opacity=70);";
	document.body.appendChild(procbg); //背景层加入页面
	
	//以下部分实现弹出层的拖拽效果
	var posX;
	var posY;
	Idiv.onmousedown=function(e) {
		if(!e) e = window.event; //IE
		posX = e.clientX - parseInt(Idiv.style.left);
		posY = e.clientY - parseInt(Idiv.style.top);
		document.onmousemove = mousemove;
	}
	document.onmouseup = function() {
		document.onmousemove = null;
	}
	function mousemove(ev) {
		if(ev==null) ev = window.event;//IE
		var curX = ev.clientX - posX;
		var curY = ev.clientY - posY;
		if(curX >= 0 && document.documentElement.clientWidth >= curX+Idiv.clientWidth+4)
			Idiv.style.left = curX + "px";
		if(curY >= 0 && document.documentElement.clientHeight+getScrollTop() >= curY+Idiv.clientHeight+4)
			Idiv.style.top = curY + "px";
	}
}
function closeBox(id) {//关闭弹出层
	var Idiv=document.getElementById(id);
	Idiv.style.display="none";
	var body = document.getElementsByTagName("body");
	var mybg = document.getElementById("mybg");
	body[0].removeChild(mybg);
}