<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>节日问候窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/JavaScript">
	function submitHolidayRegards(){
		var userId=$("#userId").val();
		var userName=$("#userName").val();
		var companyName=$("#companyName").val();
		var sendUserName=$("#sendUserName").val();
		var HolidayDate=$("#HolidayDate").val();
		var HolidayName=$("#HolidayName").val(); 
		alert(HolidayName);
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/sendHolidayRegards',
			dataType:'json',
			data:"userId="+userId+"&userName="+userName+"&companyName="+companyName+"&sendUserName="
				 +sendUserName+"&HolidayDate="+HolidayDate+"&HolidayName="+HolidayName,
			callBackFn:function(msg){
				if(msg=='SUCCESS'){
					alert("节日问候已发送成功");
					parent.closeFrame();
				}else{
					alert("发送失败");
					 parent.closeFrame();
				}
			}
		});
	}
</script>
</head>

<body>

	

				<div class="HR_Mianshitongzhi_Bottom myBox03">
					<div class="HR_Mianshitongzhi_Window">
						<p>
							尊敬的<input id="userId" name="userId" type="hidden" value="${userId}" />
							<input id="userName" name="userName" class="HR_Mianshitongzhi_input" style="width: 50px;" value="${userName}" />：
						</p>
						<p style="text-indent: 2em;">
							我是<input id="companyName" class="HR_Mianshitongzhi_input" style="width: 200px;" value="深圳第五立方网络科技有限公司" />hr
								<input id="sendUserName" class="HR_Mianshitongzhi_input" style="width: 35px;" value="梁倩" />，
								<input id="HolidayDate" class="HR_Mianshitongzhi_input" style="width: 100px;" value="阴历七月七号" />是我国传统佳节 
								<input id="HolidayName" class="HR_Mianshitongzhi_input" style="width: 60px;" value="情人节" />，特此提醒您！
						</p>
						<h5>祝愉快!</h5>
					</div>

					<div class="HR_Ruzhitongzhi_Submit">
						<input type="button" class="HR_yidongweihu_Submit01" onclick="submitHolidayRegards();" />
					</div>


				</div>


		
</body>
</html>
