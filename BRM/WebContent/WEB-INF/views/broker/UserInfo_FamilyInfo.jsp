<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>家庭成员</title>
</head>
<body>
	<div class="HR_ZZJL">
	<c:forEach items="${family}" var="entity">
		<p>
		<span>姓名：<input class="XXMCinput" readonly="readonly" value="${entity.memberName }"/></span>
		年龄：<input class="XXMCinput" value="${entity.memberBirthday }"/>
		</p>
		<p>
			<span>关系：<input class="XXMCinput" readonly="readonly" value="${entity.relationship }"/></span>
			常用联系电话：<input class="XXMCinput" style="width:133px;" readonly="readonly" value="${entity.telephone }"/>
		</p>
		<p>
			<span>工作单位：<input class="XXMCinput" style="width:146px;" readonly="readonly" value="${entity.memberUnit }"/></span>
			岗位：<input class="XXMCinput" readonly="readonly" value="${entity.memberPost }"/>
		</p>
	</c:forEach>
		
	</div>
</body>
</html>