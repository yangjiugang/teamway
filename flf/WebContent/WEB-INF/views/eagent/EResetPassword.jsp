<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>找回密码</title>
</head>

<body>
<%@ include file="ELoginHeader.jsp" %>
<div class="middle">
 	<div class="FLHLeft">
    	<%@ include file="ELoginLeft.jsp" %>
    </div>
    <div class="FLHRight">
		<%@ include file="../fparty/ResetPassword.jsp" %>
	</div>
</div>
</body>
</html>
