<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<html>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<head>
<style>
.HR_Tianjialishi input{width:210px;}
select{width:210px;height:18px;}
</style>
<script type="text/javascript">
	function saveWJ(c){
		if(!check($("#askForm"))){return;};
		var saveValue = $('#askForm').formSerialize();
		$.ajax({
			 url: 'saveQuestionPaper',
			 type: "POST",
			 dataType:"json",
			 data: saveValue,
			 success: function(data){
				 alert('保存成功!');
				 parent.right.search();
				 if(c=='close'){
					 parent.closeFrame();
				 }else{
					 parent.showFrame('问卷管理','wjManagePage?paperId='+data.paperId,830,520);
					 parent.remove();
				 }
			 }
		});
	}
</script>
</head>
<body>
<form id="askForm" name="askForm" >
<div class="HR_Tianjiadiaochahuodong">
<div class="HR_Tianjialishi">
<c:if test="${paper.paperNum!=null }">
问卷编号：<input style="width:210px;" readonly="readonly" name="paperNum" id="paperNum" value="${paper.paperNum}"/>
</c:if>
</div>
<div class="HR_Tianjialishi">问卷分类：
	<select reg="^[^ ]+$" tip="问卷分类不能为空" name="typeId" id="wjtypeId" >
		<c:forEach items="${paperTypes }" var="type">
			<c:if test="${paper.typeId == type.typeId }">
				<option value="${type.typeId }" selected="selected">${type.typeName}</option>
			</c:if>
			<c:if test="${paper.typeId != type.typeId }">
				<option value="${type.typeId }">${type.typeName}</option>
			</c:if>
		</c:forEach>
	</select>
</div>
<div class="HR_Tianjialishi">问卷名称：
<input reg=".*[^ ].*" maxlength="30" tip="问卷名称不能为空" name="paperName" id="paperName" value="${paper.paperName }" />
<input type="hidden" value="${paper.paperId }" name="paperId" id="paperId" />
</div>
<div class="HR_Tianjia_Casual">问卷说明：
<textarea style="width:220px;height:80px;" cols="" onKeyDown='if (this.value.length>=300){if(event.keyCode != 8)return false;}'  name="paperDesc" rows="20">${paper.paperDesc }</textarea>
</div>

<div class="HR_Tianjia_Submit" style="text-align:center;;">
<c:if test="${paper.paperId==null }">
<input type="button" class="HR_Tianjia_Submit11" onclick="saveWJ()" />
</c:if>
<input type="button" class="HR_Tianjia_Submit01" onclick="saveWJ('close')" />
<input type="button" class="HR_Tianjia_Submit02" onclick="parent.closeFrame()"/></div>
</div>
</form>
</body>
</html>