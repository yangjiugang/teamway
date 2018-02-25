<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Date date=new Date();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的旅游购房团</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/huodong.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/tabs/tabs.js"></script>
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<style type="text/css">
.dingdanY4DDLB{ width:760px; height:25px; line-height:25px; clear:both; overflow:hidden; text-align:center; color:#015EAB; background:#D2D2D3;}
.Y4DDLBLB{ width:760px; height:21px; line-height:21px; clear:both; overflow:hidden; border-bottom:1px solid #DDDDDF; padding:20px 0 10px 0; text-align:center; color:#A8A8AA;}
.Y4DDLBLB1{ float:left; width:90px;}
.Y4DDLBLB2{ float:left; width:98px;}
.Y4DDLBLB3{ float:left; width:125px;}
.Y4DDLBLB4{ float:left; width:181px;}
.Y4DDLBLB5{ float:left; width:145px;}
.Y4DDLBLB6{ float:left; width:65px;}
.Y4DDLBLB7{ float:left; width:53px; color:#000;}
</style>

<script type="text/javascript">
var customerId=${customerInfoDetail.customerId};
$(document).ready(function(){
	$("#tabs").tabs({
		width:"850px",
		defCheck:"#tab1"		
	});
	var curPage1=${page1.curPage};
	var curPage2=${page2.curPage};
	var curPageJoin=${page3.curPage};
	var curPage4=${page4.curPage};
	var count1=${page1.pageCount};
	var count2=${page2.pageCount};
	var countJoin=${page3.pageCount};
	var count4=${page4.pageCount};
	
    $("#page").pager({curPage:curPage1, pageSize:10, pageCount:count1, goPageCall:goPage});
	$("#page1").pager({curPage:curPage2, pageSize:10, pageCount:count2, goPageCall:goPage1});
	$("#page2").pager({curPage:curPageJoin, pageSize:10, pageCount:countJoin, goPageCall:goJoinPage});
	$("#page3").pager({curPage:curPage4, pageSize:10, pageCount:count4, goPageCall:goPage3});
});

function goPage(curPage, pageSize) {
	    $.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/attentionHouseGroup',
			dataType:'json',
			data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
			callBackFn:function(msg){		
				$("#zzjs_zzjs1").empty();
				for(var i=0;i<msg.length;i++){
					$("#zzjs_zzjs1").append("<div class='Y4DDLBLB'><div class='Y4DDLBLB1'>"+msg[i].groupName +"</div>"
							+"<div class='Y4DDLBLB2'>"+date2str(new Date(msg[i].groupStartDate),"yyyy-MM-dd hh:mm:ss")+"</div>"
							+"<div class='Y4DDLBLB3'>"+msg[i].groupDuration +"</div>"
							+"<div class='Y4DDLBLB4'>"+msg[i].groupDesc +"</div>"
							+"</div>"				
					);
				} 
			}
			});	
	    
}

function goPage1(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/collectHouseGroup',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
		callBackFn:function(msg){	
			$("#zzjs_zzjs2").empty();
			for(var i=0;i<msg.length;i++){
				$("#zzjs_zzjs2").append("<div class='Y4DDLBLB'><div class='Y4DDLBLB1'>"+msg[i].groupName +"</div>"
						+"<div class='Y4DDLBLB2'>"+date2str(new Date(msg[i].groupStartDate),"yyyy-MM-dd hh:mm:ss")+"</div>"
						+"<div class='Y4DDLBLB3'>"+msg[i].groupDuration +"</div>"
						+"<div class='Y4DDLBLB4'>"+msg[i].groupDesc +"</div>"
						+"</div>"			
				);
			} 
		
		}
		});
}

function goJoinPage(curPage, pageSize) {
	  $.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/joinHouseGroup',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
		callBackFn:function(msg){				
			 $("#zzjs_zzjs3").empty();
			for(var i=0;i<msg.length;i++){
				$("#zzjs_zzjs3").append("<div class='Y4DDLBLB'><div class='Y4DDLBLB1'>"+msg[i].groupName +"</div>"
						+"<div class='Y4DDLBLB2'>"+date2str(new Date(msg[i].groupStartDate),"yyyy-MM-dd hh:mm:ss")+"</div>"
						+"<div class='Y4DDLBLB3'>"+msg[i].groupDuration +"</div>"
						+"<div class='Y4DDLBLB4'>"+msg[i].groupDesc +"</div>"
						+"</div>"				
				);
			} 
		}
		});	
}

function goPage3(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/recommendHouseGroup',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,
		callBackFn:function(msg){		
			$("#zzjs_zzjs4").empty();
			for(var i=0;i<msg.length;i++){
				$("#zzjs_zzjs4").append("<div class='Y4DDLBLB'><div class='Y4DDLBLB1'>"+msg[i].groupName +"</div>"
						+"<div class='Y4DDLBLB2'>"+date2str(new Date(msg[i].groupStartDate),"yyyy-MM-dd hh:mm:ss")+"</div>"
						+"<div class='Y4DDLBLB3'>"+msg[i].groupDuration +"</div>"
						+"<div class='Y4DDLBLB4'>"+msg[i].groupDesc +"</div>"
						+"</div>"				
				);
			} 
		}
		});	
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

function date2str(x,y) {
	 var z = {M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
	 y = y.replace(/(M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-2)});
	 return y.replace(/(y+)/g,function(v) {return x.getFullYear().toString().slice(-v.length)});
}



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
            	<li>昵称：魅力一抖</li>
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
    	<!---游购房团--->
    	
    	<div id="tabs">
		<ul>
			<li id="#tab1">我关注的旅游购房团(${attentionCount })</li>
			<li id="#tab2">我收藏的旅游购房团(${collectCount })</li>
			<li id="#tab3">我已参加的旅游购房团(${joinCount })</li>
			<li id="#tab4">蜂蜜推荐的旅游购房团(${recommendCount })</li>
		</ul>
		
		<div class="dingdanY4DDLB">
				<div class="Y4DDLBLB1">购房团名称</div>
				<div class="Y4DDLBLB2">发团时间</div>
				<div class="Y4DDLBLB3">时长</div>
				<div class="Y4DDLBLB5">行程概要</div>
				<!-- <div class="Y4DDLBLB6">状态</div> -->
		</div>
		
		<div id="tab1">			
			<div id="zzjs_zzjs1">		
			    <c:if test="${fn:length(houseGroupList) == 0 }">
             	   <div>没有找到符合要求的房团!</div>		        	
        	     </c:if>	
			   <c:forEach items="${houseGroupList }" var="houseGroup">			
				<div class="Y4DDLBLB">
					<div class="Y4DDLBLB1">${houseGroup.groupName }</div>
					<div class="Y4DDLBLB2"><fmt:formatDate value="${houseGroup.groupStartDate }" type="both" dateStyle="medium"
	                                      timeStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					<div class="Y4DDLBLB3">${houseGroup.groupDuration }</div>
					<div class="Y4DDLBLB4">${houseGroup.groupDesc }</div>
					<!-- <div class="Y4DDLBLB5">已结束</div> -->
				</div>			
				</c:forEach>							
			</div>		
			<!---统计--->
		    <p class="Y04tong">统计：${attentionCount }条记录</p>
		    <!---End 统计--->	
			<div id="page"></div>
		</div>

		<div id="tab2">
		 <div id="zzjs_zzjs2">
		  <c:if test="${fn:length(collectHouseGroup) == 0 }">
             	   <div>没有找到符合要求的房团!</div>		        	
        	</c:if>
		   <c:forEach items="${collectHouseGroup }" var="houseGroup">			
				<div class="Y4DDLBLB">
					<div class="Y4DDLBLB1">${houseGroup.groupName }</div>
					<div class="Y4DDLBLB2"><fmt:formatDate value="${houseGroup.groupStartDate }" type="both" dateStyle="medium"
	                                      timeStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					<div class="Y4DDLBLB3">${houseGroup.groupDuration }</div>
					<div class="Y4DDLBLB4">${houseGroup.groupDesc }</div>
					<!-- <div class="Y4DDLBLB5">已结束</div> -->
				</div>			
				</c:forEach>
			</div>
			<!---统计--->
		    <p class="Y04tong">统计：${collectCount }条记录</p>
		    <!---End 统计--->
			<div id="page1"></div>
		</div>
	
		<div id="tab3">
		  <div id="zzjs_zzjs3">
		   <c:if test="${fn:length(joinHouseGroup) == 0 }">
             	   <div>没有找到符合要求的房团!</div>		        	
        	</c:if>
		    <c:forEach items="${joinHouseGroup }" var="houseGroup">			
				<div class="Y4DDLBLB">
					<div class="Y4DDLBLB1">${houseGroup.groupName }</div>
					<div class="Y4DDLBLB2"><fmt:formatDate value="${houseGroup.groupStartDate }" type="both" dateStyle="medium"
	                                      timeStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					<div class="Y4DDLBLB3">${houseGroup.groupDuration }</div>
					<div class="Y4DDLBLB4">${houseGroup.groupDesc }</div>
					<!-- <div class="Y4DDLBLB5">已结束</div> -->
				</div>			
				</c:forEach>
			</div>
			<!---统计--->
			<p class="Y04tong">统计：${joinCount }条记录</p>
			<!---End 统计--->
			<div id="page2"></div>
		</div>
				
		<div id="tab4">
		   <div id="zzjs_zzjs4">
		    <c:if test="${fn:length(recommendHouseGroup) == 0 }">
             	   <div>没有找到符合要求的房团!</div>		        	
        	</c:if>
		       <c:forEach items="${recommendHouseGroup }" var="houseGroup">			
					<div class="Y4DDLBLB">
						<div class="Y4DDLBLB1">${houseGroup.groupName }</div>
						<div class="Y4DDLBLB2"><fmt:formatDate value="${houseGroup.groupStartDate }" type="both" dateStyle="medium"
		                                      timeStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						<div class="Y4DDLBLB3">${houseGroup.groupDuration }</div>
						<div class="Y4DDLBLB4">${houseGroup.groupDesc }</div>
						<!-- <div class="Y4DDLBLB5">已结束</div> -->
					</div>			
				</c:forEach>
			</div>
			<!---统计--->
			<p class="Y04tong">统计：${recommendCount }条记录</p>
			<!---End 统计--->
			<div id="page3"></div>
		</div>
		
		
	</div>
    	
    	
    	

<!---End游购房团--->
    </div>
<!--End右边-->    
</div>
</body>
</html>
