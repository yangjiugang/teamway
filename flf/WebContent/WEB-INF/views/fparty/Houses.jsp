<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的楼盘</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/huodong.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/tabs/tabs.js"></script>
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<!--<script type="text/javascript" src="js/hide.js"></script>-->
<script type="text/javascript">
var customerId=${customerInfoDetail.customerId };

$(document).ready(function(){
	$("#tabs").tabs({
		width:"850px",
		defCheck:"#tab1"		
	});
	
	var curAttentionPage=${skimPage.curPage};
	var attentionPageCount=${skimPage.pageCount};	
	$("#page").pager({curPage:curAttentionPage, pageSize:10, pageCount:attentionPageCount, goPageCall:goPage});	
	
	var curcollectPage=${collectPage.curPage};
	var collectPageCount=${collectPage.pageCount};	
	$("#page1").pager({curPage:curcollectPage, pageSize:10, pageCount:collectPageCount, goPageCall:goPage1});	
	
	var curRecommendPage=${recommendPage.curPage};
	var recommendPageCount=${recommendPage.pageCount};	
	$("#page2").pager({curPage:curRecommendPage, pageSize:10, pageCount:recommendPageCount, goPageCall:goPage2});
	
	var curPricePage=${pricePage.curPage};
	var pricePageCount=${pricePage.pageCount};	
	$("#page3").pager({curPage:curPricePage, pageSize:10, pageCount:pricePageCount, goPageCall:goPage3});
	
	var curLookPage=${lookPage.curPage};
	var lookPageCount=${lookPage.pageCount};	
	$("#page4").pager({curPage:curLookPage, pageSize:10, pageCount:lookPageCount, goPageCall:goPage4});
});


function goPage(curPage, pageSize) {
	$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/skimHouses',
			dataType:'json',
			data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,			
			callBackFn:function(msg){	
			    $("#info_1").empty();
				for(var i=0;i<msg.length;i++){					
					$("#info_1").append(
						"<div class='loupan'><div class='loupanImg'><a href='#' target='_blank'><img src='"+msg[i].housePic+"' width='193' height='123'/></a></div>"
					    +"<div class='loupanliteral'><b>楼盘：</b><span>"+msg[i].houseName+"</span><br />"
						+"<b>价格：</b>"+msg[i].housePrice+"元/m&sup2;<br />"
						+"<b>户型：</b>"+msg[i].houseStructureType+"<br />"
						+"<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />"
						+"&nbsp;-&nbsp;"+msg[i].fcSysArea.areaName+"&nbsp;-&nbsp;"+msg[i].businessRegion+"&nbsp;-&nbsp;"					
						+houseSights(msg[i].houseSights)+"&nbsp;-&nbsp;"+houseProperties(msg[i].houseProperties)+"</dd></div>"						
					    +"<div class='loupanxlogo'><img src='"+msg[i].houseLogo+"' /><br />"+msg[i].houseDevelopersName+"<br /><span>"+msg[i].houseAttenttionCnt
					    +"</span>关注 / <span>"+msg[i].houseCommentCnt+"</span>评论</div>"
					    +"<div class='loupanRight'><a href='' target='_blank'>收藏它</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>评论</a></div></div>"
					); 
				} 
			}
			});
}

function goPage1(curPage, pageSize) {
	$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/collectHouses',
			dataType:'json',
			data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
			callBackFn:function(msg){	
			    $("#info_2").empty();
				for(var i=0;i<msg.length;i++){					
					$("#info_2").append(
						"<div class='loupan'><div class='loupanImg'><a href='#' target='_blank'><img src='"+msg[i].housePic+"' width='193' height='123'/></a></div>"
					    +"<div class='loupanliteral'><b>楼盘：</b><span>"+msg[i].houseName+"</span><br />"
						+"<b>价格：</b>"+msg[i].housePrice+"元/m&sup2;<br />"
						+"<b>户型：</b>"+msg[i].houseStructureType+"<br />"
						+"<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />"
						+"&nbsp;-&nbsp;"+msg[i].fcSysArea.areaName+"&nbsp;-&nbsp;"+msg[i].businessRegion+"&nbsp;-&nbsp;"					
						+houseSights(msg[i].houseSights)+"&nbsp;-&nbsp;"+houseProperties(msg[i].houseProperties)+"</dd></div>"						
					    +"<div class='loupanxlogo'><img src='"+msg[i].houseLogo+"' /><br />"+msg[i].houseDevelopersName+"<br /><span>"+msg[i].houseAttenttionCnt
					    +"</span>关注 / <span>"+msg[i].houseCommentCnt+"</span>评论</div>"
					    +"<div class='loupanRight'><a href='' target='_blank'>收藏它</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>评论</a></div></div>"
					); 
				} 
			}
			});
}

function goPage2(curPage, pageSize) {
	$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/recommendHouses',
			dataType:'json',
			data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
			callBackFn:function(msg){					
			    $("#info_5").empty();
				for(var i=0;i<msg.length;i++){
					$("#info_5").append(
						"<div class='loupan'><div class='loupanImg'><a href='#' target='_blank'><img src='"+msg[i].housePic+"' width='193' height='123'/></a></div>"
					    +"<div class='loupanliteral'><b>楼盘：</b><span>"+msg[i].houseName+"</span><br />"
						+"<b>价格：</b>"+msg[i].housePrice+"元/m&sup2;<br />"
						+"<b>户型：</b>"+msg[i].houseStructureType+"<br />"
						+"<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />"
						+"&nbsp;-&nbsp;"+msg[i].fcSysArea.areaName+"&nbsp;-&nbsp;"+msg[i].businessRegion+"&nbsp;-&nbsp;"					
						+houseSights(msg[i].houseSights)+"&nbsp;-&nbsp;"+houseProperties(msg[i].houseProperties)+"</dd></div>"						
					    +"<div class='loupanxlogo'><img src='"+msg[i].houseLogo+"' /><br />"+msg[i].houseDevelopersName+"<br /><span>"+msg[i].houseAttenttionCnt
					    +"</span>关注 / <span>"+msg[i].houseCommentCnt+"</span>评论</div>"
					    +"<div class='loupanRight'><a href='' target='_blank'>收藏它</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>评论</a></div></div>"
					); 
				} 
			}
			});
}

function goPage3(curPage, pageSize) {
	$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/priceHouses',
			dataType:'json',
			data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
			callBackFn:function(msg){					
			    $("#info_3").empty();
				for(var i=0;i<msg.length;i++){					
					$("#info_3").append(
						"<div class='loupan'><div class='loupanImg'><a href='#' target='_blank'><img src='"+msg[i].housePic+"' width='193' height='123'/></a></div>"
					    +"<div class='loupanliteral'><b>楼盘：</b><span>"+msg[i].houseName+"</span><br />"
						+"<b>价格：</b>"+msg[i].housePrice+"元/m&sup2;<br />"
						+"<b>户型：</b>"+msg[i].houseStructureType+"<br />"
						+"<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />"
						+"&nbsp;-&nbsp;"+msg[i].fcSysArea.areaName+"&nbsp;-&nbsp;"+msg[i].businessRegion+"&nbsp;-&nbsp;"					
						+houseSights(msg[i].houseSights)+"&nbsp;-&nbsp;"+houseProperties(msg[i].houseProperties)+"</dd></div>"						
					    +"<div class='loupanxlogo'><img src='"+msg[i].houseLogo+"' /><br />"+msg[i].houseDevelopersName+"<br /><span>"+msg[i].houseAttenttionCnt
					    +"</span>关注 / <span>"+msg[i].houseCommentCnt+"</span>评论</div>"
					    +"<div class='loupanRight'><a href='' target='_blank'>收藏它</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>评论</a></div></div>"
					); 
				} 
			}
			});
}

function goPage4(curPage, pageSize) {
	$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/lookHouses',
			dataType:'json',
			data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
			callBackFn:function(msg){					
			    $("#info_4").empty();
				for(var i=0;i<msg.length;i++){					
					$("#info_4").append(
						"<div class='loupan'><div class='loupanImg'><a href='#' target='_blank'><img src='"+msg[i].housePic+"' width='193' height='123'/></a></div>"
					    +"<div class='loupanliteral'><b>楼盘：</b><span>"+msg[i].houseName+"</span><br />"
						+"<b>价格：</b>"+msg[i].housePrice+"元/m&sup2;<br />"
						+"<b>户型：</b>"+msg[i].houseStructureType+"<br />"
						+"<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />"
						+"&nbsp;-&nbsp;"+msg[i].fcSysArea.areaName+"&nbsp;-&nbsp;"+msg[i].businessRegion+"&nbsp;-&nbsp;"					
						+houseSights(msg[i].houseSights)+"&nbsp;-&nbsp;"+houseProperties(msg[i].houseProperties)+"</dd></div>"						
					    +"<div class='loupanxlogo'><img src='"+msg[i].houseLogo+"' /><br />"+msg[i].houseDevelopersName+"<br /><span>"+msg[i].houseAttenttionCnt
					    +"</span>关注 / <span>"+msg[i].houseCommentCnt+"</span>评论</div>"
					    +"<div class='loupanRight'><a href='' target='_blank'>收藏它</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />"
					    +"<a href='../funlifun/lifang/index.html' target='_blank'>评论</a></div></div>"
					); 
				} 
			}
			});
}

function houseSights(value){
	var houseSight="";
	switch (value) {
	case 0:
		houseSight="山景";
		break;
	case 1:
		houseSight="海景";
		break;
	case 2:
		houseSight="湖景";
		break;
	case 3:
		houseSight="江河景";
		break;	
	case 4:
		houseSight="公园或游乐场";
		break;
	case 5:
		houseSight="高尔夫球场";
		break;
	case 6:
		houseSight="体育馆";
		break;
	case 7:
		houseSight="市政休闲广场";
		break;
	default:
		houseSight="大学";
		break;
	}
	return houseSight;
}

function houseProperties(value){
	var houseSight="";
	switch (value) {
	case 0:
		houseSight="普通住宅";
		break;
	case 1:
		houseSight="花园洋房";
		break;
	case 2:
		houseSight="别墅";
		break;
	case 3:
		houseSight="商住楼";
		break;	
	case 4:
		houseSight="写字楼";
		break;
	case 5:
		houseSight="商铺";
		break;
	case 6:
		houseSight="厂房";
		break;
	case 7:
		houseSight="仓库";
		break;
	default:
		houseSight="其他";
		break;
	}
	return houseSight;
}

</script>

<script type="text/javascript">
$(document).ready(function(){
	$(".Out").each(function(){
		var obj = $(this);
		obj.find(".updown").toggle(function(){
			$(this).attr("src", "images/zhankai.jpg");
			obj.find(".ycLi").slideUp('slow');
		},function(){
			$(this).attr("src", "images/zhankai1.jpg");
			obj.find(".ycLi").slideDown('slow');
		});
	});
	$(".Out").each(function(){
		var obj = $(this);
		obj.find(".updown").toggle(function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content").slideUp('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content").slideDown('slow');
		});
	});
});
</script>
<script type="text/javascript">
function settab_zzjs(name,num,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
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
            <span class="FLHMap"><div>房立方</div><img  src="images/mapImg.png"/><font>主题会所分布网点</font></span>
            <span class="FLHphone"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></span>
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
        	<span class="photo"><img src="images/touxiang.jpg" /></span>
            <ul class="nickname">
           
                <li>姓名：赵美丽</li>
                <li>生日：8.26</li>
                <li><img src="images/8%.jpg" /></li>
            </ul>
            <span class="linkage">
            	<span style="margin:0;"><a href="">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a href="">[修改密码]</a></span>           
            </span>
        </div>
        <ul class="treeNav">
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><a href="index.html"><font>我的主页</font></a>
                </div>
                <div class="xian"></div>
            </li> 
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><a href="MyProfile.html"><font>我的资料</font></a>
                </div>
                <div class="xian"></div>
            </li> 
            
             <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><a href="<%=basePath%>myHouses?customerId=${customerInfoDetail.customerId }"><font>我的楼盘</font></a><!--<span id="FLHli1"><img src="images/zhankai.jpg" /></span><span id="FLHli01" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>-->
               </div>
               	<!--<ul id="FLHul1" class="ycLi" style="display:block;">
                	<li><a href="loupan.html">我关注的楼盘</a></li>
                    <li><a href="loupan.html">我收藏的楼盘</a></li>
                    <li><a href="loupan.html">我喊过价的楼盘</a></li>
                    <li><a href="loupan.html">我实地看过的楼盘</a></li>
                    <li><a href="loupan.html">蜂蜜推荐的楼盘</a></li>
                </ul>-->
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><a href="<%=basePath%>HouseGroupInfo?customerId=${customerInfoDetail.customerId }"><font>我的旅游购房团</font></a><!--<span id="FLHli2"><img src="images/zhankai.jpg" /></span><span id="FLHli02" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>-->
               </div>
               	<!--<ul id="FLHul2" class="ycLi">
                	<li><a href="lvyougoufantuan.html">我关注的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">我收藏的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">我参加过的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">蜂蜜推荐的旅游购房团</a></li>
                </ul>-->
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><a href="<%=basePath%>activity?customerId=${customerInfoDetail.customerId }"><font>我的活动</font></a><!--<span id="FLHli3"><img src="images/zhankai.jpg" /></span><span id="FLHli03" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>-->
               </div>
               	<!--<ul id="FLHul3" class="ycLi">
                	<li><a href="huodong.html">我关注的活动</a></li>
                    <li><a href="huodong.html">我报名的活动</a></li>
                    <li><a href="huodong.html">我参加的活动</a></li>
                    <li><a href="huodong.html">蜂蜜推荐的活动</a></li>
                </ul>-->
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><a href="jiaoyi.html"><font>我的交易</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/6.jpg" /><a href="wdfm/Y611WDFM.html"><font>我的蜂蜜</font></a><span><img src="images/+.jpg" /></span>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/7.jpg" /><a href="pinglun.html"><font>我的评论</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/8.jpg" /><a href="index.html"><font>我的消息</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	&nbsp;
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><a href="../funlifun/monopolyofsale.html"><font>房源搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><a href="../funlifun/monopolyofsale(L).html"><font>旅游购房搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><a href="#"><font>活动搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/12.jpg" /><a href="../funlifun/monopolyofsaleM2.html"><font>蜂蜜搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
        </ul>
    </div>
<!--End左边--> 
<!--右边-->
    <div class="FLHRight">
      <div style="overflow:hidden;">
		<div class="Rightleft">
            <%@ include file="FPublicNotice.jsp" %> 
        </div>
        <div class="Rightright">
          <%@ include file="Rnickname.jsp" %>
    </div>
      </div>
    	<!---楼盘--->
  <div id="tabs">
		<ul>
			<li id="#tab1">我关注的楼盘(${skimCount })</li>
			<li id="#tab2">我收藏的楼盘(${collectCount })</li>
			<li id="#tab3">我喊过价的楼盘(${priceCount })</li>
			<li id="#tab4">我实地看过的楼盘(${lookCount })</li>
			<li id="#tab5">蜂蜜推荐的楼盘(${recommendCount })</li>
		</ul>		
		
		<div class="huodonglist">
<div id="tab1">
<div id="zzjs_zzjs1">
	  <div id='info_1'>
	        <c:if test="${fn:length(skimHouseList) == 0 }">
             	 没有找到符合要求的楼盘!	        	
        	</c:if>    
		    <c:forEach items='${skimHouseList }' var='houseInfo'>
				<div class='loupan'>
			 		<div class='loupanImg'><a href='#' target='_blank'><img src='${houseInfo.housePic }' width='193' height='123'/></a></div>
					<div class='loupanliteral'>
						<b>楼盘：</b><span>${houseInfo.houseName }</span><br />
						<b>价格：</b>${houseInfo.housePrice }元/m&sup2;<br />
						<b>户型：</b>${houseInfo.houseStructureType }<br />
						<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />
						&nbsp;-&nbsp;${houseInfo.fcSysArea.areaName }&nbsp;-&nbsp;${houseInfo.businessRegion }&nbsp;-&nbsp;							
						<c:if test='${houseInfo.houseSights==0 }'>
						      山景
						</c:if>				
						<c:if test='${houseInfo.houseSights==1 }'>
						      海景
						</c:if>
						<c:if test='${houseInfo.houseSights==2 }'>
						     湖景
						</c:if>
						<c:if test='${houseInfo.houseSights==3 }'>
						      江河景
						</c:if>
						<c:if test='${houseInfo.houseSights==4 }'>
						    公园或游乐场
						</c:if>
						<c:if test='${houseInfo.houseSights==5 }'>
						      高尔夫球场
						</c:if>
						<c:if test='${houseInfo.houseSights==6 }'>
						      体育馆
						</c:if>
						<c:if test='${houseInfo.houseSights==7 }'>
						      市政休闲广场
						</c:if>
						<c:if test='${houseInfo.houseSights==8 }'>
						      大学
						</c:if>
						&nbsp;-&nbsp;
						<c:if test='${houseInfo.houseProperties==0 }'>
						  普通住宅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==1 }'>
						  花园洋房
						</c:if>			
						<c:if test='${houseInfo.houseProperties==2 }'>
						  别墅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==3 }'>
						  商住楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==4 }'>
						  写字楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==5 }'>
						  商铺
						</c:if>	
						<c:if test='${houseInfo.houseProperties==6 }'>
						  厂房
						</c:if>	
						<c:if test='${houseInfo.houseProperties==7 }'>
						  仓库
						</c:if>	
						<c:if test='${houseInfo.houseProperties==8 }'>
						  其他
						</c:if>		
						</dd>
					</div>
					<div class='loupanxlogo'><img src='${houseInfo.houseLogo }' /><br />${houseInfo.houseDevelopersName }<br /><span>${houseInfo.houseAttenttionCnt }</span>关注 / <span>${houseInfo.houseCommentCnt }</span>评论</div>
					<div class='loupanRight'><a href='' target="_blank">收藏它</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>评论</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<!---统计--->
		<p class="Y04tong">统计：${skimCount }条记录</p>
		<!---End 统计--->
	   <div id="page"></div>
	</div>
</div>	

<div id="tab2">
<div id="zzjs_zzjs2">
 <div id='info_2'>
           <c:if test="${fn:length(collectHouseList) == 0 }">
             	 没有找到符合要求的楼盘!        	
        	</c:if> 
		    <c:forEach items='${collectHouseList }' var='houseInfo'>
				<div class='loupan'>
			 		<div class='loupanImg'><a href='#' target='_blank'><img src='${houseInfo.housePic }' width='193' height='123'/></a></div>
					<div class='loupanliteral'>
						<b>楼盘：</b><span>${houseInfo.houseName }</span><br />
						<b>价格：</b>${houseInfo.housePrice }元/m&sup2;<br />
						<b>户型：</b>${houseInfo.houseStructureType }<br />
						<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />
						&nbsp;-&nbsp;${houseInfo.fcSysArea.areaName }&nbsp;-&nbsp;${houseInfo.businessRegion }&nbsp;-&nbsp;							
						<c:if test='${houseInfo.houseSights==0 }'>
						      山景
						</c:if>				
						<c:if test='${houseInfo.houseSights==1 }'>
						      海景
						</c:if>
						<c:if test='${houseInfo.houseSights==2 }'>
						     湖景
						</c:if>
						<c:if test='${houseInfo.houseSights==3 }'>
						      江河景
						</c:if>
						<c:if test='${houseInfo.houseSights==4 }'>
						    公园或游乐场
						</c:if>
						<c:if test='${houseInfo.houseSights==5 }'>
						      高尔夫球场
						</c:if>
						<c:if test='${houseInfo.houseSights==6 }'>
						      体育馆
						</c:if>
						<c:if test='${houseInfo.houseSights==7 }'>
						      市政休闲广场
						</c:if>
						<c:if test='${houseInfo.houseSights==8 }'>
						      大学
						</c:if>
						&nbsp;-&nbsp;
						<c:if test='${houseInfo.houseProperties==0 }'>
						  普通住宅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==1 }'>
						  花园洋房
						</c:if>			
						<c:if test='${houseInfo.houseProperties==2 }'>
						  别墅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==3 }'>
						  商住楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==4 }'>
						  写字楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==5 }'>
						  商铺
						</c:if>	
						<c:if test='${houseInfo.houseProperties==6 }'>
						  厂房
						</c:if>	
						<c:if test='${houseInfo.houseProperties==7 }'>
						  仓库
						</c:if>	
						<c:if test='${houseInfo.houseProperties==8 }'>
						  其他
						</c:if>		
						</dd>
					</div>
					<div class='loupanxlogo'><img src='${houseInfo.houseLogo }' /><br />${houseInfo.houseDevelopersName }<br /><span>${houseInfo.houseAttenttionCnt }</span>关注 / <span>${houseInfo.houseCommentCnt }</span>评论</div>
					<div class='loupanRight'><a href='' target="_blank">收藏它</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>评论</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<!---统计--->
		<p class="Y04tong">统计：${collectCount }条记录</p>
		<!---End 统计--->
	   <div id="page1"></div>
<!--End分页-->
</div>
</div>

<div id="tab3">
<div id="zzjs_zzjs3">
 <div id='info_3'>
           <c:if test="${fn:length(priceHouseList) == 0 }">
             	   没有找到符合要求的楼盘!		        	
        	</c:if> 
		    <c:forEach items='${priceHouseList }' var='houseInfo'>
				<div class='loupan'>
			 		<div class='loupanImg'><a href='#' target='_blank'><img src='${houseInfo.housePic }' width='193' height='123'/></a></div>
					<div class='loupanliteral'>
						<b>楼盘：</b><span>${houseInfo.houseName }</span><br />
						<b>价格：</b>${houseInfo.housePrice }元/m&sup2;<br />
						<b>户型：</b>${houseInfo.houseStructureType }<br />
						<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />
						&nbsp;-&nbsp;${houseInfo.fcSysArea.areaName }&nbsp;-&nbsp;${houseInfo.businessRegion }&nbsp;-&nbsp;							
						<c:if test='${houseInfo.houseSights==0 }'>
						      山景
						</c:if>				
						<c:if test='${houseInfo.houseSights==1 }'>
						      海景
						</c:if>
						<c:if test='${houseInfo.houseSights==2 }'>
						     湖景
						</c:if>
						<c:if test='${houseInfo.houseSights==3 }'>
						      江河景
						</c:if>
						<c:if test='${houseInfo.houseSights==4 }'>
						    公园或游乐场
						</c:if>
						<c:if test='${houseInfo.houseSights==5 }'>
						      高尔夫球场
						</c:if>
						<c:if test='${houseInfo.houseSights==6 }'>
						      体育馆
						</c:if>
						<c:if test='${houseInfo.houseSights==7 }'>
						      市政休闲广场
						</c:if>
						<c:if test='${houseInfo.houseSights==8 }'>
						      大学
						</c:if>
						&nbsp;-&nbsp;
						<c:if test='${houseInfo.houseProperties==0 }'>
						  普通住宅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==1 }'>
						  花园洋房
						</c:if>			
						<c:if test='${houseInfo.houseProperties==2 }'>
						  别墅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==3 }'>
						  商住楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==4 }'>
						  写字楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==5 }'>
						  商铺
						</c:if>	
						<c:if test='${houseInfo.houseProperties==6 }'>
						  厂房
						</c:if>	
						<c:if test='${houseInfo.houseProperties==7 }'>
						  仓库
						</c:if>	
						<c:if test='${houseInfo.houseProperties==8 }'>
						  其他
						</c:if>		
						</dd>
					</div>
					<div class='loupanxlogo'><img src='${houseInfo.houseLogo }' /><br />${houseInfo.houseDevelopersName }<br /><span>${houseInfo.houseAttenttionCnt }</span>关注 / <span>${houseInfo.houseCommentCnt }</span>评论</div>
					<div class='loupanRight'><a href='' target="_blank">收藏它</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>评论</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<!---统计--->
		<p class="Y04tong">统计${priceCount }条记录</p>
		<!---End 统计--->
	   <div id="page3"></div>
<!--End分页-->
</div>
</div>

<div id="tab4">
<div id="zzjs_zzjs4">
<div id='info_4'>
           <c:if test="${fn:length(lookHouseList) == 0 }">
             	   没有找到符合要求的楼盘!	        	
        	</c:if>
		    <c:forEach items='${lookHouseList }' var='houseInfo'>
				<div class='loupan'>
			 		<div class='loupanImg'><a href='#' target='_blank'><img src='${houseInfo.housePic }' width='193' height='123'/></a></div>
					<div class='loupanliteral'>
						<b>楼盘：</b><span>${houseInfo.houseName }</span><br />
						<b>价格：</b>${houseInfo.housePrice }元/m&sup2;<br />
						<b>户型：</b>${houseInfo.houseStructureType }<br />
						<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />
						&nbsp;-&nbsp;${houseInfo.fcSysArea.areaName }&nbsp;-&nbsp;${houseInfo.businessRegion }&nbsp;-&nbsp;							
						<c:if test='${houseInfo.houseSights==0 }'>
						      山景
						</c:if>				
						<c:if test='${houseInfo.houseSights==1 }'>
						      海景
						</c:if>
						<c:if test='${houseInfo.houseSights==2 }'>
						     湖景
						</c:if>
						<c:if test='${houseInfo.houseSights==3 }'>
						      江河景
						</c:if>
						<c:if test='${houseInfo.houseSights==4 }'>
						    公园或游乐场
						</c:if>
						<c:if test='${houseInfo.houseSights==5 }'>
						      高尔夫球场
						</c:if>
						<c:if test='${houseInfo.houseSights==6 }'>
						      体育馆
						</c:if>
						<c:if test='${houseInfo.houseSights==7 }'>
						      市政休闲广场
						</c:if>
						<c:if test='${houseInfo.houseSights==8 }'>
						      大学
						</c:if>
						&nbsp;-&nbsp;
						<c:if test='${houseInfo.houseProperties==0 }'>
						  普通住宅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==1 }'>
						  花园洋房
						</c:if>			
						<c:if test='${houseInfo.houseProperties==2 }'>
						  别墅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==3 }'>
						  商住楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==4 }'>
						  写字楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==5 }'>
						  商铺
						</c:if>	
						<c:if test='${houseInfo.houseProperties==6 }'>
						  厂房
						</c:if>	
						<c:if test='${houseInfo.houseProperties==7 }'>
						  仓库
						</c:if>	
						<c:if test='${houseInfo.houseProperties==8 }'>
						  其他
						</c:if>		
						</dd>
					</div>
					<div class='loupanxlogo'><img src='${houseInfo.houseLogo }' /><br />${houseInfo.houseDevelopersName }<br /><span>${houseInfo.houseAttenttionCnt }</span>关注 / <span>${houseInfo.houseCommentCnt }</span>评论</div>
					<div class='loupanRight'><a href='' target="_blank">收藏它</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>评论</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<!---统计--->
		<p class="Y04tong">统计${lookCount }条记录</p>
		<!---End 统计--->
	   <div id="page4"></div>
</div>
</div>

<div id="tab5">
<div id="zzjs_zzjs5">
	 <div id='info_5'>
	        <c:if test="${fn:length(recommendHouseList) == 0 }">
             	 没有找到符合要求的楼盘!     	
        	</c:if>
		    <c:forEach items='${recommendHouseList }' var='houseInfo'>
				<div class='loupan'>
			 		<div class='loupanImg'><a href='#' target='_blank'><img src='${houseInfo.housePic }' width='193' height='123'/></a></div>
					<div class='loupanliteral'>
						<b>楼盘：</b><span>${houseInfo.houseName }</span><br />
						<b>价格：</b>${houseInfo.housePrice }元/m&sup2;<br />
						<b>户型：</b>${houseInfo.houseStructureType }<br />
						<dd><img src='images/regie.jpg' alt='新房专卖' style='margin-bottom:-7px;' />
						&nbsp;-&nbsp;${houseInfo.fcSysArea.areaName }&nbsp;-&nbsp;${houseInfo.businessRegion }&nbsp;-&nbsp;							
						<c:if test='${houseInfo.houseSights==0 }'>
						      山景
						</c:if>				
						<c:if test='${houseInfo.houseSights==1 }'>
						      海景
						</c:if>
						<c:if test='${houseInfo.houseSights==2 }'>
						     湖景
						</c:if>
						<c:if test='${houseInfo.houseSights==3 }'>
						      江河景
						</c:if>
						<c:if test='${houseInfo.houseSights==4 }'>
						    公园或游乐场
						</c:if>
						<c:if test='${houseInfo.houseSights==5 }'>
						      高尔夫球场
						</c:if>
						<c:if test='${houseInfo.houseSights==6 }'>
						      体育馆
						</c:if>
						<c:if test='${houseInfo.houseSights==7 }'>
						      市政休闲广场
						</c:if>
						<c:if test='${houseInfo.houseSights==8 }'>
						      大学
						</c:if>
						&nbsp;-&nbsp;
						<c:if test='${houseInfo.houseProperties==0 }'>
						  普通住宅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==1 }'>
						  花园洋房
						</c:if>			
						<c:if test='${houseInfo.houseProperties==2 }'>
						  别墅
						</c:if>	
						<c:if test='${houseInfo.houseProperties==3 }'>
						  商住楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==4 }'>
						  写字楼
						</c:if>	
						<c:if test='${houseInfo.houseProperties==5 }'>
						  商铺
						</c:if>	
						<c:if test='${houseInfo.houseProperties==6 }'>
						  厂房
						</c:if>	
						<c:if test='${houseInfo.houseProperties==7 }'>
						  仓库
						</c:if>	
						<c:if test='${houseInfo.houseProperties==8 }'>
						  其他
						</c:if>		
						</dd>
					</div>
					<div class='loupanxlogo'><img src='${houseInfo.houseLogo }' /><br />${houseInfo.houseDevelopersName }<br /><span>${houseInfo.houseAttenttionCnt }</span>关注 / <span>${houseInfo.houseCommentCnt }</span>评论</div>
					<div class='loupanRight'><a href='' target="_blank">收藏它</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>对它开价</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>报名看楼</a><br />
					  <a href='../funlifun/lifang/index.html' target='_blank'>评论</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<!---统计--->
		<p class="Y04tong">统计：${recommendCount }条记录</p>
		<!---End 统计--->
	   <div id="page2"></div>
</div>
</div>

</div></div>	
    	
<%-- <div class="huodong">

<div class="huodong_tab">
<div class="huodong_tab_left"></div>
<ul><li id="zzjs1" onmouseover="settab_zzjs('zzjs',1,5)" class="on_zzjs">我关注的楼盘(${skimCount })</li>
<li id="zzjs2" onmouseover="settab_zzjs('zzjs',2,5)">我收藏的楼盘(${collectCount })</li>
<li id="zzjs3" onmouseover="settab_zzjs('zzjs',3,5)">我喊过价的楼盘(${priceCount })</li>
<li id="zzjs4" onmouseover="settab_zzjs('zzjs',4,5)">我实地看过的楼盘(${lookCount })</li>
<li id="zzjs5" onmouseover="settab_zzjs('zzjs',5,5)">蜂蜜推荐的楼盘(${recommendCount })</li></ul>
<div class="huodong_tab_left" style="width:60px;"></div>
</div>

</div> --%>
<!---End楼盘--->
    </div>
<!--End右边-->    
</div>
</body>
</html>
