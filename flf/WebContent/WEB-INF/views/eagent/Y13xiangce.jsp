<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path + "/";
	StringBuffer uploadUrl = new StringBuffer("http://");
	uploadUrl.append(request.getHeader("Host"));
	uploadUrl.append(request.getContextPath());
	uploadUrl.append("/UploadPhotoServlet");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>传靓照 - 首页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/tanchu.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/layuod.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css"/>
<link rel="stylesheet" href="css/button.css" type="text/css" />

<link rel="stylesheet" type="text/css" href="ext/resources/css/ext-all.css" />

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="ext/ext-all.js"></script>
<script type="text/javascript" src="ext/ext-lang-zh_CN.js"></script>

<script type="text/javascript" src="js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="js/swfupload/handlers.js"></script>
<script type="text/javascript" src="js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload/handlers.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/picture.js"></script>

<script type="text/javascript">
	function settab_zzjs(name, num, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "zzjs" + i);
			menu.className = i == num ? "on_zzjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
	}
</script>
<script type="text/javascript">
			var swfu;
			var val = 0;
			window.onload = function () {
				swfu = new SWFUpload({
					upload_url: "<%=uploadUrl.toString()%>",		
					
					// File Upload Settings
					file_size_limit : "10 MB",	// 1000MB
					file_types : "*.*",
					file_types_description : "所有文件",
					file_upload_limit : "0",
									
					file_queue_error_handler : fileQueueError,
					file_dialog_complete_handler : fileDialogComplete,//选择好文件后提交
					file_queued_handler : fileQueued,
					upload_progress_handler : uploadProgress,
					upload_error_handler : uploadError,
					upload_success_handler : uploadSuccess,
					upload_complete_handler : uploadComplete,
					use_query_string:true,
					
					// Button Settings
					button_image_url : "images/SmallSpyGlassWithTransperancy_17x18.png",
					button_placeholder_id : "spanButtonPlaceholder",
					button_width: 150,
					button_height: 18,
					button_text : '<span class="button">选择图片 <span class="buttonSmall">(10 MB Max)</span></span>',
					button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall { font-size: 10pt; }',
					button_text_top_padding: 0,
					button_text_left_padding: 18,
					button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
					button_cursor: SWFUpload.CURSOR.HAND,
					
					// Flash Settings
					flash_url : "js/swfupload/swfupload.swf",
	
					custom_settings : {
						upload_target : "divFileProgressContainer"
					},
					// Debug Settings
					debug: false  //是否显示调试窗口
				});
			};
			function startUploadFile(){	   
				var set = document.getElementById('openPhoto');	   
				var setxin = document.getElementById('setxin').value;
	            var index = set.selectedIndex;
            	var setId = set.options[index].value;
            	swfu.addPostParam("setId", setId);//动态修改SWFUpload初始化设置中的post_params属性，其中所有的值都将被覆盖。        		
            	swfu.addPostParam("setxin", encodeURIComponent(setxin));
            	swfu.startUpload();
			}
			function newSet(){
				document.getElementById("newPhotoDiv").style.display="block";
				document.getElementById("openPhoto").disabled="disabled";
				document.getElementById("xiangce").disabled="";
			};
			function xuanZe(){
				document.getElementById("openPhoto").disabled="";
				document.getElementById("xiangce").disabled="disabled";
				document.getElementById("newPhotoDiv").style.display="none";
			}
</script>
<!---总体分类样式--->
<link href="css/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>

<body>
	<!--头部-->
	<div class="FlhTopOut">
		<div class="FlhTop">
			<div class="FlhLogo"></div>
			<div class="TopRight">
				<span class="FLHphone"><div>服务热线：</div> <img
					src="images/phone2.jpg" /><font>400 61355288</font></span>
			</div>
			<div id="menu">
				<ul>
					<li><a href="IndexA">首页</a></li>
					<li><a href="IndexGeren" id="cur">个人主页</a></li>
					<li><a href="IndexBA">客户</a></li>
					<li><a href="IndexFang">房源</a></li>
					<li><a href="JiaoyiY4">订单</a></li>
					<li><a href="Y52xuexi">学习</a></li>
					<li><a href="IndexHaoyou">好友</a></li>
					<li><a href="Y7chihewanle">吃喝玩乐</a></li>
					<li><a href="IndexXiaoxi">消息</a></li>
				</ul>
			</div>

		</div>
	</div>
	<div class="FLHEscOUT">
		<div>
			<font>欢迎您进入房乐会! <a href="">[安全退出]</a></font>
		</div>
	</div>
	<!--End头部-->

	<div class="middle">
		<!--左边-->
		<div class="FLHLeft">
			<div class="FLHzl">
				<span class="photo"><img src="images/touxiang.jpg" id="open_btn"/></span>
				<ul class="nickname">
					<li>昵称：魅力一抖</li>
					<li>姓名：赵美丽</li>
					<li>生日：8.26</li>
					<li><img src="images/8%.jpg" /></li>
				</ul>
				<span class="linkage"> <span style="margin: 0;"><a
						id="open_btn">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a
						href="">[修改密码]</a></span>
				</span>
			</div>
			<div class="jieshao">
				<ul>
					<li>已有<span class="red">3</span>同行加你为好友
					</li>
					<li>已有<span class="red">3</span>客户点名你为房秘书
					</li>
				</ul>
			</div>
			<ul class="treeNav">

				<li>
					<div class="treefont">
						<img src="images/1.jpg" /><font><a
							href="IndexRenshou">认售楼盘</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/2.jpg" /><font><a
							href="KehuTianjiaZhuce">添加客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/3.jpg" /><font><a
							href="Y03juluyuehui">记录约会</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/4.jpg" /><font><a href="RizhiY04Home">写日志</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/5.jpg" /><font><a href="Y13Xiangce">传靓照</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/6.jpg" /><font><a
							href="KaixiaojiluY06">记录开销</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/7.jpg" /><font><a href="HomejiaoyiY4">报名（下订单）</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/8.jpg" /><font><a href="HomeTJFXY4">推荐分享</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><font><a href="#">社交hub</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><font><a href="#">我的财富</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><font><a href="#">积分商场</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><font><a href="#">积分兑换</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><font><a href="#">搜索房源</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><font><a href="#">购搜索房团</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/12.jpg" /><font><a href="#">搜索活动</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/12.jpg" /><font><a href="#">搜索蜂蜜</a></font>
					</div>
					<div class="xian"></div>
				</li>
			</ul>
		</div>
		<!--End左边-->
		<!--右边-->
		<div class="FLHRight">
			<!---传靓照--->
			<div class="Y04rizhi">
				<ul class="Y13xiangce">
					<li><input type="image" name="imageField" id="imageField"
						src="images/Y13scxzp.gif" onclick="showBox('box')"/></li>
						<c:forEach items="${photosList}" var="photosList">
					<li><a href="Y13Xiangxi?photoId=${photosList.photoId}"><img
							src="${photosList.photoPath}" onload="DrawImage(this,100,67)"/></a></li>
							</c:forEach>
				</ul>
				<div class="Y04rizhi_tab">
					<ul>
						<li id="zzjs1" onclick="settab_zzjs('zzjs',1,2)" class="on_zzjs">所有相册</li>
						<li id="zzjs2" onclick="settab_zzjs('zzjs',2,2)">最新照片</li>
					</ul>
				</div>
				<div class="Y04rizhilist">
					<div id="zzjs_zzjs1">
						<ul class="Y13SYXB">
						<c:forEach items="${setList}" var="setList">
							<li><a href="Y13XiangceLB?setName=${setList.setName}"><img
									src="images/Y13SYXB1.jpg" /></a>
								<dt>${setList.setName}</dt></li>
						</c:forEach>
						</ul>
					</div>

					<div id="zzjs_zzjs2" style="display: none;">
						<ul class="Y13XCimg">
						<c:forEach items="${photosList}" var="photosList">
							<li><a href="Y13xiangxi.html"><img
									src="${photosList.photoPath}" onload="DrawImage(this,170,131)" onmouseup="DrawImage(this,0,0)"/></a></li>
						</c:forEach>
						</ul>
					</div>


				</div>
			</div>
			<!---End 传靓照--->
		</div>
		<!--End右边-->
	</div>
	
	<!-- Start 上传图片 -->
	<div id="box" class="tanchuc">
			<form method="post" action="UploadPhotoServlet">
	<div style="height: 300px;background-color:#C5D9FF;width: 550px;">
		<div id="content" style="background-color: white;width: 530px;background-color: #C5D9FF;">
				<div
					style="width:524px; display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 4px;height: 18px;float: left;">
					<span id="spanButtonPlaceholder"></span>
					<input id="btnUpload" type="button" value="上  传"
						onclick="startUploadFile();" class="btn3_mouseout" style="margin-bottom: 12px;"/>
					<input id="btnCancel" type="button" value="取消上传"
						onclick="cancelUpload();" disabled="disabled" class="btn3_mouseout" style="margin-bottom: 12px"/>
					<input disabled="disabled" type="text" readonly="readonly" class="btn3_mouseout" id="xiangce" value="选择相册:" style="height18px;width:58px;;margin-bottom: 12px;background-color: #C5D9FF;" onclick="xuanZe();" onclick="xuanZe();" >
					<select name="photoSet" id="openPhoto" style="width: 80px;margin-bottom: 12px;margin-right: 4px;" onchange="aa();">
					<option  value="0"></option>
					<c:forEach items="${setList}" var="setList">
						<option value="${setList.setId}">${setList.setName}</option>
					</c:forEach>
					</select>
					<input onclick="newSet();" class="btn3_mouseout" type="button" value="创建相册" style="margin-bottom: 12px;padding: 4px;" />
					<input id="btnUpload" class="btn3_mouseout" style="margin-bottom: 12px;" type="button" value="退出" onclick="closeBox('box')" style="padding: 4px ">
		</div>
		<div id="divFileProgressContainer" style="height: 30px;" ><div id="newPhotoDiv"  style="float: right;display: none"><span >请输入相册名：<input id="setxin" value="" type="text" name="setPhoto"/></span></div></div>
		<div id="thumbnails" style="background-color: #C5D9FF;width: 530px;">
				<table id="infoTable" border="0" width="100%" style="display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 4px;margin-top:8px;">
				</table>
		</div>
	</div>
	</div>
	</form>
	</div>
	<!-- end 上传图片 -->
</body>
</html>
