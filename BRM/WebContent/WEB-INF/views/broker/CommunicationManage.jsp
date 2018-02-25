<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>沟通管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
	function goToJsp(url){
		parent.document.getElementById("right").src="broker_pageForWard?url="+url;
	}
</script>
</head>
<body>
	<!--左边-->
	<div class="left1" style="height: 260px;">
			<dl>
				<dt>
					<a onclick="goToJsp('CommunicationManageIFrame')">约谈人员管理</a>
				</dt>
				<dt>
					<a onclick="goToJsp('CommunicationActivtyMange')">约谈活动管理</a>
				</dt>
				<dd><a href="javascript:parent.window.changeRight('broker_pageForWard?url=CommunicationActivtyMange&scope=yesterDay')")">昨天约谈记录</a></dd>
				<dd><a href="javascript:parent.window.changeRight('broker_pageForWard?url=CommunicationActivtyMange&scope=thisWeek')">本周约谈记录</a></dd>
				<dd><a href="javascript:parent.window.changeRight('broker_pageForWard?url=CommunicationActivtyMange&scope=thisMonth')">本月约谈记录</a></dd>
				<dt>
					<a onclick="goToJsp('CommunicationRemind')">约谈提醒</a>
				</dt>
			</dl>
	</div>
	<!--end左边-->
</body>
</html>