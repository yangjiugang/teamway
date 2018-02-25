<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>易介宝首页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
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
	
	var curPage = ${curPage};
	var pageCount = ${pageCount};
	$("#miniPage").miniPager({curPage:curPage, pageSize:10, pageCount:'${customerPageCount}', goPageCall:goPage});
	$("#miniPageHouse").miniPager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage1});
	
	var customerInfo = ${customerList};
	var recommendHouses = ${recommendHouses};
	generateCusPage(customerInfo);
	generateHouse(recommendHouses);
});
function generateCusPage(obj){
	$(".right-l-c-l").empty();
	for(var i=0;i<obj.length;i++){
		var html = '<ul><img src="'+obj[i].photoPath +'" />'+
	    		   '<li><span class="b"><a href="jumpStatUserInfo?userId='+obj[i].cusId+'">'+obj[i].name+'</a></span> <span class="d">'+obj[i].address+'</span> </li></ul>';
		$(".right-l-c-l").append(html);
	}
}
function generateHouse(o){
	$(".corridorConter").empty();
	for(var i=0;i<o.length;i++){
		var html='<li>'+
		'<a href="getHouseInfoById?houseId='+o[i].houseId+'" target="_blank"><img src='+o[i].housePic+' width="77" height="49" border="0" /></a>'+
	        '<ul><li><a href="getHouseInfoById?houseId='+o[i].houseId+'" target="_blank"><h3 style="color:#000;">'+o[i].houseName+'</h3></a></li>'+
	        '<li>'+o[i].housePrice+'元/m&sup2;</li>'+
	        '<li>'+o[i].areaName+'&nbsp;&ndash;&nbsp;'+o[i].belongToRegion+'</li></ul><div class="dian"></div></li>';
		$(".corridorConter").append(html);
	}
}
function goPage(curPage, pageSize){
	$.ajax({
		 type: "POST",
		 url: "eagent_customerInfoDetailPage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generateCusPage(obj);
		 }
	});
}
function goPage1(curPage, pageSize){
	$.ajax({
		 type: "POST",
		 url: "eagent_recommendHousePage",
		 dataType:"json",
		 data: "curPage=" + curPage + "&pageSize=" + pageSize,
		 success: function(obj){
			 generateHouse(obj);
		 }
	});
}
</script>

</head>

<body>
<%@include file="EHeader.jsp" %>
<div class="middle">
<!--左边-->
<%@include file="ELeft.jsp" %>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
	  <div class="right-pot">
	      <a href="queryCustomerApply?curPage=1&pageSize=10"><img src="images/blue.gif" border="0" /></a>
		  <span><a href="queryCustomerContact?curPage=1&pageSize=10"><img src="images/yellow.gif" border="0" /></a></span>
		  <a href="index-xiaoxi?tab=1"><img src="images/red.gif" border="0" /></a> </div>
		<div class="Rightleft">
        	<span class="ActivitiesOut">
            	<span class="ActivitiesTittle">
                	<font>活动公告</font>
                    <span class="ActivitiesSpan1"></span>
                    <font>新楼盘签约公告</font>
                    <span class="ActivitiesSpan2">
                    	<span id="Activitiesdown"><img src="images/zhankai(black).jpg" /></span>
                        <span id="Activitiesup"><img src="images/zhankai(black)1.jpg" /></span>
                    </span>
                </span>
                <div class="ActivitiesContent">
             		<div class="BorderRight">
                    	<span>
                            <img src="images/kk.jpg" />
                            <ul>
                                <li><h3>香港盛隆三期上市发布会</h3></li>
                                <li>2001-12-11 2:30pm</li>
                                <li>房立方深圳主题会所</li>
                            </ul>
                    	</span>
                    	<div class="dian" style="margin:5px;"></div>
                    	<span>
                            <img src="images/kk.jpg" />
                            <ul>
                                <li><h3>香港盛隆三期上市发布会</h3></li>
                                <li>2001-12-11 2:30pm</li>
                                <li>房立方深圳主题会所</li>
                            </ul>
                    	</span> 
                        <div class="dian" style="margin:5px;"></div>
                    	<span>
                            <img src="images/kk.jpg" />
                            <ul>
                                <li><h3>香港盛隆三期上市发布会</h3></li>
                                <li>2001-12-11 2:30pm</li>
                                <li>房立方深圳主题会所</li>
                            </ul>
                    	</span> 
                        <div class="dian" style="margin:5px;"></div>
                    	<span>
                            <img src="images/kk.jpg" />
                            <ul>
                                <li><h3>香港盛隆三期上市发布会</h3></li>
                                <li>2001-12-11 2:30pm</li>
                                <li>房立方深圳主题会所</li>
                            </ul>
                    	</span> 
                        <div class="dian" style="margin:5px;"></div>
                    	<span>
                            <img src="images/kk.jpg" />
                            <ul>
                                <li><h3>香港盛隆三期上市发布会</h3></li>
                                <li>2001-12-11 2:30pm</li>
                                <li>房立方深圳主题会所</li>
                            </ul>
                    	</span> 
                  </div>
                    <div class="ContentRight">
                    	<span>
                            <a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" /></a>
                            <ul>
                            <li><a href="../funlifun/lifang/index-gonggao.html"><h3>绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                            </ul>
                    	</span> 
                    	<div class="dian" style="margin:5px;"></div>
                    	<span>
                            <a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" /></a>
                            <ul>
                            <li><a href="../funlifun/lifang/index-gonggao.html"><h3>绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                            </ul>
                    	</span> 
                        <div class="dian" style="margin:5px;"></div>
                    	<span>
                            <a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" /></a>
                            <ul>
                            <li><a href="../funlifun/lifang/index-gonggao.html"><h3>绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                            </ul>
                    	</span>      
                        <div class="dian" style="margin:5px;"></div>
                    	<span>
                            <a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" /></a>
                            <ul>
                            <li><a href="../funlifun/lifang/index-gonggao.html"><h3>绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                            </ul>
                    	</span>      
                        <div class="dian" style="margin:5px;"></div>
                    	<span>
                            <a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" /></a>
                            <ul>
                            <li><a href="../funlifun/lifang/index-gonggao.html"><h3>绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                            </ul>
                    	</span>           
                    </div>
                </div>
            </span>
            <span class="hebdomad">
                <span class="hebdomadTittle">
                	<font>本周出团公告</font>
                    <span id="hebdomaddown"><img src="images/zhankai(black).jpg" /></span>
                    <span id="hebdomadup"><img src="images/zhankai(black)1.jpg" /></span>
                </span>
                <div class="hebdomadContent">
                
                  <ul>
                       <li><span class="sb"><a href="../funlifun/line.html" target="_blank">年假特辑-北京6日团</a></span><span class="sd"><a href="../funlifun/line.html">成都-重庆-绵阳-九寨沟-重庆-成都</a></span></li>
                       <li><span class="sb">出团时间：2011.12.11-2011.12.30</span><span class="sd">特价：<b>3888</b>元</span></li>
                   </ul>
                	
                </div>
                  <div class="hebdomadContent">
                
                  <ul>
                       <li><span class="sb"><a href="../funlifun/line.html" target="_blank">年假特辑-北京6日团</a></span><span class="sd"><a href="../funlifun/line.html">成都-重庆-绵阳-九寨沟-重庆-成都</a></span></li>
                       <li><span class="sb">出团时间：2011.12.11-2011.12.30</span><span class="sd">特价：<b>3888</b>元</span></li>
                   </ul>
                	
                </div>
                <div class="hebdomadContent">
                
                  <ul>
                       <li><span class="sb"><a href="../funlifun/line.html" target="_blank">年假特辑-北京6日团</a></span><span class="sd"><a href="../funlifun/line.html">成都-重庆-绵阳-九寨沟-重庆-成都</a></span></li>
                       <li><span class="sb">出团时间：2011.12.11-2011.12.30</span><span class="sd">特价：<b>3888</b>元</span></li>
                   </ul>
                	
                </div>
                <div class="hebdomadContent">
                
                  <ul>
                       <li><span class="sb"><a href="../funlifun/line.html" target="_blank">年假特辑-北京6日团</a></span><span class="sd"><a href="../funlifun/line.html">成都-重庆-绵阳-九寨沟-重庆-成都</a></span></li>
                       <li><span class="sb">出团时间：2011.12.11-2011.12.30</span><span class="sd">特价：<b>3888</b>元</span></li>
                   </ul>
                	
                </div>
                <div class="hebdomadContent">
                
                  <ul>
                       <li><span class="sb"><a href="../funlifun/line.html" target="_blank">年假特辑-北京6日团</a></span><span class="sd"><a href="../funlifun/line.html">成都-重庆-绵阳-九寨沟-重庆-成都</a></span></li>
                       <li><span class="sb">出团时间：2011.12.11-2011.12.30</span><span class="sd">特价：<b>3888</b>元</span></li>
                   </ul>
                	
                </div>
            </span>
			<div class="right-l-c">
			  <div class="right-l-c-left">
			   <span class="right-l-c-i"> <img src="images/turnover.jpg" /></span>
			   <c:forEach items="${buyHouseOrders }" var="order">
			    <ul>
				   <li>祝贺蜂蜜<a href="index-haoyou-right.html" style="color:#005EAC; text-decoration:underline;"><span class="zsh12">${order.customerName}</span></a>成功销售“${order.houseName}”！</li>
				   <li><span class="dda">${order.orderDate }</span></li>
				</ul>
				</c:forEach>
		      </div>
              
			   <div class="right-l-c-r">
			   <span class="biao"><img src="images/33.jpg" /></span>
			   <c:forEach items="${noContacts }" var="cus">
			   <ul>
			      <img src="${cus.photoPath }" />
			      <li><span class="b"><a href="index-b-right-zhao.html">${cus.name }</a></span> <span class="d">${cus.address }</span> </li>
			   </ul>
               </c:forEach>
			</div> 
			</div>
       		
        </div>
        <div class="Rightright">
         <%-- <ul class="Y1gerenzhuye">
              <li><a href="eagent_message?tab=1">客户点名</a>(${cusMetionCount})</li>
              <li><a href="eagent_message?tab=2">客户评论</a>(${houseDisCount})</li>
              <li><a href="eagent_message?tab=3">好友分享</a>(${userRecomCount})</li>
              <li><a href="eagent_message?tab=4">好友消息</a>(${userMsgCount})</li>
              <li><a href="eagent_message?tab=5">互动请求</a>(0)</li>
              <li><a href="eagent_message?tab=6">系统消息</a>(${sysMsgCount})</li>
          </ul>  --%>
          <%@include file="MsgCount.jsp" %>   
          <div class="Out">
           <div class="rightTittle">
          	<font>我的客户列表</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
            <div class="Content">
           	<div class="right-l-c-l">
			</div>
            <div id="miniPage"></div>
			</div>
          </div>
           <div class="Out" id="Out">
           <div class="rightTittle">
          	<font>蜂蜜推荐的${house.housePic}楼盘</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
          <div class="Content" id="Content">
           	<ul class="corridorConter">
           </ul>
           <div id="miniPageHouse"></div>
           </div>
           
         </div>  
		 
		 <div class="Out">
           <div class="rightTittle">
          	<font>最近到访的客户</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
            <div class="Content">
           	<div class="right-l-c-l">
           	   <c:forEach items="${visitorCustomers}" var="vsu">
	           	   <c:if test="${vsu.current == 0}">
					   <ul>
					      <img src="${vsu.object.photoPath }" />
					      <li><span class="b"><a href="index-b-right-zhao.html">${vsu.object.name }</a></span> <span class="d">${vsu.object.address }</span> </li>
					   </ul>
				   </c:if>
				    <c:if test="${vsu.current == 1}">
					   <ul>
					      <img src="${vsu.object.photoPath }" />
					      <li><span class="b"><a href="index-b-right-zhao.html">${vsu.object.name }</a></span> <span class="d">${vsu.object.address }</span> </li>
					   </ul>
				   </c:if>
           	   </c:forEach>
			</div>
            
			</div>
          </div>
          
		   
		   <div class="Out">
           <div class="rightTittle" style=" margin:30px 0 0 0; float:left;">
          	<font>最近到访的同行</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
            <div class="Content">
            	<c:forEach items="${recentVisitUsers }" var="user">
           	   <div class="fangmis">
                 <dl>
                <a href="index-haoyou-xiangqing.html"><img src="${user.photoPath }" border="0" /></a>
                <dd><a href="index-haoyou-xiangqing.html">${user.name }</a></dd>
                <dd><span>常住地：${user.userCity }</span><span>人气：${user.bhri }</span></dd>
                <dd>擅长楼盘：${user.userSkills }</dd>
                 </dl>
                </div>
                </c:forEach>
           </div>
		</div>
	</div>
  </div>
    </div>
<!--End右边-->    
</body>
</html>

