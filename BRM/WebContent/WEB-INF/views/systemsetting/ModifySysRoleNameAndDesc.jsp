<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改角色窗口</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript">
	function modifySysRole(){
		var roleId = $("#xgRoleId").val();
		var roleName = $("#xgRoleName").val();
		var roleDesc = $("#xgRoleDesc").val();
		if (roleName == "请输入角色名..." || $.trim(roleName)=="") {
			alert("请输入角色名...");
			return;
		}else{
			$.fc.ajaxSubmit({
				url:'${pageContext.request.contextPath}/modifyCompanySystemRole',
				dataType:'json',
				data:"roleId="+roleId+"&roleName="+roleName+"&roleDesc="+roleDesc,
				callBackFn:function(msg){
					if(msg=='SUCCESS'){
						alert("修改成功");
						parent.right.reload();
						parent.closeFrame();
						/* document.getElementById('right').contentWindow.document.getElementById('qxlist').trigger("reloadGrid"); 
						  $('#right').contentWindow.$("#qxlist").trigger("reloadGrid");  */
					}else{
						alert("修改失败");
						parent.closeFrame();
					}
				}
			});
		}
	}
</script>
</head>

<body>
				
				<div class="HR_Tianjia_Bottom myBox03">
					<div class="HR_Tianjiadiaochahuodong">
						<div class="HR_Tianjialishi">角色名称：
							<input id="xgRoleId" type="hidden" value="${companyRole.roleId }"/>
							<input id="xgRoleName" class="HR_TianjiaSan" style="width: 210px;" value="${companyRole.roleName }" />
						</div>
						<div class="HR_Tianjialishi">角色描述：
							<textarea id="xgRoleDesc" class="HR_TianjiaSan" style="width: 210px;">${companyRole.roleDesc }</textarea>
						</div>
						<div class="HR_Tianjia_Submit">
							<input type="button" class="HR_Tianjia_Submit01" onclick="modifySysRole();" />
							<input type="button" class="HR_Tianjia_Submit02" onclick="javascript:parent.closeFrame();"/>
						</div>
					</div>
				</div>
	
</body>
</html>
