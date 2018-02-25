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
		//var  = $("#dklx").val();
		var dklx = $(":radio[name=dklx][checked]").val();
		var bool = play(dklx);
		alert(bool)
		if(!bool){
			return false;
		}else{
			$("#resultPage").fadeIn();
		}
	}
 
 	function interestRate(){
 		onloads();
 	}
 	
 	function onloads(){
 		//var creditType = $(":radio[checked]").val();
 		var dklv_cl = $("#lilv").val();
 		var yhkqs = $("#years").val();
 		showLilv(yhkqs,dklv_cl);
 	}
 	
 	$(document).ready(function(){
 		$("#resultPage").hide();
 	});

 //-->
 </script>
<body onload="onloads();">
	<form name="tqhdjsq">
		<table border="0" style="line-height: 30px;font-size: 14px;" width="100%">
			<tr>
				<td width="15%">
					原贷款类型：
				</td>
				<td width="87%">
					<input type="radio" name="dklx" value="2" id="" checked="checked" />公积金贷款
					<input type="radio" name="dklx" value="1" id="" />商业贷款
				</td>
			</tr>
			<tr>
				<td>
					提前还款方式：
				</td>
				<td>
					<input type="radio" name="tqhkfs" id="" checked="checked" />一次提前还清
					<input type="radio" name="tqhkfs" id="" />部分提前还款 <INPUT size=6 name="tqhkws" class="txt"> 万元 <font color="gray" size="2">（不含当月应还款额）</font>
				</td>
			</tr>
			<tr>
				<td>
					处理方式：
				</td>
				<td>
					<input type="radio" checked name="clfs">缩短还款年限，月还款额基本不变
					<input type="radio" name="clfs">减少月还款额，还款期不变
				</td>
			</tr>
			<tr>
				<td>
					原贷款总额：
				</td>
				<td>
					<input type="text" name="dkzws" id="" />&nbsp;万元
				</td>
			</tr>
			<tr>
				<td>
					原贷款期限：
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
					</select>
					
					<font color="gray" size="2">(公积金利率: <span id="gjlv"></span> 商业贷款利率 <span id="sdlv"></span>)</font>
					<input type="hidden" id="gjlv_value" />
					<input type="hidden" id="sdlv_value" />
				</td>
			</tr>
			<tr>
				<td>
					第一次还款时间：
				</td>
				<td>
					<!-- <input type="text" name="firstDate" readOnly onClick="setDay(this);">&nbsp; -->
					<select name="yhksjn">
	                	<option value=2002>2002</option>
	
	                    <option value=2003>2003</option>
	                    <option value=2004>2004</option>
	                    <option value=2005>2005</option>
	                    <option value=2006>2006</option>
	                    <option value=2007>2007</option>
	                    <option value=2008>2008</option>
	
	                    <option value=2009>2009</option>
	                    <option value=2010 selected="selected">2010</option>
	                    <option value=2011>2011</option>
	                    <option value=2012>2012</option>
	                    <option value=2013>2013</option>
	                    <option value=2014>2014</option>
	
	                    <option value=2015>2015</option>
	                    <option value=2016>2016</option>
	                    <option value=2017>2017</option>
	                    <option value=2018>2018</option>
	                    <option value=2019>2019</option>
	                    <option value=2020>2020</option>
	
	                    <option value=2021>2021</option>
	                    <option value=2022>2022</option>
	                    <option value=2023>2023</option>
	                    <option value=2024>2024</option>
	                    <option value=2025>2025</option>
	                    <option value=2026>2026</option>
	
	                    <option value=2027>2027</option>
	                    <option value=2028>2028</option>
	                    <option value=2029>2029</option>
	                    <option value=2030>2030</option>
	                    <option value=2031>2031</option>
	                    <option value=2032>2032</option>
	
	                    <option value=2033>2033</option>
	                    <option value=2034>2034</option>
	                </select> 年 
	                <select name="yhksjy">
	                    <option value=1>1</option>
	                    <option value=2>2</option>
	
	                    <option value=3>3</option>
	                    <option value=4>4</option>
	                    <option value=5>5</option>
	                    <option value=6>6</option>
	                    <option value=7>7</option>
	                    <option value=8>8  </option>
	
	                    <option value=9>9</option>
	                    <option value=10>10</option>
	                    <option value=11>11</option>
	                    <option value=12 selected="selected">12</option>
	                </select> 月
				</td>
			</tr>
			<tr>
				<td>
					预计提前还款时间：
				</td>
				<td>
					<select name="tqhksjn">
	                    <option value=2002>2002</option>
	
	                    <option value=2003>2003</option>
	                    <option value=2004>2004</option>
	                    <option value=2005>2005</option>
	                    <option value=2006>2006</option>
	                    <option value=2007>2007</option>
	                    <option value=2008>2008</option>
	
	                    <option value=2009>2009</option>
	                    <option value=2010 selected="selected">2010</option>
	                    <option value=2011>2011</option>
	                    <option value=2012>2012</option>
	                    <option value=2013>2013</option>
	                    <option value=2014>2014</option>
	
	                    <option value=2015>2015</option>
	                    <option value=2016>2016</option>
	                    <option value=2017>2017</option>
	                    <option value=2018>2018</option>
	                    <option value=2019>2019</option>
	                    <option value=2020>2020</option>
	
	                    <option value=2021>2021</option>
	                    <option value=2022>2022</option>
	                    <option value=2023>2023</option>
	                    <option value=2024>2024</option>
	                    <option value=2025>2025</option>
	                    <option value=2026>2026</option>
	
	                    <option value=2027>2027</option>
	                    <option value=2028>2028</option>
	                    <option value=2029>2029</option>
	                    <option value=2030>2030</option>
	                    <option value=2031>2031</option>
	                    <option value=2032>2032</option>
	
	                    <option value=2033>2033</option>
	                    <option value=2034>2034</option>
	                </select> 年 
	                <select name="tqhksjy">
	                    <option value=1>1</option>
	                    <option value=2>2</option>
	
	                    <option value=3>3</option>
	                    <option value=4>4</option>
	                    <option value=5>5</option>
	                    <option value=6>6</option>
	                    <option value=7>7</option>
	                    <option value=8>8  </option>
	
	                    <option value=9>9</option>
	                    <option value=10>10</option>
	                    <option value=11>11</option>
	                    <option value=12 selected="selected">12</option>
	                </select> 月
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<img src="images/cal_btn1.jpg" onclick="startCalculate();" style="cursor: pointer;"></img>
					<input type="image" src="images/cal_btn2.jpg" onclick="">
				</td>
			</tr>
		</table>
		<div id="resultPage" style="font-size: 14px;">
			<h3 style="color: #155383;font: ">计算结果：</h3>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:30px;font-size: 14px;">
				<tr>
					<td width="11%">
						原月还款额：
					</td>
					<td width="11%">
						<input size=10 name="ykhke" class="txt" disabled>&nbsp;元
					</td>
					<td width="11%">
						原最后还款期：
					</td>
					<td width="50%">
						<input size=10 name="yzhhkq" class="txt" disabled>
					</td>
				</tr>
				<tr>
					<td>
						已还款总额：
					</td>
					<td>
						<input size=10 name="yhkze" class="txt" disabled>&nbsp;元
					</td>
					<td>
						已还利息额：
					</td>
					<td>
						<input size=10 name="yhlxe" class="txt" disabled>&nbsp;元
					</td>
	
				</tr>
				<tr>
					<td>
						该月一次还款额：
					</td>
					<td>
						<input size=10 name="gyyihke" class="txt" disabled>&nbsp;元
					</td>
					<td>
						下月起月还款额：
					</td>
					<td>
						<input size=10 name="xyqyhke" class="txt" disabled>&nbsp;元
					</td>
				</tr>
				<tr>
					<td>
						节省利息支出：
					</td>
					<td>
						<input size=10 name="jslxzc" class="txt" disabled>&nbsp;元
					</td>
					<td>
						新的最后还款期：
					</td>
					<td>
						<input size=10 name="xdzhhkq" class="txt" disabled>
					</td>
				</tr>
				<tr>
					<td>
						计算结果提示：
					</td>
					<td colspan="3">
						<input size="38" name="jsjgts" class="txt" style="width:250px" disabled>
					</td>
				</tr>
			</table>
		</div>
     </form>
</body>
</html>