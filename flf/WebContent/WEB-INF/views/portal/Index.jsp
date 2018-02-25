<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>房地产门户-房立方</title>

<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />
<link rel="stylesheet" type="text/css" href="js/multiselect/multiSelect.css" />
<link rel="stylesheet" type="text/css" href="css/portal/index.css" />
<link rel="stylesheet" type="text/css" href="css/portal/index3.css" />
<link rel="stylesheet" type="text/css" href="css/portal/imageslide.css" />

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript" src="js/multiselect/multiSelect.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/map.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
//		$.multiSelect("houseSights", " 景观", {title:"请选择景观",width:400,datas:Constant.view});
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
	
	function showAndHide(obj,types){
	var Layer = window.document.getElementById(obj);
		switch (types) {
		case "show":
			Layer.style.display = "block";
			break;
		case "hide":
			Layer.style.display = "none";
			break;
		}
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
	
	function getCity(city,id){
		closeBox("areaDiv");
		$("#city").val(" "+city);
		$("#queryform #city").empty();
		$("#queryform #city").append("<input type='hidden' name='areaId' id='areaId' value=" + id + " />");
		map.put('city', city);
		getSelectedValue();
	}
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
        left:'-'+708*curIndex+'px'
    },600);
	
	curIndex++;
	if(curIndex==$("#ul1").find("li").length){
		$("#ul1").animate({
            right:'-'+708*curIndex+'px'
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
<%@ include file="Header.jsp" %>

    <div class="middle">
	<div class="flash">
        <div id="flash_Left" class="flashLeft" style="position:relative;" >
			<div class="slides_box" style="width: 708px;height: 264px;">
				<ul id="ul1" style="width: 3540px">
					<c:forEach items="${Advertisements}" var="atm">
						<li><a href="#" title="${atm.hostIp }"><img src="${atm.adPath}" style="width: 708px;height: 264px;" alt="slideshow_large"/></a></li>
					</c:forEach>
				</ul>
			</div>
			  	
			<div class="flash_box">
			  	<span class="one"  onmouseover="show(0);" onmouseout="continueSlide();"></span>
			  	<span class="two" onmouseover="show(1);" onmouseout="continueSlide();"></span>
			  	<span class="three" onmouseover="show(2);" onmouseout="continueSlide();"></span>
			  	<span class="four" onmouseover="show(3);" onmouseout="continueSlide();"></span>
			  	<span class="five" onmouseover="show(4);" onmouseout="continueSlide();"></span>
			</div>
		</div>

        <div class="flashRight">	
        	<div class="flashImg1"><form><a href="monopolyofsaleM2.html"><img src="images/flashrightImg1.jpg" /></a></form></div>
            <div class="flashImg2">
            <form>
            	<input type="image" src="images/flashrightImg2.jpg" style="float:left; margin-left:28px;"/>
            </form>
            &nbsp;<a href="">我没有加入,现在注册</a>
            </div>
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
    <div class="banner"><img src="images/Banner1.jpg" /></div>
    
    <div class="NewExhibition1">
      <div class="Housing1">
          <h3>房秘书推荐榜</h3>
          <span class="topfont">
                <span class="name">楼盘名称</span><span class="font3">|</span><span class="price">价格</span><span class="font3">|</span><span class="price">人气</span>
                <div class="dian"></div>
            </span>
            <ul>
            	<c:forEach items="${attentionHouseInfos }" var="houseInfo">
            	<li><a href="getHouseInfoById?houseId=${houseInfo.houseId}" target="_blank"><img src="images/Triangle.gif" /><span class="name1">${houseInfo.houseName }</span><span class="price1">${houseInfo.housePrice }</span><span class="price2">${houseInfo.userRecommendCnt }</span></a>
                	<div class="dian"></div>
                </li> 
                </c:forEach>
            </ul>
      </div>
      <div class="Housing2">
      	  <h3>大家关注的楼盘</h3>
          <span class="topfont">
                <span class="name">楼盘名称</span><span class="font3">|</span><span class="price">价格</span><span class="font3">|</span><span class="price">人气</span>
                <div class="dian"></div>
            </span>
            <ul>
            	<c:forEach items="${everyoneAttentions }" var="houseInfo">
            	<li><a href="getHouseInfoById?houseId=${houseInfo.houseId}" target="_blank"><img src="images/Triangle.gif" /><span class="name1">${houseInfo.houseName }</span><span class="price1">120000</span><span class="price2">${houseInfo.houseAttenttionCnt }</span></a>
                	<div class="dian"></div>
                </li> 
                </c:forEach>
            </ul>
      </div>
      <!-- 
      <div class="Housing2">
      	  <h3>大家在买的楼盘</h3>
          <span class="topfont">
                <span class="name">楼盘名称</span><span class="font3">|</span><span class="price">价格</span>
                <div class="dian"></div>
            </span>
            <ul>
            	<li><a href=""><img src="images/Triangle.gif" /><span class="name1">钓鱼台七号院</span><span class="price1">120000</span></a>
                	<div class="dian"></div>
                </li> 
                <li><a href=""><img src="images/Triangle.gif" /><span class="name1">钓鱼台七号院</span><span class="price1">120000</span></a>
                	<div class="dian"></div>
                </li> 
                <li><a href=""><img src="images/Triangle.gif" /><span class="name1">钓鱼台七号院</span><span class="price1">120000</span></a>
                	<div class="dian"></div>
                </li> 
            </ul>
      </div>-->
    </div>
     
    <div class="Idebar">
      <div class="SymbianOut" id="event">
        	<h2><a href="">房立方主题会所本周活动<font>>></font></a></h2>
            <span class="topfont">
                <span class="name">活动名称</span><span class="font3">|</span><span class="time">时间</span>
                <div class="dian"></div>
            </span>
            <ul>
            	<c:forEach items="${weekActivitys }" var="week">
            	<li><a href=""><img src="images/Triangle.gif" /><span class="name1">${week.eventTitle }</span><span class="time1"><fmt:formatDate value="${week.eventStartTime  }" pattern="yyyy-MM-dd" /></span></a>
                	<div class="dian"></div>
                </li> 
                </c:forEach>
            </ul>
         </div>
    </div>

    <div class="NewExhibition">
    	<h1>最新上市</h1>
        <ul>
        	<c:forEach items="${homeInfoNewHouseList}" var="info">
        		<c:if test="${info.showType == 1 || info.showType == 4}">
        			<li>    
		            	<span class="ExhibitionLeft"><a href="getHouseInfoById?houseId=${info.obj.houseId}" target="_blank"><img src="${info.obj.housePic }" width="288" height="180"  /></a></span>
		                <span class="ExhibitionRight">
		                  <div style="overflow:hidden;">
		                	<ul class="Details">
		                    	<li><a href="getHouseInfoById?houseId=${info.obj.houseId}" target="_blank"><span>楼盘名称：</span><font>${info.obj.houseName }</font></a></li>
		                        <li><span>价格：</span>${info.obj.housePrice }元/平</li>
		                        <li><span>户型：</span>${info.obj.houseMinArea }-${info.obj.houseMaxArea}平</li>
		                        <li class="font2"><font>${info.obj.houseAttenttionCnt }</font> 关注度/ <font>${info.obj.houseCommentCnt }</font> 评论数</li>
		                    </ul>
		                	<span class="ERImg"><a href="getHouseInfoById?houseId=${info.obj.houseId}" target="_blank"><img src="${info.obj.houseLogo }" />${info.obj.houseDevelopersName }</a></span>
		                  </div> 
		                   <span class="font1"><img  src="images/regie.jpg" />&nbsp;&ndash;${info.obj.businessRegion } &ndash;${info.obj.belongToRegion }</span>
		                    <p>
		                    ${fn:substring(info.obj.houseDesc,0,43)}
		                    <c:if test="${fn:length(info.obj.houseDesc) > 43}">
		                    	...
		                    </c:if>
		                    <a href="getHouseInfoById?houseId=${info.obj.houseId}" target="_blank">[详细]</a></p>
		                </span>
		                <div class="dian"></div>
	            	</li>
        		</c:if>
        		<c:if test="${info.showType == 2}">
		             <li>    
		            	<div class="goufangtuan1">
		                	<span class="GFTleft"><a href="TravelInfo?houseGroupId=${info.obj.houseGroupId }" target="_blank"><img src="${info.obj.picPath }" width="288" height="180"  /></a></span>
		                <span class="GFTright">
		                	<div style="overflow:hidden;">
		                	<span class="GFTRleft">
		                    	<a href="TravelInfo?houseGroupId=${info.obj.houseGroupId }" target="_blank"><h3>${info.obj.groupName}</h3></a>
		                        <font>参团价格：</font><font color="ad050a">${info.obj.groupPrice }元</font><br />
		                        <font>淘房历程：</font>${info.obj.groupDuration}<br />
		                        <font>发团时间：</font>2${info.obj.groupStartDate }<br />
		                        <font>报名截止时间：</font>${info.obj.groupDeadlineDate }<br />
		                        <font>全国电话报名热线：</font>${info.obj.groupHotline }<br />
		                    </span>
		                    <span class="GFTRright"><a href="TravelInfo?houseGroupId=${info.obj.houseGroupId }" target="_blank"><input type="image" src="images/ProductsDescripition.jpg" /></a><font>${info.obj.attentionCnt }</font>人关注/<font>${info.obj.joinCnt }</font>人加入</span>
		                   </div> 
		                    <span id="imgfont"><img src="images/line.jpg" /><font>&nbsp;&ndash;${info.obj.groupLineDesc }</font></span>
		                    <p><font>旅游购房团：</font>
		                    ${fn:substring(info.obj.groupDesc,0,43)}
		                    <c:if test="${fn:length(info.obj.groupDesc) > 43}">
		                    	...
		                    </c:if>
		                    <a href="TravelInfo?houseGroupId=${info.obj.houseGroupId }" target="_blank">[详细]</a></p>
		              </span>
		              <div class="dian"></div>
		                </div>
		            </li>
        		</c:if>
        	</c:forEach>
        </ul>
    </div>
    <div class="Idebar" style="margin-top:10px;">
    	<div class="bannerBoder"><img src="images/Banner2.jpg" /></div>
        <div class="SymbianOut">
        	<h2>您最近浏览过的楼盘<font>>></font></h2>
            <span class="topfont">
                <span class="name">楼盘名称</span><span class="font3">|</span><span class="price">价格</span><span class="font3">|</span><span class="price"> 人气</span>
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
        <div class="bannerBoder"><img src="images/Map.jpg" /></div>
        <c:if test="${VISITOR_ID!=null }">
        <div class="SymbianOut">
        	<!--  -->
        	<h2>您收藏的楼盘<font>>></font></h2>
            <span class="topfont">
                <span class="name">楼盘名称</span><span class="font3">|</span><span class="price">价格</span><span class="font3">|</span><span class="price"> 人气</span>
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
        <div class="bannerBoder"><img src="images/Banner3.jpg" /></div>
        <c:if test="${VISITOR_ID!=null }">
        <div class="SymbianOut">
        	<h2>您最近了解过得房秘书<font>>></font></h2>
        	<c:forEach items="${skimUsers }" var="skimUser">
	         <div class="fangmi">
	          <dl>
	            <img src="${skimUser.photoPath }" border="0" />
	            <dd>${skimUser.name}</dd>
	            <dd><span>常住地：${skimUser.userCity}</span><span>关注人数：${skimUser.bhri}</span></dd>
	            <dd>擅长楼盘：${skimUser.userSkills}</dd>
	          </dl>
	        </div>
         </c:forEach>
    	</div>
    	</c:if>
    <div class="popup" id="areaDiv" style="display:none;background-color:#FFF;position:absolute;z-index:1000;">
    	<h2><font style="float:left;cursor:default">请选择地区</font> <a href="javascript:closeBox('areaDiv')"><font>[关闭]</font></a></h2>
       	<span class="popupList">
        	<font>请选择地区1</font>
        	<ul id="selectArea">
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        		<li><a href='#'>广州</a></li>
        	</ul>
            <span><a href="javascript:getCity('不限')">不限</a></span>
        </span>
    </div>
    </div>
<%@ include file="Footer.jsp" %>
</body>
<script type="text/javascript">
		var error = '${errorMsg}';
		if(error != '' )alert(error);
</script>
</html>