<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的蜂蜜</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/fparty/kehu.css" />
<link rel="stylesheet" type="text/css" href="css/fparty/yijiebao.css" />
<link rel="stylesheet" href="js/page/page.css" type="text/css"/>

<script type="text/javascript" src="js/calendar.js"></script> 

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/dataValidate.js"></script>
<script type="text/javascript" src="js/idNumValidate.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".Out").each(function() {
			var obj = $(this);
			obj.find(".updown").toggle(function() {
				$(this).attr("src", "images/zhankai(black).jpg");
				obj.find(".Content").slideUp('slow');
			}, function() {
				$(this).attr("src", "images/zhankai(black)1.jpg");
				obj.find(".Content").slideDown('slow');
			});
		});
		var curPage = ${curPage};
		var pageCount = ${pageCount};
		$("#page").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage});
		var dailys = ${dailys};
		generate(dailys);
	});
	
	function generate(obj){
		$("#daily").empty();
		for(var i=0;i<obj.length;i++){
			var html = 
			'<div class="Y04rizhiMy">'+
			'<h3><span>'+obj[i].dailyTime+'</span><a href="#" target="_blank">'+obj[i].dailyTitle+'</a></h3>'+
			'<!-- '+
			'<ul class="Y04rizhiimg">'+
			'	<li><a href="#" target="_blank"><img src="images/Y04img1.gif" /></a></li>'+
			'</ul>'+
			'<p class="Y04rizhizp"><共1张照片></p>'+
			' -->'+
			'<p class="Y04rizhiwz">'+obj[i].dailyContent+
			'</p>'+
			'<p class="Y04rizhiqw"><a href="#">阅读全文</a></p>'+
			'</div>';
			$("#daily").append(html);
		};
	}
	function goPage(curPage, pageSize) {
		$.ajax({
			 type: "POST",
			 url: "findDailyByCusIdPage",
			 dataType:"json",
			 data: "curPage=" + curPage + "&pageSize=" + pageSize,
			 success: function(obj){
				 generate(obj);
			 }
		});
	}
</script>

</head>
<body>
	<!--头部-->
	<%@include file="MyFengMiTop.jsp" %>
	<!--End头部-->
	<div class="middle">
		<!--左边-->
		<%@include file="MyFengMiLeft.jsp" %>
		<!--右边-->
		<diiv class="FLHRight">
	   <!---日志--->
		<div class="Y04rizhi">
<div class="Y04rizhi_tab">
<ul><li id="zzjs1" onclick="settab_zzjs('zzjs',1,1)" class="on_zzjs">Ta的日志</li></ul>
</div>
<div class="Y04rizhilist">
<div id="zzjs_zzjs1">
<div id="daily"></div>
<!---统计--->
<p class="Y04tong">统计：${dailyCount } 篇日志</p>
<!---End 统计--->
<!---页面切换--->
<div id="page"></div>
<!---End 页面切换--->
</div>


</div></div>
       <!---日志---> 
    </div>
		<!--End右边-->
	</div>
</body>
</html>