<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>报名(下订单) - 订单</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<!--<link rel="stylesheet" href="css/index.css" type="text/css" />-->
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
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
});
</script>
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
<!---编辑订单--->
<div class="Y4jiaoyiBJDD">
<div class="Y4jiaoyiBJDD_top">
<div class="Y4jiaoyiBJDD_top_left">编辑订单</div>
<div class="Y4jiaoyiBJDD_top_right">对于你的订单，我们的工作人员将在24小时内与你联系。<img src="images/zhankai(black)1.jpg" /></div>
</div>
<div class="Y4jiaoyiBJDD_bottom">
<form>
<ul class="Y4jiaoyiBJDD_bottom_left" style="margin-bottom:30px;">
<li>客户姓名：<input class="Y4jiaoyiinput"></li>
<li>订单类型：<input class="Y4jiaoyiinput"></li>
<li>订单对象：<input class="Y4jiaoyiinput"></li>
<li>执行时间：<input class="Y4jiaoyiinput2"></li>
<li>支付金额：<input class="Y4jiaoyiinput2"></li>
</ul>
<div class="Y4jiaoyiBJDD_bottom_right"><img src="images/Y4jiaoyiright.gif" /></div>
<div class="Y4qdxd"><input name="button" type="image" src="images/Y4qdxd.gif"></div>
</form>
</div>
</div>
<!---End 编辑订单--->
<!---订单列表--->
<div class="Y4jiaoyiBJDD">
<div class="Y4ddh13">
<div class="Y4ddh131">订单号</div>
<div class="Y4ddh132">姓名</div>
<div class="Y4ddh133">订单类型</div>
<div class="Y4ddh134">订单对象</div>
<div class="Y4ddh135">时间</div>
<div class="Y4ddh136">金额</div>
<div class="Y4ddh137">状态</div>
</div>
<div class="Y4DDLBXk">
<div class="Y4DDLBXk1"><input value="赵山河"></div>
<div class="Y4DDLBXk2"><input value="旅游购房团"></div>
<div class="Y4DDLBXk3"><input value="北京6日购房团"></div>
<div class="Y4DDLBXk4"><input value="2012.1.22-2012.1.28"></div>
<div class="Y4DDLBXk5"><input value="3888元"></div>
<!--<div class="Y4DDLBXk6"><input name="button" type="image" src="images/Y4qxdd.gif"></div>-->
</div>
<div class="Y4DDLBLB">
<div class="Y4DDLBLB1">BJ320001</div>
<div class="Y4DDLBLB2">赵山河</div>
<div class="Y4DDLBLB3">旅游购房团</div>
<div class="Y4DDLBLB4">北京6日购房团</div>
<div class="Y4DDLBLB5">2012.1.22-2012.1.28</div>
<div class="Y4DDLBLB6">3888元</div>
<div class="Y4DDLBLB7"><input name="button" type="image" src="images/Y4qxdd.gif"></div>
</div>
<div class="Y4DDLBLB">
<div class="Y4DDLBLB1">BJ320001</div>
<div class="Y4DDLBLB2">赵山河</div>
<div class="Y4DDLBLB3">旅游购房团</div>
<div class="Y4DDLBLB4">北京6日购房团</div>
<div class="Y4DDLBLB5">2012.1.22-2012.1.28</div>
<div class="Y4DDLBLB6">3888元</div>
<div class="Y4DDLBLB7"><input name="button" type="image" src="images/Y4qxdd.gif"></div>
</div>
</div>
<!---End 订单列表--->
<!---统计--->
<p class="Y04tong">统计：570个订单</p>
<!---End 统计--->
<!---页面切换--->
<div id="fenyeyi">
        	<ul>
            	<li><a href="">&lt;</a></li>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li><a href="">4</a></li>
                <li><a href="">5</a></li>
                <li><a href="">6</a></li>
                <li style="border:none;">&hellip;</li>
                <li><a href="">99</a></li>
                <li><a href="">100</a></li>
                <li><a href="">&gt;</a></li>
            </ul>
            <span><form>
            	跳转：<input type="text" class="Gotext"/> 页&nbsp;<input type="image" src="images/Go.jpg" style="position:absolute; bottom:2px; _bottom:3px;"/>
            </form></span>
        </div>
<!---End 页面切换--->
</div>
<!---End Y4交易--->   
    </div>
<!--End右边-->    
</div>


</body>
</html>