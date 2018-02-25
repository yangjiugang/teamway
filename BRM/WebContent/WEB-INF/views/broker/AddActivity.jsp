<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加调查活动窗口</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/JavaScript">
function saveHD(c){
	 /* if(!check($("#actityForm"))){return;}; */
		var saveValue = $('#actityForm').serialize();
		$.ajax({
			 url: 'activitySave',
			 type: "POST",
			 dataType:"json",
			 data: saveValue,
			 success: function(data){/* 
				 window.returnValue='suc';
				 alert('保存成功!');
				 window.close();
			 },
			 error:function(msg){ */
				/*  parent.iframe.search(); */
				 if(c=='close'){
					 parent.closeFrame();
				 }
				 if(c=='release'){
					 parent.showFrame('发布调查活动','ReleaseActivity?testId='+data.testId,430,300);
					 parent.remove();
				 }
				 else{
					 parent.showFrame('添加问卷','brokerPage?page=WenJuan',430,300);
					 parent.remove();
				 }
			 }
	}); 
}
</script>	

</head>

<body>
<div class="HR_Tianjia_Bottom myBox03">
<form id="actityForm" name="actityForm" method="post" >
<div class="HR_Tianjiadiaochahuodong">
<%-- <div class="HR_Tianjialishi">调查活动编号：<input style="width:186px;" id="testNum" name="testNum" value="${test.testNum}" /></div> --%>
<div class="HR_Tianjialishi">调查活动名称：<input style="width:300px;" id="testName" name="testName" value="${test.testName}" /></div>
<!-- <div class="HR_Tianjialishi">调查类型：<input style="width:210px;" class="HR_TianjiaSan" /></div> -->
<div class="HR_Tianjialishi">调查类型：
	<select id ="typeId" name="typeId" style="width:210px;">
		<c:forEach items ="${testTypes }" var="type">
				<c:if test="${test.typeId==type.typeId}">
					<option value="${type.typeId}" selected="selected">${type.typeName}</option>
				</c:if>
				<c:if test="${test.typeId !=type.typeId }">
					<option value ="${type.typeId}">${type.typeName}</option>
				</c:if>
		</c:forEach>
	</select>
</div>

<div class="HR_TianjiaType">调查方式：
	 <input type="radio" name="testMethod" id="nbnn" value="0" checked="checked" />内部匿名
	 <input type="radio" name="testMethod" id="nbsm" value="1" />内部实名 
	 <input type="radio" name="testMethod" id="wbdc" value="2" />外部调查
	 <input type="hidden" name="trainTaskId" id="trainTaskId" value="${trainTaskId}" />
</div>
<!-- <div class="HR_Tianjialishi">活动联络人：<input style="width:86px;" /><input style="width:100px;" class="HR_TianjiaSan" /></div> -->
<div class="HR_Tianjialishi">活动联络人：<input style="width:86px;" id="contactUserName" name="contactUserName" value="${test.contactUserName}" />
<div class="HR_Tianjialishi">答题时长：<input style="width:98px;" id="testDuration" name="testDuration" value="${test.testDuration}"/></div>
<div class="HR_Tianjialishi">答题有效数：<input style="width:197px;" id="testEnableCnt" name="testEnableCnt" value="${test.testEnableCnt}" /></div>


<div class="HR_Tianjia_Casual">活动说明：<textarea style="width:328px;" name="testDesc" cols="" rows="20">${test.testDesc}</textarea></div>
<div class="HR_Tianjialishi">活动调查对象：<input style="width:74px;" /><input style="width:100px;" class="HR_TianjiaSan" /></div>

<!-- <div class="HR_Tianjialishi">问卷选择：<input style="width:98px;" /><input style="width:100px;" class="HR_TianjiaSan" /> </div> -->
<div class="HR_Tianjialishi">问卷选择:
	<select id="paperId" name="paperId" style="width:98px;">
		<c:forEach items="${paper}" var="paper">
			<option value="${paper.paperId}">${paper.paperName}</option>
		</c:forEach>
	</select>
</div>

<div class="HR_Tianjia_Submit">
	<c:if test="${test.testId==null }">
		<input type="button" class="HR_Tianjia_Submit01" onclick="saveHD('close');" />
	</c:if>
	<input type="button" class="HR_Tianjia_Submit13" onclick="saveHD('release');" />
	<input type="button" class="HR_Tianjia_Submit12" onclick="parent.closeFrame()"/>
	<input type="button" class="H_bctj" onclick="saveHD('addPaper');"/>
</div>
</div>
</div>
</form>	
</div>

</body>
</html>

