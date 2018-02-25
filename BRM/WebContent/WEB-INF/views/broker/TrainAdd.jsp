<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" media="screen" href="js/validate/validate.css"/>
<script type="text/javascript" src="js/date/WdatePicker.js"></script>
<script type="text/JavaScript" src="js/jquery.min.js"></script>
<script type="text/JavaScript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/validate/excanvas.min.js"></script>
<script type="text/javascript" src="js/validate/easy_validator.pack.js"></script>
<style type="text/css">
.input_{width:155px;}
.input_md{width:436px;}
.Wdate{width:155px;}
</style>
<script type="text/javascript">
	function addSubject(){
		$("#contain").append($("#contain_hidden").html());
		again();
	}
	function ajaxFileUpload(){
		$("#loading").ajaxStart(function(){
			$(this).show();
		}).ajaxComplete(function(){
			$(this).hide();
		});
        $.ajaxFileUpload({
            url:'upLoadFile?taskId='+$("#taskId").val(), 
            secureuri:false,
            fileElementId:'file',
            dataType: 'json',
            success: function (data, status){
            	$("#file").val('');
            	var html = "<span id='span"+data.attachmentId+"'><a href='#' style='color:blue' onclick='download(\""+data.newName+"\")'>"+data.oldName+"</a>";
            	    html +="&nbsp;<a href='#' onclick='delFile(\""+data.newName+"\","+data.attachmentId+")'><img src='images/close.png'/></a>&nbsp;&nbsp;";
            		html +="<input type='hidden' name='attachmentId' value='"+data.attachmentId+"' /></span>";
        		$("#downFile").append(html);
            },
            error: function (data, status, e){
            	alert('上传失败 !' + e);
            }
        });
        return false;
    }
	function download(fileName){
		window.location.href = "downLoadFile?fileName="+fileName;
	}
	function delFile(fileName,id){
		$.ajax({
			 url: 'delFile',
			 type: "POST",
			 dataType:"json",
			 data: 'fileName='+fileName+'&id=' + id,
			 success: function(data){
				$("#span"+id).remove();
			 }
		});
	}
	function save(c){
		if(!check($("#myForm"))){return;};
		var saveValue = $('#myForm').serialize();
		$.ajax({
			 url: 'saveTrainTask',
			 type: "POST",
			 dataType:"json",
			 data: saveValue,
			 success: function(data){
				alert('保存成功!');
				if(c==0){
					parent.right.search();
					parent.closeFrame();
				}
				if(c==1){
					parent.ShowIframe("发布活动","trainPublishPage?taskId="+data.taskId,350,200);
					parent.remove();
				}
			 }
		});
	}
	function updateTrainTask(){
		if(!check($("#myForm"))){return;};
		var saveValue = $('#myForm').serialize();
		$.ajax({
			 url: 'updateTrainTask',
			 type: "POST",
			 dataType:"json",
			 data: saveValue,
			 success: function(data){
				alert('保存成功!');
				parent.right.search();
				parent.closeFrame();
			 }
		});
	}
	function setPersonSelectorVal(idx,ids,names,nums){
		if(idx==2){
			$("#user").val(names);
			$("#employeeId").val(ids);
		}
		if(idx==1){
			$("#contactPersonName").val(names);
			$("#userId").val(ids);
		}
	}
</script>
</head>
<body>
<div class="HR_tianjiaxinpeixun_Bottom myBox03" style="padding-left: 20px;padding-top:5px;">
<form id="myForm">
<div class="HR_lishichaxun_top29" style="padding-top:1px;">
培训活动名称：<input class='input_' name="taskName" value="${task.taskName }" reg=".*[^ ].*" tip="培训活动名称不能为空"/></div>
<input type="hidden" value="${task.taskId }" name="taskId" id="taskId"/>
<div class="HR_yidongweihu_topType">
培训类型：
<label><input type="radio" name="taskType" id="radio" value="0" ${task.taskType==0?'checked':'' } />&nbsp;外训</label>&nbsp;
<label><input type="radio" name="taskType" id="radio" value="1" ${task.taskType==1||task.taskType==null?'checked':'' } />&nbsp; 内训</label>&nbsp;
<label><input type="radio" name="taskType" id="radio" value="2" ${task.taskType==2?'checked':'' }/>&nbsp;内外结合</label>&nbsp;
</div>
<div class="HR_lishichaxun_top29">
培训地点：<input class='input_' reg=".*[^ ].*" tip="培训地点不能为空" name="taskPlace" value="${task.taskPlace }" />
联 系 人：<input class='input_' id="contactPersonName" name="contactPersonName" value="${task.contactPersonName }" onclick="parent.popupPersonSelector({idx:1,single:1})" readonly="readonly"/>
<input type="hidden" id="userId" name="userId" value="${task.userId }" />
 </div>
<div class="HR_lishichaxun_top29">
培训目的：<input class='input_md' reg=".*[^ ].*" tip="培训目的不能为空" name="taskPurpose" value="${task.taskPurpose }" /> </div>
<div class="HR_yidongweihu_topType">
培训内容分类：
<select style="width:200px;height:20px;" name="trainingContentTypeId">
	<c:forEach items="${types }" var="type" >
		<c:if test="${task.trainingContentTypeId == type.typeId }">
			<option value="${type.typeId }" selected="selected">${type.typeName }</option>	
		</c:if>
		<c:if test="${task.trainingContentTypeId != type.typeId }">
			<option value="${type.typeId }">${type.typeName }</option>	
		</c:if>
	</c:forEach>
</select>
<br/><br/>
<div>
注意事项：
<textarea name="trainingDesc" tabindex="1" style="width:450px" class="HR_yidongweihu_Casual">${task.trainingDesc }</textarea>
</div>
<p style="margin-top:15px;">上传附件：<input name="file" id="file" type="file" />
<input type="button" value="上传" onclick="return ajaxFileUpload()" />
<img id="loading" src="js/loading.gif" style="display:none;" />
</div></p>
<div id="downFile" style="padding-left:60px;margin-top: 5px;">
<c:forEach items="${task.trainAttachments}" var="attachment">
	<span id="span${attachment.attachmentId}">
	<a href='#' style='color:blue' onclick='download("${attachment.attachmentPath}")'>${attachment.fileName}</a>
    &nbsp;<a href='#' onclick='delFile("${attachment.attachmentPath}",${attachment.attachmentId})'><img src='images/close.png'/></a>&nbsp;&nbsp;
	<input type='hidden' name='attachmentId' value='${attachment.attachmentId}' />
	</span>
</c:forEach>
</div>
<p style="padding-top:15px;">培训安排表</p>
<div id="contain">
<c:forEach items="${task.schedules }" var="schedule">
<input type="hidden" value="${schedule.scheduleId }" name="scheduleId"/>
<div class="HR_lishichaxun_top29">课程名称：<input class="input_" reg=".*[^ ].*" tip="课程名称不能为空" name="courseName" value="${schedule.courseName }"/>
  讲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师：<input class="input_" reg=".*[^ ].*" tip="讲师不能为空" name="teacher" value="${schedule.teacher }"/>
 </div>
<div class="HR_lishichaxun_top29">
开始时间：<input  reg=".*[^ ].*" tip="开始时间不能为空" name="scheduleStartTime" value="<fmt:formatDate type="date" value="${schedule.scheduleStartTime }" />" class="Wdate" onclick="WdatePicker({readOnly:'true'})" />
结束时间：<input  reg=".*[^ ].*" tip="结束时间不能为空" name="scheduleEndTime" value="<fmt:formatDate type="date" value="${schedule.scheduleEndTime }" />" class="Wdate" onclick="WdatePicker({readOnly:'true'})" />
</div>
</c:forEach>
<c:if test="${task==null }">
<div class="HR_lishichaxun_top29">课程名称：<input class="input_" reg=".*[^ ].*" tip="课程名称不能为空" name="courseName" value=""/>
 讲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师：<input class="input_" reg=".*[^ ].*" tip="讲师不能为空" name="teacher" value=""/>
 </div>
<div class="HR_lishichaxun_top29">
开始时间：<input reg=".*[^ ].*" tip="开始时间不能为空" name="scheduleStartTime" value="" class="Wdate" onclick="WdatePicker({readOnly:'true'})" />
结束时间：<input reg=".*[^ ].*" tip="结束时间不能为空" name="scheduleEndTime" value="" class="Wdate" onclick="WdatePicker({readOnly:'true'})" />
</div>
</c:if>
</div>
<div style="margin-left:445px;margin-top:10px;"><input type="button" class="H_tj" onclick="addSubject()"/></div>
<br/>

<div class="HR_lishichaxun_top29" style="padding-top:0px;">
培训对象：<input class="input_" reg=".*[^ ].*" tip="培训对象不能为空" id="user" onclick="parent.popupPersonSelector({idx:2})" readonly="readonly"/>
<input type="hidden" id="employeeId" name="employeeId" /></div>
<div class="HR_lishichaxun_top29">
计划人数：<input class="input_" reg="^\d+$" tip="人数只能为正整数" name="planEmployees" value="${task.planEmployees }" /></div>

<div class="HR_lishichaxun_Submit">
<c:if test="${task==null }">
<input type="button" class="HR_Submit_QDBC29" onclick="save(0)"/>
<input type="button" class="HR_Tianjia_Submit13" onclick="save(1)" />
<input type="button" class="HR_Tianjia_Submit12" onclick="parent.closeFrame()" />
</c:if>
<c:if test="${task!=null }">
<input type="button" class="HR_Tianjia_Submit01" onclick="updateTrainTask()"/>
<input type="button" class="HR_Tianjia_Submit12" onclick="parent.closeFrame()" />
</c:if>
</div>
</div>
</form>
<div id="contain_hidden" style="display: none">
<div class="HR_lishichaxun_top29">课程名称：<input reg=".*[^ ].*" tip="课程名称不能为空" class="input_" name="courseName" />
<input type="hidden" value="0" name="scheduleId"/>
 讲师：<input class="input_" reg=".*[^ ].*" tip="讲师不能为空" name="teacher"/>
 </div>
<div class="HR_lishichaxun_top29">
开始时间：<input reg=".*[^ ].*" tip="开始时间不能为空"  name="scheduleStartTime" class="Wdate" onclick="WdatePicker({readOnly:'true'})" />
结束时间：<input reg=".*[^ ].*" tip="结束时间不能为空" name="scheduleEndTime" class="Wdate" onclick="WdatePicker({readOnly:'true'})" />
</div>

</div>
<script type="text/javascript">
var userId='',userName='';
<c:forEach items="${task.trainingUsers}" var="user">
	userId+='${user.employeeId}'+','
	userName+='${user.userName}'+','
</c:forEach>
	$("#employeeId").val(userId.substring(0,userId.length-1));
	$("#user").val(userName.substring(0,userName.length-1));
</script>
</body>
</html>