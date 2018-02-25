<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fc.flf.common.util.SessionInfo" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#menu li a").each(function(){
		if($(this).attr("href").indexOf("_<%=SessionInfo.getEagentModule(request) %>") > -1) {
			$(this).attr("id", "cur");
			$(this).parent().siblings().find("a").removeAttr("id");
		}
	});
});
</script>
<div class="FlhTopOut">
	<div class="FlhTop">
		<div class="FlhLogo"></div>
		<div class="TopRight">
			<span class="FLHphone"><div>服务热线：</div>
			<img src="images/phone2.jpg" /><font>400 61355288</font></span>
		</div>
		<div id="menu">
			<ul>
				<li><a href="eagent_EIndex" id="cur">首页</a></li>
				<li><a href="eagent_home_EIndexGeren?userId=${userid }">个人主页</a></li>
				<li><a href="index-b-a.html">客户</a></li>
				<li><a href="saleHouse?userId=${userid }">房源</a></li>
				<li><a href="eagent_order_index">订单</a></li>
				<li><a href="eagent_study_jumpClubStudy?type=0">学习</a></li>
				<li><a href="eagent_friend_jumpFriends">好友</a></li>
				<li><a href="Y7chihewanle.html">吃喝玩乐</a></li>
				<li><a href="eagent_message">消息</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="FLHEscOUT">
	<div>
		<font>欢迎您进入易介宝!&nbsp; <c:url value="/j_spring_security_logout" var="logoutUrl" /><a href="${logoutUrl}">[安全退出]</a></font>
	</div>
</div>
