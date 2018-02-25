<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>生日慰问窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript">
	function sendBirthBlessing(){
		var userName = $("#userName").val();
		var companyName = $("#companyName").val(); 
		var sendUserName = $("#sendUserName").val();
		var date = $("#date").val();
		var email=$("#email").val();
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/SendBirthRemind',
			dataType:'json',
			data:"userName="+userName+"&sendUserName="+sendUserName+"&date="+date+"&email="+email+"&companyName="+companyName,
			callBackFn:function(msg){
				if(msg){
					alert("发送成功！");
					parent.ClosePop();								
				}else{
					alert("发送失败！");
				}
			}
		});		
	}
</script>
</head>

<body>


	<div class="HR_Mianshitongzhi_Bottom myBox03">
	<h3 style="padding-bottom:5px;">祝言</h3>
		<div class="HR_Mianshitongzhi_Window">
		<p>尊敬的<input class="HR_Mianshitongzhi_input" id="userName" name="userName" style="width:50px;" value="${employeeInfo.userName}" />：</p>
		<p style="text-indent:2em;">我是<input id="companyName" name="companyName" class="HR_Mianshitongzhi_input" style="width:190px;" value="深圳第五立方网络科技有限公司" />hr<input class="HR_Mianshitongzhi_input" id="sendUserName" name="sendUserName" style="width:38px;" value="梁倩" />，<input class="HR_Mianshitongzhi_input" id="date" name="date"  style="width:80px;" value="<fmt:formatDate value='${employeeInfo.userBirthday}' type="both" pattern='MMM dd'/>"/>日是您的生日，我仅代表我公司祝贺你
		  生日快乐！</p><input type="hidden" id="email" value="${employeeInfo.enterpriseMail}" name="email">
		<h5>祝愉快!</h5>
		</div>
		</div>
		<div class="HR_Ruzhitongzhi_Submit"> <input type="submit" value=" " class="HR_jiaoliujilu_Submit01" onclick="sendBirthBlessing();"/></div>
</body>
</html>
