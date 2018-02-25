<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript">
	
	/**
	 * 判断是不是数字
	 */
	function IsNum(e) 
	{ 
	      var k = window.event ? e.keyCode:e.which; 
	     if (((k >= 48) && (k <= 57)) || k==8 || k==0) 
	     { 
	     }else 
	   { 	

	         if(window.event) 
	          { 
	               window.event.returnValue = false; 
	        } 
	        else 
	         { 
	               e.preventDefault();//for firefox 
	       } 
	   } 
	}
	
	function updateEmployeeAppraisal(){
		var employeeId = $("#employeeId").val();
		var userName = $("#userName").val();
		var appraisalStartDate = $("#appraisalStartDate").val();
		var appraisalResult = $("#appraisalResult").val();
		var appraisalRate = $("#appraisalRate").val();
		if(appraisalResult==""){
			alert("请输入绩效得分!");
			return;
		}
		if(appraisalRate==""){
			alert("请输入绩效比例");
			return;
		}
		$.ajax({
			url:"updateEmployeeAppraisal",
			dataType:'json',
			data:"employeeId="+employeeId+"&appraisalResult="+appraisalResult+"&appraisalRate="+appraisalRate+"&appraisalStartDate="+appraisalStartDate,
			success:function(msg){
				if(msg==1){
					alert("修改成功");
					parent.right.reloadGrid();
					parent.closeFrame();
				}
				if(msg<=0){
					alert("修改失败");
				}
			}
		});
	}
</script> 	
</head>
<body>
		<div class="HR_Mianshitongzhi_Bottom myBox03" style="margin-left: -70px;">
	<form action="" name="newForm" id="newForm">
	<ul class="jl">
			<li><label>姓名:</label><input type="text" readonly="readonly" id="userName" value="${employeeAppraisal.employeeInfo.userName }"><input type="hidden" name="employeeId" id="employeeId" value="${employeeAppraisal.employeeId }"></li>        
            <li><label>本月绩效得分:</label><input type="text" value="${employeeAppraisal.appraisalResult }" id="appraisalResult" onkeypress="IsNum(event)" onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled" reg=".*[^ ].*" tip="得分不能为空"/></li>
             <li><label>绩效工资发放比例:</label><input type="text" value="${employeeAppraisal.appraisalRate }" id="appraisalRate" onkeypress="IsNum(event)" onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled" reg=".*[^ ].*" tip="比例不能为空"/></li>
             <li><label>&nbsp;</label><input class="HR_Tianjia_Submit01" style="border:none;" onclick="updateEmployeeAppraisal()"/></li>
			 <input type="hidden" id="appraisalStartDate" value="${employeeAppraisal.appraisalStartDate }"/>
        </ul>
	</form>        
</div>
</body>
</html>