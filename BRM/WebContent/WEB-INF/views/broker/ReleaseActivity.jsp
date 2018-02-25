<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>活动发布窗口</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script type="text/javascript">
function releaseActivity(){
	if(!check($("#releaseForm"))){return;};
	var saveValue = $('#releaseForm').serialize();
	$.ajax({
		 url: 'updateQuestionTest',
		 type: "POST",
		 dataType:"json",
		 data: saveValue,
		 success: function(){
			 window.returnValue='suc';
			 alert('发布成功!');
			 window.close();
		 },
		 error:function(msg){
		 }
	}); 
}
</script>

</head>

<body>
	<form action="releaseForm" id="releaseForm" method="post">
		<div class="HR_Tianjialishi">
			活动开始时间：<input class="Wdate" type="text" style="width: 100px"
				id="testStartTime" name="testStartTime"
				onClick="WdatePicker({readOnly:'true'})" />
		</div>
		<div class="HR_Tianjialishi">
			活动截止时间：<input class="Wdate" type="text" style="width: 100px"
				id="testEndTime" name="testEndTime"
				onClick="WdatePicker({readOnly:'true'})" /> 
				<input type="hidden"id=testId name="testId" value="${testId}"/>
		</div>
		<div class="HR_Tianjia_Submit">
			<input type="button" class="HR_Tianjia_Submit14" onclick="releaseActivity()" /> <input
				type="button" class="HR_Tianjia_Submit12" onclick="parent.closeFrame()" />
		</div>
	</form>
</body>
</html>
