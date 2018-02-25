<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动管理</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<style>
	.HR_TianjiaSan{width:210px;background:none;}
</style>
<script type="text/javascript">
	function add(){
		if(!check($("#myform"))){return;};
		$.ajax({
			 url: 'saveQuestionType',
			 type: "POST",
			 dataType:"json",
			 data: "typeName="+$("#typeName").val()+"&typeDesc="+$("#typeDesc").val(),
			 success: function(){
				 alert('保存成功!');
				 parent.right.search();
				 $("#typeName").val('');
				 $("#typeDesc").val('');
			 }
		});
	}
	function edit(){
		$.ajax({
			 url: 'updateQuestionType',
			 type: "POST",
			 dataType:"json",
			 data: "typeName="+$("#typeName").val()+"&typeDesc="+$("#typeDesc").val()+"&typeId="+$("#typeId").val(),
			 success: function(){
				 alert('保存成功!');
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
<form id="myform">
<div class="HR_Tianjialishi">
类型名称：<input reg=".*[^ ].*" maxlength="30" tip="问卷名称不能为空" style="width:210px;background: none;" id="typeName" value="${type.typeName }" class="HR_TianjiaSan" /></div>
<input type="hidden" value="${type.typeId}" id="typeId"/>
<div class="HR_Tianjialishi">
类型描述：<textarea onKeyDown='if(this.value.length>=150){this.value=this.value.substring(0,150)}' style="width:210px;background: none;" id="typeDesc"  class="HR_TianjiaSan" >${type.typeDesc }</textarea></div>
</form>
<div class="HR_Tianjia_Submit" style="text-align:center;">
<c:if test="${type.typeId==null}">
<input type="button" class="HR_Tianjia_Submit09" onclick="add()"/>
<input type="button" class="HR_Tianjia_Submit07" onclick="parent.closeFrame()" />
</c:if>
<c:if test="${type.typeId!=null}">
<input type="button" class="HR_Tianjia_Submit01" onclick="edit()"/>
<input type="button" class="HR_Tianjia_Submit02" onclick="parent.closeFrame()" />
</c:if>
</div>
</div>

</div>
</body>
</html>