<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色关联功能码</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<style type="text/css">
.QXsz_l{width:20%; float:left; border-right:#7FB5DC 1px solid; margin:20px 0 0 20px;}
.QXsz_l dd{ margin:10px 0 5px 20px;}
.QXsz_r{width:65%; float:left; margin:20px 0 0 0px;}
.QXsz_r ul{ margin-left:12px;}
.QXsz_r li{ width:100px; float:left; margin:10px 0 5px 10px;}
.QXsz_r div{ float:right; margin-top:20px;}
.QXsz_r .queding{ width:55px; height:25px; background-image:url(images/HR_qd.gif); border:medium none;}
</style>
<script type="text/javascript">
function showRoleFunc(id){
	$("#empRoleList").attr("src","singleEmpAssociateRole?employeeId="+id);
	$("a[name='empName']").each(function(){
		$(this).css("color","black");
	})
	$("#empName"+id).css("color","red");
}
function reloadParent(){
	parent.right.reload();
}
</script>
</head>

<body>

<div class="HR_lishichaxun_Bottom myBox03">
	<dl class="QXsz_l">
    	<dt>人员列表</dt>
    	<c:forEach items="${employees}" var="emp" varStatus="index">
    		<c:if test="${index.index == 0}">
    			<dd><a id="empName${emp.employeeId}" name="empName" href="javascript:showRoleFunc(${emp.employeeId});" style="color: red;">${emp.userName}</a></dd>
    		</c:if>
    		<c:if test="${index.index != 0}">
    			<dd><a id="empName${emp.employeeId}" name="empName" href="javascript:showRoleFunc(${emp.employeeId});" >${emp.userName}</a></dd>
    		</c:if>
    	</c:forEach>
    </dl>
    <iframe id="empRoleList" frameborder="0" src="singleEmpAssociateRole?employeeId=${employees[0].employeeId}" width="900" height="900"></iframe>
</div>

</body>
</html>
