<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>约谈通知窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<script type="text/javascript">
	function sendMsg(){
		$.ajax({
			url : "broker_confirmSendRemind",
			dataType : 'json',
			data : "content1=" + $("#content1").val() +
			       "&userId=" + $("#userId").val() +
			       "&content2=" + $("#content2").val(),
			success:function(data){
				alert("发送成功！");
				parent.right.search();
				parent.closeFrame();
			}
		});
	}
</script>
</head>
<body>
	<div class="HR_Mianshitongzhi_Bottom myBox03">
		<div class="HR_Mianshitongzhi_Window">
			<p>
				尊敬的<input class="HR_Mianshitongzhi_input" id="userName" style="width: 500px;" value="${userName }" readonly onfocus="this.blur()"/>：
				<input type="hidden" id="userId" value="${userId }">
			</p>
			<p style="text-indent: 2em;">
			    <input class="HR_Mianshitongzhi_input" id="content1" style="width: 500px;" value="由于您长时间未与您的下属进行沟通 为确保人员工作效率工作激情，" maxlength="38"/>
			    <input class="HR_Mianshitongzhi_input" id="content2" style="width: 500px;" value="请尽快进行沟通安排，并记录您的沟通记录" maxlength="37" />
			</p>
		</div>
		<div class="HR_Ruzhitongzhi_Submit">
			<input type="button" class="HR_yidongweihu_Submit01" onclick="sendMsg();"/>
		</div>
	</div>
</body>
</html>