<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经纪人管理-薪酬福利</title>
<!--[if lte IE 8]><link rel="stylesheet" media="screen" href="css/ie.css"/><![endif]-->	
<!--[if lte IE 6]><link rel="stylesheet" media="screen" href="css/ie6.css"/><![endif]-->
<!--[if IE 7]><link rel="stylesheet" media="screen" href="css/ie7.css"/><![endif]-->
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
	  function goToJsp(iframeName,sendPage){
		document.getElementById(iframeName).src=sendPage;
	  }	  
	  function changeURL(url){
		document.getElementById("iframe").src=url;
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
    	经纪人首页 >> 经纪人管理 >> 经纪人档案管理
</div>
<!--end中间选项卡，面包屑-->
<!--中间-->
<div class="middle">
	<div class="left">
    	<ul class="left_top zp_ltop">
        	<li style="border:none; width:170px;"><a onclick="goToJsp('right','YG_Administration_DYXCFLSC1.html')">当月薪酬福利报表生成</a></li>
         </ul>
        <ul class="left_top zp_ltop">
        	<li style="border:none; width:170px;"><a onclick="goToJsp('right','xinchoufuli_ls.html')">历史薪酬福利结构分析</a></li>
         </ul>
        <dl class="year">
        	<dt style="color:#3662b4; font-size:14px;">历史薪酬福利报表查询/统计</dt>
            <dd style="margin-left:10px;"><select><option>2010年</option></select> <a href="">全年</a></dd>
            <dd><a href="">2010年12月</a></dd>
            <dd><a href="">2010年11月</a></dd>
            <dd><a href="">2010年10月</a></dd>
            <dd><a href="">2010年9月</a></dd>
            <dd><a href="">2010年8月</a></dd>
            <dd><a href="">2010年7月</a></dd>
            <dd><a href="">2010年6月</a></dd>
            <dd><a href="">2010年5月</a></dd>
            <dd><a href="">2010年4月</a></dd>
            <dd><a href="">2010年3月</a></dd>
            <dd><a href="">2010年2月</a></dd>
            <dd><a href="">2010年1月</a></dd>
        </dl>    
    </div>
    <iframe src="SalaryManagement" name="right" id="iframe" frameborder="0" class="right"></iframe>
</div>
<!--end中间-->
</body>
</html>