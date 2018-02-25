<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>关联角色</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<script type="text/javascript">
function changeEmpRole(){
	var employeeId="${employeeIdes}";
	var roles=[];
	$("input[name='roles']:checked").each(function(){
		roles.push($(this).val());
	});
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/changeEmployeeRole',
		dataType:'json',
		data:"employeeIdes="+employeeId+"&roleIds="+roles.join(","),
		callBackFn:function(msg){
			if(msg=='SUCCESS'){
				alert("设置成功");
				parent.right.reload();
				parent.closeFrame();
			}else{
				alert("操作失败");
			}
		}
	});
}
</script>

</head>

<body>




<div class="HR_lishichaxun_Bottom myBox03">
	<div class="QXsz_r" style="margin:20px 0 0 40px; clear:both;"> <font>您将要设置角色的员工：${empNames}</font></div>
	<div class="QXsz_r" style="margin:20px 0 0 40px; clear:both;">
    <font>请选择关联的角色：</font>
      <ul>
	    <c:forEach items="${allRoles}" var="role">
	      <li><input name="roles" id="role${role.roleId}"type="checkbox" value="${role.roleId}"/> ${role.roleName}</li>
	    </c:forEach>
      </ul>
      <div><input type="button" class="queding" onclick="changeEmpRole();" /></div>  
    </div>

</div>






</body>
</html>
