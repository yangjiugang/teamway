<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="left1">
        <dl>
            <dd><a href="javascript:parent.window.changeRight('CheckingInManagement?type=1')">昨天异常考勤   (${yesterdayCNT })</a></dd>
            <dd><a href="javascript:parent.window.changeRight('CheckingInManagement?type=2')">本周异常考勤   (${weekCNT })</a></dd>
          	<dd><a href="javascript:parent.window.changeRight('CheckingInManagement?type=3')">本月异常考勤   (${monthCNT })</a></dd>
        </dl>
    </div>
</body>
</html>