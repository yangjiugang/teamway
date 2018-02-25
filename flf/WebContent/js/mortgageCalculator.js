//定义利率
lilv_array = new Array;          
//10年10月20日利率下限(7折)
lilv_array[5] = new Array;
lilv_array[5][1] = new Array;
lilv_array[5][2] = new Array;
lilv_array[5][1][5] = 0.04172;//商贷 1～5年 4.172%
lilv_array[5][1][10] = 0.04298;//商贷 5-30年 4.298%
lilv_array[5][2][5] = 0.035;//公积金 1～5年 3.5%
lilv_array[5][2][10] = 0.0405;//公积金 5-30年 4.05%
//10年10月20日利率下限(85折)
lilv_array[6] = new Array;
lilv_array[6][1] = new Array;
lilv_array[6][2] = new Array;
lilv_array[6][1][5] = 0.05066;//商贷 1～5年 5.066%
lilv_array[6][1][10] = 0.05218;//商贷 5-30年 5.218%
lilv_array[6][2][5] = 0.035;//公积金 1～5年 3.5%
lilv_array[6][2][10] = 0.0405;//公积金 5-30年 4.05%
//10年10月20日基准利率
lilv_array[7] = new Array;
lilv_array[7][1] = new Array;
lilv_array[7][2] = new Array;
lilv_array[7][1][5] = 0.0596;//商贷 1～5年 5.96%
lilv_array[7][1][10] = 0.0614;//商贷 5-30年 6.14%
lilv_array[7][2][5] = 0.035;//公积金 1～5年 3.5%
lilv_array[7][2][10] = 0.0405;//公积金 5-30年 4.05%
//10年10月20日利率上限(1.1倍)
lilv_array[8] = new Array;
lilv_array[8][1] = new Array;
lilv_array[8][2] = new Array;
lilv_array[8][1][5] = 0.06556;//商贷 1～5年 6.556%
lilv_array[8][1][10] = 0.06754;//商贷 5-30年 6.754%
lilv_array[8][2][5] = 0.035;//公积金 1～5年 3.5%
lilv_array[8][2][10] = 0.0405;//公积金 5-30年 4.05%
//10年12月26日基准利率
lilv_array[9] = new Array;
lilv_array[9][1] = new Array;
lilv_array[9][2] = new Array;
lilv_array[9][1][5] = 0.0622;//商贷 1～5年 6.22%
lilv_array[9][1][10] = 0.0640;//商贷 5-30年 6.4%
lilv_array[9][2][5] = 0.0375;//公积金 1～5年 3.75%
lilv_array[9][2][10] = 0.0430;//公积金 5-30年 4.3%
//10年12月26日利率下限(7折)
lilv_array[10] = new Array;
lilv_array[10][1] = new Array;
lilv_array[10][2] = new Array;
lilv_array[10][1][5] = 0.04354;//商贷 1～5年 4.354%
lilv_array[10][1][10] = 0.0448;//商贷 5-30年 4.48%
lilv_array[10][2][5] = 0.0375;//公积金 1～5年 3.75%
lilv_array[10][2][10] = 0.0430;//公积金 5-30年 4.3%
//10年12月26日利率上限(1.1倍)
lilv_array[11] = new Array;
lilv_array[11][1] = new Array;
lilv_array[11][2] = new Array;
lilv_array[11][1][5] = 0.06842;//商贷 1～5年 6.842%
lilv_array[11][1][10] = 0.0704;//商贷 5-30年 7.04%
lilv_array[11][2][5] = 0.0375;//公积金 1～5年 3.75%
lilv_array[11][2][10] = 0.0430;//公积金 5-30年 4.3%
//11年2月9日基准利率
lilv_array[12] = new Array;
lilv_array[12][1] = new Array;
lilv_array[12][2] = new Array;
lilv_array[12][1][5] = 0.0645;//商贷 1～5年 6.45%
lilv_array[12][1][10] = 0.0660;//商贷 5-30年 6.6%
lilv_array[12][2][5] = 0.0400;//公积金 1～5年 4%
lilv_array[12][2][10] = 0.0450;//公积金 5-30年 4.5%
//11年2月9日利率下限(7折)
lilv_array[13] = new Array;
lilv_array[13][1] = new Array;
lilv_array[13][2] = new Array;
lilv_array[13][1][5] = 0.04515;//商贷 1～5年 4.515%
lilv_array[13][1][10] = 0.04620;//商贷 5-30年 4.62%
lilv_array[13][2][5] = 0.0400;//公积金 1～5年 4%
lilv_array[13][2][10] = 0.0450;//公积金 5-30年 4.5%
//11年2月9日利率下限(85折)
lilv_array[14] = new Array;
lilv_array[14][1] = new Array;
lilv_array[14][2] = new Array;
lilv_array[14][1][5] = 0.054825;//商贷 1～5年 5.4825%
lilv_array[14][1][10] = 0.0561;//商贷 5-30年 5.61%
lilv_array[14][2][5] = 0.0400;//公积金 1～5年 4%
lilv_array[14][2][10] = 0.0450;//公积金 5-30年 4.5%
//11年2月9日利率上限(1.1倍)
lilv_array[15] = new Array;
lilv_array[15][1] = new Array;
lilv_array[15][2] = new Array;
lilv_array[15][1][5] = 0.07095;//商贷 1～5年 7.095%
lilv_array[15][1][10] = 0.0726;//商贷 5-30年 7.26%
lilv_array[15][2][5] = 0.0400;//公积金 1～5年 4%
lilv_array[15][2][10] = 0.0450;//公积金 5-30年 4.5%
//11年4月5日基准利率
lilv_array[16] = new Array;
lilv_array[16][1] = new Array;
lilv_array[16][2] = new Array;
lilv_array[16][1][5] = 0.0665;//商贷 1～5年 6.65%
lilv_array[16][1][10] = 0.0680;//商贷 5-30年 6.8%
lilv_array[16][2][5] = 0.0420;//公积金 1～5年 4.2%
lilv_array[16][2][10] = 0.0470;//公积金 5-30年 4.7%
//11年4月5日利率下限（7折）
lilv_array[17] = new Array;
lilv_array[17][1] = new Array;
lilv_array[17][2] = new Array;
lilv_array[17][1][5] = 0.04655;//商贷 1～5年 4.655%
lilv_array[17][1][10] = 0.0476;//商贷 5-30年 4.76%
lilv_array[17][2][5] = 0.0420;//公积金 1～5年 4.2%
lilv_array[17][2][10] = 0.0470;//公积金 5-30年 4.7%
//11年4月5日利率下限（85折）
lilv_array[18] = new Array;
lilv_array[18][1] = new Array;
lilv_array[18][2] = new Array;
lilv_array[18][1][5] = 0.056525;//商贷 1～5年 5.6525%
lilv_array[18][1][10] = 0.0578;//商贷 5-30年 5.78%
lilv_array[18][2][5] = 0.0420;//公积金 1～5年 4.2%
lilv_array[18][2][10] = 0.0470;//公积金 5-30年 4.7%
//11年4月5日利率上限（1.1倍）
lilv_array[19] = new Array;
lilv_array[19][1] = new Array;
lilv_array[19][2] = new Array;
lilv_array[19][1][5] = 0.07315;//商贷 1～5年 7.315%
lilv_array[19][1][10] = 0.0748;//商贷 5-30年 7.48%
lilv_array[19][2][5] = 0.0420;//公积金 1～5年 4.2%
lilv_array[19][2][10] = 0.0470;//公积金 5-30年 4.7%
//11年7月6日基准利率
lilv_array[20] = new Array;
lilv_array[20][1] = new Array;
lilv_array[20][2] = new Array;
lilv_array[20][1][5] = 0.0690;//商贷 1～5年 6.9%
lilv_array[20][1][10] = 0.0705;//商贷 5-30年 7.05%
lilv_array[20][2][5] = 0.0445;//公积金 1～5年 4.45%
lilv_array[20][2][10] = 0.0490;//公积金 5-30年 4.9%
//11年7月6日利率下限（7折）
lilv_array[21] = new Array;
lilv_array[21][1] = new Array;
lilv_array[21][2] = new Array;
lilv_array[21][1][5] = 0.0483;//商贷 1～5年 4.83%
lilv_array[21][1][10] = 0.04935;//商贷 5-30年 4.935%
lilv_array[21][2][5] = 0.0445;//公积金 1～5年 4.45%
lilv_array[21][2][10] = 0.0490;//公积金 5-30年 4.9%
//11年7月6日利率下限（85折）
lilv_array[22] = new Array;
lilv_array[22][1] = new Array;
lilv_array[22][2] = new Array;
lilv_array[22][1][5] = 0.05865;//商贷 1～5年 5.865%
lilv_array[22][1][10] = 0.059925;//商贷 5-30年 5.9925%
lilv_array[22][2][5] = 0.0445;//公积金 1～5年 4.45%
lilv_array[22][2][10] = 0.0490;//公积金 5-30年 4.9%
//11年7月6日利率上限（1.1倍）
lilv_array[23] = new Array;
lilv_array[23][1] = new Array;
lilv_array[23][2] = new Array;
lilv_array[23][1][5] = 0.0759;//商贷 1～5年 7.59%
lilv_array[23][1][10] = 0.07755;//商贷 5-30年 7.755%
lilv_array[23][2][5] = 0.0445;//公积金 1～5年 4.45%
lilv_array[23][2][10] = 0.0490;//公积金 5-30年 4.9%

function myround(v, e){
    var t = 1;
    e = Math.round(e);
    for(; e > 0; t *= 10, e--);
    for(; e < 0; t /= 10, e++);
    return Math.round(v * t) / t;
}
// 在页面上显示利率
function showLilv(month, lt){
	var year = (month > 5) ? 10 : 5;
	$("#sdlv").empty();$("#gjlv").empty();
	$("#sdlv").append(myround(lilv_array[lt][1][year] * 100, 2) + "%");
	$("#gjlv").append(myround(lilv_array[lt][2][year] * 100, 2) + "%");
	$("#gjlv_value").val(myround(lilv_array[lt][2][year] * 100, 4));
	$("#sdlv_value").val(myround(lilv_array[lt][1][year] * 100, 4));
}
// 计算贷款
function calcloan(fmobj){
	var hkMethod = $("#hkfs").val(); 	 	  //还款方式
	var loanType = $("#loanType").val();      //贷款类型
	var calcMethod = $("#calcmethod").val();  //计算方式
	var houseTotal = $("#housetotal").val();  //房屋总价
	var anJie = $("#anjie").val();			  //按揭成数
	var ajns = $("#ajns").val();			  //按揭年数
	var loanTotal = $("#loantotal").val();	  //贷款总额
	var gjlv = $("#gjlv_value").val();		  //公积金利率
	var sdlv = $("#sdlv_value").val();		  //商业贷款利率
	var comb_sy = $("#comb_sy").val();		  //组合商业贷款
	var comb_gj = $("#comb_gj").val();		  //组合公积金贷款
	
	if(calcMethod == 'cs'){
		if(houseTotal == '' && loanType != 3){
			alert('房屋总价不能为空');return;
		}
	}else if(calcMethod == 'ze' && loanType != 3){
		if(loanTotal == ''){
			alert('贷款总额不能为空');return;
		}
	}
	if(loanType == 3){
		if(comb_sy == ''){
			alert('商业性贷款不能为空');return;
		}else if(comb_gj == ''){
			alert('公积金贷款不能为空');return;
		}
	}
	
	// 分别是贷款本金, 利率, 还款月数
	var loanMoney= 0, rate = 0, month = 0;
	// 等额本息计算
	if(hkMethod == 'debx'){
		month = ajns * 12;
		if(loanType == '3'){// 计算组合的
			var combTotle = comb_gj * 10000 + comb_sy * 10000;
			var monthMoney = getMonthMoney(gjlv * 0.01, comb_gj*10000, month) + getMonthMoney(sdlv * 0.01, comb_sy*10000, month);
			
			$("#fwzj_value").val('略');
			$("#sqfk_value").val(0);
			$("#dkze_value").val(combTotle);
			$("#hkze_value").val(Math.round(monthMoney * month * 100) / 100);
			$("#zflx_value").val((Math.round((monthMoney * month - combTotle) * 100) / 100));
			$("#dkys_value").val(month);
			$("#monthMoney").val((Math.round(monthMoney * 100) / 100));
		}else{ // 贷款类型非组合的
			if(loanType == '1'){
				rate = sdlv * 0.01;
			}else if(loanType == '2'){
				rate = gjlv * 0.01;
			}
			if(calcMethod == 'ze'){
				loanMoney = loanTotal * 10000;
			}else if(calcMethod == 'cs'){
				loanMoney = anJie * 0.1 * houseTotal * 10000;
			}
			var total = getMonthMoney(rate,loanMoney,month);
			
			$("#monthMoney").val((Math.round(total * 100) / 100));
			$("#dkys_value").val(month);
			$("#dkze_value").val(loanMoney);
			$("#hkze_value").val(Math.round(total * month * 100) / 100);
			$("#zflx_value").val((Math.round((total * month - loanMoney) * 100) / 100));
			if(calcMethod == 'ze'){
				$("#fwzj_value").val('略');
				$("#sqfk_value").val(0);
			}else if(calcMethod == 'cs'){
				$("#fwzj_value").val(houseTotal * 10000);
				$("#sqfk_value").val((houseTotal * 10000) - (houseTotal * 10000 * anJie * 0.1));
			}
		}
	}else{// 等额本金计算
		month = ajns * 12;
		if(loanType == '3'){// 计算组合的
			var combTotle = comb_gj * 10000 + comb_sy * 10000;
			var total = 0, month_money_show = '';
			for(var i = 0; i < month; i++){
				var hk_gjj = getMonthMoney2(gjlv * 0.01, comb_gj * 10000, month, i);
				var hk_sy = getMonthMoney2(sdlv * 0.01, comb_sy * 10000, month, i);
				total += (hk_gjj + hk_sy);
				hk_gjj = Math.round((hk_gjj + hk_sy) * 100) / 100;
				month_money_show += (i + 1) + "y," + hk_gjj + "(y)\n";
			}
			$("#fwzj_value").val('略');
			$("#sqfk_value").val(0);
			$("#dkze_value").val(combTotle);
			$("#hkze_value").val(Math.round(total * 100) / 100);
			$("#zflx_value").val((Math.round((total - combTotle) * 100) / 100));
			$("#dkys_value").val(month);
			$("#monthMoney").val(month_money_show);
		}else{ // 贷款类型非组合的
			if(loanType == '1'){
				rate = sdlv * 0.01;
			}else if(loanType == '2'){
				rate = gjlv * 0.01;
			}
			if(calcMethod == 'ze'){
				loanMoney = loanTotal * 10000;
			}else if(calcMethod == 'cs'){
				loanMoney = anJie * 0.1 * houseTotal * 10000;
			}
			var total = 0, month_money_show = '';
			for(var i = 0; i < month; i++){
				var hk = getMonthMoney2(rate, loanMoney, month, i);
				total += hk;
				hk = Math.round(hk * 100) / 100;
				month_money_show += (i + 1) + "y," + hk + "(y)\n";
			}
			$("#monthMoney").val(month_money_show);
			$("#dkys_value").val(month);
			$("#dkze_value").val(loanMoney);
			$("#hkze_value").val(Math.round(total * 100) / 100);
			$("#zflx_value").val((Math.round((total - loanMoney) * 100) / 100));
			if(calcMethod == 'ze'){
				$("#fwzj_value").val('略');
				$("#sqfk_value").val(0);
			}else if(calcMethod == 'cs'){
				$("#fwzj_value").val(houseTotal * 10000);
				$("#sqfk_value").val((houseTotal * 10000) - (houseTotal * 10000 * anJie * 0.1));
			}
		}
	}
}

//本息还款的月还款额(参数: 年利率/贷款总额/贷款总月份)
function getMonthMoney(lilv, total, month){
	var lilv_month = lilv / 12; //月利率
	return total * lilv_month * Math.pow(1 + lilv_month, month) / ( Math.pow(1 + lilv_month, month) -1 );
}
//本金还款的月还款额(参数: 年利率 / 贷款总额 / 贷款总月份 / 贷款当前月0～length-1)
function getMonthMoney2(lilv, total, month, cur_month){
	var lilv_month = lilv / 12;//月利率
	var benjin_money = total / month;
	return (total - benjin_money * cur_month) * lilv_month + benjin_money;
}


//得到利率
function getlilv(lilv_class, type, years){
	var lilv_class = parseInt(lilv_class);
    if (years <= 5){
		 return lilv_array[lilv_class][type][5];
	}else{
		return lilv_array[lilv_class][type][10];
	}
}

function creditCal(){
	
}

//提前还歀计算
function play(dklx){
	if (document.tqhdjsq.dkzws.value == ''){
		alert('请填入贷款总额');
		return false;
	}else dkzys = parseFloat(document.tqhdjsq.dkzws.value) * 10000;
	if(document.tqhdjsq.tqhkfs[1].checked && document.tqhdjsq.tqhkws.value == ''){
		alert('请填入部分提前还款额度');
		return false;
	}
	s_yhkqs=parseInt(document.tqhdjsq.yhkqs.value);

	//月利率
	if(dklx == 2){
		if (s_yhkqs > 60){
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 2, 10)/12; //公积金贷款利率5年以上4.23%
		}else{
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 2, 3)/12;  //公积金贷款利率5年(含)以下3.78%
		}
	}
	if(dklx == 1){
		if(s_yhkqs > 60){
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 1, 10)/12; //商业性贷款利率5年以上5.31%
		}else{
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 1, 3)/12; //商业性贷款利率5年(含)以下4.95%
		}
	}

	//已还贷款期数
	yhdkqs = (parseInt(document.tqhdjsq.tqhksjn.value) * 12 + parseInt(document.tqhdjsq.tqhksjy.value)) - (parseInt(document.tqhdjsq.yhksjn.value) * 12 + parseInt(document.tqhdjsq.yhksjy.value));

	if(yhdkqs < 0 || yhdkqs > s_yhkqs){
		alert('预计提前还款时间与第一次还款时间有矛盾，请查实');
		return false;
	}

	yhk = dkzys * (dklv * Math.pow((1 + dklv), s_yhkqs)) / (Math.pow((1 + dklv), s_yhkqs) - 1);
	yhkjssj = Math.floor((parseInt(document.tqhdjsq.yhksjn.value) * 12 + parseInt(document.tqhdjsq.yhksjy.value) + s_yhkqs - 2) / 12) + '年' + ((parseInt(document.tqhdjsq.yhksjn.value) * 12 + parseInt(document.tqhdjsq.yhksjy.value) + s_yhkqs - 2) % 12 + 1) + '月';
	yhdkys = yhk * yhdkqs;

	yhlxs = 0;
	yhbjs = 0;
	for(var i = 1; i <= yhdkqs; i++){
		yhlxs = yhlxs + (dkzys - yhbjs) * dklv;
		yhbjs = yhbjs + yhk - (dkzys - yhbjs) * dklv;
	}

	remark = '';
	if(document.tqhdjsq.tqhkfs[1].checked){
		tqhkys = parseInt(document.tqhdjsq.tqhkws.value) * 10000;
		if(tqhkys + yhk >= (dkzys - yhbjs) * (1 + dklv)){
			remark = '您的提前还款额已足够还清所欠贷款！';
			return false;
		}else{
			yhbjs = yhbjs + yhk;
            byhk = yhk + tqhkys;
			if(document.tqhdjsq.clfs[0].checked){
				yhbjs_temp = yhbjs + tqhkys;
				for(var xdkqs = 0; yhbjs_temp <= dkzys; xdkqs++) yhbjs_temp = yhbjs_temp + yhk - (dkzys - yhbjs_temp) * dklv;
				xdkqs = xdkqs - 1;
				xyhk = (dkzys - yhbjs - tqhkys) * (dklv * Math.pow((1 + dklv), xdkqs)) / (Math.pow((1 + dklv), xdkqs) - 1);
				jslx = yhk * s_yhkqs - yhdkys - byhk - xyhk * xdkqs;
				xdkjssj = Math.floor((parseInt(document.tqhdjsq.tqhksjn.value) * 12 + parseInt(document.tqhdjsq.tqhksjy.value) + xdkqs - 2) / 12) + '年' + ((parseInt(document.tqhdjsq.tqhksjn.value) * 12 + parseInt(document.tqhdjsq.tqhksjy.value) + xdkqs - 2) % 12 + 1) + '月'; 
			}else{
				xyhk = (dkzys - yhbjs - tqhkys) * (dklv * Math.pow((1 + dklv), (s_yhkqs - yhdkqs))) / (Math.pow((1 + dklv), (s_yhkqs - yhdkqs)) - 1);
				jslx = yhk * s_yhkqs - yhdkys - byhk - xyhk * (s_yhkqs - yhdkqs);
				xdkjssj = yhkjssj;
			}
		}
	}

	if(document.tqhdjsq.tqhkfs[0].checked || remark != ''){
		byhk = (dkzys - yhbjs) * (1 + dklv);
		xyhk = 0;
		jslx = yhk * s_yhkqs - yhdkys - byhk;
		xdkjssj = document.tqhdjsq.tqhksjn.value + '年' + document.tqhdjsq.tqhksjy.value + '月';
	}

	document.tqhdjsq.ykhke.value = Math.round(yhk * 100) / 100;
	document.tqhdjsq.yhkze.value = Math.round(yhdkys * 100) / 100;
	document.tqhdjsq.yhlxe.value = Math.round(yhlxs * 100) / 100;
	document.tqhdjsq.gyyihke.value = Math.round(byhk * 100) / 100;
	document.tqhdjsq.xyqyhke.value = Math.round(xyhk * 100) / 100;
	document.tqhdjsq.jslxzc.value = Math.round(jslx * 100) / 100;
	document.tqhdjsq.yzhhkq.value = yhkjssj;
	document.tqhdjsq.xdzhhkq.value = xdkjssj;
	document.tqhdjsq.jsjgts.value = remark;
	return true;
}




//个人公积金
var l1_5 = lilv_array[23][2][5];
var l6_30 = lilv_array[23][2][10];

// 公积金贷款
function highestAmount(providentFund,proportion,spouseProvidentFund,spouseProportion,price,years,housesNature,creditRating)
{

  var gryjce = providentFund;         //住房公积金个人月缴存额
  var poyjce = spouseProvidentFund;   //配偶住房公积金个人月缴存额
  var grjcbl = proportion/100;        //缴存比例
  var pojcbl = spouseProportion/100;  //配偶缴存比例
  var xy;                             //个人信用
  var fwzj = price;                   //房屋总价
  var fwxz;                           //房屋性质
  var dknx = years;                   //贷款申请年限

  //中间变量
  var jtysr; //家庭月收入
  var r;//月还款
  var gjjdka;//住房公积金贷款额度a
  var gjjdkb;//住房公积金贷款额度b
  var gjjdkc;//住房公积金贷款额度c
 
 // 房屋性质
 if (housesNature == 1){
	 fwxz = 0.9;
 }
 else {
	 fwxz = 0.8;
 }
 
 // 个人信用
 if (creditRating == 2){
	 xy = 1.15;
 }
 else if(creditRating == 1){
	 xy = 1.3;
 }
 else {
	 xy = 1;
 }
 
 var bcv = 0;
 if (dknx > 5){
	 bcv = Math.round( 1000000 * l6_30/12 ) / 1000000;
 }else{
	 bcv = Math.round( 1000000 * l1_5/12 ) / 1000000;
 }
 r = adv_format((10000*bcv*Math.pow(1+bcv,12*dknx))/(Math.pow(1+bcv,12*dknx)-1),2);

 if(poyjce.length > 0 && pojcbl != 0){
	 jtysr=Math.ceil((gryjce/grjcbl+poyjce/pojcbl)*10)/10;
 }
 else{
	 jtysr=Math.ceil((gryjce/grjcbl)*10)/10;
 }

 gjjdka = Math.min(Math.round((jtysr-400)/r*10000*10)/10,600000);
 gjjdkb = Math.round(gjjdka*xy*10)/10;
 gjjdkc = Math.round(fwzj*fwxz*10)/10;
 zgdk = Math.floor(Math.min(gjjdkb,gjjdkc)/10000*10)/10;  //最高贷款额度
 return zgdk;
}

// 等额本息
function dengebenxi(providentFund,proportion,spouseProvidentFund,spouseProportion,years,creditAmount,repayment){
	
	var gryjce = providentFund;         // 住房公积金个人月缴存额
	var poyjce = spouseProvidentFund;   // 配偶住房公积金个人月缴存额
	var grjcbl = proportion/100;        // 缴存比例
	var pojcbl = spouseProportion/100;  // 配偶缴存比例
	var dked = creditAmount;            // 贷款额度
	var hkfs = new Array();
	hkfs = repayment.split(",");                   // 还款方式
	var bxhj;                           //本息合计
	var dknx = years;                   //贷款申请年限
	// 临时变量
	var gbl;
	// 月还款
	var r;
	var rb;
	var syhk; //首月还款额
	  
	// 家庭月收入
	if(poyjce.length > 0 && pojcbl != 0){
		jtysr = Math.ceil((gryjce/grjcbl+poyjce/pojcbl)*10)/10;
	}
	else{
		jtysr = Math.ceil((gryjce/grjcbl)*10)/10;
	}
	
	var bcv = 0;
	if (dknx > 5)
	{
		bcv = Math.round( 1000000 * l6_30/12 ) / 1000000;
	}else{
		bcv = Math.round( 1000000 * l1_5/12 ) / 1000000;
	}
	r = adv_format((10000*bcv*Math.pow(1+bcv,12*dknx))/(Math.pow(1+bcv,12*dknx)-1),2);
	
	var ylv_new ;
	if(dknx >= 1 && dknx <= 5){
		ylv_new = l1_5/12;
	}
	else{
		ylv_new = l6_30/12;
	}
	
	
	for(var i = 0; i < hkfs.length; i++){
		if(hkfs[i] == 1){ // 等额本息
			var ncm  = parseFloat(ylv_new) + 1;//n次幂
			var dknx_new = dknx * 12;
			total_ncm = Math.pow(ncm, dknx_new);
			ze22 = Math.round(((dked*10000*ylv_new*total_ncm)/(total_ncm-1))*100)/100;
			var pp = Math.round(((dked*10000*ylv_new*total_ncm)/(total_ncm-1))*100)/100;
		
			//=========================================================
			gbl = Math.round(Math.ceil(dked*r*100)/100/jtysr*1000)/10;
			//obj.yj2.value=gbl;
			bxhj = Math.round(pp*dknx*12*100)/100;
			document.forms[0].dengebenxi.value = bxhj;
		}
		if(hkfs[i] == 2){ // 等额本金
			if (dknx>5){
				rb = l6_30 * 100;
			}else{
				rb = l1_5*100;
			}

			syhk = Math.round((dked*10000/(dknx*12)+dked*10000*rb/(100*12))*100)/100;
			//obj.sfk2.value=syhk;
			var yhke; //月还款额
			var bxhj; //本息合计
			var dkys; //贷款月数
			var sydkze;//当前剩余贷款总额
			var yhkbj; //月还款本金
			dkys=dknx*12;
			yhkbj=dked*10000/dkys;

			yhke=syhk;
			sydkze=dked*10000-yhkbj;
			bxhj=syhk;
			for (var count=2;count<=dkys; ++count){
				yhke=dked*10000/dkys+sydkze*rb/1200;
				sydkze-=yhkbj;
				bxhj+=yhke;
			}
			document.forms[0].dengebenjin.value = Math.round(bxhj*100)/100;
			document.forms[0].shouyhk.value = syhk;
		}
		
		if(hkfs[i] == 3){   // 自由还款
			switch(parseInt(dknx)){//自由还款还款方式月最低还款额参照表,调整利率不修改
				case 1 :  rb = 83.04/100; break;
				case 2 :  rb = 81.08/100; break;
				case 3 :  rb = 79.12/100; break;
				case 4 :  rb = 77.16/100; break;
				case 5 :  rb = 75.20/100; break;
				case 6 :  rb = 73.24/100; break;
				case 7 :  rb = 71.28/100; break;
				case 8 :  rb = 69.32/100; break;
				case 9 :  rb = 67.36/100; break;
				case 10 :  rb = 65.40/100; break;
				case 11 :  rb = 63.44/100; break;
				case 12 :  rb = 61.48/100; break;
				case 13 :  rb = 59.52/100; break;
				case 14 :  rb = 57.56/100; break;
				case 15 :  rb = 55.60/100; break;
				case 16 :  rb = 53.64/100; break;
				case 17 :  rb = 51.68/100; break;
				case 18 :  rb = 49.72/100; break;
				case 19 :  rb = 47.76/100; break;
				case 20 :  rb = 45.80/100; break;
				case 21 :  rb = 43.84/100; break;
				case 22 :  rb = 41.88/100; break;
				case 23 :  rb = 39.92/100; break;
				case 24 :  rb = 37.96/100; break;
				case 25 :  rb = 36.00/100; break;
				case 26 :  rb = 34.04/100; break;
				case 27 :  rb = 32.08/100; break;
				case 28 :  rb = 30.12/100; break;
				case 29 :  rb = 28.16/100; break;
				case 30 :  rb = 26.20/100; break;
				default :  break;
			}
			var yhke; //月还款额
			var ll;//利率
			var zhbj;//最后一期本金
			zhbj = Math.round(dked*10000*rb*100)/100;
			if (dknx <= 5){
				ll=l1_5/12;
				zdhkll=0.0378/12;
				var total_gjj = Math.pow(zdhkll + 1, dknx*12);
				syhk=Math.ceil(dked*10000*zdhkll*total_gjj/(total_gjj-1));
			}
			else{
				ll=l6_30/12;
				zdhkll=0.0423/12;
				var total_gjj = Math.pow(zdhkll + 1, dknx*12-1);
				syhk=Math.ceil((dked*10000-zhbj)*zdhkll*total_gjj/(total_gjj-1)+zhbj*zdhkll);
			}
			document.forms[0].lowestRep.value = syhk;       //最低还款额
			var zhyqbj=dked*10000;
			var zchlx=0;//总偿还利息
			for (i=1;i<dknx*12 ;i++ ){
				zchlx+=Math.round(zhyqbj*ll*100)/100;
				zhyqbj=Math.round((zhyqbj-(syhk-Math.round(zhyqbj*ll*100)/100))*100)/100;
			}
			var sydkze = dked*10000-syhk;
			document.forms[0].lastPri.value = zhyqbj;    //最后期本金
			zchlx+=Math.round(zhyqbj*ll*100)/100;
			// 总偿还利息
			var zchlxb = adv_format(zchlx,2);
			document.forms[0].free.value = zchlxb;
			document.forms[0].interest.value = Math.round(zhyqbj*ll*100)/100;
		}
	}
}

//四舍五入
function adv_format(value,num){
	var a_str = formatnumber(value,num);
	var a_int = parseFloat(a_str);
	if (value.toString().length>a_str.length){
		var b_str = value.toString().substring(a_str.length,a_str.length+1);
		var b_int = parseFloat(b_str);
		if (b_int<5){
			return a_str;
		}
		else{
		    var bonus_str,bonus_int;
		    if (num==0){
		        bonus_int = 1;
		    }
	    	else{
		        bonus_str = "0.";
		        for (var i=1; i<num; i++)
		            bonus_str+="0";
		        bonus_str+="1";
		        bonus_int = parseFloat(bonus_str);
		    }
	    	a_str = formatnumber(a_int + bonus_int, num);
	    }
	}
    return a_str;
}


//直接去尾
function formatnumber(value,num){
	var a,b,c,i;
	a = value.toString();
	b = a.indexOf('.');
	c = a.length;
	if (num==0){
		if (b!=-1){
			a = a.substring(0,b);
		}
	}
	else{
	    if (b==-1){
	        a = a + ".";
	        for (i=1;i<=num;i++)
	            a = a + "0";
	    }
	    else{
	        a = a.substring(0,b+num+1);
	        for (i=c;i<=b+num;i++)
	            a = a + "0";
	    }
	}
	return a;
}

// 贷款计算器
function creditPlay(gjdkze,gjdj,gjmj,anjcs,calculation,hkfs,anjcs,dklv,years){
	var gjdkze = gjdkze;
	
	var hkfs = hkfs;
	var gjdj = gjdj;
	var gjmj = gjmj;
	var anjcs = anjcs;
	var calculation = calculation;
	var dklv = dklv;
	var anjcs = anjcs/10;
	var lilv = dklv/100/12;
	
	var yhke;
	//月利率
	if(hkfs == 1){   // 等额本息
		var ylilv = Math.pow((1+lilv),years);
		//贷款本金*月利率(4.05%)*（1+月利率）/[(1+月利率)^240 -1]
		if(calculation == 1){ // 根据面积、单价计算
			var dkbj = gjdj * gjmj * anjcs;
			yhke = dkbj * lilv * ylilv / (ylilv - 1);
			$("input[name='yjhke']").val(adv_format(yhke,2));
			$("input[name='fkze']").val(gjdj * gjmj);
			$("input[name='dkze']").val(dkbj);
			$("input[name='hkze']").val(adv_format(yhke*years,2));
			$("input[name='yhlxe']").val(adv_format(yhke*years,2)-dkbj);
			$("input[name='sqfke']").val(gjdj * gjmj - dkbj);
			$("input[name='dkyues']").val(years);
		}else{  //根据贷款总额计算
			yhke = (gjdkze*10000) * lilv * ylilv / (ylilv-1);
			$("input[name='yjhke']").val(adv_format(yhke,2));
			$("input[name='fkze']").val("略");
			$("input[name='yhlxe']").val(adv_format(yhke*years-gjdkze*10000,2));
			$("input[name='dkze']").val(gjdkze*10000);
			$("input[name='hkze']").val(adv_format(yhke*years,2));
			//$("input[name='sqfke']").val(gjdkze - dkbj);
			$("input[name='dkyues']").val(years);
			$("input[name='sqfke']").val(0);
		}
		
	}else{   // 等额本金
		// (贷款总额-贷款总额/贷款总月份*贷款当前月0-length-1) * 月利率 + 贷款总额/贷款总月份
		if(calculation == 1){ // 根据面积、单价计算
			var cur_month = 0;
			var dkze = gjdj * gjmj * anjcs;
			var hkze=0;
			$("#month_money").empty();
			while(parseInt(cur_month) < parseInt(years)){
				var yuejune = [dkze - (dkze / years * cur_month)] * lilv + dkze/years;
				var html = "<option value='" + cur_month + "'>" + [parseInt(cur_month) + 1] + "月，" 
							+ adv_format(yuejune,2) + "（元）" + "</option>";
				$(html).appendTo("#month_money");
				hkze += yuejune;
				cur_month++;
			}
			$("input[name='dkze']").val(dkze);
			$("input[name='fkze']").val(gjdj * gjmj);
			$("input[name='hkze']").val(adv_format(hkze,2));
			$("input[name='yhlxe']").val(adv_format(hkze-dkze,2));
			$("input[name='sqfke']").val(gjdj * gjmj - dkze);
			$("input[name='dkyues']").val(years);
			
		}else{  //根据贷款总额计算
			var cur_month = 0;
			var dkze = (gjdkze*10000);
			var hkze=0;
			$("#month_money").empty();
			while(parseInt(cur_month) < parseInt(years)){
				var yuejune = [dkze - (dkze / years * cur_month)] * lilv + dkze / years;
				var html = "<option value='" + cur_month + "'>" + [parseInt(cur_month) + 1] + "月，" 
				+ adv_format(yuejune,2) + "（元）" + "</option>";
				$(html).appendTo("#month_money");
				hkze += yuejune;
				cur_month++;
			}
			$("input[name='dkze']").val(dkze);
			$("input[name='fkze']").val("略");
			$("input[name='hkze']").val(adv_format(hkze,2));
			$("input[name='yhlxe']").val(adv_format(hkze-dkze,2));
			$("input[name='sqfke']").val(0);
			$("input[name='dkyues']").val(years);
		}
		
	}
}

//购房能力评估
function chk01(){
	if (parseFloat(document.gfnlpg.rg01.value)<4.7)
		alert("--您确定是"+parseFloat(document.gfnlpg.rg01.value)+"万元?--"+"\n\n"+"那么您目前尚不具备购房能力，"+"\n\n"+"建议积攒积蓄或能筹集更多的资金。");
	if (parseFloat(document.gfnlpg.rg01.value)>10000)
		alert("您确定拥有超过一亿元的购房资金？");
}

function chk02(){
	if (parseFloat(document.gfnlpg.rg03.value)>parseFloat(document.gfnlpg.rg02.value)*0.7){
		alert("您预计家庭每月可用于购房支出已超过家庭月收入的70%，"+"\n\n"+"是否确定不会影响您的正常生活消费？"+"\n\n"+"建议在40%（"+parseFloat(document.gfnlpg.rg02.value)*0.4+"元）左右");
	}
}

function chk03(){
	if (document.gfnlpg.rg01.value==""){
		alert("请填写现可用于购房的资金");
	}else{
		if (document.gfnlpg.rg02.value==""){
			alert("请填写现家庭月收入");
		}else{	
			if (document.gfnlpg.rg03.value==""){
				alert("请填写预计家庭每月可用于购房支出");
			}else{
				if (document.gfnlpg.rg06.value==""){
					alert("请填写您计划购买房屋的面积");
				}
				else{
					chk04();
				}
			}
		}
	}
}

rhb=new Array(440.104,301.103,231.7,190.136,163.753,144.08,129.379,117.991,108.923,101.542,95.425,90.282,85.902,82.133,78.861,75.997,73.473,71.236,69.241,67.455,65.848,64.397,63.082,61.887,60.798,59.802,58.890,58.052,57.282);
yhz=new Array(1.978,2.9344,3.8699,4.7847,5.6794,6.5544,7.4102,8.2472,9.0657,9.8662,10.6491,11.4148,12.1636,12.8959,13.6121,14.3126,14.9977,15.6677,16.3229,16.9637,17.5904,18.2034,18.8028,19.389,19.9624,20.5231,21.0715,21.6078,22.1323);
function chk04(){
    js00 = parseFloat(document.gfnlpg.rg01.value) * 10000;
    js01 = parseFloat(document.gfnlpg.rg03.value);
    js02 = Math.round(js01 / rhb[parseInt(document.gfnlpg.rg04.options[document.gfnlpg.rg04.selectedIndex].value) / 12 - 2]) * 10000;
    js03 = parseFloat(document.gfnlpg.rg06.value);
    if (js02 > js00 * 3.2){
        js02 = js00 * 3.2;
    }
    document.gfnlpg.rg07.value = Math.round((js02 + 0.8 * js00) * 100) / 100;
    document.gfnlpg.rg08.value = Math.round(parseFloat(document.gfnlpg.rg07.value) / js03 * 100) / 100;
    if (js03 < 120){
        document.gfnlpg.rg10.value = Math.round(parseFloat(document.gfnlpg.rg07.value) * 2) / 100;
    }
    else{ 
        document.gfnlpg.rg10.value = Math.round((parseFloat(document.gfnlpg.rg07.value) - parseFloat(document.gfnlpg.rg08.value) * 120) * 4 + parseFloat(document.gfnlpg.rg08.value) * 120 * 2) / 100;
    }
    document.gfnlpg.rg11.value = Math.round(parseFloat(document.gfnlpg.rg07.value) * 2) / 100;
    document.gfnlpg.rg12.value = Math.round(parseFloat(document.gfnlpg.rg07.value) * 20) / 100;
    document.gfnlpg.rg13.value = Math.round(Math.round(parseFloat(document.gfnlpg.rg07.value) * 0.05) / 100 * yhz[parseInt(document.gfnlpg.rg04.options[document.gfnlpg.rg04.selectedIndex].value) / 12 - 2] * 100) / 100;
    document.gfnlpg.rg14.value = Math.round(parseFloat(document.gfnlpg.rg07.value) * 0.3) / 100;
    document.gfnlpg.rg15.value = "200~500";
}


//=========================================================================

$(document).ready(
	function() {
		var $parentItem = $(this).parent(), slideAmt = $(this)
				.next().width(), direction;

		if (parseInt($parentItem.css('marginLeft'), 10) < 0) {
			direction = '+=';
			$(this).removeClass('expanded');
		} else {
			$(this).addClass('expanded');
			direction = '-=';
		}
		$parentItem.animate({
			marginLeft : direction + slideAmt
		}, 400);
		return false;
	}
);
