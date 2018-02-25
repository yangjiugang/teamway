<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script type="text/javascript">
	function updateTC(){
		var employeeId = "${cash.employeeInfo.employeeId}";
		var pushMoney = $("#pushMoney").val();		
		code = pushMoney.charAt(0).charCodeAt();
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth();//因为月份是从0开始，所以取得的月份等于（实际月份减1）
		var type = "thisMonth";
		var display = $("#thisMonth").css("display");
		if(display=="none"){
			type = "lastMonth";
		}
		if(code>48&&code<57){
			 $.fc.ajaxSubmit({
				url:'${pageContext.request.contextPath}/pushNewlyAjax',
				dataType:'json',
				data:"pushMoney="+pushMoney+"&year="+year+"&month="+month+"&employeeId="+employeeId+"&type="+type,
				callBackFn:function(msg){
					alert(msg);
					parent.ClosePop();
					parent.$("#list").trigger("reloadGrid");
				}
			}); 
		}else{
			alert("提成金额只能为数字");
		}
	}
	function showButtom(){
		var date = new Date();
		if(date.getDate()<8){
			$("#thisMonth").css("display","none");
		}else{
			$("#lastMonth").css("display","none");			
		}
	}
</script>
</head>

<body onload="showButtom();">


<div class="HR_Mianshitongzhi_Bottom myBox03">

		<ul class="jl">
			<li><label>姓名:</label><input type="text" value="${cash.employeeInfo.userName}" id="employeeInfo.userName" readonly="readonly"/></li>        
        	<li><label>部门:</label><input type="text" value="${cash.employeeInfo.organizationName}" id="employeeInfo.organizationName" readonly="readonly"/></li>
            <li><label>岗位:</label><input type="text" value="${cash.employeeInfo.postName}" id="employeeInfo.postName" readonly="readonly"/></li>
            <li><label>&nbsp;</label>
            	<input id="lastMonth" style="display: block;" type="button" value="上月" id="lastMonth"/>
            	<input id="thisMonth" style="display: block;" type="button" value="本月" id="thisMonth"/>
            </li>
            <li><label>提成金额:</label><input type="text" value="" id="pushMoney"/></li>
            <li><label>&nbsp;</label><input class="HR_jiarurencaitidui_Submit01" onclick="updateTC();" style="border:none;" /></li>
        </ul>


</div>


</body>
</html>