<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<%@ include file="../common.jsp" %>
<script type="text/javascript">
function showFrame(title,url,width,height){
	ShowIframe(title,url,width,height);
}

function closeFrame(){
	ClosePop();
}

function getObj(id){
	return getChildObj(id);
}

$(document).ready(function(){
	setRightWidth();
	var oLine = document.getElementById("line");
	oLine.onmousedown = function(e) {
		document.onmousemove = function(e) {
			var x = mousePos(e).x;
			$("#left").width(x);
			setRightWidth();
		};
		document.onmouseup = function() {
			document.onmousemove = null;
			document.onmouseup = null;	
			oLine.releaseCapture && oLine.releaseCapture();
		};
		oLine.setCapture && oLine.setCapture();
		return false;
	};
	
	$(window).resize(function() {
		var w = xWidth();
		$(".head").width(w);
		$(".breadCrumb").width(w);
		$(".middle").width(w);
		setRightWidth();
	});
	
	function xWidth(){
		var wWin = $(window).width();
		return wWin < 1220 ? 1220 : wWin;
	}
	
	function setRightWidth(){
		$("#right").width(xWidth() - $("#left").width() - 6);
	}
});

function changeMenu(leftUrl, rightUrl){ // 上面菜单点击执行
	$("#left").attr("src", leftUrl);
	$("#right").attr("src", rightUrl);
}

function changeRight(url){ // 左边菜单点击执行
	$("#right").attr("src", url);
}

function combParam(params){
	var p = "";
	if(params){
		if(params.single == 1)
			p = "single=1";
		if(params.idx)
			p += p=="" ? ("idx="+params.idx) : ("&idx="+params.idx);
	}
	return p;
}

function popupPersonSelector(params) { // 弹出人员选择器
	var p = combParam(params);
	parent.showFrame('人员选择器','personSelector'+(p==""?"":("?"+p)),700,350);
}

function popupOrgSelector(params) { // 弹出部门选择器
	var p = combParam(params);
	parent.showFrame('部门选择器','orgSelector'+(p==""?"":("?"+p)),700,350);
}

function popupPostSelector(params) { // 弹出岗位选择器
	var p = combParam(params);
	parent.showFrame('岗位选择器','postSelector'+(p==""?"":("?"+p)),700,350);
}

function getParentWin(){
	return getChildFrame() || document.getElementById("right").contentWindow;
}
</script>
</head>
<body>
<!--头部-->
<%@include file="Head.jsp" %>
<!--end头部-->
<!--中间选项卡，面包屑-->
<div class="tab1">
    <c:choose>
		<c:when test="${flag eq 'broker'}">
			<ul>
		       <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01"><li><a onclick="changeMenu('retainManage','intoRetainManageList?taskId=0')">招聘管理</a></li></authz:authorize>
		       <li><a href="#" onclick="changeMenu('broker_postChange','broker_postChangeIFrame')">异动管理</a></li>
		       <authz:authorize ifAllGranted="FUNC_AUTH_BRO_03"><li class="li_border"><a href="YG_Administration_DAGL.html">经纪人档案管理</a></li></authz:authorize>
		       <li><a href="YG_Administration_XCFLGL.html">薪酬福利管理</a></li>
		       <li><a href="#" onclick="changeMenu('AppraisalManagementLeft','AppraisalManagement')">绩效管理</a></li>
		       <li><a href="#" onclick="changeMenu('trainLeft', 'trainList?taskStatus=-1')">培训管理</a></li>
		       <li><a href="#" onclick="changeMenu('investigationLeft', 'activityManagement?testStatus=9')">调查活动管理</a></li>
		       <li><a href="#" onclick="changeMenu('CheckingInManagementLeft','CheckingInManagement')">考勤管理</a></li>
		       <li><a href="#" onclick="changeMenu('RewardPunishmentManagementLeft','RewardPunishmentManagement')">奖惩管理</a></li>
		       <li><a href="#" onclick="changeMenu('broker_Communication','broker_pageForWard?url=CommunicationManageIFrame')">约谈管理</a></li>
		       <authz:authorize ifAllGranted="FUNC_AUTH_BRO_11"><li><a href="#" onclick="changeMenu('BirthdayRemind', 'SR?dayName=today')">生日提示</a></li></authz:authorize>
		       <authz:authorize ifAllGranted="FUNC_AUTH_BRO_12"><li><a href="#" onclick="changeMenu('pushIndex', 'pushLineTC?month=13')">提成管理</a></li></authz:authorize>
			</ul>
			<script>changeMenu("investigationLeft", "activityManagement?testStatus=9");</script>
		</c:when>
		<c:when test="${flag eq 'deactivated'}">
			<ul>
		       <li><a href="YG_Administration_ZPGL.html">招聘管理</a></li>
		       <li><a href="YG_Administration_YDGL.html">异动管理</a></li>
		       <li class="li_border"><a href="YG_Administration_DAGL.html">经纪人档案管理</a></li>
		       <li><a href="YG_Administration_XCFLGL.html">薪酬福利管理</a></li>
		       <li><a href="YG_Administration_JXGL.html">绩效管理</a></li>
		       <li><a href="YG_Administration_PXGL.html">培训管理</a></li>
		       <li><a href="YG_Administration_DCGL.html">调查活动管理</a></li>
		       <li><a href="YG_Administration_KQGL.html">考勤管理</a></li>
		       <li><a href="YG_Administration_JCGL.html">奖惩管理</a></li>
		       <li><a href="YG_Administration_YTGL.html">沟通管理</a></li> 
		       <authz:authorize ifAllGranted="FUNC_AUTH_BRO_11"><li><a href="#" onclick="changeMenu('BirthdayRemind', 'SR')">生日提示</a></li></authz:authorize>
               <authz:authorize ifAllGranted="FUNC_AUTH_BRO_12"> <li><a href="#" onclick="changeMenu('pushLineTC', 'pushLine?month=13')">提成管理</a></li></authz:authorize>
			</ul>
		</c:when>
	</c:choose>
</div>
    <div class="breadCrumb">
    	经纪人首页 >> 经纪人管理 >> 经纪人档案管理
</div>
<!--end中间选项卡，面包屑-->
<!--中间-->
<div class="middle">
    <iframe id="left" name="left" frameborder="0" class="left"></iframe>
    <div id="line" style="float:left;background-color:#7fb5dc;width:2px;height:100%;cursor:w-resize;"></div>
    <iframe id="right" name="right" frameborder="0" class="right"></iframe>
</div>
<!--end中间-->
<!--每个模块设置默认显示内容-->
<c:choose>
	<c:when test="${flag eq 'broker'}">
		<script>changeMenu("investigationLeft", "activityManagement?testStatus=9");</script>
	</c:when>
	<c:when test="${flag eq 'deactivated'}">
		<script>changeMenu("DimissionUserLeft", "lz");</script>
	</c:when>
	<c:when test="${flag eq 'homepage'}">
		<script>changeMenu("system_settings", "systemSettingsDefaultRight");</script>
	</c:when>
	<c:when test="${flag eq 'external'}">
		<script>changeMenu("external_frameJsp?jsp=External_Left", "external_frameJsp?jsp=Personnel&type=");</script>
	</c:when>
	<c:when test="${flag eq 'todayInterview'}">
		<script>changeMenu("homepage_todayLeft", "homepage_todayInterview");</script>
	</c:when>
	<c:when test="${flag eq 'todayJob'}">
		<script>changeMenu("homepage_todayLeft", "homepage_todayJob");</script>
	</c:when>
	<c:when test="${flag eq 'todayTraining'}">
		<script>changeMenu("homepage_todayLeft", "homepage_todayTraining");</script>
	</c:when>
	<c:when test="${flag eq 'todaySurvey'}">
		<script>changeMenu("homepage_todayLeft", "homepage_todaySurvey");</script>
	</c:when>
	<c:when test="${flag eq 'todayAppointments'}">
		<script>changeMenu("homepage_todayLeft", "homepage_todayAppointments");</script>
	</c:when>
	<c:when test="${flag eq 'todaySiuhong'}">
		<script>changeMenu("homepage_todayLeft", "homepage_todaySiuhong");</script>
	</c:when>
	<c:when test="${flag eq 'echelon'}">
		<script>changeMenu("echelon_JSPForWard?jspName=BrokerEchelonLeft", "echelon_JSPForWard?jspName=BrokerEchelonRight");</script>
	</c:when>
</c:choose>
</body>
</html>
