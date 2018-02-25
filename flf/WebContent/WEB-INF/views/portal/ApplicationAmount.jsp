<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script language="javascript" type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="js/mortgageCalculator.js"></script>
<script type="text/javascript">
 <!--
	 function startCalculate(){
		 // 住房公积金个人月缴存额
		 var providentFund = $("#providentFund",window.parent.document).val();
		 // 缴存比例
		 var proportion = $("#proportion",window.parent.document).val();
		// 配偶住房公积金个人月缴存额
		 var spouseProvidentFund = $("#SpouseProvidentFund",window.parent.document).val();
		 // 缴存比例
		 var spouseProportion = $("#SpouseProportion",window.parent.document).val();
		 // 总房价
		 var price = $("#price",window.parent.document).val();
		 // 需要贷款的额度
		 var creditAmount = $("#creditAmount").val();
		 // 最高申请额度
		 var highestAmount = $("#highestAmount").val();
		 // 申请贷款年限
		 var years = $("#years",window.parent.document).val();
		 if(parseInt(creditAmount) > parseInt(highestAmount)){
			 $("#error6").show();
			 $("#error1").hide();
			 $("#error2").hide();
			 $("#error3").hide();
			 $("#error4").hide();
			 $("#error5").hide();
			 return false;
		 }
		 if(providentFund == ""){
			$("#error1").show();
			$("#error2").hide();
			$("#error3").hide();
			$("#error4").hide();
			$("#error5").hide();
			$("#error6").hide();
			return false;
		 }
		 if(proportion == ""){
			$("#error2").show();
			$("#error1").hide();
			$("#error3").hide();
			$("#error4").hide();
			$("#error5").hide();
			$("#error6").hide();
			return false;
		 }
		 if(price == ""){
			$("#error3").show();
			$("#error1").hide();
			$("#error2").hide();
			$("#error4").hide();
			$("#error5").hide();
			$("#error6").hide();
			return false;
		 }
		 if(creditAmount == ""){
			$("#error4").show();
			$("#error3").hide();
			$("#error1").hide();
			$("#error2").hide();
			$("#error5").hide();
			$("#error6").hide();
			return false;
		 }
		 $("iframe[name='hidenorshow']",window.parent.document).fadeIn();
		 
		 var checkedbox;
		 $(":checkbox[checked]").each(function(){
			 checkedbox += $(this).val() + ",";
		 });
		 if(typeof checkedbox == "undefined" ){
			 $("#error1").hide();
			 $("#error2").hide();
			 $("#error3").hide();
			 $("#error4").hide();
			 $("#error5").show();
			 $("#error6").hide();
			 return false;
		 }
		 // 还款类型
		 var checkedboxa = checkedbox.substr(9,checkedbox.length-10);
		 // 等额本息还款
		 dengebenxi(providentFund,proportion,spouseProvidentFund,spouseProportion,years,creditAmount,checkedboxa);
		 //alert("隐藏表单的值"+document.forms[0].dengebenxi.value);
		 var repType = new Array();
		 repType = checkedboxa;
		 var benxiTotal = document.forms[0].dengebenxi.value;
		 var dengebenjin = document.forms[0].dengebenjin.value;
		 var shouyhk = document.forms[0].shouyhk.value;
		 var lastPri = document.forms[0].lastPri.value;
		 var lowestRep = document.forms[0].lowestRep.value;
		 var free = document.forms[0].free.value;
		 var interest = document.forms[0].interest.value;
		 $("#benxiLoans").text("");
		 $("#benxiTotal").text("");
		 $("#benxiMonthsRep").text("");
		 $("#benxiLoansMonths").text("");
		 $("#benxiInterest").text("");
		 
		 $("#benjinLoans").text("");
		 $("#benjinTotal").text("");
		 $("#benjinLoansMonths").text("");
		 $("#fristRep").text("");
		 $("#benjinInterest").text("");
		 
		 $("#freeLoans").text("");
		 $("#freeLastPri").text("");
		 $("#freeLowestRep").text("");
		 $("#freeTotal").text("");
		 $("#freeInterest").text("");
		 for(var i = 0; i < repType.length; i++){
			 if(repType[i] == 1){ // 等额本息
				 $("#benxiLoans").text(creditAmount);
				 $("#benxiTotal").text(benxiTotal);
				 var benxiTotala = adv_format(benxiTotal/(years*12),2);
				 $("#benxiMonthsRep").text(benxiTotala);
				 $("#benxiLoansMonths").text(years*12);
				 $("#benxiInterest").text(parseInt(benxiTotal)-parseInt(creditAmount*10000));
			 }
			 if(repType[i] == 2){ // 等额本金
				 $("#benjinLoans").text(creditAmount);
				 $("#benjinTotal").text(dengebenjin);
				 $("#benjinLoansMonths").text(years*12);
				 $("#fristRep").text(shouyhk);
				 $("#benjinInterest").text(parseInt(dengebenjin)-parseInt(creditAmount*10000));
			 }
			 if(repType[i] == 3){ //自由还款
				 $("#freeLoans").text(creditAmount);
				 $("#freeLastPri").text(lastPri);
				 $("#freeLowestRep").text(lowestRep);
				 $("#freeTotal").text(free);
				 $("#freeInterest").text(interest);
			 }
		 }
		 $("#resultPage").fadeIn();
		 $("#error1").hide();
		 $("#error2").hide();
		 $("#error3").hide();
		 $("#error4").hide();
		 $("#error5").hide();
		 $("#error6").hide();
	 }

	 $(document).ready(function(){
		 $("#error1").hide();
		 $("#error2").hide();
		 $("#error3").hide();
		 $("#error4").hide();
		 $("#error5").hide();
		 $("#resultPage").hide();
		 $("#error6").hide();
	 });
	 
	 
  //-->
</script>
<body>
	<form action="">
	<input type="hidden" name="dengebenxi" /><!-- 等额本息本息合计 -->
	<input type="hidden" name="dengebenjin" /><!-- 等额本金本息合计 -->
	<input type="hidden" name="shouyhk" />  <!-- 首月还款额 -->
	<input type="hidden" name="free" />     <!-- 自由还款总偿还利息 -->
	<input type="hidden" name="lastPri" />     <!-- 自由还款最后期本金 -->
	<input type="hidden" name="lowestRep" />     <!-- 自由还款最低换额 -->
	<input type="hidden" name="interest" />     <!-- 自由还款最后期利息 -->
		<table border="0" style="line-height:30px" >
			<tr>
				<td colspan="2"><font style="color: #155383;font-size: 14px;"><b>计算结果：</b></font></td>
			</tr>
			<tr>
				<td>
					<font style="font-size: 14px;">可申请最高贷款额度：</font>
				</td>
				<td>
					<input readonly="readonly" id="highestAmount" type="text" size="6" /> &nbsp;<font style="font-size: 14px;">万元</font>
				</td>
			</tr>
			<tr>
				<td>
					<font style="font-size: 14px;">需要贷款额度：</font>
				</td>
				<td>
					<input id="creditAmount" type="text" size="6" maxlength="3" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" /> &nbsp;<font style="font-size: 14px;">万元</font>
				</td>
			</tr>
			<tr>
				<td >
					<font style="font-size: 14px;">还款方式：</font>
				</td>
				<td>
					<input type="checkbox" checked="checked" name="repayment" value="1" id="benxi" /><font style="font-size: 14px;">等额本息</font>
					<input type="checkbox" checked="checked" name="repayment" value="2" id="benjin" /><font style="font-size: 14px;">等额本金</font>
					<input type="checkbox" checked="checked" name="repayment" value="3" id="free" /><font style="font-size: 14px;">自由还款</font>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<img src="images/btn1.jpg" onclick="startCalculate(this);" style="cursor: pointer;"></img>
					<input type="image" src="images/btn2.jpg" onclick="">
					<span id="error1" class=".gray"><img src="images/warningy.png" /><font style="font-size: 14px;">住房公积金个人月缴存额不正确!</font></span>
					<span id="error2"><img src="images/warningy.png" /><font style="font-size: 14px;">个人缴存比例不正确!</font></span>
					<span id="error3"><img src="images/warningy.png" /><font style="font-size: 14px;">房屋评估价值或实际购房款不正确!</font></span>
					<span id="error4"><img src="images/warningy.png" /><font style="font-size: 14px;">需要的贷款额度不能为空!</font></span>
					<span id="error5"><img src="images/warningy.png" /><font style="font-size: 14px;">请选择还款方式!</font></span>
					<span id="error6"><img src="images/warningy.png" /><font style="font-size: 14px;">不能高于最高贷款额度!</font></span>
				</td>
			</tr>
		</table>
		<div id="resultPage" style="font-size: 14px;">
			<table border="0" style="line-height:30px" >
				<tr>
					<td colspan="3">
						<font style="color: #155383;font: "><b>计算结果：</b></font>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							
							<tr>
								<td width="30%">
									等额本息还款&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td >
									贷款总额：<label id="benxiLoans"></label>万元
								</td>
							</tr>
							<tr>
								<td>
									贷款月数：<label id="benxiLoansMonths"></label>月
								</td>
							</tr>
							<tr>
								<td>
									月均还款：<label id="benxiMonthsRep"></label>元
								</td>
							</tr>
							<tr>
								<td>
									支付利息：<label id="benxiInterest"></label>元
								</td>
							</tr>
							<tr>
								<td>
									本息合计：<label id="benxiTotal"></label>元
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td width="30%">
									等额本金还款&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									贷款总额：<label id="benjinLoans"></label>万元
								</td>
							</tr>
							<tr>
								<td>
									贷款月数：<label id="benjinLoansMonths"></label>月
								</td>
							</tr>
							<tr>
								<td>
									首月还款额：<label id="fristRep"></label>元
								</td>
							</tr>
							<tr>
								<td>
									支付利息：<label id="benjinInterest"></label>元
								</td>
							</tr>
							<tr>
								<td>
									本息合计：<label id="benjinTotal"></label>元
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td width="30%">
									自&nbsp;由&nbsp;还&nbsp;款&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									贷款总额：<label id="freeLoans"></label>万元
								</td>
							</tr>
							<tr>
								<td>
									最低还款额：<label id="freeLowestRep"></label>元
								</td>
							</tr>
							<tr>
								<td>
									最后期本金：<label id="freeLastPri"></label>元
								</td>
							</tr>
							<tr>
								<td>
									最后期利息：<label id="freeInterest"></label>元
								</td>
							</tr>
							<tr>
								<td>
									总偿还利息：<label id="freeTotal"></label>元
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>