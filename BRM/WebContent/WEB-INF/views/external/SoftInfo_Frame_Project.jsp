<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style>
.HR_RZXXLeft{ float:left; width:530px;}
.HR_RZXXLeft p{ margin-left:20px; padding:5px 0; margin-bottom:5px;}
.HR_RZXXLeft p input{ width:150px; margin:0 5px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff;}
.HR_RZXXLeft p span{ margin-right:20px;}
.HR_RZXXRight{ float:right; width:120px; text-align:center;}
</style>
</head>
<body>
	<div class="HR_ZZJL">
	<c:if test="${fn:length(project) == 0}">
		<p class="HR_RZBL_Casual">
			项目描述：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${pro.projectDesc }</textarea>
		</p>
		
		<p style="border-bottom:1px solid #60B9F9; width:620px; _margin-top:-20px;"></p>
	</c:if>
	<c:forEach items="${project}" var="pro" varStatus="status">
		<p class="HR_RZBL_Casual">
			项目描述：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${pro.projectDesc }</textarea>
		</p>
		
		<p style="border-bottom:1px solid #60B9F9; width:620px; _margin-top:-20px;"></p>
	</c:forEach>
		
	</div>
</body>
</html>