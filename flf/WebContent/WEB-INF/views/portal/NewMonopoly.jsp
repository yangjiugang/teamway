<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新房专卖</title>
<link rel="stylesheet" type="text/css" href="css/portal/index.css" />
<link rel="stylesheet" type="text/css" href="css/portal/imageslide.css" />
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />
<link rel="stylesheet" type="text/css" href="js/multiselect/multiSelect.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript" src="js/multiselect/multiSelect.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/map.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
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
        left:'-'+558*curIndex+'px'
    },600);
	
	curIndex++;
	if(curIndex==$("#ul1").find("li").length){
		$("#ul1").animate({
            right:'-'+558*curIndex+'px'
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
	$("#page").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage});
	
//	$.multiSelect("houseSights", " 景观", {title:"请选择景观",width:400,datas:Constant.view});
	$.multiSelect("traffic", " 交通", {titleImg:"images/jiaotong.png",width:520,datas:Constant.traffic});
		$.multiSelect("school", " 学区", {titleImg:"images/xuequ.png",width:520,datas:Constant.school});
		$.multiSelect("hospital", " 医疗", {titleImg:"images/yiliao.png",width:520,datas:Constant.hospital});
		$.multiSelect("live", " 生活设施", {titleImg:"images/shenghuo.png",width:420,datas:Constant.live});
	/*
	var city = eval(Constant.city);
	for(var i=0;i<city.length;i++){
		$("#selectArea").append("<li><a href='javascript:getCity(\"" + city[i].text + "\",\""+city[i].id+"\",\"areaId\")'>" + city[i].text + "</a></li>");
	}*/
	
	$("#areaId").htmlSelect({defVal:'城市',data:Constant.city} );
	$("#houseProperties").htmlSelect({defVal:'地产性质',data:Constant.temperament} );
	$("#price_").htmlSelect({defVal:'价格区间',width:130,data:Constant.price,clickFn:getPriceValue} );
	$("#area_").htmlSelect({defVal:'面积区间',data:Constant.area,clickFn:getAreaValue} );
	$("#houseStructureType").htmlSelect({defVal:'房屋类型',data:Constant.housetype} );
	$("#houseDecorations").htmlSelect({defVal:'房屋装修',data:Constant.fitment} );
	$("#houseBuildProcess").htmlSelect({defVal:'建筑情况',data:Constant.build} );
	$("#houseSaleEvent").htmlSelect({defVal:'营销活动',data:Constant.activity} );
	$("#houseSights").htmlSelect({defVal:'景观',data:Constant.view} );
});
function goPage(curPage, pageSize) {
	window.location.href="${pageContext.request.contextPath}/newmonopoly?curPage=" + curPage + "&pageSize=" + pageSize;
}
function getAreaValue(id) {
	if(typeof(id) == 'undefined' ){return;}
	var arr = id.split('-');
	$("#queryform #houseArea").empty();
	$("#queryform #houseArea").append("<input type='hidden' name='houseMinArea' value=" + arr[0] + " />");
	$("#queryform #houseArea").append("<input type='hidden' name='houseMaxArea' value=" + arr[1] + " />");
}
function getPriceValue(id){
	if(typeof(id) == 'undefined' ){return;}
	var arr = id.split('-');
	$("#queryform #price").empty();
	$("#queryform #price").append("<input type='hidden' name='housePrice' value=" + arr[0] + " />");
	$("#queryform #price").append("<input type='hidden' name='priceMax' value=" + arr[1] + " />");
}
</script>

</head>

<body>
<%@ include file="Header.jsp" %>
<div class="middle">
	<div class="flash">
        <ul class="ZMFlsahleft">
        	<li class="leftFont"><h1>新盘上市时间表</h1></li>
        	<c:forEach items="${newHouses}" var="new" varStatus="index">
        		<c:if test="${index.index!=5}">
		            <li><a href="getHouseInfoById?houseId=${new.houseId }">${new.houseName }&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${new.houseInfoDetail.houseOpenDate}" type="date"/></a></li>
		        </c:if>
		        <c:if test="${index.index==5}">
		            <li style="border:none;"><a href="getHouseInfoById?houseId=${new.houseId }">${new.houseName }&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${new.houseInfoDetail.houseOpenDate}" type="date"/></a></li>
		        </c:if>
            </c:forEach>
        </ul>
        <!-- <div class="ZMFlashmiddle"><img src="images/xfzmFlash.jpg" /></div> -->
        <div id="ZMFlash_right" class="flashLeft" style="width: 558px;height: 264px;float: left;margin-left:5px;" >
			<div class="slides_box" style="width: 558px;height: 264px;">
				<ul id="ul1" style="width: 2790px">
					<c:forEach items="${Advertisements}" var="atm" varStatus="index">
						<li><a href="getHouseInfoById?houseId=${atm.adUrlId}" title="${atm.hostIp }"><img src="${atm.adPath}" style="width: 558px;height: 264px;" alt="slideshow_large"/></a>
							<input id="h_id_${index.index }" value="${atm.adUrlId}" type="hidden"/>
							<input id="pic_${index.index }" value="${atm.adDescPic}" type="hidden"/>
							<input id="att_${index.index }" value="${atm.houseInfo.houseAttenttionCnt}" type="hidden"/>
							<input id="coll_${index.index }" value="${atm.houseInfo.houseCollectCnt}" type="hidden"/>
						</li>
					</c:forEach>
				</ul>
			</div>
			  	
			<div class="flash_box" style="width: 558px;" >
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
    <form name="queryform" id="queryform" action="searchHouses" method="post">
   	<input type="hidden" name="isExpand" value="none" />
   	<input type="hidden" name="selected" id="selected" value="" />
   	<div id="houseArea"></div>
    <div id="price"></div>
    <div class="SelectOut">
    	<span class="selectLeft"><img src="images/SearchImg.jpg" /></span>
        <span class="selectRight">
          <div class="single" style="margin-left:9px;">
          		<!-- 
          		<span><input type="text" id="city" name="city" onfocus="showBox('areaDiv')" value=" 目标城市"></span>
          		 -->
          		<input class="Y01homeSOSOinput" type="text" id="areaId" />
          		 
                <input class="Y01homeSOSOinput" type="text" id="houseProperties" />
                
                <input class="Y01homeSOSOinput" type="text" id="price_"  />
                
                <input class="Y01homeSOSOinput" type="text" id="area_"  />
                
                <input class="Y01homeSOSOinput" type="text" id="houseStructureType"  />
                
                <input class="Y01homeSOSOinput" type="text" id="houseDecorations" />     
                
                <input class="Y01homeSOSOinput" type="text" id="houseBuildProcess" />
                
                <input class="Y01homeSOSOinput" type="text" id="houseSaleEvent" />

          </div>
          <div class="multiple">
          	<!-- 
             <input type="text" value=" 景观" id="houseSights" />
              -->
             <input type="text" class="Y01homeSOSOinput" id="houseSights" />
             <input type="text" value=" 交通" id="traffic" />
             <input type="text" value=" 学区" id="school" />
             <input type="text" value=" 医疗" id="hospital" />
             <input type="text" value=" 生活设施" id="live" />
             <input type="text" value="请输入关键词" onclick="this.select();" name="houseName" class="selectText"/>
             <a href="javascript:document.queryform.submit()">
             	<img  src="images/seachBut1.jpg" class="selectBut" style="margin-left:7px;_margin-left:0px;"/>
             </a>
           </div>
        </span>
    </div>
    </form>
    
    <div class="NewExhibition">
    	<h1>最新楼盘展示</h1>
        <ul>
        	<c:forEach items="${newHouseList }" var="house">
        	<li>    
            	<span class="ExhibitionLeft"><a href="getHouseInfoById?houseId=${house.houseId}" target="_blank"><img src="${house.housePic }" width="288" height="180" /></a></span>
                <span class="ExhibitionRight">
                  <div style="overflow:hidden;">
                	<ul class="Details">
                    	<li><a href="getHouseInfoById?houseId=${house.houseId}" target="_blank"><span>楼盘名称：</span><font>${house.houseName }</font></a></li>
                        <li><span>价格：</span>${house.housePrice }元/平</li>
                        <li><span>户型：</span>${house.houseMinArea }-${house.houseMaxArea }平</li>
                        <li class="font2"><font>${house.houseAttenttionCnt }</font> 关注度/ <font>${house.houseCommentCnt }</font> 评论数</li>
                    </ul>
                	<span class="ERImg"><a href="getHouseInfoById?houseId=${house.houseId}" target="_blank"><img src="${house.houseLogo }"/>中粮集团</a></span>
                  </div> 
                   <span class="font1"><img  src="images/line.jpg" />&nbsp;&ndash;${house.businessRegion } &ndash;${house.belongToRegion }</span>
                    <p>
                   	${fn:substring(house.houseDesc,0,43)}
	                    <c:if test="${fn:length(house.houseDesc) > 43}">
	                    	...
	                    </c:if>
	                   <a href="getHouseInfoById?houseId=${house.houseId}" target="_blank">[详细]</a></p>
                    </p>
                </span>
                <div class="dian"></div>
            </li>
            </c:forEach>
        </ul>
        <div id="page"></div>
    </div>
    <div class="Idebar">
    	<div class="bannerBoder"><a href="lifang/index.html"><img src="images/Banner2.jpg" /></a></div>
        <div class="SymbianOut">
        	<h2>房秘书关注榜<font>>></font></h2>
            <span class="topfont">
                <span class="name">楼盘名称</span><span class="message">| &nbsp;&nbsp;价格 &nbsp;&nbsp;|</span><span class="price"> 人气</span>
                <div class="dian"></div>
            </span>
            <c:forEach items="${fangMishuAttentions }" var="houseInfo">
            <ul>
            	<li>
            	<a href="getHouseInfoById?houseId=${houseInfo.houseId}" target="_blank">
            		<img src="images/Triangle.gif" />
            		<span class="name1">${houseInfo.houseName }</span><span class="price1">${houseInfo.housePrice }</span><span class="price2">${houseInfo.houseAttenttionCnt}</span></a>
                	<div class="dian"></div>
                </li>
            </ul>
            </c:forEach>
        </div>
        <div class="bannerBoder"><a href="lifang/index.html"><img src="images/Map.jpg" /></a></div>
        <div class="SymbianOut">
        	<h2>您最近浏览过的楼盘<font>>></font></h2>
            <span class="topfont">
                <span class="name">楼盘名称</span><span class="message">| &nbsp;&nbsp;价格&nbsp;&nbsp;  |</span><span class="price"> 人气</span>
                <div class="dian"></div>
            </span>
            <ul>
            	<c:forEach items="${history }" var="house">
            	<li><a href="getHouseInfoById?houseId=${house.houseId}" target="_blank"><img src="images/Triangle.gif" /><span class="name1">${house.houseName }</span><span class="price1">${house.housePrice }</span><span class="price2">${house.houseAttenttionCnt }</span></a>
                	<div class="dian"></div>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="bannerBoder"><a href="lifang/index.html"><img src="images/Banner3.jpg" /></a></div>
        <c:if test="${VISITOR_ID!=null }">
        <div class="SymbianOut">
        	<h2>您收藏的楼盘<font>>></font></h2>
            <span class="topfont">
                <span class="name">楼盘名称</span><span class="message">| &nbsp;&nbsp;价格 &nbsp;&nbsp;|</span><span class="price"> 人气</span>
                <div class="dian"></div>
            </span>
            <ul>
            	<c:forEach items="${collectHouses }" var="house">
            	<li><a href="getHouseInfoById?houseId=${house.houseId}" target="_blank"><img src="images/Triangle.gif" /><span class="name1">${house.houseName }</span><span class="price1">${house.housePrice }</span><span class="price2">${house.houseAttenttionCnt }</span></a>
                	<div class="dian"></div>
                </li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </div>
    
    <div class="popup" id="areaDiv" style="display:none; background-color:#FFF;position:absolute;z-index:1000;"
>
    	<h2><font style="float:left;">请选择地区</font> <a href=""><font>[确认]</font></a></h2>
       	<span class="popupList">
        	<font>请选择地区1</font>
        	<ul>
            	<li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
                <li><a href="">请选择地区</a></li>
            </ul>
            <span><a href="">全选</a></span>
        </span>
    </div>
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
