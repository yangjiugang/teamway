<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>职系添加窗口</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
function saveGrade(){
	 if(!check($("#gradeForm"))){return;}; 
		var saveValue = $('#gradeForm').serialize();
		$.ajax({
			 url: 'updataSysGrade?jobGradeId=${grade.jobGradeId}',
			 type: "POST",
			 dataType:"json",
			 data: saveValue,
			 success: function(){
				 window.returnValue='suc';
				 alert('保存成功!');
				 parent.closeFrame();
			 },
			 error:function(msg){ 
			 }
	}); 
}
</script>	
</head>
<body>
	<div class="HR_Tianjia myBox">
		<form id ="gradeForm" name="gradeForm" method="post">
			<div class="myBox01">
				<div class="myBox02">
					<!-- <div class="HR_Tianjia_Top">
						<div class="HR_Tianjia_TopL">职系设置窗口</div>
						<div class="HR_Tianjia_TopR">
							<a href="#"><img src="images/Tanchu04.gif" /></a> <a href="#"><img
								src="images/Tanchu05.gif" style="margin-left: 10px;" /></a>
						</div>
					</div> -->
					<div class="HR_Tianjia_Bottom myBox03">
						<div class="HR_Tianjiadiaochahuodong">
							<div class="HR_Tianjialishi">
								职系名称：<input style="width: 247px;" id="jobGradeName" name="jobGradeName" value="${grade.jobGradeName}"/>
							</div>
							<div class="HR_Tianjialishi">
								职系描述：<input style="width: 247px;" id="jobGradeDesc" name="jobGradeDesc" value="${grade.jobGradeDesc}"/>
							</div>
							<!-- <div class="HR_Tianjialishi">
							职系对应岗位：<input style="width: 223px;" />
						</div> -->
							<div class="HR_Tianjia_Submit">
								<!--  <input type="button" class="HR_Tianjia_Submit20" />-->
								<input type="button" class="HR_Tianjia_Submit01"
									onclick="saveGrade()" />
								<input type="button" class="HR_Tianjia_Submit12" onclick="parent.closeFrame()" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
