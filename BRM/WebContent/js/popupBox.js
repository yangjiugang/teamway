function getScrollTop() {
	if(document.documentElement.scrollTop > 0) return document.documentElement.scrollTop;
	else return document.body.scrollTop; // 由于chrome不支持document.documentElement.scrollTop
}

function getTitleObj(parentObj) {
	for (var i=0; i < parentObj.childNodes.length; i++) {
		var obj = parentObj.childNodes[i];
		if(obj.nodeType == 1 && obj.getAttribute("name") == "title") return obj;
	}
}
 
function showBox(id) {
	var Idiv=document.getElementById(id);
	Idiv.style.zIndex=1000;
	Idiv.style.display="block";
	//以下部分要将弹出层居中显示
	Idiv.style.left=(document.documentElement.clientWidth-Idiv.clientWidth)/2+document.documentElement.scrollLeft+"px";
	Idiv.style.top=(document.documentElement.clientHeight-Idiv.clientHeight)/2+getScrollTop()+"px";
	
	//以下部分使整个页面至灰不可点击
	var procbg = document.createElement("div"); //首先创建一个div
	procbg.setAttribute("id","mybg"); //定义该div的id
	if(!!window.ActiveXObject && !window.XMLHttpRequest) { // IE6
		procbg.style.cssText="background:#A9A9A9;width:"+$(window).width()+";height:"+$(document).height()+";position:fixed!important;position:absolute;top:0;left:0;zIndex:500;opacity:0.2;filter:Alpha(opacity=70);";
	} else {
		procbg.style.cssText="background:#A9A9A9;width:100%;height:100%;position:fixed;top:0;left:0;zIndex:500;opacity:0.2;filter:Alpha(opacity=70);";
	}
	document.body.appendChild(procbg); //背景层加入页面
	
	var Ititle=getTitleObj(Idiv);
	if (typeof Ititle != "undefined") {
		Ititle.style.cursor = "move";
		//以下部分实现弹出层的拖拽效果
		var posX;
		var posY;
		Ititle.onmousedown=function(e) {
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
}

function closeBox(id) {//关闭弹出层
	var Idiv=document.getElementById(id);
	Idiv.style.display="none";
	var body = document.getElementsByTagName("body");
	var mybg = document.getElementById("mybg");
	body[0].removeChild(mybg);
}