<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>职等职级设置窗口</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
	function saveSysJobLevel(n) {
		if (!check($("#jobLevelForm"))) {
			return;
		}
		;
		var saveValue = $('#jobLevelForm').serialize();
		$.ajax({
			url : 'saveSysJobLevel',
			type : "POST",
			dataType : "json",
			data : saveValue,
			success : function() {
				window.returnValue = 'suc';
				alert('保存成功!');
				if(n==1){
					$("#jobLevelForm").resetForm();
				}
				if(n==2){
					parent.closeFrame();
				}
			},
			error : function(msg) {
			}
		});
	}
	function setPostSelectorVal (ids,names,nums){
		$("#postId").val(ids);
		$("#postName").val(names);
	}
	
	//$("#myForm").resetForm();
</script>
</head>
<body>
		<form name="jobLevelForm" id="jobLevelForm" method="post">
				<div class="myBox02">
					<div class="HR_Tianjia_Bottom myBox03">
						<div class="HR_Tianjiadiaochahuodong">
							<div class="HR_Tianjialishi">
								职级名称：<input style="width: 247px;" id="jobLevelName" name="jobLevelName" />
							</div>
							<div class="HR_Tianjialishi">
								职级描述：<input style="width: 247px;" id="jobLevelOrder" name="jobLevelOrder" />
							</div>
							<div class="HR_Tianjialishi">
								所属职系选择：<select id="jobGradeId" name="jobGradeId" style="width: 98px;">
									<c:forEach items="${jobGrade}" var="jobGrade">
										<option value="${jobGrade.jobGradeId}">${jobGrade.jobGradeName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="HR_Tianjialishi">
								职级对应岗位：<input style="width: 223px;" id="postName" name="postName" onclick="parent.popupPostSelector({single:1})"/>
								<input type="hidden" id="postId" name="postId" />
							</div>
							<div class="HR_Tianjialishi">
								最高薪酬等级：<input style="width: 223px;" id="highestSalaryLevel" name="highestSalaryLevel" />
							</div>
							<div class="HR_Tianjialishi">
								最低薪酬等级：<input style="width: 223px;" id="lowestSalaryLevel" name="lowestSalaryLevel" />
							</div>
							<div class="HR_Tianjia_Submit">
								<input type="button" class="HR_Tianjia_Submit21" onclick="saveSysJobLevel(1)" /> <input
									type="button" class="HR_Tianjia_Submit01"
									onclick="saveSysJobLevel(2);" /> <input type="button"
									class="HR_Tianjia_Submit12" onclick="parent.closeFrame();" />
							</div>
						</div>
					</div>
				</div>
		</form>
</body>
</html>
