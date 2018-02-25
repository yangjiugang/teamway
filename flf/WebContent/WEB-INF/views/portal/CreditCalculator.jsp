<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
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
			$("#resultPage").fadeIn();
			var gjlv = document.dkjsq.gjlv_value.value;
			var sdlv = document.dkjsq.sdlv_value.value;
			var dklx = $(":radio[name='dklx'][checked]").val();
			var hkfs = $(":radio[name='hkfs'][checked]").val();
			var anjcs = $("#anjcs").val();
			var years = $("#years").val();
			// 计算方式  1:根据单价、面积计算。2：根据贷款总额计算
			var calculation = $(":radio[name='calculation'][checked]").val();
			if(dklx == 2){
				// 贷款类型：公积金
				creditPlay($("#gjdkze").val(),$("#gjdj").val(),$("#gjmj").val(),$("#anjcs").val(),calculation,hkfs,anjcs,gjlv,years);
			}else{
				// 贷款类型：商业贷款
				creditPlay($("#gjdkze").val(),$("#gjdj").val(),$("#gjmj").val(),$("#anjcs").val(),calculation,hkfs,anjcs,sdlv,years);
			}
		}
	
		function onloads(){
			// 取得利率
	 		var dklv_cl = $("#lilv").val();
	 		var yhkqs = $("#years").val();
	 		showLilv(yhkqs,dklv_cl);
	 	}
		
		// 计算方式
		function onc(){
			var calculation = $(":radio[name='calculation'][checked]").val();
			if(calculation == 1){
				$("#gjmjjs").fadeIn();
				$("#gjdkjs").hide();
			}else{
				$("#gjdkjs").fadeIn();
				$("#gjmjjs").hide();
			}
		}
		
		function interestRate(){
	 		onloads();
	 	}
		
		$(document).ready(function(){
			$("#resultPage").hide();
			$("#debj_text").hide();
			onc();
		});
		
		function changes_bx(){
			$("#debj_text").hide();
			$("#debx_text").fadeIn();
		}
		
		function changes_bj(){
			$("#debj_text").fadeIn();
			$("#debx_text").hide();
		}
	//-->
</script>
<body onload="onloads()">
	<form name="dkjsq">
		<table border="0" style="line-height: 30px;font-size: 14px;" width="100%">
			<tr>
				<td width="10%">
					还款方式：
				</td>
				<td width="90%">
					<input type="radio" name="hkfs" value="1" id="" checked="checked" onchange="changes_bx()"/>等额本息
					<input type="radio" name="hkfs" value="2" id="" onchange="changes_bj()" />等额本金
				</td>
			</tr>
			<tr>
				<td>
					贷款类型：
				</td>
				<td>
					<input type="radio" name="dklx" value="2" id="" checked="checked" />公积金贷款
					<input type="radio" name="dklx" value="1" id="" />商业贷款
				</td>
			</tr>
			<tr>
				<td>
					计算方式：
				</td>
				<td>
					<input type="radio" name="calculation" value="1" id="" onclick="onc();" checked />根据面积、单价计算：
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
				<div id="gjmjjs">
					<table>
						<tr>
						<td>
						<span style="margin-left: 5mm;">
							单价：<input type="text" name="creditType" id="gjdj" maxlength="7" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" checked="checked" />元/平米<br></span>
						<span style="margin-left: 5mm;">
							面积：<input type="text" name="creditType" id="gjmj" maxlength="7" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" />平方米<br></span>
						<span style="margin-left: 5mm;">
							按揭成数：
							<select size="1" name="anjie" id="anjcs">
								<option value="9">9成</option>
								<option value="8">8成</option>
								<option value="7" selected="selected">7成</option>
								<option value="6">6成</option>
								<option value="5">5成</option>
								<option value="4">4成</option>
								<option value="3">3成</option>
								<option value="2">2成</option>
						    </select>
						</span>
						</td>
						</tr>
					</table>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<input type="radio" name="calculation" value="2" onclick="onc();" id="" />根据贷款总额计算&nbsp;
					<div id="gjdkjs">
						<span style="margin-left: 5mm;">贷款总额：<input id="gjdkze" type="text" maxlength="3" size="8" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')" /> 万元</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					按揭年数：
				</td>
				<td>
					<select name="yhkqs" id="years" >
						<option value="12">1年（12期）</option>
						<option value="24">2年（24期）</option>
						<option value="36">3年（36期）</option>
						<option value="48">4年（48期）</option>
						<option value="60">5年（60期）</option>
						<option value="72">6年（72期）</option>
						<option value="84">7年（84期）</option>
						<option value="96">8年（96期）</option>
						<option value="108">9年（108期）</option>
						<option value="120">10年（120期）</option>
						<option value="132">11年（132期）</option>
						<option value="144">12年（144期）</option>
						<option value="156">13年（156期）</option>
						<option value="168">14年（168期）</option>
						<option value="180">15年（180期）</option>
						<option value="192">16年（192期）</option>
						<option value="204">17年（204期）</option>
						<option value="216">18年（216期）</option>
						<option value="228">19年（228期）</option>
						<option selected="selected" value="240">20年（240期）</option>
						<option value="300">25年（300期）</option>
						<option value="360">30年（360期）</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					贷款利率：
				</td>
				<td>
					<select id="lilv" name="dklv_class" onchange="interestRate()">
						<option value='23'>11年07月07日利率上限(1.1倍)</option>
						<option value='22' selected="selected">11年07月07日利率下限(85折)</option>
						<option value='21'>11年07月07日利率下限（7折）</option>
						<option value='20'>11年07月07日利率基准</option>
						<option value='19'>11年04月06日利率上限(1.1倍)</option>
						<option value='18'>11年04月06日利率下限(85折)</option>
						<option value='17'>11年04月06日利率下限（7折）</option>
						<option value='16'>11年04月06日利率基准</option>
						<option value='15'>11年02月09日利率上限(1.1倍)</option>
						<option value='14'>11年02月09日利率下限(85折)</option>
						<option value='13'>11年02月09日利率下限(7折)</option>
						<option value='12'>11年02月09日利率基准</option>
						<option value='11'>10年12月26日利率上限(1.1倍)</option>
						<option value='10'>10年12月26日利率下限(7折)</option>
						<option value='9'>10年12月26日利率基准</option>
						<option value='8'>10年10月20日利率上限(1.1倍)</option>
						<option value='7'>10年10月20日利率基准</option>
						<option value='6'>10年10月20日利率下限(85折)</option>
						<option value='5'>10年10月20日利率下限(7折)</option>
						
						<!--  <option value='45'>08年12月23日第二套房(1.1倍)</option>
						<option value='44'>08年12月23日利率基准</option>
						<option value='43'>08年12月23日利率上限(1.1倍)</option>
						<option value='42'>08年12月23日利率下限(85折)</option>
						<option value='41'>08年12月23日利率下限(7折)</option>
						<option value='40'>08年11月27日第二套房</option>
						<option value='39'>08年11月27日利率基准</option>
						<option value='38'>08年11月27日利率上限</option>
						<option value='37'>08年11月27日利率下限</option>-->
					</select>
					
					<font color="gray" size="2">(公积金利率: <span id="gjlv"></span> 商业贷款利率 <span id="sdlv"></span>)</font>
					<input type="hidden" id="gjlv_value" />
					<input type="hidden" id="sdlv_value" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<img src="images/cal_btn1.jpg" onclick="startCalculate(this);" style="cursor: pointer;"></img>
					<input type="image" src="images/cal_btn2.jpg" onclick="">
				</td>
			</tr>
		</table>
		<div id="resultPage" style="font-size: 14px;">
			<h3 style="color: #155383;font: ">计算结果：</h3>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:30px;font-size: 14px;">
				<tr>
					<td width="8%">
						房款总额：
					</td>
					<td width="14%">
						<input size=17 name="fkze" class="txt" disabled>&nbsp;元
					</td>
					<td width="8%">
						贷款总额：
					</td>
					<td width="50%">
						<input size=17 name="dkze" class="txt" disabled>&nbsp;元
					</td>
				</tr>
				<tr>
					<td>
						还款总额：
					</td>
					<td>
						<input size=17 name="hkze" class="txt" disabled>&nbsp;元
					</td>
					<td>
						支付利息款：
					</td>
					<td>
						<input size=17 name="yhlxe" class="txt" disabled>&nbsp;元
					</td>
	
				</tr>
				<tr>
					<td>
						首期付款：
					</td>
					<td>
						<input size=17 name="sqfke" class="txt" disabled>&nbsp;元
					</td>
					<td>
						货款月数：
					</td>
					<td>
						<input size=17 name="dkyues" class="txt" disabled>&nbsp;月
					</td>
				</tr>
				<tr id="debx_text">
					<td>
						月均还款：
					</td>
					<td>
						<input size=17 name="yjhke" class="txt" disabled>&nbsp;元
					</td>
				</tr>
				<tr>
				<tr id="debj_text">
					<td>
						月均还款：
					</td>
					<td>
						<!-- <textarea rows="" cols="" name="month_money" class="txt" ></textarea> -->
						<select multiple="multiple" id="month_money" style="height: 55px;width: 90%" disabled>
						</select>
					</td>
				</tr>
			</table>
		</div>
     </form>
</body>
</html>