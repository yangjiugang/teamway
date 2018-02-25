<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>海外置业</title>
<link rel="stylesheet" type="text/css" href="css/portal/index.css" />
<link rel="stylesheet" type="text/css" href="css/portal/globle2.css" />
<link rel="stylesheet" type="text/css" href="css/portal/index2.css" />
<link rel="stylesheet" type="text/css" href="css/portal/imageslide.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript">
//当前图片编号
var curIndex = 1;
//时间间隔 单位毫秒
var timeInterval = 3000;
//启动图片滑动
var v=setInterval(slide, timeInterval);
function slide(){
	var pic=$("#pic_"+curIndex).attr("value");
	var att=$("#att_"+curIndex).attr("value");
	var coll=$("#coll_"+curIndex).attr("value");
	var hid=$("#h_id_"+curIndex).attr("value");
	for(var sta=0;sta<5;sta++){
	 $(".flash_box").children("span").eq(sta).css("background","url(images/carousel_circle_"+(sta+1)+"1.png)");
	}
	$(".flash_box").children("span").eq(curIndex).css("background","url(images/carousel_circle_"+(curIndex+1)+"2.png)");
	$(".ZMFlashright").css("background-image","url("+pic+")");
	$("#att_num").empty().append(att);
	$("#coll_num").empty().append(coll);
	$("#house_detail").attr("href","getHouseInfoById?houseId="+hid);
	$("#ul1").animate({
        left:'-'+738*curIndex+'px'
    },600);
	
	curIndex++;
	if(curIndex==$("#ul1").find("li").length){
		$("#ul1").animate({
            right:'-'+738*curIndex+'px'
        },2000);
		curIndex=0;
	}
}
function show(num){
	$("#ul1").stop(true);
	curIndex=num;
	slide();
	clearTimeout(v);
}
function continueSlide(){
	v=setInterval(slide, timeInterval);
}

$(document).ready(function(){
	var curPage = ${curPage};
	var pageCount = ${pageCount};
	$("#page").pager({curPage:curPage, pageSize:4, pageCount:pageCount, goPageCall:goPage});
});

function goPage(curPage, pageSize) {
	window.location.href = "${pageContext.request.contextPath}/abroad?curPage="+curPage+"&pageSize="+pageSize;
}
</script>
</head>

<body>
<%@ include file="Header.jsp" %>
<div class="middle">
    <div class="flash">
    
        <div id="ZMFlash_middle" class="flashLeft" style="width: 738px;height: 264px; float: left;" >
			<div class="slides_box" style="width: 738px;height: 264px;">
				<ul id="ul1" style="width: 3690px">
					<c:forEach items="${Advertisements}" var="atm" varStatus="index">
						<li><a href="getHouseInfoById?houseId=${atm.adUrlId}" title="${atm.hostIp }"><img src="${atm.adPath}" style="width: 738px;height: 264px;" alt="slideshow_large"/></a>
							<input id="h_id_${index.index }" value="${atm.adUrlId}" type="hidden"/>
							<input id="pic_${index.index }" value="${atm.adDescPic}" type="hidden"/>
							<input id="att_${index.index }" value="${atm.houseInfo.houseAttenttionCnt}" type="hidden"/>
							<input id="coll_${index.index }" value="${atm.houseInfo.houseCollectCnt}" type="hidden"/>
						</li>
					</c:forEach>
				</ul>
			</div>
			  	
			<div class="flash_box" style="width: 738px;" >
			  	<span class="one"  onmouseover="show(0);" onmouseout="continueSlide();"></span>
			  	<span class="two" onmouseover="show(1);" onmouseout="continueSlide();"></span>
			  	<span class="three" onmouseover="show(2);" onmouseout="continueSlide();"></span>
			  	<span class="four" onmouseover="show(3);" onmouseout="continueSlide();"></span>
			  	<span class="five" onmouseover="show(4);" onmouseout="continueSlide();"></span>
			 </div>
		</div>
		
        <div class="ZMFlashright">
        	<a id="house_detail" href="getHouseInfoById?houseId=${Advertisements[0].adUrlId}"><img src="images/zlBut.jpg"/></a>
        	<span><font id="att_num">${Advertisements[0].houseInfo.houseAttenttionCnt}</font>人关注 <font id="coll_num">${Advertisements[0].houseInfo.houseCollectCnt}</font>人收藏</span>
        </div>
    </div>
    <div class="SelectOut">
    	<span class="selectLeft"><img src="images/redian.jpg" /></span>
    	
        <ul class="selectRight">
        	<c:forEach items="${hotHouses }" var="house" varStatus="num" begin="0" step="1" end="3">
          	<c:if test="${num.count %4!=0 }">
          		<li><a href="getHouseInfoById?houseId=${house.houseId }">${house.houseName }</a></li>
          	</c:if>

            <c:if test="${num.last }">
            	<li style="border-right:#0566aa 1px solid;"><a href="getHouseInfoById?houseId=${house.houseId }">${house.houseName }</a></li>
            </c:if>
            </c:forEach>
        </ul>
        <ul class="selectRight" style="margin-top:5px;">
        	<c:forEach items="${hotHouses }" var="house1" varStatus="num1" begin="4" step="1">
          	<c:if test="${num1.count %4!=0}">
          		<li><a href="getHouseInfoById?houseId=${house1.houseId }">${house1.houseName }</a></li>
			</c:if>
            <c:if test="${num1.last }">
            	<li style="border-right:#0566aa 1px solid;"><a href="getHouseInfoById?houseId=${house1.houseId }">${house1.houseName }</a></li>
            </c:if>
        	</c:forEach>
        </ul>
        
    </div>
</div>

  <div class="conterh">
    <h1>最新海外楼盘</h1>
    <c:forEach items="${houseInfoList }" var="houseInfo">
	 <div class="conterh-c"> 
		<div class="conterh-l">
	   		<span><h3 class="name01">高级公寓</h3><h3 class="name02">paragon</h3></span>
            <ul>
            	<li>
                	<div class="dian"></div>
                    <a href="">${houseInfo.houseInfoDetail.houseKeyword1 }</a>
                </li>
                <li>
                	<div class="dian"></div>
                    <a href="">${houseInfo.houseInfoDetail.houseKeyword2 }</a>
                </li>
                <li>
                	<div class="dian"></div>
                    <a href="">${houseInfo.houseInfoDetail.houseKeyword3 } </a>
                </li>
                <li>
                	<div class="dian"></div>
                    <a href="">${houseInfo.houseInfoDetail.houseKeyword4 }</a>
                </li>
                <li>
                	<div class="dian"></div>
                    <a href="">${houseInfo.houseInfoDetail.houseKeyword5 }</a>
                </li>
            </ul>
	   </div>
	   <div class="conterh-co"><a href="getHouseInfoById?houseId=${houseInfo.houseId }"><img src="${houseInfo.housePic }" /></a></div>
	   <div class="conterh-r">
	   		<ul>
            	<li><font>楼盘名称：</font><h3>${houseInfo.houseName }</h3></li>
                <li><font>价格：</font>${houseInfo.housePrice}元/平</li>
                <li><font>面积：</font>${houseInfo.houseMaxArea}平米</li>
                <li><font>景观：</font><c:if test="${houseInfo.houseSights==0}">山景</c:if><c:if test="${houseInfo.houseSights==1}">海景</c:if><c:if test="${houseInfo.houseSights==2}">湖景</c:if><c:if test="${houseInfo.houseSights==3}">江河景</c:if><c:if test="${houseInfo.houseSights==4}">公园或游乐场</c:if><c:if test="${houseInfo.houseSights==5}">高尔夫球场</c:if><c:if test="${houseInfo.houseSights==6}">体育馆</c:if><c:if test="${houseInfo.houseSights==7}">市政休闲广场</c:if><c:if test="${houseInfo.houseSights==8}">大学</c:if></li>
                <li><font>户型：</font>${houseInfo.houseStructureType}平</li>
                <li class="font2"><span>${houseInfo.houseAttenttionCnt}</span> 关注度/ <span>${houseInfo.houseCommentCnt}</span> 评论数</li>
                <span id="imgfont"><img src="images/hwlp.gif" /><font>&nbsp;&ndash;${houseInfo.fcSysArea.areaDesc}</font></span>
               	<p>${fn:substring(houseInfo.houseDesc,0,46)}
               			<c:if test="${fn:length(houseInfo.houseDesc) > 46}">
	                    	...
	                    </c:if><a href="getHouseInfoById?houseId=${houseInfo.houseId }">[详细]</a></p>
	   		</ul>
	   </div>
	 </div>  
 	</c:forEach>
 	        <div id="page"></div>
   </div>
  
 
	 <!--尾部-->
	<div class="footBorder">
	<div class="foot" >
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
    </div>
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
        	Copyright ? 2011 www.funlifun.com Corporation, All Rights Reserved<br />
            房立方用户服务、信息咨询、技术支持、客服服务热线：0755-61355288
        </span>
    </div>
</div>
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
