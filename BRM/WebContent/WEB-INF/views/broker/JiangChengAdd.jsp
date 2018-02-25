<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
	function modifiEmployeeRewardPunishment(){
		var userName = $("#userName").val();
		var employeeNum =$("#employeeNum").val();
		var causeDate = $("#causeDate").val();
		var praisePunishmentDesc = $("#praisePunishmentDesc").val();
		var recordDate = $("#recordDate").val();
		var praisePunishmentMethod = $("#praisePunishmentMethod").val();
		var praiseOrganizationName = $("#praiseOrganizationName").val();
		var praisePunishmentMoney = $("#praisePunishmentMoney").val();
		var signName = $("#signName").val();
		
		if(!check($("#newForm"))){return;};
		$.ajax({
			url:"updateEmployeeRewardPunishment",
			type:"post",
			dataType:"json",
			data:"causeDate="+causeDate+"&praisePunishmentDesc="+praisePunishmentDesc+"&recordDate="+recordDate+"&praisePunishmentMethod="+praisePunishmentMethod+"&praiseOrganizationName="+praiseOrganizationName+"&praisePunishmentMoney="+praisePunishmentMoney+"&signName="+signName,
			success:function(msg){
				switch(msg){
					case 0:alert("修改失败");break;
					case 1:alert("修改成功");break;
				}
				parent.reload();	
				parent.closeFrame();
			},error:function(msg){
				 alert("修改失败");
			 }
		});
	}
</script>
</head>
<body>
		<form action="updateEmployeeRewardPunishment" method="post" name="newForm" id="newForm">
				<div class="HR_lishichaxun_Bottom myBox03">
					<div id="tabs">
						<div id="tab1" style="padding: 0 20px;">
							<div class="HR_lishichaxun_top29">
								员工姓名：<input style="width: 100px;" type="text" name="userName" id="userName" value="${employeeRewardPunishment.employeeInfo.userName }" readonly="readonly"/> 员工编号：<input style="width: 100px;" type="text" name="employeeNum" id="employeeNum" value="${employeeRewardPunishment.employeeInfo.employeeNum }" readonly="readonly"/>
										 <input type="hidden" name="recordId" value="${employeeRewardPunishment.recordId }">
							</div>
							<div class="HR_lishichaxun_top29">
								事由发生日期：<input style="width: 255px;" name="causeDate" id="causeDate" class="Wdate" onClick="WdatePicker({readOnly:'true'})" reg=".*[^ ].*" tip="日期不能为空" value="<fmt:formatDate value="${employeeRewardPunishment.causeDate }" pattern="yyyy-MM-dd "/>"/>
							</div><br />
							事由简述：<textarea node-type="textEl" name="praisePunishmentDesc" id="praisePunishmentDesc" title="请输入......."
								tabindex="1" class="HR_yidongweihu_Casual" reg=".*[^ ].*" tip="请输入事由">${employeeRewardPunishment.praisePunishmentDesc }</textarea>
							<div class="HR_lishichaxun_top29">
								嘉奖或处理日期：<input style="width: 243px;" name="recordDate" id="recordDate" class="Wdate" onClick="WdatePicker({readOnly:'true'})" reg=".*[^ ].*" tip="日期不能为空" value="<fmt:formatDate value="${employeeRewardPunishment.recordDate }" pattern="yyyy-MM-dd "/>"/>
							</div>
							<div class="HR_lishichaxun_top29">
								嘉奖或处理方法：<input style="width: 243px;" type="text" name="praisePunishmentMethod" id="praisePunishmentMethod" reg=".*[^ ].*" tip="嘉奖或处理方法不能为空" value="${employeeRewardPunishment.praisePunishmentMethod }"/>
							</div>
							<div class="HR_lishichaxun_top29">
								嘉奖或处理部门：<input style="width: 243px;" type="text" name="praiseOrganizationName" reg=".*[^ ].*" tip="嘉奖或处理部门不能为空" value="${employeeRewardPunishment.praiseOrganizationName }"/>
							</div>
							<div class="HR_lishichaxun_top29">
								金额：<input style="width: 119px;" type="text" name="praisePunishmentMoney" id="praisePunishmentMoney" reg=".*[^ ].*" tip="金额不能为空" value="${employeeRewardPunishment.praisePunishmentMoney }" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /> 签发人：<input	style="width: 119px;" type="text" name="signName" id="signName" reg=".*[^ ].*" tip="签发人不能为空" value="${signName }"/>
							</div>
							<div class="HR_lishichaxun_Submit">
								<input type="button" class="HR_yidongweihu_Submit01" onclick="modifiEmployeeRewardPunishment()"/>
							</div>
						</div>
					</div>
				</div>
		</form>
</body>
</html>