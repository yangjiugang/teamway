<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/portal/layout.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 页签切换
	var bol = true;
	$(".logoNav").find("li a").each(function(){
		if(window.location.href.indexOf($(this).attr("href")) > 0) {
			$(this).html("<font>" + $(this).html() + "</font>");
			bol = false;
		}
	});
	if(bol) {
		var o = $(".logoNav ul li:first-child a");
		o.html("<font>" + o.html() + "</font>");
	}
	
	$.fc.ajaxSubmit({
		url:"newHouseNews",
		callBackFn:function(msg){
			$.each(msg, function(i, o){
				var title = o.infoTitle;
				if(title.length > 19) {
					title = title.substring(0, 19) + "...";
				}
				$("#rollNews").append("<a href=\"newsInfo?newsId="+o.newsId+"\" target=\"_blank\">"+title+"</a>");
			});
		}
	});
	
	// 滚动新闻
	$("#rollNews").find("a").css({display:"block", "line-height":"14px"});
	var box = document.getElementById("rollNews"),can = true;
	box.innerHTML += box.innerHTML;
	box.onmouseover = function(){can = false;};
	box.onmouseout = function(){can = true;};
	new function(){
		var stop = box.scrollTop%14==0 && !can;
		if(!stop) box.scrollTop == parseInt(box.scrollHeight/2) ? box.scrollTop = 1 : box.scrollTop++;
		setTimeout(arguments.callee, box.scrollTop%14 ? 15 : 2000);
	}
});
</script>
<div class="head">
	<div class="loginBarOut">
    	<div class="loginBar">
        	<span class="left">
        	<c:if test="${sessionScope.VISITOR_TYPE == 'ROLE_1'}"><a href="fPartyIndex">[<font>进入房乐会</font>]</a></c:if>
        	<c:if test="${sessionScope.VISITOR_TYPE != 'ROLE_1' }"><a href="toflogin">[登陆<font>房乐会</font>]</a><a href="register">[注册]</a></c:if>
        	 中国最专业的房地产流通行业社交平台</span>
            <span class="right">
            <c:if test="${sessionScope.VISITOR_TYPE == 'ROLE_0'}"><a href="eagent_EIndex">[<font>进入易介宝</font>]</a></c:if>
            <c:if test="${sessionScope.VISITOR_TYPE != 'ROLE_0' }"><font>易介宝</font><a href="toelogin">[登陆]</a> </c:if>| <font>售楼宝</font><a href="../SLB/landing.html">[登陆]</a> | <a href="">主题会所分布</a> </span>
        </div>
    </div>
	<div class="logoNav">
    	<div class="logo"></div>
        <ul>
        	<li><a href="index">首 页</a></li>
            <li><a href="newmonopoly">新房专卖</a></li>
            <li><a href="hotline?pageSize=8">旅游购房</a></li>
            <li><a href="abroad?pageSize=4">海外置业</a></li>
            <li><a href="brandzone">品牌专区</a></li>
        </ul>
        <span>
			<font class="font1">关注城市</font><img src="images/gzcs.jpg" style="float:left; margin-top:3px;"/>
            <font class="font2">[深圳]</font>
        	<img src="images/TEL.gif" style="float:right;"/>
        </span>
    </div>
    <div class="searchOut">
    	<div>
        	<div class="input1">
                <form>
                    <input type="text" class="inputText" value="请输入关键词" onclick="this.select();"/>
                    <input type="image" src="images/Search.gif" class="inputBut"/>
                </form>
             </div>
            <span id="rollNews" style="height:14px;overflow:hidden"></span>
        </div>
    </div>
</div>
