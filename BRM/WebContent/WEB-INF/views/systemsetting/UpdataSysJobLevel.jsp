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
	function saveSysJobLevel() {
		if (!check($("#updataJobLevelForm"))) {
			return;
		}
		;
		var saveValue = $('#updataJobLevelForm').serialize();
		$.ajax({
			url : 'updataSysJobLevel?jobLevelId=${jodLevel.jobLevelId}',
			type : "POST",
			dataType : "json",
			data : saveValue,
			success : function() {
				window.returnValue = 'suc';
				alert('保存成功!');
				parent.closeFrame();
			},
			error : function(msg) {
			}
		});
	}
	function setPersonSelectorVal(ids,names,nums){
		$("#postId").val(ids);
		$("#postName").val(names);
	}
</script>
</head>
<body>
	<div class="HR_Tianjia myBox">
		<form name="updataJobLevelForm" id="updataJobLevelForm" method="post">
			<div class="myBox01">
				<div class="myBox02">
					<div class="HR_Tianjia_Bottom myBox03">
						<div class="HR_Tianjiadiaochahuodong">
							<div class="HR_Tianjialishi">
								职级名称：<input style="width: 247px;" id="jobLevelName" name="jobLevelName" value="${jodLevel.jobLevelName}" />
							</div>
							<div class="HR_Tianjialishi">
								职级描述：<input style="width: 247px;" id="jobLevelOrder" name="jobLevelOrder" value="${jodLevel.jobLevelOrder}" />
							</div>
							<div class="HR_Tianjialishi">
								所属职系选择：<select id="jobGradeId" name="jobGradeId" style="width: 98px;">
									<c:forEach items="${jobGrade}" var="jobGrade">
										<option value="${jobGrade.jobGradeId}">${jobGrade.jobGradeName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="HR_Tianjialishi">
								职级对应岗位：<input style="width: 223px;" id="postName" name="postName" onclick="parent.popupPostSelector()"/>
								<input type="hidden" id="postId" name="postId" />
							</div>
							<div class="HR_Tianjialishi">
								最高薪酬等级：<input style="width: 223px;" id="highestSalaryLevel" name="highestSalaryLevel" value="${jodLevel.highestSalaryLevel}" />
							</div>
							<div class="HR_Tianjialishi">
								最低薪酬等级：<input style="width: 223px;" id="lowestSalaryLevel" name="lowestSalaryLevel" value ="${jodLevel.lowestSalaryLevel}"/>
							</div>
							<div class="HR_Tianjia_Submit">
								 <input
									type="button" class="HR_Tianjia_Submit01"
									onclick="saveSysJobLevel();" /> <input type="button"
									class="HR_Tianjia_Submit12" onclick="parent.closeFrame();" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
