<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>合同</title>
</head>
<body>
	<div class="HR_ZZJL">
	<c:forEach items="${contracks }" var="cont">
		<p>
		    <span>
		        	合同类型：<c:if test="${cont.contractType == 0 }">劳动合同</c:if>
		        	 &nbsp;&nbsp;
		    </span>
			附件：  <a href="${cont.contractDoc}">${cont.contractNum }</a>
		</p>
	</c:forEach>
	</div>
</body>
</html>