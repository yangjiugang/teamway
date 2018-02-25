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
		var organizationId = $("#organizationId").val();
		var organizationName = $("#organizationName").val();
		var postId = $("#postId").val();
		var postName = $("#postName").val();
		var jobGradeId = $("#jobGradeId").val();
		var jobGradeName = $("#jobGradeName").val();
		var jobLevelId = $("#jobLevelId").val();
		var jobLevelName = $("#jobLevelName").val();
		var employeeId = $("#employeeId").val();
		var companyId = $("#companyId").val();
		
		if(!check($("#newForm"))){return;};
		$.ajax({
			url:"insertEmployeeRewardPunishment",
			type:"post",
			dataType:"json",
			data:"userName="+userName+"&employeeNum="+employeeNum+"&causeDate="+causeDate+"&praisePunishmentDesc="+praisePunishmentDesc+"&recordDate="+recordDate+"&praisePunishmentMethod="+praisePunishmentMethod+"&praiseOrganizationName="+praiseOrganizationName+"&praisePunishmentMoney="+praisePunishmentMoney+"&signName="+signName+"&organizationId="+organizationId+"&organizationName="+organizationName+"&postId="+postId+"&postName="+postName+"&jobGradeId="+jobGradeId+"&jobGradeName="+jobGradeName+"&jobLevelId="+jobLevelId+"&jobLevelName="+jobLevelName+"&employeeId="+employeeId+"&companyId="+companyId,
			success:function(msg){
				switch(msg){
					case 0:alert("新增失败");break;
					case 1:alert("新增成功");break;
				}
				parent.reload();	
				parent.closeFrame();
			},error:function(msg){
				 alert("新增失败");
			 }
		});
		//document.form.submit();
	}
	
	function selectEmployeeInfo(){
		var employeeNum = $("#employeeNum").val();
		if(employeeNum==""){
			alert("员工编号不能为空");
			return;
		}
		$.ajax({
			url:"getEmployeeInfoByEmployeeNum",
			type:"post",
			dataType:"json",
			data: "employeeNum="+employeeNum,
			success: function(msg){
				if(msg==null||msg==""){
					alert("找不到该编号的员工");
					return;
				}
				$("#organizationId").val(msg.organizationId);
				$("#organizationName").val(msg.organizationName);
				$("#postId").val(msg.postId);
				$("#postName").val(msg.postName);
				$("#jobGradeId").val(msg.jobGradeId);
				$("#jobGradeName").val(msg.jobGradeName);
				$("#jobLevelId").val(msg.jobLevelId);
				$("#jobLevelName").val(msg.jobLevelName);
				$("#employeeId").val(msg.employeeId);
				$("#companyId").val(msg.companyId);
			}
		});
	}
</script>
</head>
<body>
		<form action="insertEmployeeRewardPunishment" method="post" name="form" id="newForm">
				<div class="HR_lishichaxun_Bottom myBox03">
					<div id="tabs">
						<div id="tab1" style="padding: 0 20px;">
							<div class="HR_lishichaxun_top29">
								员工姓名：<input style="width: 100px;" type="text" name="userName" id="userName" value="" reg=".*[^ ].*" tip="员工姓名不能为空"/> 员工编号：<input style="width: 100px;" type="text" name="employeeNum" id="employeeNum" value="" onblur="selectEmployeeInfo()" reg=".*[^ ].*" tip="员工编号不能为空"/>
							</div>
							<div class="HR_lishichaxun_top29">
								事由发生日期：<input style="width: 125px;" name="causeDate" id="causeDate" class="Wdate" onClick="WdatePicker({readOnly:'true'})" value="" reg=".*[^ ].*" tip="日期不能为空"/><input type="radio" value="1" name="recordType" checked="checked">嘉奖<input type="radio" value="2" name="recordType">处罚
							</div><br />
							事由简述：<textarea node-type="textEl" name="praisePunishmentDesc" id="praisePunishmentDesc" 
								tabindex="1" class="HR_yidongweihu_Casual" reg=".*[^ ].*" tip="请输入事由"></textarea>
							<div class="HR_lishichaxun_top29">
								嘉奖或处理日期：<input style="width: 243px;" name="recordDate" id="recordDate" class="Wdate" onClick="WdatePicker({readOnly:'true'})" value="" reg=".*[^ ].*" tip="日期不能为空"/>
							</div>
							<div class="HR_lishichaxun_top29">
								嘉奖或处理方法：<input style="width: 243px;" type="text" name="praisePunishmentMethod" id="praisePunishmentMethod" value="" reg=".*[^ ].*" tip="嘉奖或处理方法不能为空"/>
							</div>
							<div class="HR_lishichaxun_top29">
								嘉奖或处理部门：<input style="width: 243px;" type="text" name="praiseOrganizationName" value="" reg=".*[^ ].*" tip="嘉奖或处理部门不能为空"/>
							</div>
							<div class="HR_lishichaxun_top29">
								金额：<input style="width: 119px;" type="text" name="praisePunishmentMoney" id="praisePunishmentMoney" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false" value="" reg=".*[^ ].*" tip="金额不能为空"/> 签发人：<input	style="width: 119px;" type="text" name="signName" id="signName" value="" value="" reg=".*[^ ].*" tip="签发人不能为空"/>
							</div>
							<div class="HR_lishichaxun_Submit">
								<input type="button" class="HR_yidongweihu_Submit01" onclick="modifiEmployeeRewardPunishment()"/>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" id="employeeId" name="employeeId">
				<input type="hidden" id="companyId" name="companyId">
				<input type="hidden" id="organizationId" name="organizationId">
				<input type="hidden" id="organizationName" name="organizationName">
				<input type="hidden" id="postId" name="postId">
				<input type="hidden" id="postName" name="postName">
				<input type="hidden" id="jobGradeId" name="jobGradeId">
				<input type="hidden" id="jobGradeName" name="jobGradeName">
				<input type="hidden" id="jobLevelId" name="jobLevelId">
				<input type="hidden" id="jobLevelName" name="jobLevelName">
		</form>
</body>
</html>