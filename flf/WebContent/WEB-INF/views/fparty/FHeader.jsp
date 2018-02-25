<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/fparty/layout.css" />
</head>
<body>
<div class="FlhTopOut">
	<div class="FlhTop">
        <div class="FlhLogo"></div>
        <div class="TopRight">
            <span class="FLHMap"><div>房立方</div><img  src="images/mapImg.png"/><font>主题会所分布网点</font></span>
            <span class="FLHphone"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></span>
        </div>
	</div>
</div>
<div class="FLHEscOUT">
	<div>
    	<font>欢迎您进入房乐会! 
    	<c:if test="${sessionScope.VISITOR_TYPE == 'ROLE_1'}"><c:url value="/j_spring_security_logout" var="logoutUrl"/><a href="${logoutUrl}">[安全退出]</a></c:if>
    	<c:if test="${sessionScope.VISITOR_TYPE != 'ROLE_1' }"><c:url value="toflogin" var="toflogin"/><a href="${toflogin}">[登录]</a>
    	<c:url value="register" var="register"/><a href="${register}">[注册]</a></c:if></font>
    </div>
</div>

<!--End头部-->
</body>
</html>
<!--End头部-->
