<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>旅游购房</title>
<link rel="stylesheet" type="text/css" href="css/portal/Y01home.css"/>
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />

<link rel="stylesheet" type="text/css" href="css/portal/layout.css" />
<link rel="stylesheet" type="text/css" href="css/portal/index.css" />
<link rel="stylesheet" type="text/css" href="css/portal/hotline.css" />
<link rel="stylesheet" type="text/css" href="css/portal/imageslide.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>

<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript">
function showAndHide(obj,types){
	var Layer=window.document.getElementById(obj);
	switch(types){
		case "show":
			Layer.style.display="block";
		break;
		case "hide":
			Layer.style.display="none";
		break;
	}
}
function getValue(obj,str){
var input=window.document.getElementById(obj);
input.value=str;
}

$(document).ready(function(){
	var curPage = ${curPage};
	var pageCount = ${pageCount};
	$("#page").pager({curPage:curPage, pageSize:8, pageCount:pageCount, goPageCall:goPage});
});

function goPage(curPage, pageSize) {
	window.location.href = "${pageContext.request.contextPath}/hotline?curPage="+curPage+"&pageSize="+pageSize;
}

$(document).ready(function(){
	$("#groupDuration").htmlSelect({defVal:"行程时间",absolute:false,data:Constant.journey} );
	$("#grouptime").htmlSelect({defVal:"发团日期",absolute:false,data:Constant.grouptime} );
	$("#groupLineDesc").htmlSelect({defVal:"目的地",absolute:false,data:Constant.destination} );
	$("#housePurpose").htmlSelect({defVal:"购房目的",absolute:false,data:Constant.buytoletpurpose} );
	$("#houseProperties").htmlSelect({defVal:"房产性质",absolute:false,data:Constant.houseproperty} );
	$("#lineProperties").htmlSelect({defVal:"线路性质",absolute:false,data:Constant.lineproperty} );
});

</script>
<script type="text/javascript">
//当前图片编号
var curIndex = 1;
//时间间隔 单位毫秒
var timeInterval = 3000;
//启动图片滑动
var v=setInterval(slide, timeInterval);
function slide(){
	for(var sta=0;sta<5;sta++){
	 $(".flash_box").children("span").eq(sta).css("background","url(images/carousel_circle_"+(sta+1)+"1.png)");
	}
	$(".flash_box").children("span").eq(curIndex).css("background","url(images/carousel_circle_"+(curIndex+1)+"2.png)");
	$("#ul1").animate({
        left:'-'+610*curIndex+'px'
    },600);
	
	curIndex++;
	if(curIndex==$("#ul1").find("li").length){
		$("#ul1").animate({
            right:'-'+610*curIndex+'px'
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
</script>

</head>

<body>
<!--头部-->
<%@ include file="Header.jsp" %>
<!--End头部-->
<div class="middle">
	<div class="flash">
        <ul class="ZMFlsahleft">
        	<li class="leftFont"><h1 style="width:110px;">最近出团公告</h1><font><a href="">>></a></font></li>
        		<c:forEach items="${newGroups}" var="group" varStatus="index">
        			<c:if test="${index.index!=5}">
		            	<li><a href="TravelInfo?houseGroupId=${group.houseGroupId }">${group.groupName}&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${group.groupStartDate }" type="date"/></a></li>
		            </c:if>
		            <c:if test="${index.index==5}">
		            	<li style="border:none;"><a href="TravelInfo?houseGroupId=${group.houseGroupId}">${group.groupName }&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${group.groupStartDate }" type="date"/></a></li>
		            </c:if>
            </c:forEach>
        </ul>
      <div id="ZMFlash_right" class="flashLeft" style="width: 610px;height: 265px; float: left;position:relative;" >
			<div class="slides_box" style="width: 610px;height: 265px;">
				<ul id="ul1" style="width: 3050px">
					<c:forEach items="${Advertisements}" var="atm">
						<li><a href="TravelInfo?houseGroupId=${atm.adUrlId }" title="${atm.hostIp }"><img src="${atm.adPath}" style="width: 610px;height: 265px;" alt="slideshow_large"/></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="flash_box" style="width: 610px;" >
			  	<span class="one"  onmouseover="show(0);" onmouseout="continueSlide();"></span>
			  	<span class="two" onmouseover="show(1);" onmouseout="continueSlide();"></span>
			  	<span class="three" onmouseover="show(2);" onmouseout="continueSlide();"></span>
			  	<span class="four" onmouseover="show(3);" onmouseout="continueSlide();"></span>
			  	<span class="five" onmouseover="show(4);" onmouseout="continueSlide();"></span>
			</div>
		</div>
        <div class="ZMFlashright">
        
        	<h3>线路套餐搜索</h3>
        	
            <div class="single">
            <form method="post" id="search" action="search" name="search">
          		<span>
          			<input type="text" id="groupDuration" value="">          		
          		</span>
                <span><input type="text" id="grouptime" value="">
              </span>
                <span><input type="text" id="groupLineDesc" value="">
              </span>     
                <span><input type="text" id="housePurpose" value="">
              </span>
                <span><input type="text" id="houseProperties" value="">
              </span>
                <span><input type="text" id="lineProperties" value="">
              </span>
          </div>
          <a href="javascript:document.search.submit()"><img src="images/seachline.jpg" class="But1"/></a></form>
          
        </div>
    </div>
    
    <div class="SelectOut">
    	<span class="selectLeft"><img src="images/hotline.jpg" /></span>
        <ul class="selectRight">
        <c:forEach items="${hotlineRecommends }" var="hotLineRecommend" varStatus="num" step="1" end="3" begin="0">
         <c:if test="${num.last}">         	
         		<li style="border-right:#0566aa 1px solid;"><a href="TravelInfo?houseGroupId=${hotLineRecommend.houseGroupId }">${hotLineRecommend.groupName }</a></li>
         </c:if>
         <c:if test="${num.count %4!=0}">         
          	<li><a href="TravelInfo?houseGroupId=${hotLineRecommend.houseGroupId }">${hotLineRecommend.groupName }</a></li>
          </c:if>
         </c:forEach>
        </ul>
        <ul class="selectRight" style="margin-top:5px;">
        <c:forEach items="${hotlineRecommends }" var="hotLineRecommend1" varStatus="num1" step="1" begin="4">
        	<c:if test="${num1.last}">
        		<li style="border-right:#0566aa 1px solid;"><a href="TravelInfo?houseGroupId=${hotLineRecommend1.houseGroupId }">${hotLineRecommend1.groupName }</a></li>
        	</c:if>
        	<c:if test="${num1.count %4!=0}">         
          		<li><a href="TravelInfo?houseGroupId=${hotLineRecommend1.houseGroupId }">${hotLineRecommend1.groupName }</a></li>
            </c:if>
        </c:forEach>
        </ul>
    </div>

    <div class="NewExhibition">
    	<h1>最新线路套餐</h1>
        <ul class="goufangtuan">
        <c:forEach items="${lineSetMealList }" var="groupLine">
        	<li>    
                <span class="GFTleft"><a href="TravelInfo?houseGroupId=${groupLine.houseGroupId }"><img src="${groupLine.picPath}" /></a></span>
                <span class="GFTright">
                	<div style="overflow:hidden;">
                	<span class="GFTRleft">
                    	<a href="TravelInfo?houseGroupId=${groupLine.houseGroupId }"><h3>${groupLine.groupName }</h3></a>
                        <font>参团价格：</font><font color="ad050a">${groupLine.groupPrice }元</font><br />
                        <font>淘房历程：</font>${groupLine.groupDuration }<br />
                        <font>发团时间：</font><fmt:formatDate value="${groupLine.groupStartDate }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
                        <font>报名截止时间：</font><fmt:formatDate value="${groupLine.groupDeadlineDate }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
                        <font>全国电话报名热线：</font>${groupLine.groupHotline }<br />
                    </span>
                    <span class="GFTRright"><a href="TravelInfo?houseGroupId=${groupLine.houseGroupId }"><form><input type="image" src="images/ProductsDescripition.jpg" /></form></a><font>${groupLine.attentionCnt }</font>人关注/<font>${groupLine.joinCnt }</font>人加入</span>
                   </div> 
                    <span id="imgfont"><img src="images/line.jpg" /><font>&nbsp;&ndash;&nbsp;${groupLine.groupLineDesc }</font></span>
                    <p><font>旅游购房团：</font>${fn:substring(groupLine.groupDesc,0,46) }
                    	<c:if test="${fn:length(groupLine.groupDesc) > 46}">
	                    	...
	                    </c:if><a href="TravelInfo?houseGroupId=${groupLine.houseGroupId }">[详细]</a></p>
              </span>
              <div class="dian"></div>
            </li> 
          </c:forEach>
        </ul>
        <div id="page">
</div>
    </div>
    <div class="Idebar">
    	<div class="bannerBoder"><a href="line.html"><img src="images/Banner2.jpg" /></a></div>
        <div class="SymbianOut">
        	<h2><a href="">房秘书关注路线<font>>></font></a></h2>
            <span class="topfont">
                <span class="name">路线名称</span><span class="price"> 发团时间</span>
                <div class="dian"></div>
            </span>
            <ul>
            <c:forEach items="${economicManHouseGroup }" var="houseGroup">            	
                <li><a href=""><img src="images/Triangle.gif" /><span class="name1">${houseGroup.groupName }</span><span class="price1"><fmt:formatDate value="${houseGroup.groupStartDate }" pattern="yyyy-MM-dd "/></span></a>
                	<div class="dian"></div>
                </li>
            </c:forEach>                
             <c:if test="${fn:length(economicManHouseGroup) ==0}">
            	您还没有房秘书或您还没有登陆!
            </c:if>
            </ul>
        </div>
        <div class="bannerBoder"><a href="line.html"><img src="images/Map.jpg" /></a></div>
        <div class="SymbianOut">
        	<h2><a href="">您最近浏览过的购房旅游团<font>>></font></a></h2>
            <span class="topfont">
                <span class="name">路线名称</span><span class="price"> 发团时间</span>
                <div class="dian"></div>
            </span>
            <ul>
            <c:forEach items="${browsers }" var="group">
            	<li><a href="TravelInfo?houseGroupId=${group.houseGroupId }"><img src="images/Triangle.gif" /><span class="name1">${group.groupName }</span><span class="price1"><fmt:formatDate value="${group.groupStartDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span></a>
                	<div class="dian"></div>
                </li>
            </c:forEach>    
            </ul>
        </div>
        <div class="bannerBoder"><a href="line.html"><img src="images/Banner3.jpg" /></a></div>
        <div class="SymbianOut">
        	<h2><a href="">您收藏的购房旅游团<font>>></font></a></h2>
            <span class="topfont">
                <span class="name">路线名称</span><span class="price"> 发团时间</span>
                <div class="dian"></div>
            </span>
            <ul>
            <c:forEach items="${collectHotLine }" var="hotLine">
            	<li><a href="TravelInfo?houseGroupId=${hotLine.houseGroupId }"><img src="images/Triangle.gif" /><span class="name1">${hotLine.groupName }</span><span class="price1"><fmt:formatDate value="${hotLine.groupStartDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span></a>
                	<div class="dian"></div>
                </li>
            </c:forEach>
            <c:if test="${fn:length(collectHotLine) ==0}">
            	您还没有收藏购房旅游团或您还没有登陆
            </c:if>
            </ul>
        </div>
    </div>
    
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
        	Copyright © 2011 www.funlifun.com Corporation, All Rights Reserved<br />
            房立方用户服务、信息咨询、技术支持、客服服务热线：0755-61355288
        </span>
    </div>
</div>
</div>
<!--End尾部-->
</body>
</html>
