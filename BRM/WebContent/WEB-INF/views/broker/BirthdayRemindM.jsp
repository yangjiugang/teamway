<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>生日提醒窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript">
function closeHtml(){
	parent.closeFrame();
};
</script>

</head>

<body>

<div class="HR_Yichang_Bottom myBox03">
<c:forEach items="${employeeFamilyInfos}" var="employeeFamilyInfos">
	<div class="HR_shengritixing">今天是您的
	<c:if test="${employeeFamilyInfos.relationship==1}">父亲</c:if>
	<c:if test="${employeeFamilyInfos.relationship==2}">母亲</c:if>
	<c:if test="${employeeFamilyInfos.relationship==3}">妻子</c:if>
	<c:if test="${employeeFamilyInfos.relationship==4}">丈夫</c:if>
	<c:if test="${employeeFamilyInfos.relationship==5}">儿子</c:if>
	<c:if test="${employeeFamilyInfos.relationship==6}">女儿</c:if>
	<c:if test="${employeeFamilyInfos.relationship==7}">兄弟</c:if>
	<c:if test="${employeeFamilyInfos.relationship==8}">姊妹</c:if>
	生日,记得送上祝福哟！</div>
</c:forEach>
</div>

</body>
</html>
