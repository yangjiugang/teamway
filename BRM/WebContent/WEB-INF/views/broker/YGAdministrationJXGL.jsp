<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
	function showFrame(title,url,width,height){
		ShowIframe(title,url,width,height);
	}
	function closeFrame(){
		ClosePop();
	}
	function reload(){
		document.getElementById("right").src = "AppraisalManagement";
	}
	function ifremaUrl(type){
		document.getElementById("right").src = "RewardPunishmentManagement?type="+type;
	}
</script>
</head>
<body>
<!--头部-->
<div class="head">
	<ul class="manu">
    	<li><a href="index.html" class="manu1"></a></li>
        <li><a href="YG_Administration_DAGL.html" class="manu02"></a></li>
        <li><a href="YG_Administration_RCTD.html" class="manu3"></a></li>
        <li><a href="YG_Administration_RCK.html" class="manu4"></a></li>
        <li><a href="YG_Administration_LZGL.html" class="manu5"></a></li>
        <li><a href="YG_Administration_GWGL.html" class="manu6"></a></li>
        <li><a href="YG_Administration_GWGL.html" class="manu7"></a></li>
    </ul>
    <div class="top_right">
    	<ul>
        	<li><a href=""><span><img src="images/top_zt.jpg" /></span> 职谈大厅</a></li>
            <li><a href=""><span><img src="images/top_yg.jpg" /></span> 云过程平台</a></li>
            <li><a href="XTSZ.html"><span><img src="images/top_sz.jpg" /></span> 系统设置</a></li>
        </ul>
        <h1>房立方地产经纪人管理系统</h1>
    </div>
</div>
<!--end头部-->
<!--中间选项卡，面包屑-->
<div class="tab1">
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
       <li><a href="YG_Administration_SRWW.html">生日提示</a></li>
       <li><a href="pushIndex">提成管理</a></li>
     </ul>
</div>
    <div class="breadCrumb">
    	经纪人首页 >> 经纪人管理 >> 绩效管理
</div>
<!--end中间选项卡，面包屑-->
<!--中间-->
<div class="middle">
	<iframe id="left" name="left" src="AppraisalManagementLeft" frameborder="0" class="left"></iframe>
    <div id="line" style="float:left; background-color:#7fb5dc; width:1px; height:100%;cursor:w-resize;"></div>
    <iframe src="AppraisalManagement" name="right" frameborder="0" class="right" id="right"></iframe>
</div>
<!--end中间-->
</body>
</html>