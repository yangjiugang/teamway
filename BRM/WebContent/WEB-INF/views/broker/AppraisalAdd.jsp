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
	function setPersonSelectorVal(ids,names,nums){
		$("#employeeId").val(ids);
		$("#userName").val(names);		
	}	
	function submitVerify(){
		if(!check($("#newForm"))){return;};
		var monthType = $("input[name='monthType']:checked").val();
		today = new Date();
		var day = today.getDate();
		if(monthType=="0"){
			if(day>8){
			    ajaxVerify(monthType);
			    alert(temp);
			}else{
				alert("目前还不可以添加本月的绩效");
				return false;
			}
		}
		if(monthType=="1"){
			if(day<=8){
				ajaxVerify(monthType);
			}else{
				alert("不能添加上个月的绩效");
				return false;
			}
		}
	}
	
	function submitAndClose(){
		var temp = submitVerify();
		alert(temp);
		if(temp){
			parent.closeFrame();
		}
	}
	
	function ajaxVerify(monthType){
		var employeeId = $("#employeeId").val();
		$.ajax({
			url:"verifyEmployeeAppraisalByIdStartTimeEndTime",
			dataType:'json',
			data:"employeeId="+employeeId+"&monthType="+monthType,
			success:function(msg){
				if(msg>0){
					alert("添加失败,有重复数据");
					return false;
				}
				if(msg<=0){
					ajaxInsert(monthType);
				}
			}
		});
	}
	
	function ajaxInsert(monthType){
		var employeeId = $("#employeeId").val();
		$.ajax({
			url:"insertEmployeeAppraisal",
			dataType:'json',
			data:"employeeId="+employeeId+"&monthType="+monthType,
			success:function(msg){
				if(msg>0){
					alert("添加成功!");
					emptyInput();
					parent.right.reloadGrid();
				}
				if(msg<0){
					alert("添加失败!");
				}
			},
			error:function(){alert("添加失败!");}
		});
	}
	
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
	function emptyInput(){
		$("#userName").val("");
		$("#employeeId").val("");
		$("#appraisalResult").val("");
		$("#appraisalRate").val("");
	}
</script> 	
</head>
<body>
		<div class="HR_Mianshitongzhi_Bottom myBox03" style="margin-left: -70px;">
	<form action="" name="newForm" id="newForm">
	<ul class="jl">
			<li><label>姓名:</label><input type="text" readonly="readonly" onclick="parent.popupPersonSelector({single:1})" id="userName" reg=".*[^ ].*" tip="姓名不能为空"><input type="hidden" name="employeeId" id="employeeId"></li>        
            <li><label>本月绩效得分:</label><input type="text" id="appraisalResult" onkeypress="IsNum(event)" onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled" reg=".*[^ ].*" tip="得分不能为空"/></li>
             <li><label>绩效工资发放比例:</label><input type="text" id="appraisalRate" onkeypress="IsNum(event)" onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled" reg=".*[^ ].*" tip="比例不能为空"/></li>
             <li><label>绩效时间:</label><input type="radio" value="0" name="monthType" checked="checked">本月<input type="radio" value="1" name="monthType">上个月</li>  
             <li><label>&nbsp;</label><input class="HR_Tianjia_Submit09" style="border:none;" onclick="submitVerify()"/><input class="HR_Tianjia_Submit04" style="border:none;" onclick="submitAndClose()"/></li>
        </ul>
	</form>        
</div>
</body>
</html>