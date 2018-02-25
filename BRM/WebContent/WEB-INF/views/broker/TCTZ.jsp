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
		var employeeId = "${cash.employeeId}";
		var pushStartDate = "${cash.pushStartDate}";
		var pushEndDate = "${cash.pushEndDate}";
		var pushMoney = $("#pushMoney").val();
		code = pushMoney.charAt(0).charCodeAt();
		if(code>48&&code<57){
			$.fc.ajaxSubmit({
				url:"${pageContext.request.contextPath}/TCTZAdjust",
				dataType:'json',
				data:"employeeId="+employeeId+"&pushStartDate="+pushStartDate+"&pushEndDate="+pushEndDate+"&pushMoney="+pushMoney,
				callBackFn:function(msg){
					alert("调整成功");
					parent.$("#list").trigger("reloadGrid");
					parent.ClosePop();
				}
			});
		}else{
			alert("提成金额只能为数字");
		}
	}
</script>
</head>

<body>


<div class="HR_Mianshitongzhi_Bottom myBox03">

		<ul class="jl">
			<li><label>姓名:</label>${cash.employeeInfo.userName}</li>        
        	<li><label>部门:</label>${cash.employeeInfo.organizationName}</li>
            <li><label>岗位:</label>${cash.employeeInfo.postName}</li>
            <li><label>本月提成:</label><input type="text" value="${cash.pushMoney}" id="pushMoney"/></li>
            <li><label>&nbsp;</label><input class="HR_jiarurencaitidui_Submit01" onclick="updateTC();" style="border:none;" /></li>
        </ul>


</div>


</body>
</html>