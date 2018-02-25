<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script language="javascript" type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
 <!--
 	 // 开始计算
	 function startCalculate(){
		 var price =$("#price").val();
		 var area =$("#area").val();
		 if(price == ""){
			 $("#error1").show();
			 $("#error2").hide();
			 return false;
		 }
		 if(area == ""){
			 $("#error1").hide();
			 $("#error2").show();
			 return false;
		 }
	     $("iframe[name='taxesiframe']").fadeIn();
		 $("#error1").hide();
		 $("#error2").hide();
		 
		 
		 var price = $("#price").val();
		 var area = $("#area").val();
		 var sum = price*area;  // 房款总价
		 var deed = sum*0.015;  // 契税
		 var printingTax = sum*0.0005;  // 印花税
		 var notaryFees = sum*0.003; // 公证费
		 var commissionFee = sum*0.003; // 委托办理产权手续费
		 var houseSaleFee;
		 if(area <= 120){
			 houseSaleFee = 500;
		 }else if(area > 120 && area <=5000 ){
			 houseSaleFee = 1500;
		 }else{
			 houseSaleFee = 5000;
		 }
		 
		 var isIE = (navigator.appName == 'Microsoft Internet Explorer');
		 // 获得子窗口对象
		 if(isIE){ // IE浏览器
			 var child = document.frames("showhiden");
			 child.document.getElementById("sumPrice").value=sum;
			 child.document.getElementById("printingTax").value=printingTax;
			 child.document.getElementById("notaryFees").value=notaryFees;
			 child.document.getElementById("deed").value=deed;
			 child.document.getElementById("commissionFee").value=commissionFee;
			 child.document.getElementById("houseSaleFee").value=houseSaleFee;
			 
		 }else{  // FF浏览器
			 var child = document.getElementById("showhiden");
			 child.contentDocument.getElementById("sumPrice").value=sum;
			 child.contentDocument.getElementById("printingTax").value=printingTax;
			 child.contentDocument.getElementById("notaryFees").value=notaryFees;
			 child.contentDocument.getElementById("deed").value=deed;
			 child.contentDocument.getElementById("commissionFee").value=commissionFee;
			 child.contentDocument.getElementById("houseSaleFee").value=houseSaleFee;
		 }
	 }
 	 
 	 // 清空
 	 function clean(){
 		 $("#price").val("");
		 $("#area").val("");
 		 // 获得子窗口对象
		 var child = document.frames("showhiden");
 		 // 清空子窗口内容
		 child.document.getElementById("sumPrice").value="";
		 child.document.getElementById("printingTax").value="";
		 child.document.getElementById("notaryFees").value="";
		 child.document.getElementById("deed").value="";
		 child.document.getElementById("commissionFee").value="";
		 child.document.getElementById("houseSaleFee").value="";
 	 }

	 $(document).ready(function(){
		 $("#error1").hide();
		 $("#error2").hide();
	 });
 //-->
</script>
<body>
	<form name="">
		<table border="0" style="font-size: 14px;">
			<tr>
				<td width="100">
					单价：
				</td>
				<td width="400">
					<input type="text" id="price" size="10" onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />&nbsp;元/平方米
					<span id="error1"><img src="images/warningy.png" onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />单价不能为空,请输入!</span>
				</td>
			</tr>
			<tr>
				<td>
					面积：
				</td>
				<td>
					<input type="text" id="area" size="10" />&nbsp;平方米
					<span id="error2"><img src="images/warningy.png" />请输入面积!</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img src="images/cal_btn1.jpg" onclick="startCalculate(this);" style="cursor: pointer;"></img>
					<input type="image" src="images/cal_btn2.jpg" onclick="reset(this);">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					____________________________________________________________________________
				</td>
			</tr>
		</table>
		<div>
			<iframe scrolling="no" frameborder="0" height="450" width="540"  id="taxesiframe"  name="showhiden" src="taxesResult"></iframe>
		</div>
	</form>
</body>
</html>