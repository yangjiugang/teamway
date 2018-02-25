<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发表过评论的客户</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/tanchu.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/layuod.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/openBox.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
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
	<!--头部-->
	<div class="FlhTopOut">
		<div class="FlhTop">
			<div class="FlhLogo"></div>
			<div class="TopRight">
				<span class="FLHphone"><div>服务热线：</div>
					<img src="images/phone2.jpg" /><font>400 61355288</font></span>
			</div>
			<div id="menu">
				<ul>
					<li><a href="IndexA">首页</a></li>
					<li><a href="IndexGeren" id="cur">个人主页</a></li>
					<li><a href="IndexBA">客户</a></li>
					<li><a href="IndexFang">房源</a></li>
					<li><a href="JiaoyiY4">订单</a></li>
					<li><a href="Y52xuexi">学习</a></li>
					<li><a href="IndexHaoyou">好友</a></li>
					<li><a href="Y7chihewanle">吃喝玩乐</a></li>
					<li><a href="IndexXiaoxi">消息</a></li>
				</ul>
			</div>

		</div>
	</div>
	<div class="FLHEscOUT">
		<div>
			<font>欢迎您进入房乐会! <a href="">[安全退出]</a></font>
		</div>
	</div>
	<!--End头部-->
	<div class="middle">
		<!--左边-->
		<div class="FLHLeft">
			<div class="FLHzl">
				<span class="photo"><img src="images/touxiang.jpg" id="open_btn"/></span>
				<ul class="nickname">
					<li>昵称：魅力一抖</li>
					<li>姓名：赵美丽</li>
					<li>生日：8.26</li>
					<li><img src="images/8%.jpg" /></li>
				</ul>
				<span class="linkage"> <span style="margin: 0;"><a
						id="open_btn">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a
						href="">[修改密码]</a></span>
				</span>
			</div>
			<div class="jieshao">
				<ul>
					<li>已有<span class="red">3</span>同行加你为好友
					</li>
					<li>已有<span class="red">3</span>客户点名你为房秘书
					</li>
				</ul>
			</div>
			<ul class="treeNav">
	<li>
					<div class="treefont">
						<img src="images/1.jpg" /><font><a
							href="Y03juluyuehuiKehu">约会管理</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/2.jpg" /><font><a
							href="KehuTianjiaZhuce">添加客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/3.jpg" /><font><a href="IndexBA">全部客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/4.jpg" /><font><a href="IndexBC">下过单的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/5.jpg" /><font><a href="IndexBE">看过房的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/6.jpg" /><font><a href="IndexBD">参加过购房团的客户</a>
						</font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/7.jpg" /><font><a href="IndexBF">参加过活动的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/8.jpg" /><font><a href="IndexBB">发表过评论的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><font><a href="#">客户分析</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><a href=""><font>我的财富</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><a href=""><font>积分商场</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><a href=""><font>积分兑换</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><font><a href="#">搜索房源</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><font><a href="#">购搜索房团</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/12.jpg" /><font><a href="#">搜索活动</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/12.jpg" /><font><a href="#">搜索蜂蜜</a></font>
					</div>
					<div class="xian"></div>
				</li>
			</ul>
		</div>
		<!--End左边-->
		<!--右边-->
		<div class="FLHRight">
			<div class="jiangjie-a">
				<div class="kehu-c" style="border-bottom: none;">
				  <dl>
		          <a href="IndexKehuXiangqing?nameXiangqing=${cusList.cusId}"><img src="images//mishu-mg.gif" border="0" /></a>
			      <dt><!-- <span><a href="#">发信息</a></span> --><span><a href="#" onclick="showBox('liuyanBox',${cusList.cusId})">留言</a></span><span><a href="HomeTJFXY4">推荐</a></span>姓名：<a href="IndexKehuXiangqing?nameXiangqing=${cusList.cusId}">${cusList.name}</a></dt>
                  <dt>生日： <fmt:formatDate value="${cusList.birthday}" type="date"/>  
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   	客户类别： <c:if test="${cusList.customerType == 1}">预备客户</c:if>
                   	<c:if test="${cusList.customerType == 2}">普通客户</c:if>
                   	<c:if test="${cusList.customerType == 3}">会员客户</c:if></dt>
                  <dt>手机号：${cusList.cellphone}&nbsp;&nbsp;&nbsp;兴趣爱好：${cusList.customerInterests.interests}</dt>	   
                 </dl>	    
				</div>
			</div>
			<ul class="Y01Result">
				<li>日期</li>
				<li>地点</li>
				<li style="width: 150px;">活动名称</li>
				<li style="width: 250px;">活动概要</li>

			</ul>
		<c:forEach items="${eventList}" var="list">
    	<ul class="Y01jg">
	      <li><fmt:formatDate value="${list.eventStartTime}" type="date"/></li>
	      <li>${list.eventAddress}</li>
	      <li style="width:150px;">${list.eventTitle}</li>
	      <li style="width:250px;">${list.eventDesc}</li>
		   </ul>
		  </c:forEach>
			<ul class="Y01-tong">
				<li class="red">统计：${size}</li>
			</ul>

			<!--页面切换-->
			<div id="fenyeyi">
				<ul>
					<li><a href="">&lt;</a></li>
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
					<li><a href="">6</a></li>
					<li style="border: none;">&hellip;</li>
					<li><a href="">99</a></li>
					<li><a href="">100</a></li>
					<li><a href="">&gt;</a></li>
				</ul>
				<span><form>
						跳转：<input type="text" class="Gotext" /> 页&nbsp;<input type="image"
							src="images/Go.jpg"
							style="position: absolute; bottom: 2px; _bottom: 3px;" />
					</form></span>
			</div>
			<!--页面切换-->

		</div>
		<!--End右边-->
	</div>
 <div class="tanchuc" id="liuyanBox">
 <form action="insertUserMsg?cusId=cusId&textMsg=textMsg" id="form1" method="post" >
     <div class="tanchusc">
      <div class="tanchuc-tel" >
         <img src="images/liuyan.png" width="146" height="52" />
         	<div style="width: 80px;height: 50px;margin-top: 8px;margin-right：10px;float: right;">
         		<input type="submit" value="[提交]" style="background-image: url('images/queding.png');width: 38px;height: 11px"/><br>
         		<input type="button" value="[退出]" style="background-image: url('images/tuichu.png');margin-top: 14px;width: 38px;height: 11px" id="exit"  onclick="closeBox('liuyanBox')" >
         	</div>
         </div>
      <div class="tanchuc-tel-right" ></div>
      </div>     
      <div class="tanchuc-co" >
         <div class="tanchuc-cos">
            <textarea cols="62" rows="5" name="textMsg"></textarea>
         </div>         
      </div>
      <div class="tanchuc-bottom">
         <div class="tanchuc-bottom-left"><img src="images/bottom-leftbg.png" width="17" height="16" /></div>
         <div class="tanchuc-bottom-con"></div>
         <div class="tanchuc-bottom-right"><img src="images/rightjiao-bg.png" width="16" height="16" /></div>
       </div>     
     </form>  
   </div>
 <div id="sampleformdiv" style="display:none;width: 300px;height: 500px;" title="更换图像" >
      在电脑上选中一张图片<br/>
      <form method="post" id="sampleform" name="sampleform" action="changeTouXiang">
         <input type="file" name="fileUp"/><br>
         <input type="submit" name="sub" value="修改"/>
         <input type="reset" name="reset" value="重新选择"/>
      </form>
      <br><input type="button" value="退出" id="exit" style="float: right;">
   </div>
</body>
<script type="text/javascript">
$(document).ready(function() {
   $("#open_btn").click(function () {
      $("#sampleformdiv").jqpopup_open(this.id);
   });
});
</script>
</html>
