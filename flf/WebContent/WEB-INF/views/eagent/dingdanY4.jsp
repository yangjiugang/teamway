<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购房类订单 - 订单</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />

<!--<link rel="stylesheet" href="css/index.css" type="text/css" />-->
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".Out").each(function(){
		var obj = $(this);
		obj.find(".updown").toggle(function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content").slideUp('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content").slideDown('slow');
		});
	});
	var index = '${index}';
	if(index == '' || index > 4 || index < 1)
		index = 1;
	settab_zzjs('zzjs',index,4);
	
	var curPage = ${curPage};
	var pageCount = ${pageCount};
	
	$("#page1").pager({curPage:curPage, pageSize:10, pageCount:'${myBuyHousePageCount}', goPageCall:goPage1});
	$("#page2").pager({curPage:curPage, pageSize:10, pageCount:'${viewHouseOrderPageCount}', goPageCall:goPage2});
	$("#page3").pager({curPage:curPage, pageSize:10, pageCount:'${myGroupHousePageCount}', goPageCall:goPage3});
	$("#page4").pager({curPage:curPage, pageSize:10, pageCount:'${myActivityHousePageCount}', goPageCall:goPage4});
	$("#page5").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage1});

	var houseOrders = ${houseOrders};
	var viewHouseOrders = ${viewHouseOrders};
	var myGroupHouses = ${myGroupHouses};
	var myActivityHouse = ${myActivityHouse}
	generate(houseOrders);
	generateViweOrder(viewHouseOrders);
	generateGroup(myGroupHouses);
	generateActive(myActivityHouse);
});

function generate(houseOrders){
	$("#tab1").empty();
	for(var i=0;i<houseOrders.length;i++){
		var html = '<div class="Y4DDLBLB">'+
				'<div class="Y4DDLBLB1">'+houseOrders[i].orderNum+'</div>'+
				'<div class="Y4DDLBLB2">'+houseOrders[i].customerName+'</div>'+
				'<div class="Y4DDLBLB3">个人购房</div>'+
				'<div class="Y4DDLBLB4">'+houseOrders[i].orderName+'</div>'+
				'<div class="Y4DDLBLB5">'+houseOrders[i].orderDate+'</div>'+
				'<div class="Y4DDLBLB6">'+houseOrders[i].orderMoney+'</div>'+
				'<div class="Y4DDLBLB7">'+houseOrders[i].orderStatus+'</div>'+
				'</div>';
			$("#tab1").append(html);
	    }
}
function generateViweOrder(viewHouseOrders){
	$("#tab2").empty();
	for(var i=0;i<viewHouseOrders.length;i++){
		var  html = '<div class="Y4DDLBLB">'+
			'<div class="Y4DDLBLB1">'+viewHouseOrders[i].eventNum+'</div>'+
			'<div class="Y4DDLBLB2">'+viewHouseOrders[i].customerName+'</div>'+
			'<div class="Y4DDLBLB3">看房</div>'+
			'<div class="Y4DDLBLB4">'+viewHouseOrders[i].eventTitle+'</div>'+
			'<div class="Y4DDLBLB5">'+viewHouseOrders[i].eventStartTime+'-'+viewHouseOrders[i].eventEndTime+'</div>'+
			'<div class="Y4DDLBLB6">'+viewHouseOrders[i].orderMoney+'</div>'+
			'<div class="Y4DDLBLB7">状态</div>'+
			'</div>';
		$("#tab2").append(html);
	}
}
function generateGroup(myGroupHouses){
	$("#tab3").empty();
	for(var i=0;i<myGroupHouses.length;i++){
		var html='<div class="Y4DDLBLB">'+
		'<div class="Y4DDLBLB1">'+myGroupHouses[i].houseGroupId+'</div>'+
		'<div class="Y4DDLBLB2">'+myGroupHouses[i].customerName+'</div>'+
		'<div class="Y4DDLBLB3">参团</div>'+
		'<div class="Y4DDLBLB4">'+myGroupHouses[i].groupName+'</div>'+
		'<div class="Y4DDLBLB5">'+myGroupHouses[i].groupStartDate+'-'+myGroupHouses[i].groupDeadlineDate+'</div>'+
		'<div class="Y4DDLBLB6">'+myGroupHouses[i].orderMoeny+'</div>'+
		'<div class="Y4DDLBLB7">状态</div>'+
		'</div>';
		$("#tab3").append(html);
	}
}
function generateActive(myActivityHouse){
	$("#tab4").empty();
	for(var i=0;i<myActivityHouse.length;i++){
		var  html = '<div class="Y4DDLBLB">'+
			'<div class="Y4DDLBLB1">'+myActivityHouse[i].eventNum+'</div>'+
			'<div class="Y4DDLBLB2">'+myActivityHouse[i].customerName+'</div>'+
			'<div class="Y4DDLBLB3">活动</div>'+
			'<div class="Y4DDLBLB4">'+myActivityHouse[i].eventTitle+'</div>'+
			'<div class="Y4DDLBLB5">'+myActivityHouse[i].eventStartTime+'-'+myActivityHouse[i].eventEndTime+'</div>'+
			'<div class="Y4DDLBLB6">'+myActivityHouse[i].orderMoney+'</div>'+
			'<div class="Y4DDLBLB7">状态</div>'+
			'</div>';
		$("#tab4").append(html);
	}
}
function goPage1(curPage, pageSize){
	$.ajax({
		 type: "POST",
		 url: "eagent_order_myBuyHousePage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generate(obj);
		 }
	});
}
function goPage2(curPage, pageSize){
	$.ajax({
		 type: "POST",
		 url: "eagent_order_myViewHousePage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generateViweOrder(obj);
		 }
	});
}
function goPage3(curPage, pageSize){
	$.ajax({
		 type: "POST",
		 url: "eagent_order_myGroupHousePage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generateGroup(obj);
		 }
	});
}
function goPage4(curPage, pageSize){
	$.ajax({
		 type: "POST",
		 url: "eagent_order_myActivityPage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generateActive(obj);
		 }
	});
}

</script>
<!---Y4订单--->
<script type="text/javascript">
function settab_zzjs(name,num,n){
 for(var i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
 }
}
</script>
<!---End Y4订单--->

<!---总体分类样式--->
<link href="css/eagent/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>

<body>
<!--头部-->
<%@ include file="EHeader.jsp" %>
<div class="middle">
<!--左边-->
<%@ include file="jiaoyiLeft.jsp" %>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
<!---Y4交易--->
<div class="Y4jiaoyi">
<!---订单--->
<div class="dingdanY4">
<div class="dingdanY4_tab">
<ul>
<li id="zzjs1" onclick="settab_zzjs('zzjs',1,4)" class="on_zzjs">我的购房类订单</li>
<li id="zzjs2" onclick="settab_zzjs('zzjs',2,4)">我的看房类订单</li>
<li id="zzjs3" onclick="settab_zzjs('zzjs',3,4)">我的参团类订单</li>
<li id="zzjs4" onclick="settab_zzjs('zzjs',4,4)">我的参加活动类订单</li>
<!--  
<li id="zzjs5" onclick="settab_zzjs('zzjs',5,5)">全部购房类订单</li>
-->
<li onmouseover="this.style.backgroundColor='#BB0E13'" onmouseout="this.style.backgroundColor='#DA9EA0'"><a href="jiaoyiY4.html">添加订单</a></li></ul>
</div>
<div class="dingdanY4DDLB">
<div class="Y4DDLBLB1">订单号</div>
<div class="Y4DDLBLB2">姓名</div>
<div class="Y4DDLBLB3">订单类型</div>
<div class="Y4DDLBLB4">订单对象</div>
<div class="Y4DDLBLB5">时间</div>
<div class="Y4DDLBLB6">金额</div>
<div class="dingdanY4DDLB7">订单状态</div>
</div>

<div id="zzjs_zzjs1">
<div id="tab1"></div>
<p class="Y04tong">统计：${myBuyHouseCount } 个订单</p>
<div id="page1"></div>
</div>

<div id="zzjs_zzjs2" style="display:none;">
<div id="tab2"></div>
<p class="Y04tong">统计：${viewHouseOrderCount } 个订单</p>
<div id="page2"></div>
</div>
<div id="zzjs_zzjs3" style="display:none;">
<div id="tab3"></div>
<p class="Y04tong">统计：${myGroupHouseCount} 个订单</p>
<div id="page3"></div>
</div>
<div id="zzjs_zzjs4" style="display:none;">
<div id="tab4"></div>
<p class="Y04tong">统计：${myActivityHouseCount } 个订单</p>
<div id="page4"></div>
</div>
<div id="zzjs_zzjs5" style="display:none;">
<div class="Y4DDLBLB">
<div class="Y4DDLBLB1">BJ320001</div>
<div class="Y4DDLBLB2">赵山河</div>
<div class="Y4DDLBLB3">旅游购房团</div>
<div class="Y4DDLBLB4">北京6日购房团</div>
<div class="Y4DDLBLB5">2012.1.22-2012.1.28</div>
<div class="Y4DDLBLB6">3888元</div>
<div class="Y4DDLBLB7">已结束</div>
</div>
<p class="Y04tong">统计：570个订单</p>
<div id="page5"></div>
</div>
</div>

</div>
<!---End Y4交易--->   
    </div>
<!--End右边-->    
</div>


</body>
</html>