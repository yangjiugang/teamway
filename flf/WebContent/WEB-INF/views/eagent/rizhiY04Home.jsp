<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>日志 - 首页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="js/uploadify/uploadify.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />

<!--<link rel="stylesheet" href="css/index.css" type="text/css" />-->
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="js/nicEdit.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/map.js"></script>

<style>
	#area{font-size: 16px;padding-left: 0px; border: 1px solid #DDDDDD; width: 750px;height:500px;overflow:auto; }
	#area:hover{cursor:text;}
	#title{width: 750px;height:40px;border: 1px dashed #DDDDDD;margin: 10px 0px; 8px 0px;line-height:40px;}
	#title:hover{bor  der:1px solid orange;cursor:text}
	#title:focus{border:1px solid orange}
	.btn1 {BORDER: #C1C1C1 1px solid;width:75px;height:25px;cursor:pointer; PADDING-RIGHT: 2px;PADDING-LEFT: 2px; FONT-SIZE: 14px;COLOR: white;font-weight:bold; background:#66ACE2; PADDING-TOP: 1px;}
	.btn2 {BORDER: #C1C1C1 1px solid;width:60px;height:25px;cursor:pointer; PADDING-RIGHT: 2px;PADDING-LEFT: 2px; FONT-SIZE: 13px;COLOR: #656565; background:#E0E0E0; PADDING-TOP: 2px;}
	.uploadifyQueueItem{background-color: #FFFFFF;border: none;border-bottom: 1px solid #E5E5E5;font: 11px Verdana, Geneva, sans-serif;height: 50px;margin-top: 0;padding: 10px;width: 350px;}
	#menu_a1,#menu_a2{font-size: 13px;color: gray;width:80px;}
</style>
<script type="text/javascript">
var map = new Map();
var isUpload = true;
$(document).ready(function() {
	var pageSize = 10;
	var curPage = ${curPage};
	var pageCount = ${pageCount};
	var pageCountOwn = ${pageCountOwn};
	$("#page").pager({curPage:curPage, pageSize:pageSize, pageCount:pageCountOwn, goPageCall:goPage});
	$("#friendPage").pager({curPage:curPage, pageSize:pageSize, pageCount:pageCount, goPageCall:goFriendPage});
	var own = ${dailys};
	var friend = ${friendDailys};
	generate(own,'own',curPage,pageSize);
	generate(friend,'friend',curPage,pageSize);
})

function generate(obj,type,curPage,pageSize){
	if(type == 'own')$("#mydaily").empty();
	else $("#friendDaily").empty();
	for(var i=0;i<obj.length;i++){
		var html = 
		'<div class="Y04rizhiMy">'+
		'<h3><span>'+obj[i].dailyTime+'</span><a id="title'+obj[i].id+'" href="javascript:viewAll('+obj[i].id+')">'+obj[i].dailyTitle+'</a></h3>'+
		'<!-- '+
		'<ul class="Y04rizhiimg">'+
		'<li><a href="javascript:viewAll('+obj[i].id+')" target="_blank"><img src="images/Y04img1.gif" /></a></li>'+
		'</ul>'+
		'<p class="Y04rizhizp"><共1张照片></p>'+
		' -->'+
		'<div class="Y04rizhiwz'+obj[i].id+'" style="height:200px;overflow:hidden;">'+obj[i].dailyContent+'</div>'+
		'<p>&nbsp;</p>'+
		'<div class="Y04rizhiqw'+obj[i].id+'"><a href="javascript:viewAll('+obj[i].id+');" style="color:#0B60B0;">阅读全文 ↓</a></div>'+
		'<p class="Y04rizhisq'+obj[i].id+'" style="display:none"><a href="javascript:closeView('+obj[i].id+');" style="color:#BB0E13">收起 ↑</a>&nbsp;&nbsp;'+
		(type == 'own'?'&nbsp;<span><a href="javascript:edit('+obj[i].id+')" style="color:#BB0E13">编辑</a>&nbsp;&nbsp;&nbsp;<a href="javascript:del('+obj[i].id+','+curPage+','+pageSize+')" style="color:#BB0E13">删除</a><span></p>'+'</div>':'')
		if(type == 'own')
			$("#mydaily").append(html);
		if(type == 'friend')
			$("#friendDaily").append(html);
	};
}

function viewAll(i){
	$('.Y04rizhiqw'+i).css('display','none');
	$('.Y04rizhisq'+i).css('display','');
	$('.Y04rizhiwz'+i).css('height','auto');
	if($('.Y04rizhiwz'+i).height() < 200){
		$('.Y04rizhiwz'+i).css('height','200');	
	}
		
}
function closeView(i){
	$('.Y04rizhiqw'+i).css('display','');
	$('.Y04rizhisq'+i).css('display','none');
	$('.Y04rizhiwz'+i).css('height','200');
}
function settab_zzjs(name,num,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
 }
}

var myNicEditor ;
bkLib.onDomLoaded(function() {
     myNicEditor = new nicEditor({buttonList : ['saves','undo','fontSize','fontFamily','bold','italic','underline','forecolor','space1','left','center','right','justify','space2','image']});
     myNicEditor.setPanel('panel');
     myNicEditor.addInstance('area');
});

function titleOnfocus(){
	if($("#titleContent").html() == '请在这里输入日志标题'){
		$("#titleContent").empty();
		$("#titleContent").html("&nbsp;");
	}
}

function titleOnblur(){
	var c = $("#titleContent").html();
	if(c == '&nbsp;' || c == '' || c == '<br>'){
		$("#titleContent").html("请在这里输入日志标题");
		$("#title").css("border","1px dashed #DDDDDD");
	}else{
		$("#title").css("border","none");
		$("#title").css("border-bottom","1px solid #DDDDDD");
	}
}

//实现撤销
var log = []; 
$(function () {
	var txt = window.setInterval(function () {
	if (log[log.length - 1] != $("#area").html()) {
		log[log.length] = $("#area").html(); 
	}
	}, 1500); 
	var isCtrl = false;
	$(document).keydown(function (e) {
	if (e.which === 17) 
		isCtrl = true; 
	if (e.which === 90 && isCtrl === true) {
		log.pop();
		$("#area").html(log[log.length - 1]); 
		$("#area").blur();
	}
	}).keyup(function (e) { 
	if (e.which === 17) 
		isCtrl = false; 
	}); 
}); 

$(document).ready(function() { 
    $("#file").uploadify({  
        'uploader'       : '<%=request.getContextPath() %>/js/uploadify/uploadify.swf',  
        'script'         : 'eagent_uploadImage',
        'cancelImg'      : '<%=request.getContextPath() %>/js/uploadify/cancel.png',  
        'queueID'        : 'fileQueue', //和存放队列的DIV的id一致  
        'fileDataName'   : 'file', //和以下input的name属性一致  
        'auto'           : false, //是否自动开始  
        'multi'          : true, //是否支持多文件上传  
        'simUploadLimit' : 1, //一次同步上传的文件数目
        'removeCompleted': false,
        'sizeLimit'      : 1024*1024*1024, //设置单个文件大小限制  
        'queueSizeLimit' : 3, //队列中同时存在的文件个数限制  
        'fileDesc'       : 'Image Files', //如果配置了以下的'fileExt'属性，那么这个属性是必须的  
        'fileExt'        : '*.jpg;*.gif;*.jpeg;*.png;*.bmp',//允许的格式   
        'buttonImg'      : '<%=request.getContextPath()%>/images/browser.png',
        onComplete: function (event, queueID, fileObj, response, data) {
        	map.put(queueID,"upload/" +response);
        	$("#img").append('<div id="'+queueID+'"><img src="upload/'+response+'" width="100" height="80" border="0" /></div>');
        },  
        onError: function(event, queueID, errorObj) {
        	alert(errorObj.type + ' Error: ' + errorObj.info);
        }, 
        onCancel: function(event, queueID, fileObj){
        	var fileName = $("#"+queueID+" img").attr("src");
        	map.remove(queueID);
  			if(typeof(fileName) != 'undefined')
	        	delImage(fileName.split('/')[1],queueID);
        }  
    });  
});  
 
function goPage(curPage, pageSize) {
	$.ajax({
		 type: "POST",
		 url: "eagent_dailyPage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generate(obj,'own',curPage, pageSize);
		 }
	});
}
function goFriendPage (curPage, pageSize) {
	$.ajax({
		 type: "POST",
		 url: "eagent_friendDailyPage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generate(obj,'friend',curPage, pageSize);
		 }
	});
}
function changeTab(menu){
	if(menu == 'tab_online'){
		$("#tab_online").css("display","");
		$("#tab_local").css("display","none");
		$("#menu_a1").css("font-weight","bold");
		$("#menu_a2").css("font-weight","");
	}
	if(menu == 'tab_local'){
		$("#tab_online").css("display","none");
		$("#tab_local").css("display","");
		$("#menu_a1").css("font-weight","");
		$("#menu_a2").css("font-weight","bold");
	}
}

function uploadImageWin(){  
   art.dialog({  
       title: "添加图片",
      	content: document.getElementById('uploadDiv'),
       id: 'EF893L' ,
       lock: true,
       background: '#CCCCCC',
       padding: 0,
       close: function () {
       	  map.clear();
       	  $("#img").empty();	
       }
	});  
}
function delImage(fileName,queueID){
	$.ajax({
		 type: "POST",
		 url: "eagent_delImage",
		 dataType:"json",
		 data: "fileName=" + fileName,
		 success: function(){
			 $("#"+queueID).remove();
		 },
		 error:function(msg){
			 alert(msg);
		 }
	});
}
function addImage(menu){
	if(menu == 'local'){
		if($("#url").val() == ''){return;}
		$("#area").focus();
		art.dialog.list['EF893L'].close();
		document.execCommand("insertImage",false,$("#url").val());
	}
	if(menu =="online"){
		if(!map.isEmpty()){
			$("#area").focus();
   		for(var i in map.keys()){
				document.execCommand("insertImage",false,map.get(map.keys()[i]));
			}
			map.clear();
			$("#img").empty();
			art.dialog.list['EF893L'].close();
		}
	}
}

function save(){
	var titleContent = $("#titleContent").html();
	var area = $("#area").html();
	var style = $("#area").attr('style');
	if(typeof(style) != 'undefined'){
		area = '<span style="'+style+'">' + area + '</span>';
	}
	var url = $("#id").val() == '' ? 'eagent_saveDaily' : 'eagent_updateDaily';
	$.ajax({
		 type: "POST",
		 url: url,
		 dataType:"json",
		 data: "dailyTitle="+titleContent+"&dailyContent="+encodeURIComponent(area) + "&id="+$("#id").val(),
		 success: function(){
			 alert('保存成功');
			 window.location.reload();
		 },
		 error:function(msg){
			 alert(msg);
		 }
	});
}
function del(id,curPage,pageSize){
	if(window.confirm("你确定要删除吗 ?")){
		$.ajax({
			 type: "POST",
			 url: "eagent_delDaily",
			 dataType:"json",
			 data: "id=" + id+"&pageSize="+pageSize+"&curPage="+curPage,
			 success: function(obj){
				$(".Y04tong span").empty();
				$(".Y04tong span").append(obj.count);
				generate(obj.jsonValue,'own',curPage,pageSize);
			 }
		});
	}
}
function edit(id){
	settab_zzjs('zzjs',3,3);
	$("#titleContent").html(($("#title"+id).html()));
	$("#area").html($(".Y04rizhiwz"+id).html()+"&nbsp;");
	$("#id").val(id);
}

</script>
<!---总体分类样式--->
<link href="css/eagent/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>

<body>
<!--头部-->
<%@ include file="EHeader.jsp" %>
<div class="middle">
<!--左边-->
<%@ include file="ELeft.jsp" %> 	
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
	   <!---日志--->
		<div class="Y04rizhi">
<div class="Y04rizhi_tab">
<ul><li id="zzjs1" onclick="settab_zzjs('zzjs',1,3)" class="on_zzjs">我的日志</li>
<li id="zzjs2" onclick="settab_zzjs('zzjs',2,3)">好友日志</li>
<li id="zzjs3" onclick="settab_zzjs('zzjs',3,3)">写日志</li></ul>
</div>
<div class="Y04rizhilist">
<div id="zzjs_zzjs1">

<div id="mydaily">

</div>

<p class="Y04tong">统计：<span>${count }</span>篇日志</p>
<div id="page"></div>
</div>
</div>
<div id="zzjs_zzjs2" style="display:none;">
<div id="friendDaily"></div>
<p class="Y04tong">统计：${friendDailyCount }篇日志</p>
<div id="friendPage"></div>
</div>

<div id="zzjs_zzjs3" style="display:none;">
<div class="Y04rizhiX">
	<div style="border:1px solid #F2F2F2;width: 753px;padding:4px;">
		<div style="height:30px;line-height:25px;width:750px;background:#EFEFEF;border: 1px solid #EFEFEF">
				<table>
					<tr>
						<td width="510" style="font-weight: bold;color:#242426">&nbsp;写日志</td>
						<td><input type="button" value="预览" class="btn2" style="height: 27px;padding-top:0px;" /></td>
						<td><input type="button" value="保存草稿" style="width:90px;height: 27px;padding-top:0px;" class="btn2" /></td>
						<td valign="bottom">&nbsp;<a href="#" style="font-size:14px;color:#478DC2;text-decoration: none;">草稿箱</a></td>
					</tr>
				</table>
		</div>
		<div id="panel" style="width: 750px;"></div>
		<div id="title">
			<div id="titleContent" onfocus="titleOnfocus()" onblur="titleOnblur()" contenteditable="true" style="font-weight:bold;font-family:微软雅黑;color:#666666;font-size:20px;text-align:center;">请在这里输入日志标题</div>
		</div>
		<div id="all">
		<div id="area"></div>
		</div>
		<input type="hidden" name="id" id="id" />
		<div style="height:38px;background:#EFEFEF;font-size:13px;padding-top:8px;width:750px;border: 1px solid #EFEFEF">
			<span>
			&nbsp;&nbsp;&nbsp;<font color='gray'>权限</font>
			<select>
				<option>公开</option>
				<option>仅自己可见</option>
			</select>
			</span>
		</div>
		<div style="height:28px;margin-top:2px;">
			<table border="0" style="float:right">
				<tr>
					<td><input type="button" value="发表" class="btn1" onclick="save();"/></td>
					<td><input type="button" value="取消" class="btn2" onclick="window.location.reload()"/></td>
				</tr>
			</table>
		</div>
	</div>
	
	<!--  图片上传弹出框 -->		
	<div id="uploadDiv" style="height:300px;width:550px;display: none;">
		<div style="padding-left:10px;">
			<a href="javascript:changeTab('tab_online')" style="font-weight:bold;"  id="menu_a1">网络图片</a>&nbsp;
			<a href="javascript:changeTab('tab_local')" id="menu_a2">上传图片</a>
		</div>
		<div id="tab_online" style="height:200px;width:100%;line-height: 200px;text-align: center;" >
		  	<span style="color:gray;font-size:13px;">URL:&nbsp;</span>
		  	<input type="text" name="url" id="url" />
		  	<input type="button" value="确定" class="btn2" style="height:22px;padding:0px;" onclick="addImage('local')" />
		</div> 
		<div id="tab_local" style="display: none;text-align: center;" >
		  	<table style="float: left;">
		        <tr>
		            <td colspan="3">  
		                <div id="fileQueue" style="border: 1px solid #E5E5E5;height: 213px;margin-bottom: 10px;width: 370px;"></div><br/>
		                <div style="float: left;padding:0px;"><input type="file" name="file" id="file" /></div>
		                <a href="#;" style="color:gray;text-decoration: none;font-size:14px;" onClick="javascript:$('#file').uploadifyUpload()">
						<img src='<%=request.getContextPath()%>/images/upload.png' border="0"/>
						</a>
		                <a href="#;" style="color:gray;text-decoration: none;font-size:14px;" onClick="addImage('online')">
						<img src='<%=request.getContextPath()%>/images/enter.png' border="0"/>
						</a>  
		            	<!-- <a href="javascript:jQuery('#file').uploadifyClearQueue()">取消所有上传</a>  -->  
		            </td> 
		        </tr>  
	    	</table>
	    	<div id="img"></div>
		</div>
	</div>
</div>

</div>
</div></div>
       <!---日志---> 
    </div>
<!--End右边-->    
</div>



</body>
</html>
