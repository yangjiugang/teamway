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
			$("#resultPage").fadeIn();
		}
		
		$(document).ready(function(){
			$("#resultPage").hide();
		});
	//-->
</script>
<body>
	<form name="gfnlpg">
	  <table border="0" style="line-height: 30px;font-size: 14px;">
        <tr>
          <td width="11%"> 购房资金： </td>
          <td width="17%">
		  	<input name="rg01" type="text" size="8" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'');chk01();"/>万元
          </td>
		  <td width="72%">
		  	<font color="#999999">包括现金、存款、有价证券和可以筹措到的资金总和</font>
		  </td>
        </tr>
        <tr>
          <td> 月 收 入： </td>
          <td><input name="rg02" type="text" size="8" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')"/>元
          </td>
		  <td>
		  	<font color="#999999">现家庭月收入</font>		  
		  </td>
        </tr>
		<tr>
          <td> 购房支出： </td>
          <td><input name="rg03" type="text" size="8" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'');chk02();"/>元/月
          </td>
		  <td>
		  	<font color="#999999">预计家庭每月可用于购房支出</font>
		  </td>
        </tr>
        <tr>
          <td>还款年限： </td>
          <td>
			  <select name="rg04" id="years" >
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
				</select>年
          </td>
		  <td>
		  	<font color="#999999">您期望偿还贷款的年限</font>
		  </td>
        </tr>
		<tr>
          <td>房屋面积： </td>
          <td><input name="rg06" type="text" size="8" onkeyup="value=value.replace(/[^0-9\.]/g,'')" onblur="value=value.replace(/[^0-9\.]/g,'')"/>平方米
          </td>
		  <td>
		  	<font color="#999999">您的计划购买房屋面积</font>
		  </td>
        </tr>
		<tr>
		  <td>
		      <img src="images/cal_btn1.jpg" onclick="startCalculate(this);chk03();" style="cursor: pointer;"></img>
		  </td>
          <td colspan="2">
		      <input type="image" onclick="" src="images/cal_btn2.jpg" />
		  </td>
        </tr>
      </table>
	  <div id="resultPage" style="line-height: 30px;font-size: 14px;">
	  	<table border="0">
			<tr>
				<td width="11%">
					<font color="#155383" size="+1"><strong>计算结果</strong>：</font>
				</td>
				<td width="17%" ></td>
				<td width="72%" colspan="2"></td>
			</tr>
			<tr>
				<td>
					房屋总价：
				</td>
				<td>
					<input name="rg07" type="text" size="8" readonly="readonly" disabled />元
				</td>
				<td colspan="2">
					<font color="#999999">您可购买的房屋总价</font>
				</td>
			</tr>
			<tr>
				<td>
					房屋单价：
				</td>
				<td>
					<input name="rg08" type="text" size="8" readonly="readonly" disabled />元
				</td>
				<td colspan="2">
					<font color="#999999">您可购买的房屋单价</font>
				</td>
			</tr>
			<tr>
				<td>
					契税：
				</td>
				<td>
					<input name="rg10" type="text" size="8" readonly="readonly" disabled />元
				</td>
				<td colspan="2">
					<font style="line-height: 20px;" color="#999999">房屋的实际成交价格高于同级别土地上住房平均交易<br>
					                      价格的1.2倍以上，契税按3%收取
					</font>
				</td>
			</tr>
			<tr>
				<td>
					维修基金：
				</td>
				<td>
					<input name="rg11" type="text" size="8" readonly="readonly" disabled />元
				</td>
				<td colspan="2">
					<font color="#999999">公共维修基金</font>
				</td>
			</tr>
			<tr>
				<td>
					首付款：
				</td>
				<td>
					<input name="rg12" type="text" size="8" readonly="readonly" disabled />元
				</td>
				<td width="10">
					保险费：
				</td>
				<td width=""><input name="rg13" type="text" size="8" readonly="readonly" disabled />元</td>
			</tr>
			<tr>
				<td>
					律师费：
				</td>
				<td>
					<input name="rg14" type="text" size="8" readonly="readonly" disabled />元
				</td>
				<td>
					抵押登记费：
				</td>
				<td width=""><input name="rg15" type="text" size="8" readonly="readonly" disabled />元</td>
			</tr>
			
			<tr>
				<td></td>
				<td>
					<font color="#155383" size="-1">购房相关税费</font>
				</td>
				<td>
					<font color="#155383" size="-1">银行贷款需支付的费用</font>
				</td>
				<td>
				</td>
			</tr>
			
		</table>
	  </div>
	</form>
</body>
</html>