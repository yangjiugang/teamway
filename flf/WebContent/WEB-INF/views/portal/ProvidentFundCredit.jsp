<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<script language="javascript" type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="js/mortgageCalculator.js"></script>
<script type="text/javascript">
 <!--
	 function startCalculate(obj){
		 // 住房公积金个人月缴存额
		 var providentFund =  $("#providentFund").val();
		 // 缴存比例
		 var proportion = $("#proportion").val();
		 // 配偶住房公积金个人月缴存额
		 var spouseProvidentFund = $("#SpouseProvidentFund").val();
		 // 缴存比例
		 var spouseProportion = $("#SpouseProportion").val();
		 // 房屋评估价值或实际购房款
		 var price =$("#price").val();
		 // 申请年限
		 var years = $("#years").val();
		 // 房屋性质
		 var housesNature = $(":radio[name='fun'][checked]").val();
		 // 个人信用等级
		 var creditRating = $(":radio[name='credit'][checked]").val();
		 
		 // 最高贷款额度
		 var gjjAmount = highestAmount(providentFund,proportion,spouseProvidentFund,spouseProportion,price,years,housesNature,creditRating,highestAmount);
		 
		 var isIE = (navigator.appName == 'Microsoft Internet Explorer');
		 if(isIE){ // IE浏览器
			 var child = document.frames("highestAmountPage");
			 child.document.getElementById("highestAmount").value = gjjAmount;
		 }else{ // FF浏览器
			 document.getElementById("highestAmountPage").contentDocument.getElementById("highestAmount").value = gjjAmount;
		 }
		 
		 if(providentFund == ""){
			$("#error1").show();
			$("#error2").hide();
			$("#error3").hide();
			return false;
		 }
		 if(proportion == ""){
			$("#error2").show();
			$("#error1").hide();
			$("#error3").hide();
			return false;
		 }
		 if(price == ""){
			$("#error3").show();
			$("#error1").hide();
			$("#error2").hide();
			return false;
		 }
	     $("iframe[name='hidenshow']").fadeIn();
		 $("#error1").hide();
		 $("#error2").hide();
		 $("#error3").hide();
	 }

	 $(document).ready(function(){
		 $("iframe[name='hidenshow']").hide();
		 $("iframe[name='hidenorshow']").hide();
		 $("#error1").hide();
		 $("#error2").hide();
		 $("#error3").hide();
		 $("#error4").hide();
	 });
	 
	 //$(document).ready(function(){
		 //for(var i = 1; i < 20; i++){
			 //var html = "<option value='" + i + "'>" + i + "年 (" + i*12 + "期)";
			 //$("#ajns").append(html);
		 //}
	 //});
 //-->
</script>
<body>
	<form action="" name="providentFund">
		<table border="0" style="font-size: 14px; line-height:30px">
			<tr>
				<td>
					住房公积金个人月缴存额：
				</td>
				<td>
					<input id="providentFund" type="text" size="6" maxlength="4" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" /> &nbsp;元
				</td>
				<td>
					&nbsp;缴存比例：<input id="proportion" type="text" maxlength="2" size="6" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" /> %
				</td>
			</tr>
			<tr>
				<td>
					配偶住房公积金个人月缴存额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="SpouseProvidentFund"  maxlength="4" type="text" size="6" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" /> &nbsp;元
				</td>
				<td>
					&nbsp;缴存比例：<input id="SpouseProportion" maxlength="2" type="text" size="6" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')"/> %
				</td>
			</tr>
			<tr>
				<td>
					房屋评估价值或实际购房款：
				</td>
				<td colspan="2">
					<input id="price" maxlength="9" type="text" size="11" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" /> &nbsp;元
				</td>
			</tr>
			<tr>
				<td colspan="3">
					房屋性质：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="fun" id="policy" value="1" />政策性住房&nbsp;&nbsp;
					<input type="radio" name="fun" id="other" value="2" checked />其他
				</td>
			</tr>
			<tr>
				<td colspan="3">
					贷款申请年限：&nbsp;&nbsp;&nbsp;
					<select id="years">
						<option value="1">1年（12期）</option>
						<option value="2">2年（24期）</option>
						<option value="3">3年（36期）</option>
						<option value="4">4年（48期）</option>
						<option value="5">5年（60期）</option>
						<option value="6">6年（72期）</option>
						<option value="7">7年（84期）</option>
						<option value="8">8年（96期）</option>
						<option value="9">9年（108期）</option>
						<option value="10">10年（120期）</option>
						<option value="11">11年（132期）</option>
						<option value="12">12年（144期）</option>
						<option value="13">13年（156期）</option>
						<option value="14">14年（168期）</option>
						<option value="15">15年（180期）</option>
						<option value="16">16年（192期）</option>
						<option value="17">17年（204期）</option>
						<option value="18">18年（216期）</option>
						<option value="19">19年（228期）</option>
						<option selected="selected" value="20">20年（240期）</option>
						<option value="25">25年（300期）</option>
						<option value="30">30年（360期）</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					个人信用等级：&nbsp;&nbsp;&nbsp;
					<input type="radio" name="credit" value="1" id="aAAL" />AAA级&nbsp;&nbsp;
					<input type="radio" name="credit" value="2" id="aAL" />AA级
					<input type="radio" name="credit" value="3" id="aOther" checked="checked" />其他
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<img src="images/cal_btn1.jpg" onclick="startCalculate(this);" style="cursor: pointer;"></img>
					<input type="image" src="images/cal_btn2.jpg" onclick="">
					<span id="error1"><img src="images/warningy.png" />住房公积金个人月缴存额不正确!</span>
					<span id="error2"><img src="images/warningy.png" />个人缴存比例不正确!</span>
					<span id="error3"><img src="images/warningy.png" />房屋评估价值或实际购房款不正确!</span>
					<span id="error4"><img src="images/warningy.png" />配偶缴存比例不正确!</span>
				</td>
			</tr>
		</table>
		<div>
			<iframe scrolling="no" frameborder="0" height="460" width="700" id="highestAmountPage" name="hidenshow" src="applicationAmount" >
			
			</iframe>
		</div>
		
	</form>
</body>
</html>