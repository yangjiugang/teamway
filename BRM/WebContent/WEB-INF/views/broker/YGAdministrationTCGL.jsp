<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>经纪人管理-提成管理</title>
<!--[if lte IE 8]><link rel="stylesheet" media="screen" href="css/ie.css"/><![endif]-->	
<!--[if lte IE 6]><link rel="stylesheet" media="screen" href="css/ie6.css"/><![endif]-->
<!--[if IE 7]><link rel="stylesheet" media="screen" href="css/ie7.css"/><![endif]-->
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
	  function goToJsp(sendPage){
		  	parent.$("#right").attr("src",sendPage);
	  };
	  function changeTCURL(url){
		  	var year = $("#year").val();
		  	parent.$("#right").attr("src",'pushLineTC?month='+url+"&year="+year);
      }
	  function showFrame(title,url,width,height){
			ShowIframe(title,url,width,height);
	  }
      function closeFrame(){
			ClosePop();
	  }
</script>
</head>

<body>
<!--头部-->

<!--中间-->
	<div class="left1">
    	<!--<ul class="left_top zp_ltop">
        	<li style="border:none;"><a href="">当月绩效导入</a></li>
         </ul>-->
        <ul class="left_top zp_ltop">
        	<authz:authorize ifAllGranted="FUNC_AUTH_BRO_12_01"><li style="border:none; width:170px;"><a onclick="goToJsp('historyPush')">历史绩效结构分析</a></li></authz:authorize>
         </ul>  
        <dl class="year">
        	<dt style="color:#3662b4; font-size:14px;">历史提成查询/统计</dt>
            <dd style="margin-left:10px;"><select id="year" onchange="changeTCURL('13');">
            <option value="2012">2012年</option>
            <option value="2011">2011年</option>
            <option value="2010">2010年</option>
            <option value="2009">2009年</option>
            <option value="2008">2008年</option>
            <option value="2007">2007年</option>
            <option value="2006">2006年</option>
            <option value="2005">2005年</option>
            <option value="2004">2004年</option>
            <option value="2003">2003年</option>
            <option value="2002">2002年</option>
            </select> <a onclick="changeTCURL('13');">全年</a></dd>
            <dd><a onclick="changeTCURL('12');">12月</a></dd>
            <dd><a onclick="changeTCURL('11');">11月</a></dd>
            <dd><a onclick="changeTCURL('10');">10月</a></dd>
            <dd><a onclick="changeTCURL('09');">09月</a></dd>
            <dd><a onclick="changeTCURL('08');">08月</a></dd>
            <dd><a onclick="changeTCURL('07');">07月</a></dd>
            <dd><a onclick="changeTCURL('06');">06月</a></dd>
            <dd><a onclick="changeTCURL('05');">05月</a></dd>
            <dd><a onclick="changeTCURL('04');">04月</a></dd>
            <dd><a onclick="changeTCURL('03');">03月</a></dd>
            <dd><a onclick="changeTCURL('02');">02月</a></dd>
            <dd><a onclick="changeTCURL('01');">01月</a></dd>
        </dl> 
    </div>
    <iframe id="showDiv" style="display: none;position: absolute;" frameborder="0" class="right"></iframe>
<!--end中间-->
</body>
</html>