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
	});
</script>

</head>
<body>
	<!--左边-->
	<div class="FLHLeft">
		<div class="FLHzl">
			<span class="photo"><img src="images/touxiang.jpg" /></span>
			<ul class="nickname">
				<li>姓名：赵美丽</li>
				<li>生日：8.26</li>
				<li><img src="images/80.jpg" /></li>
			</ul>
			<ul class="Y611wdfm">
				<li><a href="#">[给Ta留言]</a></li>
				<li><a href="#">[给Ta发消息]</a></li>
			</ul>
		</div>
		<ul class="treeNav">
			<li>
				<div class="treefont">
					<img src="images/10.jpg" /><a href="Y611WDFM.html"><font>Ta的个人主页</font></a>
				</div>
				<div class="xian"></div>
			</li>
			<li>
				<div class="treefont">
					<img src="images/10.jpg" /><a href="honeyInfo"><font>资料</font></a>
				</div>
				<div class="xian"></div>
			</li>
			<li>
				<div class="treefont">
					<img src="images/11.jpg" /><a href="Y611WDFM-xiangce.html"><font>相册</font></a>
				</div>
				<div class="xian"></div>
			</li>
			<li>
				<div class="treefont">
					<img src="images/9.jpg" /><a href="myFengMiDaily"><font>日志</font></a>
				</div>
				<div class="xian"></div>
			</li>
			<li>
				<div class="treefont">
					<img src="images/9.jpg" /><a href="myFengMiCostFee"><font>开销记录</font></a>
				</div>
				<div class="xian"></div>
			</li>
			<li>
				<div class="treefont">
					<img src="images/10.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="Y611WDFM-fang.html">Ta分享给我的楼盘</a>
				</div>
				<div class="xian"></div>
			</li>
			<li>
				<div class="treefont">
					<img src="images/11.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="Y611WDFM-lygft.html">Ta分享给我的旅游购房团</a>
				</div>
				<div class="xian"></div>
			</li>
			<li>
				<div class="treefont">
					<img src="images/12.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">Ta分享给我的活动</a>
				</div>
				<div class="xian"></div>
			</li>

		</ul>
	</div>
	<!--End左边-->
</body>
</html>