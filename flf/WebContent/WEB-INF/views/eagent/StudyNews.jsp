<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/portal/layout.css" />
<link rel="stylesheet" type="text/css" href="css/portal/news.css" />
<title>新闻</title>
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/page.css" />
<script type="text/javascript" src="js/page.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#page").pager({pageSize:20, pageCount:30, goPageCall:goPage});
});

function goPage(curPage, pageSize) {
	alert("curPage:"+curPage+",pageSize="+pageSize);
}
</script>
</head>

<body>
<!--头部-->
<div class="head">
	<div class="loginBarOut">
    	<div class="loginBar">
        	<span class="left"><a href="../FLH/landing.html">[登陆<font>房乐会</font>]</a><a href="../FLH/register.html">[注册]</a> 中国最专业的房地产流通行业社交平台</span>
            <span class="right"><font>易介宝</font><a href="../FLH01/denglu.html">[登陆]</a> | <font>售楼宝</font><a href="../SLB/landing.html">[登陆]</a> | <span class="cc"><a href="">主题会所分布</a></span></span>
        </div>
    </div>
	<div class="logoNav">
    	<div class="logo"></div>
        <ul>
        	<li><a href="index.html"><font>首 页</font></a></li>
            <li><a href="monopolyofsaleM1.html">新房专卖</a></li>
            <li><a href="hotline.html">旅游购房</a></li>
            <li><a href="abroad.html">海外置业</a></li>
            <li><a href="Brand.html">品牌专区</a></li>
        </ul>
        <span>
        	<!--<font style="float:left;">关注城市</font><img src="images/gzcs.jpg" style="float:left;"/>
             <font><a href="">[深圳]</a></font>-->
            <div>
				<font class="font1">关注城市</font><img src="images/gzcs.jpg" style="float:left; margin-top:3px;"/>
                <font class="font2">[深圳]</font>
            </div>
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
            <span><a href="news.html">武汉| 协信打造浮躁城市里唯一的完美小城</a></span>
        </div>
    </div>
</div>
<!--End头部-->
<div class="middle">
	<div class="banner"><img src="images/Banner1.jpg" /></div>
    <div class="breadCrumb"><span style="float:left;">您的位置 >> 首页 >> 新闻</span><span><font>1</font>年前上传 &nbsp; &nbsp; 您是第 <font>7941</font> 位浏览者</span></div>

<c:if test="${clubStudyDataInfo!=null}">
<div class="NewsOut">
    	<div class="NewsLeft">
        	<h1>武汉、绿城打造浮躁城市中唯一的完美小城</h1>
            <div class="subhead">[转自：瑞丽女性网]&nbsp; 2011-12-06&nbsp; 17:50:06&nbsp; &nbsp; 编辑：茜茜</div>
            <div class="shuoming"><p>新华网北京12月31日电 记者了解到，由"郭美美事件"引起的针对商业系统红十字会(以下简称商红会)问题的联合调查已形成结论，并将对</p></div>
            <div class="xiayiye"><a href="">点击图片，进入下一页</a></div>
            <div class="leftimg"><a href=""><img src="images/b_pic_3.jpg" /></a></div>
           <div class="lefttext">
           		 ${clubStudyDataInfo.contentText}
           </div>
           
        </div>
        
    </div>
	
</c:if>
<c:if test="${clubStudyDataInfo==null}">
	<a href="javaScript:history.go(-1);">改资料不存在或已被删除</a>
</c:if>
    
</div>    
<!--尾部-->
<div class="footBorder">
	<!--<div class="foot" >
    <div class="dian"></div>
	<div class="footCenter" >
    	<h3><span></span>选择楼盘</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>注册登陆</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>选房秘书</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>线下服务</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>报名置房</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>现场看房</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>签约下定</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>按揭办理</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>购买成功</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    </div>-->
	<div class="FootInformation">
	<div>
    	<ul>
        	<li><a href="">房立方介绍</a></li>
            <li><a href="">关于我们</a></li>
            <li><a href="">广告服务</a></li>
            <li><a href="">合作伙伴</a></li>
            <li><a href="">联系我们</a></li>
            <li><a href="">诚聘英才</a></li>
            <li><a href="">会员注册</a></li>
            <li><a href="">产品答疑</a></li>
            <li style="border:none;"><a href="">客户投诉</a></li>
        </ul>
    	<span>
        	Copyright © 2011 www.funlifun.com Corporation, All Rights Reserved<br />
            房立方用户服务、信息咨询、技术支持、客服服务热线：0755-61355288
        </span>
    </div>
</div>
</div>
<!--End尾部-->
</body>
</html>
