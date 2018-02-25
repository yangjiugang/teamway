<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
<c:if test="${fn:length(userDynamics) == 0}">
	 <div class="geren-c">
	           <dl>
		          <img src="images/fanglifang.jpg" width="51" height="26"/>
			      <dt><span>马超</span>2011-1-30</dt>
			       <dd>你似乎还没收到好友留言，快去给好友留言吧！</dd>
		      </dl>
		       <span class="pu">
		        <ul>
		          <li><a href="#">删除</a></li>
			    </ul>
		      </span>
	       </div>
</c:if>
	<c:forEach items="${userDynamics }" var="Dynamics">
		<div class="geren-c">
			<dl>
				<img src="${Dynamics.photoPath}" width="51" height="26" />
				<dt>
					<span>${Dynamics.userName}</span><fmt:formatDate value="${Dynamics.orderDate }" pattern="yyyy-MM-dd" type="date"/>
				</dt>
				<c:if test="${Dynamics.type==1}">
					<dd>与 <a href="#">@${Dynamics.dataName} </a>约会哦</dd>
				</c:if>
				<c:if test="${Dynamics.type==2}">
					<dd>收藏房团  <a href="#">${Dynamics.dataName}</a></dd>
				</c:if>
				<c:if test="${Dynamics.type==3}">
					<dd>收藏楼盘  <a href="#">${Dynamics.dataName}</a></dd>
				</c:if>
				<c:if test="${Dynamics.type==4}">
					<dd>学习了<a href="#">${Dynamics.dataName}</a> 楼盘</dd>
				</c:if>
				<c:if test="${Dynamics.type==5}">
					<dd>认售了<a href="#">${Dynamics.dataName}</a> 楼盘</dd>
				</c:if>
			</dl>
			<span class="pu">
				<ul>
				<c:if test="${type==null }">
					<li><a href="delDynamic?makeType=${Dynamics.type}&userId=${Dynamics.id}">删除</a></li>
				</c:if>
				</ul>
			</span>
		</div>
	</c:forEach>
</body>
</html>