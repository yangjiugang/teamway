<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人首页</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
</head>
<body>
<div class="left1">
  	<ul class="left_top zp_ltop">
     	<li style="border:none; width:170px;"><a onclick="goToJsp('right','pxtj.html')">培训活动统计</a></li>
    </ul>
      <dl class="checkbox">
      	<dt><img src="images/tree1.jpg" /><a href="javascript:parent.window.changeRight('trainList?taskStatus=-1')">全部培训活动</a></dt>
          <dd><a href="javascript:parent.window.changeRight('trainList?taskStatus=0')">未发布的培训活动 </a></dd>
          <dd><a href="javascript:parent.window.changeRight('trainList?taskStatus=1&flag=no')">已发布未执行的培训活动 </a></dd>
          <dd><a href="javascript:parent.window.changeRight('trainList?taskStatus=1&flag=yes')">已执行的培训活动 </a></dd>
          <dd><a href="javascript:parent.window.changeRight('trainList?taskStatus=3')">已取消的培训活动 </a></dd>
          <dt><img src="images/tree1.jpg" />类型管理</dt>
          <dd><a href="javascript:parent.window.changeRight('trainType')">培训活动类型</a></dd>
      </dl>
 </div>
</body>
</html>