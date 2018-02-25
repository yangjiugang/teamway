<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
	parent.document.getElementById("${type}Sum").innerHTML='${count}';
	
	$(document).ready(function(){
		var curPage=${curPage};
		var pageCount=${pageCount};
		$("#fenyeyi").pager({curPage:curPage,pageSize:5, pageCount:pageCount, goPageCall:goPage});
		
		function goPage(curPage, pageSize){
			location.href="getStatInfo?getType=collectHouse&userId=${userId}&listType=${listType}&curPage="+curPage+"&pageSize="+pageSize;
		}
		
		function strTrim(str){   
		    return str.replace(/(^\s*)|(\s*$)/g,   "");  
		}
		
	});
</script>
<title>Insert title here</title>
</head>
<body><div>
	<ul class="huodong_status">
		<li style="width:121px;">姓名</li>
		<li style="width:119px;">常驻地</li>
		<li style="width:119px;">生日</li>
		<li style="width:625px;">手机号</li>
	</ul>
	<c:forEach items="${userFriends}" var="friend">
		<ul class="huodong_list">
			<li style="width:89px;">${friend.userInfo.name }</li>
			<li style="width:87px;">${friend.userInfo.userCity }</li>
			<li style="width:87px;"><fmt:formatDate value="${friend.userInfo.firstWorkDate}" pattern="yyyy年MM月dd日" type="date"/></li>
			<li style="width:580px; color:#959698; text-align:center;">${friend.userInfoDetail.cellphone}</li>
		</ul>
	</c:forEach>
	<ul class="tongj">
		<li>统计：<span class="red">${count}</span>条</li>
	</ul>
	<!--页面切换--> 
		<div id="fenyeyi" style="${count==0?'display: none;':''}"></div>
		   <!--页面切换--> 
		   </div>
</body>
</html>