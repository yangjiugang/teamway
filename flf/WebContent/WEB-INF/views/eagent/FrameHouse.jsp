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
		<li style="width:121px;">楼盘名</li>
		<li style="width:119px;">楼盘类型</li>
		<li style="width:119px;">楼盘价格</li>
		<li style="width:119px;">楼盘面积</li>
		<li style="width:98px;">日期</li>
		<li style=" width:98px;">喊价</li>
		<li style=" width:306px; border:none;">评论</li>
	</ul>
	<c:forEach items="${houseInfos}" var="houseInfo">
		<ul class="huodong_list">
			<li style="width:89px;">${houseInfo.houseName }</li>
			<li style="width:87px;">
				<c:if test="${houseInfo.houseProperties==0 }">  普通住宅 </c:if>
				<c:if test="${houseInfo.houseProperties==1 }">  花园洋房 </c:if>
				<c:if test="${houseInfo.houseProperties==2 }">  别墅 </c:if>
				<c:if test="${houseInfo.houseProperties==3 }">  商住楼 </c:if>
				<c:if test="${houseInfo.houseProperties==4 }">  写字楼 </c:if>
				<c:if test="${houseInfo.houseProperties==5 }">  商铺 </c:if>
				<c:if test="${houseInfo.houseProperties==6 }">  厂房 </c:if>
				<c:if test="${houseInfo.houseProperties==7 }">  仓库 </c:if>
				<c:if test="${houseInfo.houseProperties==8 }">  其他 </c:if>
			</li>
			<li style="width:87px;">${houseInfo.housePrice }</li>
			<li style="width:87px;">${houseInfo.houseMinArea }-${houseInfo.houseMaxArea}</li>
			<li style=" width:66px;"><fmt:formatDate value="${houseInfo.createdAt }" pattern="MM.dd a hh:mm" type="date"/></li>
			<li style=" width:66px;">${houseInfo.wharf==0?'未喊价':'已喊价' }</li>
			<li style="width:274px; color:#959698;">${houseInfo.houseDesc==null?"你还未评论哦!":houseInfo.houseDesc }</li>
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