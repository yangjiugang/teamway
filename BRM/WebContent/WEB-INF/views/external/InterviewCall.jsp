<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>面试通知编辑窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script>
	<c:if test="${isAdd==1}">
		alert('提交成功!');
		parent.ClosePop();
	</c:if>
	<c:if test="${isAdd>=0}">
		alert('系统繁忙,请重试!');
	</c:if>
	
	$(document).ready(function(){
		//获取当前时间
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth();
		var day = myDate.getDate();
	
		$("#notifyTime").val(year+"-"+month+"-"+day);
	});
</script>
</head>

<body>


<div class="HR_Mianshitongzhi_Bottom myBox03">

<form action="addNewInterview" method="post">
<input type="hidden" name="userId" value="${resume.userId}"/>
<input type="hidden" name="emploId" value="1" />
<input type="hidden" name="companyId" value="${userInfo.cfgCompany.companyId }" />
<div class="HR_Mianshitongzhi_Window">
<p>尊敬的<input class="HR_Mianshitongzhi_input" style="width:80px;" value="${resume.userName }" />：</p>
<p style="text-indent:2em;">
我是<input class="HR_Mianshitongzhi_input" style="width:170px;" value="${userInfo.cfgCompany.companyName }" />
hr<input class="HR_Mianshitongzhi_input" style="width:27px;" value="${userInfo.userName }" />
，代表我公司通知您，通过和您的交流沟通，我们认为您符合我公司 <input class="HR_Mianshitongzhi_input" style="width:115px;" value="技术部 数据库管理员" />的任职条件，特此通知您于<input class="Wdate" style="width:80px;" id="notifyTime" name="notifyTime" onClick="WdatePicker({readOnly:'true'})"/>到公司来面试。有任何问题，请及时联系我！</p>
<h5>祝愉快!</h5>
</div>
<ul class="HR_Mianshitongzhi_Contact">
<li>报到地点：<input class="HR_Mianshitongzhi_input" style="width:205px;" name="interviewAddress" value="${userInfo.cfgCompany.companyAddress }" /></li>
<li>联系人：&nbsp;&nbsp;&nbsp; <input class="HR_Mianshitongzhi_input" style="width:205px;" name="notifyEmployeeName" value="${userInfo.userName }" /></li>
<li>联系电话：<input class="HR_Mianshitongzhi_input" style="width:205px;" name="notifyEmployeePhone" value="${userInfo.telephone }" /></li>
</ul>
<div class="HR_Ruzhitongzhi_Submit"><input type="submit" value="  " class="HR_Submit30" /></div>
</form>

</div>


</body>
</html>
