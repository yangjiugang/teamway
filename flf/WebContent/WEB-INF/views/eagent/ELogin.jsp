<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录易介宝</title>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
</head>

<body onload="document.f.j_username.focus();">
<%@ include file="ELoginHeader.jsp" %>
<div class="middle">
<!--左边-->
 	<%@ include file="ELoginLeft.jsp" %>
<!--End左边-->
<!--右边-->
    <div class="FLHRights">
		<div id="jianjie"><img src="images/denglu.jpg" /></div>
    </div>
<!--End右边-->    
</div>
</body>
<script type="text/javascript">
		var error = '${errorMsg}';
		if(error != '' )alert(error);
</script>
</html>
