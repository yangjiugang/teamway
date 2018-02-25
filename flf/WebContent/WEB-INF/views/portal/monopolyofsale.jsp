<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>房立方-精准搜索</title>
<link rel="stylesheet" type="text/css" href="css/portal/layout.css" />
<link rel="stylesheet" type="text/css" href="css/portal/Y01home.css" />
<link rel="stylesheet" type="text/css" href="css/portal/index.css" />
<link rel="stylesheet" type="text/css" href="css/portal/monopolyofsale.css" />
<link rel="stylesheet" type="text/css" href="js/multiselect/multiSelect.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/map.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript" src="js/multiselect/multiSelect.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>

<style type="">
	.selected{}
</style>
<script type="text/javascript">
	var isExpand = '${isExpand}';
	var map = new Map();
	$(function(){
		
		$("#expand").click(function(){
			$("#isExpand").val("none");
			$("#yingcang").slideDown("slow");
			$("#expand").css({display:"none"});
			$("#retracting").css({display:"block"});
		});
		$("#retracting").click(function(){
			$("#isExpand").val("block");
			$("#yingcang").slideUp("slow");
			$("#retracting").css({display:"none"});
			$("#expand").css({display:"block"});
		});
		
		var curPage = ${curPage};
		var pageCount = ${pageCount};
		$("#page").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage});
	//	$("#page_up").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage});
			
		// 判断收缩
		if(isExpand == 'block' || isExpand == ''){
			$("#yingcang").hide();
			$("#expand").css({display:"block"});
			$("#retracting").css({display:"none"});
		}else{
			$("#yingcang").show();
			$("#expand").css({display:"none"});
			$("#retracting").css({display:"block"});
		}
		
		var traffics = new Array();
		var schools = new Array();
		var hospitals = new Array();
		var lives = new Array();
		for(var i=0;i<'${houseInfo.traffic}'.split(',').length;i++){
			var o = '${houseInfo.traffic}'.split(',')[i];
			if(o != '')
				traffics[i] = o;
		}
		for(var i=0;i<'${houseInfo.school}'.split(',').length;i++){
			var o = '${houseInfo.school}'.split(',')[i];
			if(o != '')
				schools[i] = o;
		}
		for(var i=0;i<'${houseInfo.hospital}'.split(',').length;i++){
			var o = '${houseInfo.hospital}'.split(',')[i];
			if(o != '')
				hospitals[i] = o;
		}
		for(var i=0;i<'${houseInfo.live}'.split(',').length;i++){
			var o = '${houseInfo.live}'.split(',')[i];
			if(o != '')
				lives[i] = '${houseInfo.live}'.split(',')[i];
		}
		$.multiSelect("traffic", " 交通", {titleImg:"images/jiaotong.png",width:520,datas:Constant.traffic,selectIds:traffics});
		$.multiSelect("school", " 学区", {titleImg:"images/xuequ.png",width:520,datas:Constant.school,selectIds:schools});
		$.multiSelect("hospital", " 医疗", {titleImg:"images/yiliao.png",width:520,datas:Constant.hospital,selectIds:hospitals});
		$.multiSelect("live", " 生活设施", {titleImg:"images/shenghuo.png",width:420,datas:Constant.live,selectIds:lives});
		// 城市
		var city = eval(Constant.city);
		for(var i=0;i<city.length;i++){
			if(city[i].id == '${houseInfo.areaId}'){
				$("#queryform #city").append("<input type='hidden' name='areaId' id='areaId' value=" + city[i].id + " />");
				$("#ulcity ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"city\",\"" + city[i].text + "\",\"" + city[i].id + "\",\"areaId\")'>" + city[i].text + "</a></li>");
			}else{
				$("#ulcity ul").append("<li><a href='javascript:getUrl(\"city\",\"" + city[i].text + "\",\"" + city[i].id + "\",\"areaId\")'>" + city[i].text + "</a></li>");
			}
			if(i == city.length - 1)
				$("#ulcity span").append("<a href='javascript:getUrl(\"city\",\"不限\",0,\"areaId\")'>不限</a>");
		}
		
		// 地产性质
		var type = eval(Constant.temperament);
		for(var i=0;i<type.length;i++){
			if(type[i].id == '${houseInfo.houseProperties}'){
				$("#queryform #temperament").append("<input type='hidden' name='houseProperties' id='houseProperties' value=" + type[i].id + " />");
				$("#ultype ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"temperament\",\"" + type[i].text + "\",\"" + type[i].id + "\",\"houseProperties\")'>" + type[i].text + "</a></li>");
			}else{
				$("#ultype ul").append("<li><a href='javascript:getUrl(\"temperament\",\"" + type[i].text + "\",\"" + type[i].id + "\",\"houseProperties\")'>" + type[i].text + "</a></li>");
			}
			if(i == type.length - 1)
				$("#ultype span").append("<a href='javascript:getUrl(\"temperament\",\"不限\",0,\"houseProperties\")'>不限</a>");
		}
		
		// 价格区间
		var price = eval(Constant.price);
		for(var i=0;i<price.length;i++){
			if(price[i].id == '${houseInfo.housePrice}'+'-'+'${houseInfo.priceMax}'){
				$("#queryform #price").append("<input type='hidden' name='housePrice' id='housePrice' value=" + price[i].id.split('-')[0] + " />");
				$("#queryform #priceMax").append("<input type='hidden' name='priceMax' id='priceMax' value=" + price[i].id.split('-')[1] + " />");
				$("#ulprice ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"price\",\"" + price[i].text + "\",\"" + price[i].id + "\",\"housePrice\")'>" + price[i].text + "</a></li>");
			}else{
				$("#ulprice ul").append("<li><a href='javascript:getUrl(\"price\",\"" + price[i].text + "\",\"" + price[i].id + "\",\"housePrice\")'>" + price[i].text + "</a></li>");
			}
			if(i == price.length - 1)
				$("#ulprice span").append("<a href='javascript:getUrl(\"price\",\"不限\",\"0-0\",\"housePrice\")'>不限</a>");
		}
		// 面积区间
		var area = eval(Constant.area);
		for(var i=0;i<area.length;i++){
			if(area[i].id == '${houseInfo.houseMinArea}'+'-'+'${houseInfo.houseMaxArea}'){
				$("#queryform #area").append("<input type='hidden' name='houseMinArea' id='houseMinArea' value=" + area[i].id.split('-')[0] + " />");
				$("#queryform #houseMaxArea").append("<input type='hidden' name='houseMaxArea' id='houseMaxArea' value=" + area[i].id.split('-')[1] + " />");
				$("#ularea ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"area\",\"" + area[i].text + "\",\"" + area[i].id + "\",\"houseMinArea\")'>" + area[i].text + "</a></li>");
			}else{
				$("#ularea ul").append("<li><a href='javascript:getUrl(\"area\",\"" + area[i].text + "\",\"" + area[i].id + "\",\"houseMinArea\")'>" + area[i].text + "</a></li>");
			}
			if(i == area.length - 1)
				$("#ularea span").append("<a href='javascript:getUrl(\"area\",\"不限\",\"0-0\",\"houseMinArea\")'>不限</a>");
		}
		// 房屋户型
		var housetype = eval(Constant.housetype);
		for(var i=0;i<housetype.length;i++){
			if(housetype[i].id == '${houseInfo.houseStructureType}'){
				$("#queryform #housetype").append("<input type='hidden' name='houseStructureType' id='houseStructureType' value=" + housetype[i].id + " />");
				$("#ulhousetype ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"housetype\",\"" + housetype[i].text + "\",\"" + housetype[i].id + "\",\"houseStructureType\")'>" + housetype[i].text + "</a></li>");
			}else{
				$("#ulhousetype ul").append("<li><a href='javascript:getUrl(\"housetype\",\"" + housetype[i].text + "\",\"" + housetype[i].id + "\",\"houseStructureType\")'>" + housetype[i].text + "</a></li>");
			}
			if(i == housetype.length - 1)
				$("#ulhousetype span").append("<a href='javascript:getUrl(\"housetype\",\"不限\",0,\"houseStructureType\")'>不限</a>");
		}
		// 建筑
		var build = eval(Constant.build);
		for(var i=0;i<build.length;i++){
			if(build[i].id == '${houseInfo.houseBuildProcess}'){
				$("#queryform #build").append("<input type='hidden' name='houseBuildProcess' id='houseBuildProcess' value=" + build[i].id + " />");
				$("#ulbuild ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"build\",\"" + build[i].text + "\",\"" + build[i].id + "\",\"houseBuildProcess\")'>" + build[i].text + "</a></li>");
			}else{
				$("#ulbuild ul").append("<li><a href='javascript:getUrl(\"build\",\"" + build[i].text + "\",\"" + build[i].id + "\",\"houseBuildProcess\")'>" + build[i].text + "</a></li>");
			}
			if(i == build.length - 1)
				$("#ulbuild span").append("<a href='javascript:getUrl(\"build\",\"不限\",0,\"houseBuildProcess\")'>不限</a>");
		}
		// 房屋装修
		var fitment = eval(Constant.fitment);
		for(var i=0;i<fitment.length;i++){
			if(fitment[i].id == '${houseInfo.houseDecorations}'){
				$("#queryform #fitment").append("<input type='hidden' name='houseDecorations' id='houseDecorations' value=" + fitment[i].id + " />");
				$("#ulfitment ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"fitment\",\"" + fitment[i].text + "\",\"" + fitment[i].id + "\",\"houseDecorations\")'>" + fitment[i].text + "</a></li>");
			}else{
				$("#ulfitment ul").append("<li><a href='javascript:getUrl(\"fitment\",\"" + fitment[i].text + "\",\"" + fitment[i].id + "\",\"houseDecorations\")'>" + fitment[i].text + "</a></li>");
			}
			if(i == fitment.length - 1)
				$("#ulfitment span").append("<a href='javascript:getUrl(\"fitment\",\"不限\",0,\"houseDecorations\")'>不限</a>");
		}
		// 活动区域
		var activity = eval(Constant.activity);
		for(var i=0;i<activity.length;i++){
			if(activity[i].id == '${houseInfo.houseSaleEvent}'){
				$("#queryform #activity").append("<input type='hidden' name='houseSaleEvent' id='houseSaleEvent' value=" + activity[i].id + " />");
				$("#ulactivity ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"activity\",\"" + activity[i].text + "\",\"" + activity[i].id + "\",\"houseSaleEvent\")'>" + activity[i].text + "</a></li>");
			}else{
				$("#ulactivity ul").append("<li><a href='javascript:getUrl(\"activity\",\"" + activity[i].text + "\",\"" + activity[i].id + "\",\"houseSaleEvent\")'>" + activity[i].text + "</a></li>");
			}
			if(i == activity.length - 1)
				$("#ulactivity span").append("<a href='javascript:getUrl(\"activity\",\"不限\",0,\"houseSaleEvent\")'>不限</a>");
		};
		// 景观
		var view = eval(Constant.view);
		for(var i=0;i<view.length;i++){
			if(view[i].id == '${houseInfo.houseSights}'){
				$("#queryform #view").append("<input type='hidden' name='houseSights' id='houseSights' value=" + view[i].id + " />");
				$("#ulview ul").append("<li><a class='selected' style='color:#FFF' href='javascript:getUrl(\"view\",\"" + view[i].text + "\",\"" + view[i].id + "\",\"houseSights\")'>" + view[i].text + "</a></li>");
			}else{
				$("#ulview ul").append("<li><a href='javascript:getUrl(\"view\",\"" + view[i].text + "\",\"" + view[i].id + "\",\"houseSights\")'>" + view[i].text + "</a></li>");
			}
			if(i == activity.length - 1)
				$("#ulview span").append("<a href='javascript:getUrl(\"view\",\"不限\",0,\"houseSights\")'>不限</a>");
		};
	}
	);
	
	function getUrl(type,value,id,property){
		map.remove(type);
		map.put(type, value);
		var keys = map.keys()+'';
		$("#queryform #" + type).empty();
		//解析面积
		if(type == 'area'){
			var arr = id.split('-');
			$("#queryform #houseMaxArea").empty();
			$("#queryform #" + type).empty();
			$("#queryform #" + type).append("<input type='hidden' name='"+property+"' id='"+property+"' value=" + arr[0] + " />");
			$("#queryform #houseMaxArea").append("<input type='hidden' name='houseMaxArea' id='houseMaxArea' value=" + arr[1] + " />");
		}//解析价格
		if(type == 'price'){
			var arr = id.split('-');
			$("#queryform #priceMax").empty();
			$("#queryform #" + type).empty();
			$("#queryform #" + type).append("<input type='hidden' name='"+property+"' id='"+property+"' value=" + arr[0] + " />");
			$("#queryform #priceMax").append("<input type='hidden' name='priceMax' id='priceMax' value=" + arr[1] + " />");
		}
		if(type != 'area' && type != 'price'){
			$("#queryform #" + type).append("<input type='hidden' name='"+property+"' id='"+property+"' value='" + id + "' />");
		}
		document.getElementById('queryform').submit();
	//	document.queryform.submit();
	}
	
	function goPage(curPage, pageSize) {
		$("#pagediv").append("<input type='hidden' name='pageSize' value=" + pageSize + " />");
		$("#pagediv").append("<input type='hidden' name='curPage' value=" + curPage + " />");
		document.queryform.submit();
	}
	
</script>
</head>

<body>
<!--头部-->
<%@ include file="Header.jsp" %>
<!--End头部-->
<div class="middle">
	<div style="margin-top:5px;"><img src="images/searchTop.png" /></div>
    <div class="Outboder">
    	<span>目标城市:</span>
        <div id="ulcity">
        	<ul></ul>
        	<span></span>
        </div>	
    </div>
    <div id="yingcang">
    	<form style="" name="queryform" id="queryform" method="post" action="searchHouses">
    	<div id="city"></div>
    	<div id="temperament"></div>
    	<div id="price"></div>
    	<div id="area"></div>
    	<div id="housetype"></div>
    	<div id="fitment"></div>
    	<div id="build"></div>
    	<div id="activity"></div>
    	<div id="houseMaxArea"></div>
    	<div id="priceMax"></div>
    	<div id="pagediv"></div>
    	<div id="view"></div>
    	<input type="hidden" name="isExpand" id="isExpand" value="${isExpand }" />
    
    	<div class="out1">
            <span>房产性质:</span>
            <div id="ultype">
                <ul ></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
        	<span>价格区间:</span>
            <div id="ulprice">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>面积区间:</span>
            <div id="ularea">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>房屋户型:</span>
            <div id="ulhousetype">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>建设情况:</span>
            <div id="ulbuild">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>房屋装修:</span>
            <div id="ulfitment">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>营销活动:</span>
            <div id="ulactivity">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>景观:</span>
            <div id="ulview">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
        	<div class="selectRight" style="border:none; margin-left:77px;">
         	
          <div class="multiple" style="border:none;z-index:3">
             <input type="text" value=" 交通" id="traffic" />
             <input type="text" value=" 学区" id="school" />
             <input type="text" value=" 医疗" id="hospital" />
             <input type="text" value=" 生活设施" id="live" />
                <input type="text" value="${houseInfo.houseName==''?'请输入关键词':houseInfo.houseName }" onclick="this.select();" name="houseName" class="selectText"/>
                <a href="javascript:document.queryform.submit()">
                <img  src="images/seachBut1.jpg" class="selectBut" style="margin-left:7px;_margin-left:0px;"/></a>
           </div>
        </div>
        </div>
        </form>
    </div>
    <div class="seachFoot">
    	<div id="expand"></div>
    	<div id="retracting"></div>
    </div>
    
    <div class="pailie">
		<div style="width:260px; float:left;">&nbsp;共有<font color="#FF0000">${count }</font>个符合要求的新房楼盘<font style="margin-left:30px;">排序方式:</font></div><span><input type="text" id="txt" name="txt" onfocus="showAndHide('List1','show');" onblur="showAndHide('List1','hide');" value="价格从低到高">
            <div class="Menu" id="List1">
                <ul>
                    <li onmousedown="getValue('txt','2011-12-14 10:30:00');showAndHide('List1','hide');">2011-12-14</li>
                    <li onmousedown="getValue('txt','美国USA');showAndHide('List1','hide');">美国USA</li>
                </ul>
            </div>
          </span>
         <div class="pltext">价格排序 <img src="images/zhankai(black).jpg" />&nbsp; 开售排序 <img src="images/zhankai(black).jpg" /></div> 
         <ul>
         	<li>&lt;</li>
            <li>1</li>
            <li>&gt;</li>
         </ul>
    </div>
    <div class="NewExhibition">
    	<h1>楼盘展示</h1>
        <ul>
        	<c:if test="${fn:length(houseInfos) == 0 }">
        		没有找到符合要求的楼盘!
        	</c:if>
        	<c:forEach items="${houseInfos }" var="houseInfo">
        	<li>    
            	<span class="ExhibitionLeft"><a href="getHouseInfoById?houseId=${houseInfo.houseId}" target="_blank"><img src="images/WKimg1.jpg" width="288" height="180"/></a></span>
                <span class="ExhibitionRight">
                  <div style="overflow:hidden;">
                	<ul class="Details">
                    	<li><a href="lifang/index.html"><span>楼盘名称：</span><font>${houseInfo.houseName }</font></a></li>
                        <li><span>价格：</span>${houseInfo.housePrice }元/平</li>
                        <li><span>户型：</span>：</span>${houseInfo.houseMinArea }-${houseInfo.houseMaxArea}平</li>
                        <li class="font2"><font>${houseInfo.houseAttenttionCnt }</font> 关注度/ <font>${houseInfo.houseCommentCnt }</font> 评论数</li>
                    </ul>
                	<span class="ERImg"><a href="getHouseInfoById?houseId=${houseInfo.houseId}" target="_blank"><img src="images/GYimg1_1.jpg"/>中粮集团</a></span>
                  </div> 
                   <span class="font1"><img  src="images/regie.jpg" />&nbsp;&ndash;${houseInfo.businessRegion } &ndash;${houseInfo.belongToRegion }</span>
                    <p>
                    	${fn:substring(houseInfo.houseDesc,0,43)}
	                    <c:if test="${fn:length(houseInfo.houseDesc) > 43}">
	                    	...
	                    </c:if>
	                    <a href="getHouseInfoById?houseId=${houseInfo.houseId}" target="_blank">[详细]</a>
                    </p>
                </span>
                <div class="dian"></div>
            </li>
            </c:forEach>
        </ul>
        <div id="page"></div>
    </div>
</div>
<!--尾部-->
<%@ include file="Footer.jsp" %>
<!--End尾部-->
</body>
</html>
