<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动管理</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<style>
	#HR_TianjiaSan{width:210px;background:none;}
	#trainingEndTime{width:210px;background:none;}
</style>
<script type="text/javascript">
	function publish(){
		if(!check($("#myForm"))){return;};
		var saveValue = $('#myForm').serialize();
		$.ajax({
			 url: 'trainPublish',
			 type: "POST",
			 dataType:"json",
			 data: saveValue,
			 success: function(){
				 alert('发布成功!');
				 parent.right.search();
				 parent.closeFrame();
			 }
		});
	}
</script>
</head>
<body>

<div class="HR_Tianjia_Bottom myBox03">
<div class="HR_Tianjiadiaochahuodong">
<br/><br/>
<form id="myForm">
<div class="HR_Tianjialishi">
活动开始时间：<input name="trainingStartTime" reg=".*[^ ].*" tip="活动开始时间不能为空"　class="Wdate" id="HR_TianjiaSan" onClick="WdatePicker({readOnly:'true'})" />
<input type="hidden" name="taskId" value="${ taskId }" />
</div>
<div class="HR_Tianjialishi">
活动截止时间：<input name="trainingEndTime" reg=".*[^ ].*" tip="活动截止时间不能为空"　class="Wdate" id="trainingEndTime" onClick="WdatePicker({readOnly:'true'})" />
</div>
</form>
<br/><br/>
<div style="text-align: center;">
<input type="button" class="HR_Tianjia_Submit14" onclick="publish()"/>
<input type="button" class="HR_Tianjia_Submit02" onclick="parent.closeFrame()" />
</div>
</div>

</div>
</body>
</html>