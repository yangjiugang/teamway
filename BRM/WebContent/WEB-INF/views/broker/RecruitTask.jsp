<%
/**********************************************************************
 * 添加招聘任务
 * 2012-3-27 邓祥 新建
 **********************************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加招聘任务</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
	<script>
		
		  function init(){
			  var taskId= $("#taskId").val();
			  if(taskId!=0){
				  document.getElementById("tijiao").style.display="none"; 
				  $("#organizationName").attr("disabled","disabled");
				  $("#postName").attr("disabled","disabled");
				  $("#userCnt").attr("disabled","disabled");
				  $("#taskDesc").attr("disabled","disabled");
				  $("#hopeWorkDate").attr("disabled","disabled");
				 // $("#requireUserName").attr("disabled","disabled");
				 // $("#requireUserName").attr("disabled","disabled");
				  
			  }
		  }
	
		  //添加招聘任务
		  function addRecruitTask(from){
			  	var vFlag = false;
				 var vMessage = "";
				 if(recruitTaskfrom.taskNum.value==""){
				 		vMessage+="任务单号不能为空！\n";
				 		vFlag = true ;
				 }
		         if(recruitTaskfrom.organizationName.value==""){
				 		vMessage+="用工部门不能为空！\n";
				 		vFlag = true ;
				 }
		         if(recruitTaskfrom.postName.value==""){
				 		vMessage+="待聘岗位不能为空！\n";
				 		vFlag = true ;
				 }
		         if(recruitTaskfrom.userCnt.value==""){
				 		vMessage+="人数不能为空！\n";
				 		vFlag = true ;
				 }
		         if(recruitTaskfrom.hopeWorkDate.value==""){
				 		vMessage+="希望到岗日期不能为空！\n";
				 		vFlag = true ;
				 }
		         if(recruitTaskfrom.requireUserName.value==""){
				 		vMessage+="申请人不能为空！\n";
				 		vFlag = true ;
				 }
					if(vFlag){
							alert(vMessage);
							return;
					}
			
			  recruitTaskfrom.submit();
			  parent.left.reload();
			  parent.ClosePop();
		  }
		  
		
		  
	</script>
</head>
<body onLoad="init();">
	<form name="recruitTaskfrom" action="addRecruitTask" method="post">
		<input type="hidden" name="taskId" id ="taskId" value="${recruitTask.taskId}"/>
		<div class="HR_Yichang_Bottom myBox03">
			
			<div class="HR_Tanchu28_input">
				任务单号：<font color="red">*</font><input name="taskNum" id = "taskNum" value="${recruitTask.taskNum }" readonly="readonly"   style="width:220px;" />
			</div>
			<div class="HR_Tanchu28_input">
				用工部门：<font color="red">*</font><input name="organizationName" id ="organizationName" value="${recruitTask.organizationName }" maxlength="10" style="width:220px;" />
				<input type="hidden" name="organizationId"  />
			</div>
			<div class="HR_Tanchu28_input">
				待聘岗位：<font color="red">*</font><input name="postName" id= "postName" value="${recruitTask.postName }" maxlength="10" style="width:220px;" />
				<input type="hidden" name="postId" />
			</div>
			<div class="HR_Tanchu28_input">
				人数：<font color="red">*</font><input name="userCnt" id ="userCnt" value="${recruitTask.userCnt }" 
				 maxlength="5" style="width:244px;" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" />
			</div>
			招聘原因：
			<textarea node-type="textEl" name="taskDesc" id="taskDesc" maxlength="50"  tabindex="1" class="HR_Zhaopin_Casual">${recruitTask.taskDesc }</textarea>
			<div class="HR_Tanchu28_input">
				希望到岗日期：<font color="red">*</font><input name="hopeWorkDate" id="hopeWorkDate"
				value='<fmt:formatDate value="${recruitTask.hopeWorkDate }" pattern="yyyy-MM-dd" type="date"/>'
				onClick="WdatePicker({readOnly:'true'})" style="width:196px;" /></div>
			<!--  <div class="HR_Zhaopin_shuoming">-->
				<!-- 岗位说明书导入：<input name="" style="width:189px;" type="file" /></div> -->
			<div class="HR_Tanchu28_input">
				申请人：<font color="red">*</font><input name="requireUserName" readonly="readonly" id="requireUserName" value="${recruitTask.requireUserName }" maxlength="10" style="width:232px;" />
				<input type="hidden" name="requireUserId" value="${recruitTask.requireUserId }" />
			</div>
			<!-- <div class="HR_Tanchu28_input"> -->
				<!-- 批准人：<input name="requireUserName" id="requireUserName" value="${recruitTask.requireUserName }"  style="width:232px;" />-->
			<!--  </div>-->
			<div class="HR_Zhaopin_Submit">
			<input type="button" id="tijiao"  onclick="addRecruitTask(this.from)" class="HR_Submit_QDBC29" />
			</div>
	
		</div>
	</form>
</body>
</html>