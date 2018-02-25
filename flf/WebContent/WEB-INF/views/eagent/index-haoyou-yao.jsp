<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>邀请好友</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
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
					<li><a href="index-a.jsp">首页</a></li>
					<li><a href="index-geren.jsp" id="cur">个人主页</a></li>
					<li><a href="index-b-a.jsp">客户</a></li>
					<li><a href="index-fang.jsp">房源</a></li>
					<li><a href="jiaoyiY4.jsp">订单</a></li>
					<li><a href="Y52xuexi.jsp">学习</a></li>
					<li><a href="index-haoyou.jsp">好友</a></li>
					<li><a href="Y7chihewanle.jsp">吃喝玩乐</a></li>
					<li><a href="index-xiaoxi.jsp">消息</a></li>
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
							href="index-haoyou.html">好友管理</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/2.jpg" /><font><a
							href="index-haoyou-yao.html">邀请好友</a></font>
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

			<form>
				<ul class="Y01homeSOSO">
					<li><span><input class="Y01homeSOSOinput" type="text"
							id="txt" name="txt" value="请输入..."> </span>在线状态：</li>
					<li><span><input class="Y01homeSOSOinput" type="text"
							id="txt" name="txt" value="请输入..."> </span>常驻地：</li>
					<li><span><input class="Y01homeSOSOinput" type="text"
							id="txt" name="txt" value="请输入..."> </span>籍贯：</li>
					<li><span><input class="Y01homeSOSOinput" type="text"
							id="txt" name="txt" value="请输入..."> </span>经验：</li>
					<li><span><input class="Y01homeSOSOinput" type="text"
							id="txt" name="txt" value="请输入..."> </span>性别：</li>
					<li><input class="Y01input" name="searchkey" type="text"
						value="请输入关键词" onFocus="this.value=''"> <input
						name="button" type="image" src="images/Y01SOSO.gif"
						style="margin-bottom: -6px; margin-right: 16px;"></li>
				</ul>

			</form>


			<div class="Rightleft">
				<div class="jiange-z">
					<span class="tltle-wenzi">邀请好友</span> <span class="title-line"
						style="width: 438px;"></span>
				</div>

				<div class="kehu-c">
					<dl>
						<img src="images/kehu-vipbg.gif" />
						<dt>
							<span>成龙</span>姓名：
						</dt>
						<dt>
							<span>深圳</span>常驻地：
						</dt>
						<dt>
							<span>7.12</span>生日：
						</dt>
						<dt>手机号：123466789123</dt>

					</dl>
					<ul>
						<li><span><a href="#">详细资料</a></span><span><a href="#">发信息</a></span><span><a
								href="#">留言</a></span><span><a href="#">推荐</a></span></li>
						<li>兴趣爱好：爱好运动，社交，音乐。兴趣爱好：爱好运动，社交，音乐。</li>
					</ul>
				</div>

				<div class="kehu-c">
					<dl>
						<img src="images/kehu-vipbg.gif" />
						<dt>
							<span>成龙</span>姓名：
						</dt>
						<dt>
							<span>深圳</span>常驻地：
						</dt>
						<dt>
							<span>7.12</span>生日：
						</dt>
						<dt>手机号：123466789123</dt>

					</dl>
					<ul>
						<li><span><a href="#">详细资料</a></span><span><a href="#">发信息</a></span><span><a
								href="#">留言</a></span><span><a href="#">推荐</a></span></li>
						<li>兴趣爱好：爱好运动，社交，音乐。兴趣爱好：爱好运动，社交，音乐。</li>
					</ul>
				</div>

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
							跳转：<input type="text" class="Gotext" /> 页&nbsp;<input
								type="image" src="images/Go.jpg"
								style="position: absolute; bottom: 2px; _bottom: 3px;" />
						</form></span>
				</div>
				<!--页面切换-->


				<span
					style="margin: 180px 0 20px 50px; float: left; display: inline;"><img
					src="images/tuijian-bg.gif" /></span> <span
					style="margin: 20px 0 20px 50px; float: left; display: inline;"><img
					src="images/liuyan-bg.gif" /></span>

			</div>
			<div class="Rightright">

				<ul class="Y2kehu"
					style="margin: 38px 0 0 0; background: url(images/Y2xiang.gif) left top no-repeat;">
					<li><span>21</span><a href="index-haoyou-right.html"
						target="_blank">关注楼盘数:</a></li>
					<li><span>21</span><a href="index-haoyou-right.html"
						target="_blank">认售楼盘数:</a></li>
					<li><span>21</span><a href="index-haoyou-right.html"
						target="_blank">喊价楼盘数:</a></li>
					<li><span>21</span><a href="index-haoyou-right.html"
						target="_blank">评论楼盘数:</a></li>
					<li><span>21</span><a href="index-haoyou-right.html"
						target="_blank">客户数量:</a></li>
					<li><span>8</span><a href="index-haoyou-right.html"
						target="_blank">客户交流数:</a></li>
					<li><span>63</span><a href="index-haoyou-right.html"
						target="_blank">客户参加活动数:</a></li>
					<li><span>15</span><a href="index-haoyou-right.html"
						target="_blank">客户看房数:</a></li>
					<li><span>15</span><a href="index-haoyou-right.html"
						target="_blank">客户参团数:</a></li>
					<li><span>15</span><a href="index-haoyou-right.html"
						target="_blank">客户评论数:</a></li>
					<li><span>63</span><a href="index-haoyou-right.html"
						target="_blank">客户成交数:</a></li>
					<li><span>15</span><a href="index-haoyou-right.html"
						target="_blank">好友数量:</a></li>
					<li><span>15</span><a href="index-haoyou-right.html"
						target="_blank">向好友推荐楼盘数:</a></li>
					<li><span>15</span><a href="index-haoyou-right.html"
						target="_blank">向客户推荐楼盘数:</a></li>

				</ul>


			</div>
		</div>
		<!--End右边-->
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
