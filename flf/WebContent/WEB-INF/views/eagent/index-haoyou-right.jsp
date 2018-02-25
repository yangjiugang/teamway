<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好友统计明细</title>
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
<script type="text/javascript">
	function settab_zzjs(name, num, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "zzjs" + i);
			menu.className = i == num ? "on_zzjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
	}
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

		<!--右边-->
		<div class="jiangjie-a" style="margin: 30px 0 10px 220px;">
			<div class="kehu-c" style="border-bottom: none;">
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
				<ul class="xiang-b" style="margin: 0;">
					<li><span><a href="#">详细资料</a></span><span><a href="#">发信息</a></span><span><a
							href="#">留言</a></span><span><a href="#">推荐</a></span></li>
					<li>兴趣爱好：爱好运动，社交，音乐。兴趣爱好：爱好运动，社交，音乐。</li>
				</ul>
			</div>
		</div>
		<!--End右边-->
		<!---游购房团--->
		<div class="huodong">
			<div class="huodong_tab">
				<div class="huodong_tab_left"></div>
				<ul>
					<li id="zzjs1" onmouseover="settab_zzjs('zzjs',1,8)"
						class="on_zzjs">关注楼盘(7)</li>
					<li id="zzjs2" onmouseover="settab_zzjs('zzjs',2,8)">认售楼盘(8)</li>
					<li id="zzjs3" onmouseover="settab_zzjs('zzjs',3,8)">喊价楼盘(13)</li>
					<li id="zzjs4" onmouseover="settab_zzjs('zzjs',4,8)">向好友推荐楼盘(8)</li>
					<li id="zzjs5" onmouseover="settab_zzjs('zzjs',5,8)">向客户推荐楼盘(13)</li>
					<li id="zzjs6" onmouseover="settab_zzjs('zzjs',6,8)">向客户推荐购房团(8)</li>
					<li id="zzjs7" onmouseover="settab_zzjs('zzjs',7,8)">好友数量(13)</li>
					<li id="zzjs8" onmouseover="settab_zzjs('zzjs',8,8)">评论内容(13)</li>
				</ul>
				<!--<div class="huodong_tab_right"><a href="#" target="_blank">我要了解更多活动</a></div>-->
			</div>

			<div class="huodonglist">
				<div id="zzjs_zzjs1">
					<ul class="huodong_status">
						<li style="width: 121px;">楼盘名</li>
						<li style="width: 119px;">楼盘类型</li>
						<li style="width: 119px;">楼盘价格</li>
						<li style="width: 119px;">楼盘面积</li>
						<li style="width: 98px;">日期</li>
						<li style="width: 98px;">喊价</li>
						<li style="width: 306px; border: none;">评论</li>
					</ul>
					`
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
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
								跳转：<input type="text" class="Gotext" /> 页&nbsp;<input
									type="image" src="images/Go.jpg"
									style="position: absolute; bottom: 2px; _bottom: 3px;" />
							</form></span>
					</div>
					<!--页面切换-->
				</div>

				<div id="zzjs_zzjs2" style="display: none;">
					<ul class="huodong_status">
						<li style="width: 121px;">楼盘名</li>
						<li style="width: 119px;">楼盘类型</li>
						<li style="width: 119px;">楼盘价格</li>
						<li style="width: 119px;">楼盘面积</li>
						<li style="width: 98px;">日期</li>
						<li style="width: 98px;">喊价</li>
						<li style="width: 306px; border: none;">评论</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
					</ul>
				</div>
				<div id="zzjs_zzjs3" style="display: none;">
					<ul class="huodong_status">
						<li style="width: 121px;">楼盘名</li>
						<li style="width: 119px;">楼盘类型</li>
						<li style="width: 119px;">楼盘价格</li>
						<li style="width: 119px;">楼盘面积</li>
						<li style="width: 98px;">日期</li>
						<li style="width: 98px;">喊价</li>
						<li style="width: 306px; border: none;">评论</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
					</ul>
				</div>
				<div id="zzjs_zzjs4" style="display: none;">
					<ul class="huodong_status">
						<li style="width: 121px;">楼盘名</li>
						<li style="width: 119px;">楼盘类型</li>
						<li style="width: 119px;">楼盘价格</li>
						<li style="width: 119px;">楼盘面积</li>
						<li style="width: 98px;">日期</li>
						<li style="width: 98px;">喊价</li>
						<li style="width: 306px; border: none;">评论</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
					</ul>
				</div>
				<div id="zzjs_zzjs5" style="display: none;">
					<ul class="huodong_status">
						<li style="width: 121px;">楼盘名</li>
						<li style="width: 119px;">楼盘类型</li>
						<li style="width: 119px;">楼盘价格</li>
						<li style="width: 119px;">楼盘面积</li>
						<li style="width: 98px;">日期</li>
						<li style="width: 98px;">喊价</li>
						<li style="width: 306px; border: none;">评论</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 274px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
					</ul>
				</div>
				<div id="zzjs_zzjs6" style="display: none;">
					<ul class="huodong_status">
						<li style="width: 121px;">购房团名称</li>
						<li style="width: 119px;">线路类型</li>
						<li style="width: 119px;">时长</li>
						<li style="width: 119px;">发团时间</li>
						<li style="width: 98px;">线路价格</li>

						<li style="width: 404px; border: none;">评论</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">绿城北京 - 天上人间展销会</li>
						<li style="width: 87px;">11.16 am14:30</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 66px;">已在报名</li>
						<li style="width: 320px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
					</ul>
				</div>
				<div id="zzjs_zzjs7" style="display: none;">
					<ul class="huodong_status">
						<li style="width: 121px;">姓名</li>
						<li style="width: 119px;">常驻地</li>
						<li style="width: 119px;">生日</li>
						<li style="width: 625px;">手机号</li>

					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">赵山河</li>
						<li style="width: 87px;">深圳南山</li>
						<li style="width: 87px;">1964-09-09</li>
						<li style="width: 580px; color: #959698; text-align: center;">13789867976</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
					</ul>
				</div>
				<div id="zzjs_zzjs8" style="display: none;">
					<ul class="huodong_status">
						<li style="width: 121px;">评论时期</li>
						<li style="width: 119px;">评论对象</li>
						<li style="width: 748px; border: none;">评论内容</li>
					</ul>
					<ul class="huodong_list">
						<li style="width: 89px;">2012-01-02</li>
						<li style="width: 87px;">北京三里屯房立方主题会所</li>
						<li style="width: 716px; color: #959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
					</ul>
					<ul class="tongj">
						<li>统计：<span class="red">13</span>条
						</li>
					</ul>
				</div>

			</div>
		</div>
		<!---End游购房团--->
	</div>
</body>
</html>
