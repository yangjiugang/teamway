<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>找回密码</title>
</head>

<body onload="document.f.j_username.focus();">
<%@ include file="FHeader.jsp" %>
<div class="middle">
 	<div class="FLHLeft">
    	<%@ include file="FLoginLeft.jsp" %>
    </div>
    <div class="FLHRight">
		<%@ include file="ResetPasswordSucceed.jsp" %>
	</div>
</div>
</body>
</html>
