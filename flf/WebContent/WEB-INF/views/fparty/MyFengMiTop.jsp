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
	<div class="FlhTopOuts">
		<div class="FlhTops">
			<div class="FlhLogos"><img src="images/logoF.png" /></div>
			<div class="Y611grzy">
				<a href="#">赵美丽</a>的个人主页
			</div>
			<div class="TopRights">
				<span class="FLHMaps"><div>房立方</div> <img
					src="images/mapImg.png" /><font>主题会所分布网点</font></span> <span
					class="FLHphones"><div>服务热线：</div> <img
					src="images/phone2.jpg" /><font>400 61355288</font></span>
			</div>
		</div>
	</div>
	<div class="FLHEscOUTs">
		<div>
			<font>赵美丽欢迎你进入Ta的个人主页!</font>
		</div>
	</div>
</body>
</html>