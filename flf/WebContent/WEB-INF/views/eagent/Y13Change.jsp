<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path + "/";

	StringBuffer uploadUrl = new StringBuffer("http://");
	uploadUrl.append(request.getHeader("Host"));
	uploadUrl.append(request.getContextPath());
	uploadUrl.append("/FileUploadServlet");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改形象—个人主页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
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
			window.onload = function () {
				swfu = new SWFUpload({
					upload_url: "<%=uploadUrl.toString()%>",
					post_params: {"name" : "huliang"},
					
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
	
					// Button Settings
					button_image_url : "images/SmallSpyGlassWithTransperancy_17x18.png",
					button_placeholder_id : "spanButtonPlaceholder",
					button_width: 180,
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
				swfu.startUpload();
			}
			var win = new Ext.Window({
				title : 'SwfUpload',
				closeAction : 'hide',
				width : 750,
				height : 360,
				resizable : false,
				modal : true,
				html : '<iframe src="index.jsp" width="100%" height="100%"><table><tr><td>000000</td></tr></table></iframe>'
			});
			function showExtShow(){
				win.show();
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
					<li><a href="index-a.jsp">首页</a></li>
					<li><a href="index-geren.jsp" id="cur">个人主页</a></li>
					<li><a href="index-b-a.jsp">客户</a></li>
					<li><a href="index-fang.jsp">房源</a></li>
					<li><a href="jiaoyiY4.jsp">订单</a></li>
					<li><a href="Y52xuexi.jsp">学习</a></li>
					<li><a href="index-haoyou.jsp">好友</a></li>
					<li><a href="Y7chihewanle.jsp">吃喝玩乐</a></li>
					<li><a href="index-xiaoxi.jsp">消息</a></li>
				</ul>
			</div>

		</div>
	</div>
	<div class="FLHEscOUT">
		<div>
			<font>欢迎您进入房乐会! <a href="denglu.html">[安全退出]</a></font>
		</div>
	</div>
	<!--End头部-->

	<div class="middle">

		<!--右边-->
		<div class="FLHRight">
			<!---传靓照--->
			<div class="Out1">
				<div class="khzlTitle">
					<font>修改形象</font><img src="images/zhankai(black).jpg"
						class="updown1" />
				</div>
				<div class="Content1">
					<form>
						<div class="jbzlIpunt">
							<span><font>点击从电脑中选择一张图片</font></span> <span><input
								type="file" id="change_tou" /></span> <span><input
								type="submit" id="sub_change_tou" value="更改" /></span>
						</div>
					</form>
				</div>
			</div>
			<!---End 传靓照--->
		</div>
		<!--End右边-->
	</div>
	<div>
		<div id="content">
			<form>
				<div
					style="display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 2px;">
					<span id="spanButtonPlaceholder"></span>
					<input id="btnUpload" type="button" value="上  传"
						onclick="startUploadFile();" class="btn3_mouseout" />
					<input id="btnCancel" type="button" value="取消所有上传"
						onclick="cancelUpload();" disabled="disabled" class="btn3_mouseout" />
				</div>
			</form>
			<div id="divFileProgressContainer"></div>
			<div id="thumbnails">
				<table id="infoTable" border="0" width="530" style="display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 2px;margin-top:8px;">
				</table>
			</div>
		</div>
	</div>
</body>
</html>
