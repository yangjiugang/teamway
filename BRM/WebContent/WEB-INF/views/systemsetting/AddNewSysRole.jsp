<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加角色窗口</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript">
	function clearText() {
		var roleName = $("#roleName").val();
		if (roleName == "请输入角色名...") {
			$("#roleName").val("");
		}
	}
	function initText() {
		var roleName = $("#roleName").val();
		if (roleName == "") {
			$("#roleName").val("请输入角色名...");
		}
	}
	function addSysRole(){
		var roleName = $("#roleName").val();
		var roleDesc = $("#roleDesc").val();
		if (roleName == "请输入角色名..." || $.trim(roleName)=="") {
			alert("请输入角色名...");
		}else{
			$.fc.ajaxSubmit({
				url:'${pageContext.request.contextPath}/addCompanySystemRole',
				dataType:'json',
				data:"roleName="+roleName+"&roleDesc="+roleDesc,
				callBackFn:function(msg){
					if(msg=='SUCCESS'){
						alert("添加成功");
						parent.right.reload();
						parent.closeFrame();
					}else{
						 alert("添加失败");
						 parent.closeFrame();
					}
				}
			});
			
			
			
			/* $.ajax({
				url:'addCompanySystemRole',
				type:"post",
				dataType:"json",
				data: "roleName="+roleName+"&roleDesc="+roleDesc,
				success: function(msg){
					alert("添加成功");
					parent.closeFrame();
					parent.location.reload();
				 },
				 error:function(msg){
					 alert("添加失败");
					 parent.closeFrame();
				 }
			}); */
		}
	}

</script>
</head>

<body>
			
				<div class="HR_Tianjia_Bottom myBox03">
					<div class="HR_Tianjiadiaochahuodong">
						<div class="HR_Tianjialishi">角色名称：
							<input id="roleName" class="HR_TianjiaSan" style="width: 210px;" value="请输入角色名..." onclick="clearText();" onblur="initText();" /><br/>
						</div>
						<div class="HR_Tianjialishi">角色描述：
							<textarea id="roleDesc" class="HR_TianjiaSan" style="width: 210px;" onkeydown='if(this.value.length>=2){event.returnValue = false;}'></textarea>
						</div>
						<div class="HR_Tianjia_Submit">
							<input type="button" class="HR_Tianjia_Submit01" onclick="addSysRole();" />
							<input type="button" class="HR_Tianjia_Submit02" onclick="javascript:parent.closeFrame();" />
						</div>
					</div>
				</div>
	
</body>
</html>
