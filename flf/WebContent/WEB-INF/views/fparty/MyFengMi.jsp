<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的蜂蜜</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/fparty/kehu.css" />
<link rel="stylesheet" type="text/css" href="css/fparty/yijiebao.css" />
<link rel="stylesheet" href="js/page/page.css" type="text/css"/>

<script type="text/javascript" src="js/calendar.js"></script> 

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/dataValidate.js"></script>
<script type="text/javascript" src="js/idNumValidate.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
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

function date2str(x,y) {
	 var z = {M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
	 y = y.replace(/(M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-2)});
	 return y.replace(/(y+)/g,function(v) {return x.getFullYear().toString().slice(-v.length)});
}

var userid=${user.userId};
$(document).ready(function(){	
	var curSalePage= ${salePage.curPage};
	var pageSaleCount = ${salePage.pageCount};
    $("#miniPage").miniPager({curPage:curSalePage, pageSize:5, pageCount:pageSaleCount, goPageCall:goPage});
    var curCollectPage= ${userCollectPage.curPage};
	var pageCollectCount = ${userCollectPage.pageCount};
    $("#miniCollectPage").miniPager({curPage:curCollectPage, pageSize:5, pageCount:pageCollectCount, goPageCall:goCollectPage});
    
});

function goPage(curPage, pageSize) {
	 $.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/gerenSaleHouse',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize+"&userId="+userid,			
		callBackFn:function(msg){	
		    $(".corridorConter").empty();
			for(var i=0;i<msg.length;i++){	
				$(".corridorConter").append("<li><a href='../funlifun/lifang/index-gonggao.html'><img src='"+msg[i].housePic +"' border='0'  width='77' height='49'/></a>"
					     +"<ul><li><a href='../funlifun/lifang/index-gonggao.html'><h3 style='color:#000;'>"+msg[i].houseName +"</h3></a></li>"
					     +"<li>"+msg[i].housePrice+"元/m&sup2;</li><li>"+msg[i].fcSysArea.areaName+"&nbsp;&ndash;&nbsp;"+msg[i].businessRegion+"</li>"
					     +"</ul><div class='dian'></div></li>"
				); 
			} 
		}
	}); 
}
	 
function goCollectPage(curPage, pageSize) {
	 $.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/gerenUserCollectHouseGroup',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize+"&userId="+userid,			
		callBackFn:function(msg){	
		    $("#indexGeren").empty();
			for(var i=0;i<msg.length;i++){	
				$("#indexGeren").append(  "<ul class='lygft10'><li><a href='../funlifun/line.html'>"+msg[i].groupName +"</a></li>"
					     +"<li>出团时间："+date2str(new Date(msg[i].groupStartDate),"yyyy-MM-dd hh:mm")+"</li>"
					     +"<li>特价：<b>"+msg[i].groupPrice+"</b>元</li></ul><div class='dian'></div>"
				); 
			} 
		}
}); 	 
}

</script>

</head>
<body>
	<!--头部-->
	<%@include file="MyFengMiTop.jsp" %>
	<!--End头部-->
	<div class="middle">
		<!--左边-->
		<%@include file="MyFengMiLeft.jsp" %>
		<!--右边-->
		<div class="FLHRight">
			<!--我的蜂蜜-->
			<div class="Y611wdfmright">
				<div class="Y611wdfmrightL">
					<p class="Y611wdfmrightText">Ta的最新照片</p>
					<ul class="Y611wdfmrightLZP">
					<c:if test="${fn:length(photoList) == 0 }">
					              <li>
					        		还没有上传照片!
					        	  </li>	
				        	  </c:if>    
					<c:forEach items="${photoList}" var="photoList">
						<li><a href="#"> <img src="${photoList.photoPath}" onload="DrawImage(this,100,67)"></a> </li>
					</c:forEach>
					</ul>
					<p class="Y611wdfmrightText">我要给Ta留言：</p>
					<div class="Y611form">
						<form>
							<textarea name="" cols="" rows=""></textarea>
							<br /> <input name="button" type="image" src="images/submit.jpg">
						</form>
					</div>
				</div>
				<div class="Y611wdfmrightR">
					<div class="Y611wdfmrightRLP">
						<div class="Y611wdfmrightRBT">
							<div class="Y611wdfmrightRBT1">Ta的楼盘</div>
							<div class="Y611wdfmrightRBT2">
								<img src="images/zhankai(black).jpg" />
							</div>
						</div>
						
						
						<ul class="corridorConter">
				           	  <c:if test="${fn:length(saleHouses) == 0 }">
					              <li>
					        		没有找到符合要求的楼盘!
					        	  </li>	
				        	  </c:if>           	
				           	   <c:forEach items="${saleHouses }" var="houseInfo">
				           		<li>
				                	<a href="../funlifun/lifang/index-gonggao.html"><img src="${houseInfo.housePic }" border="0"  width='77' height='49'/></a>
				                        <ul>
				                           <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">${houseInfo.houseName }</h3></a></li>
				                           <li>${houseInfo.housePrice}元/m&sup2;</li>
				                           <li>${houseInfo.fcSysArea.areaName}&nbsp;&ndash;&nbsp;${houseInfo.businessRegion}</li>
				                        </ul>
				                     <div class="dian"></div>
				                </li>
				                </c:forEach>
				           </ul>
				            <div id="miniPage" style="margin: 0 0 0 155px;"></div>
										
					</div>

					<div class="Y611wdfmrightRLP">
						<div class="Y611wdfmrightGFT">
							<div class="Y611wdfmrightGFT1">Ta的旅游购房团</div>
							<div class="Y611wdfmrightGFT2">
								<img src="images/zhankai(black).jpg" />
							</div>
						</div>
						
						
				             <c:if test="${fn:length(userCollectHouseGroupInfo) == 0 }">
				             	   <ul class="lygft10">
					             	  <li>
						        		没有找到符合要求的楼盘!
						        	  </li>
					        	  </ul>
				        	  </c:if>      
				        	  <div id="indexGeren">
				           	  <c:forEach items="${userCollectHouseGroupInfo }" var="houseGroupInfo">
				                 <ul class="lygft10">
							     <li><a href="../funlifun/line.html">${houseGroupInfo.groupName }</a></li>
							     <li>出团时间：<fmt:formatDate value="${houseGroupInfo.groupStartDate }" type="both" dateStyle="medium"
						                                      timeStyle="medium" pattern="yyyy-MM-dd hh:mm"/></li>
							     <li>特价：<b>${houseGroupInfo.groupPrice }</b>元</li></ul>		
							     <div class="dian"></div>     
							  </c:forEach>  
				              </div>
				            <div id="miniCollectPage" style="margin: 0 0 0 155px;"></div>
				   
						
					</div>

					<div class="Y611wdfmrightRLP">
						<div class="Y611wdfmrightRBT">
							<div class="Y611wdfmrightRBT1">Ta的好友</div>
							<div class="Y611wdfmrightRBT2">
								<img src="images/zhankai(black).jpg" />
							</div>
						</div>
						<div class="fangmis">
							<dl>
								<img src="images/mishu-mg.gif" border="0" />
								<dd>赵山河</dd>
								<dd>
									<span>常住地：北京</span><span>服务客户：12</span>
								</dd>
								<dd>擅长楼盘：豪宅、别墅、城堡</dd>
							</dl>
						</div>
						<div class="fangmis">
							<dl>
								<img src="images/mishu-mg.gif" border="0" />
								<dd>赵山河</dd>
								<dd>
									<span>常住地：北京</span><span>服务客户：12</span>
								</dd>
								<dd>擅长楼盘：豪宅、别墅、城堡</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<!--End 我的蜂蜜-->
		</div>
		<!--End右边-->
	</div>
</body>
</html>