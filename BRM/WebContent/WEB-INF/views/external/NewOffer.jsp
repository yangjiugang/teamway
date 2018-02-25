<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>入职通知编辑窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
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
	
		$("#arriveDate").val(year+"-"+month+"-"+day);
	});
	
	
	//验证日期
	function checkInput(id){
		var dateStr = $("#houseDate").val();
		//获取当前时间
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth()+1;
		var day = myDate.getDate();
		
		var dateArray = dateStr.split("-");
		if(dateArray[0]<year){
			$.fc.alert({msg:"日期格式不正确！"});
			return false;
		}
		if(year==dateArray[0] &&dateArray[1]< month){
			$.fc.alert({msg:"日期格式不正确！"});
			return false;
		}
		if(month==dateArray[1] && dateArray[2]<day){
			$.fc.alert({msg:"日期格式不正确！"});
			return false;
		}
	}
</script>
</head>

<body>

<div class="HR_Mianshitongzhi_Bottom myBox03">
<form action="addNewOffer?uid=1" method="post">
<input type="hidden" name="resumeId" value="${userId }"/>
<div class="HR_Mianshitongzhi_Window">
<p>尊敬的
<input class="HR_Mianshitongzhi_input" style="width:50px;" name="userName" value="${resume.userName }" tip="请输入关键字" />：</p>
<p style="text-indent:2em;">我是<input class="HR_Mianshitongzhi_input" style="width:170px;" value="${userInfo.cfgCompany.companyName }" />hr<input class="HR_Mianshitongzhi_input" name="contactUser" style="width:27px;" value="${userInfo.userName}" />，代表我公司通知您，通过和您的交流沟通，我们认为您符合我公司 <input class="HR_Mianshitongzhi_input" style="width:115px;" name="postName" value="技术部 数据库管理员" />的任职条件，特此通知您于
<input class="Wdate" style="width:80px;" id="arriveDate" name="arriveDate" onClick="WdatePicker({readOnly:'true'})" />到公司办理入职手续。有任何问题，请及时联系我！</p>
<h5>祝愉快!</h5>
</div>
<ul class="HR_Mianshitongzhi_Contact">
<li>报到地点：<input class="HR_Mianshitongzhi_input" style="width:205px;" value="${userInfo.cfgCompany.companyAddress }" /></li>
<li>联系人：&nbsp;&nbsp;&nbsp; <input class="HR_Mianshitongzhi_input" name="contactUser" style="width:205px;" value="${userInfo.userName }" /></li>
<li>联系电话：<input class="HR_Mianshitongzhi_input" style="width:205px;" name="contactPhone" value="${userInfo.telephone }" /></li>
</ul>
<div class="HR_Ruzhitongzhi_Submit"><input type="submit" value="  " class="HR_Submit_qdtj29" /></div>
</form>
</div>

</body>
</html>
