<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易介宝个人主页</title>
<link rel="stylesheet" href="<%=path %>/css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=path %>/css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="<%=path %>/css/eagent/kehu.css" type="text/css"/>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/hide.js"></script>
<script type="text/javascript" src="<%=basePath %>js/page/page.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/page/page.css" />
<script type="text/javascript" src="<%=basePath %>js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
					     +"<li>特价：<b>"+msg[i].groupPrice+"</b>元</li></ul>"
				); 
			} 
		}
		
		
       		     
	
     
     
}); 	 
}
function clickShowDiv(open,close,divName){
	
	$("#"+divName+"InfoA"+close).className="";
	$("#"+divName+"InfoA"+open).className="cuterSelect";
	
	
	$("#"+divName+"ContentDiv"+close).hide();
	$("#"+divName+"ContentDiv"+open).show();
	
}
</script>
</head>

<body>
<%@include file="EHeader.jsp" %>
<div class="middle">
<%@include file="ELeft.jsp" %>
<!--右边-->
    <div class="FLHRight">
		<div class="Rightleft">
		   <div class="geren-z">
		     <span>最新照片</span>
			 <ul>
			    <li><img src="images/poto-a.gif" /></li>
				<li><img src="images/poto-b.gif" /></li>
				<li><img src="images/poto-b.gif" /></li>
				<li><img src="images/poto-b.gif" /></li>
				<li><img src="images/poto-b.gif" /></li>
			 </ul>
		   </div>
		   
		  <div class="Out">
		   <div class="geren-ts">
		     <ul>
		         <li><a href="javaScript:clickShowDiv(1,2,'friend')" id="friendInfoA1" class="cuterSelect">我的动态</a></li>
			     <li><a href="javaScript:clickShowDiv(2,1,'friend')" id="friendInfoA2">好友动态</a></li>
				 <img src="images/zhankai(black).jpg" class="updown"/> 
		      </ul>
		   </div>
		    <div id="friendContentDiv1" class="Content">
		    	<iframe id="Dynamic" name="Dynamic" src="getDynamic?type=&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="400" scrolling="no" frameborder="no">
				 </iframe> 
		   </div>
		    <div id="friendContentDiv2" class="Content" style="display: none;">
		    	<iframe id="Dynamic" name="Dynamic" src="getDynamic?type=1&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="400" scrolling="no" frameborder="no">
				 </iframe> 
		   </div>
		  </div>
		 
		 <div class="Out">
		   <div class="geren-ts">
		     <ul>
		         <li><a href="javaScript:clickShowDiv(1,2,'stat')" id="statInfoA1" class="cuterSelect">我的分享</a></li>
			     <li><a href="javaScript:clickShowDiv(2,1,'stat')" id="statInfoA2">好友分享</a></li>
				 <img src="images/zhankai(black).jpg" class="updown"/> 
		      </ul>
		   </div>
		   <div id="statContentDiv1" class="Content">
		   		 <iframe id="statInfo" name="statInfo" src="statInfo?type=&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="400" scrolling="no" frameborder="no">
				 </iframe> 
		   </div>
		   <div id="statContentDiv2" class="Content" style="display: none;">
		   		 <iframe id="statInfo" name="statInfo" src="statInfo?type=1&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="400" scrolling="no" frameborder="no">
				 </iframe> 
		   </div>
		  </div>
		
		<div class="Out">
		   <div class="geren-ts">
		     <ul>
		         <li><a href="#" id="cuter">我的留言</a></li>
			     <li><a href="#">好友留言</a></li>
				 <li><a href="#">客户留言</a></li>
				 <img src="images/zhankai(black).jpg" class="updown"/> 
		      </ul>
		   </div>
		    <div class="Content">
		   <div class="geren-c">
	           <dl>
		          <img src="images/fanglifang.jpg" width="51" height="26"/>
			      <dt><span>马超</span>2011-1-30</dt>
			       <dd>你似乎还没收到好友留言，快去给好友留言吧！</dd>
		      </dl>
		       <span class="pu">
		        <ul>
		          <li><a href="#">删除</a></li>
			    </ul>
		      </span>
	       </div>
		   </div>
		  </div>
		
		</div>
		
        <div class="Rightright">
          <ul class="Y1gerenzhuye">
              <li><a href="index-xiaoxi.html" target="_blank">客户点名</a>(1)</li>
              <li><a href="index-xiaoxi.html" target="_blank">客户评论</a>(2)</li>
              <li><a href="index-xiaoxi.html" target="_blank">好友分享</a>(1)</li>
              <li><a href="index-xiaoxi.html" target="_blank">好友消息</a>(3)</li>
              <li><a href="index-xiaoxi.html" target="_blank">互动请求</a>(1)</li>
              <li><a href="index-xiaoxi.html" target="_blank">系统消息</a>(4)</li>
          </ul>
          
          
           <div class="Out" id="Out">
           <div class="rightTittle">
          	<font>我的楼盘</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
          <div class="Content" id="Content">
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
            <div id="miniPage" style="margin: 0 0 0 160px;"></div>
           </div>
         </div>  
         
         <div class="Out" id="Out">
           <div class="rightTittle">
          	<font>我的旅游购房团</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
          <div class="Content" id="Content">
          
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
			  </c:forEach>  
              </div>
            <div id="miniCollectPage" style="margin: 0 0 0 160px;"></div>
         </div>  
		
         <%@include file="FriendsPlugin.jsp" %>
</div>
		 
		 
        </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>

