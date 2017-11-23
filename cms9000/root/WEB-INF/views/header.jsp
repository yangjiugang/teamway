<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CMS9000</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easyui/themes/black/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/ztree/css/zTreeStyle/zTreeStyle.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/style/common-6.0.css">
<link rel="icon" href="<%=basePath %>/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="<%=basePath %>/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath %>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/ztree/js/jquery.ztree.all.min.js"></script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

img {
	border: 0 none;
}

.box {
	background: #35353b url(<%=basePath %>/images/logo.png) no-repeat;
	position: relative;
	height: 70px;
	background-image: ;
}

.layout-panel {
	overflow: visible;
}

.panel {
	overflow: visible;
}


ul,li{list-style: none;}
a:link,a:visited{text-decoration: none;}
.list{width: 192px;margin:0 auto 0 auto;}
.list ul li{padding-left:10px; }
.list ul li a{padding-left: 10px;color:#333333; font-size:14px; display: block; height:32px;line-height: 32px;position: relative;
}
.list ul li .inactive{ background:url(<%=basePath %>/images/off.png) no-repeat 165px center;}
.list ul li .inactives{background:url(<%=basePath %>/images/on.png) no-repeat 165px center;} 
.list ul li ul{display: block;}
.list ul li ul li { border-left:0; border-right:0; padding-left:25px;}
.list ul li ul li ul{display: none;}
.list ul li ul li a{ padding-left:20px;}
.list ul li ul li ul li {}
.last{ background-color:#d6e6f1; border-color:#6196bb; }
.list ul li ul li ul li a{ color:#316a91; padding-left:30px;}


.resource_css{ background:url(<%=basePath %>/images/menu/resource.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}
.user_css{ background:url(<%=basePath %>/images/menu/user.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}
.role_css{ background:url(<%=basePath %>/images/menu/role.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}
.system_css{ background:url(<%=basePath %>/images/menu/system.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}
.region_css{ background:url(<%=basePath %>/images/menu/region.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}
.device_css{ background:url(<%=basePath %>/images/menu/device.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}
.stream_css{ background:url(<%=basePath %>/images/menu/stream.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}
.view_css{ background:url(<%=basePath %>/images/menu/view.png) no-repeat center center;  height:28px; width:28px;s line-height:28px;}


.menu_line { font-size:18px; height:28px;line-height:28px;cursor:pointer;padding:3px 8px 3px 30px;}
.menu_title { font-size:18px; height:28px;line-height:28px;  display:table-cell; vertical-align:middle;}
</style>
<script type="text/javascript">

	var basepath = "<%=basePath %>";
	$(document).ready(function() {
		$.messager.defaults = { ok: "是", cancel: "否" };
	
		var menus=new Array('server/page','region/page','monitor/page','user/page','role/page');
	
		for(var i=0;i<menus.length;i++)
		{
			var name = menus[i];
		}
	
		$(".menu_line").click(function(){
			var  shortUrl = $(this).attr('data-url');
			self.location = basepath + shortUrl ; 
		});

		 $(".menu_line").each(function(){
			 var  shortUrl = $(this).attr('data-url');
			 var  url = window.location.pathname;
			 if(url.indexOf(shortUrl)>=0){
				 $(this).css("background-color",'#0052a3');
				 $(this).css("color",'#fff');
			 }
		 });
	
});


</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 70px; overflow: visible;" >
		<div class="box" onclick="window.location.href='../index';return false"> </div>
	</div>

	<div data-options="region:'south',split:true" style="height: 24px; text-align: center;">
		<p>深圳市铁越电器有限公司  版权所有</p>
	</div>
	
	<div data-options="region:'west',split:true" title="导航" style="width: 200px;">
	<div class="list" >
	<div class="menu_nav"  style="display:none;">
	
		 		<div class="menu_title">&nbsp;<span class="resource_css">&nbsp;&nbsp;&nbsp;</span>  <span style="font-size:14px;">资源管理</span> </div>
			
					<div  class="menu_line" data-url="server/page" > &nbsp;<span class="device_css">&nbsp;&nbsp;&nbsp;</span>  <span style="font-size:14px;">设备管理</span></div>
					<div  class="menu_line" data-url="region/page"  >&nbsp;<span class="region_css">&nbsp;&nbsp;&nbsp;</span> <span  style="font-size:14px;">区域管理</span></div>
					<div  class="menu_line" data-url="monitor/page">&nbsp;<span class="view_css">&nbsp;&nbsp;&nbsp;</span> <span   style="font-size:14px;">监控点管理</span></div>
					<div  class="menu_line" data-url="stream/page" >&nbsp;<span class="stream_css">&nbsp;&nbsp;&nbsp;</span> <span  style="font-size:14px;">流媒体服务器管理</span></div>

				<div  class="menu_title">&nbsp;<span class="system_css">&nbsp;&nbsp;&nbsp;</span>  <span style="font-size:14px;">系统管理</span> </div>
					<div class="menu_line" data-url="user/page" > &nbsp;<span class="user_css">&nbsp;&nbsp;&nbsp;</span> <span style="font-size:14px;">用户管理</span></div>
					<div class="menu_line" data-url="role/page" >&nbsp;<span class="role_css">&nbsp;&nbsp;&nbsp;</span>  <span style="font-size:14px;">角色管理</span></div>
	</div>
	</div>
	</div>

	<div data-options="region:'center'">
