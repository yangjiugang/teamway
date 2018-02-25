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
	<c:forEach items="${userRecommendShares }" var="statInfo">
	<div class="geren-c">
		<dl>
			<img src="${statInfo.userInfo.photoPath }" width="51" height="26" />
			<dt>
				<span>${statInfo.userInfo.userDesc}</span><fmt:formatDate value="${statInfo.recommendTime }" pattern="yyyy-MM-dd" type="date"/>
			</dt>
			<dd>把 <a href="#">${statInfo.recommendContent}</a>
			<c:if test="${statInfo.recommendType==1}">活动 </c:if>
			<c:if test="${statInfo.recommendType==2}">楼盘</c:if>
			<c:if test="${statInfo.recommendType==3}">旅游线路</c:if>
			分享给<c:if test="${statInfo.recommendVisitorType==0}">好友</c:if><c:if test="${statInfo.recommendVisitorType==1}">客户</c:if>
			<a href="#">@${statInfo.recommendVisitor}</a>
			</dd>
		</dl>
		<span class="pu">
			<ul>
			<c:if test="${type==null }">
				<li><a href="delStatInfo?makeType=${type}&userId=${statInfo.recommendId}">删除</a></li>
			</c:if>
			</ul>
		</span>
	</div>
	</c:forEach>
</body>
</html>