<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>经纪人管理-生日慰问</title>
<!--[if lte IE 8]><link rel="stylesheet" media="screen" href="css/ie.css"/><![endif]-->	
<!--[if lte IE 6]><link rel="stylesheet" media="screen" href="css/ie6.css"/><![endif]-->
<!--[if IE 7]><link rel="stylesheet" media="screen" href="css/ie7.css"/><![endif]-->
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript">
function changeURL(url){
	parent.$("#right").attr("src",'SR?dayName='+url);
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
<!--中间-->
	<div class="left1">
    	<!--<ul class="left_top zp_ltop">
        	<li style="border:none; width:170px;"><a href="">招聘工作统计分析</a></li>
         </ul>
        <ul class="left_top zp_ltop">
        	<li><a href="">添加招聘任务</a></li><li style="border:none;"><a href="">终止招聘任务</a></li>
         </ul>  -->  
        <form>
        <dl>
        	<!--<dt style="color:#3662b4; font-size:14px;"><a href="YG_Administration_YGGX.html">生日提醒</a></dt>-->
            <dd><a onclick="changeURL('today');">今天生日   (${today})</a></dd>
            <dd><a onclick="changeURL('tomorrow');">明天生日   (${tomorrow})</a></dd>
          	<dd><a onclick="changeURL('bermorgen');">后天生日   (${bermorgen})</a></dd>
            <dd><a onclick="changeURL('thisWeek');">本周生日   (${thisWeek})</a></dd>
            <dd><a onclick="changeURL('thisMonth');">本月生日   (${thisMonth})</a></dd>            
        </dl>
        </form>
    </div>
    <iframe id="showDiv" style="display: none;position: absolute;" frameborder="0" class="right"></iframe>    
    
    <iframe id="cIframe" src="#" name="right" frameborder="0" class="right"></iframe>
<!--end中间-->
</body>
</html>
