<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的交易</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/huodong.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<script type="text/javascript" src="js/tabs/tabs.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>

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
$(document).ready(function(){
	$("#tabs").tabs({
		width:"850px",
		defCheck:"#tab1",
		functions:{
			"#tab1":doTab1,
			"#tab2":doTab2,
			"#tab3":doTab3,
			"#tab4":doTab4,
		}
	});
	var curPage = ${curPage};
	var pageCount = ${pageCount};
	$("#page").pager({curPage:curPage, pageSize:3, pageCount:pageCount, goPageCall:goPage});
});

function doTab1(){
	//alert(1);
}
function doTab2(){
	//alert(2);
}
function doTab3(){
	//alert(3);
}
function doTab4(){
	//alert(4);
}
function goPage(curPage, pageSize) {
	//alert("curPage:"+curPage+",pageSize="+pageSize);
	window.location.href = "${pageContext.request.contextPath}/jiaoyiGroup?curPage="+curPage+"&pageSize="+pageSize;
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
                	<img src="images/2.jpg" /><a href="loupan.html"><font>我的楼盘</font></a><span id="FLHli1"><img src="images/zhankai.jpg" /></span><span id="FLHli01" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>
               </div>
               	<ul id="FLHul1" class="ycLi" style="display:block;">
                	<li><a href="loupan.html">我关注的楼盘</a></li>
                    <li><a href="loupan.html">我收藏的楼盘</a></li>
                    <li><a href="loupan.html">我喊过价的楼盘</a></li>
                    <li><a href="loupan.html">我实地看过的楼盘</a></li>
                    <li><a href="loupan.html">蜂蜜推荐的楼盘</a></li>
                </ul>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><a href="lvyougoufantuan.html"><font>我的旅游购房团</font></a><span id="FLHli2"><img src="images/zhankai.jpg" /></span><span id="FLHli02" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>
               </div>
               	<ul id="FLHul2" class="ycLi">
                	<li><a href="lvyougoufantuan.html">我关注的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">我收藏的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">我参加过的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">蜂蜜推荐的旅游购房团</a></li>
                </ul>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><a href="huodong"><font>我的活动</font></a><span id="FLHli3"><img src="images/zhankai.jpg" /></span><span id="FLHli03" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>
               </div>
               	<ul id="FLHul3" class="ycLi">
                	<li><a href="huodong.html">我关注的活动</a></li>
                    <li><a href="huodong.html">我报名的活动</a></li>
                    <li><a href="huodong.html">我参加的活动</a></li>
                    <li><a href="huodong.html">蜂蜜推荐的活动</a></li>
                </ul>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><a href="jiaoyiGroup"><font>我的交易</font></a>
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
    	<!---交易--->
	  <div class="huodong">
	    <div class="huodong_tab" id="tabs">
		 <div class="huodong_tab_left"></div>
		 <ul>
			<li id="#tab1">买房订单(${iBuyHousecount })</li>
			<li id="#tab2">看房(${iSeeHouseCount })</li>
			<li id="#tab3">旅游购房团(${iJoinHouseCount })</li>
			<li id="#tab4">参加活动(${iActivityCount })</li>
		 </ul>
		
	    </div>
		<ul class="huodong_status">
			<li style="width:121px;">订单号</li>
			<li style="width:260px;">订单名称</li>
			<li style="width:163px;">下单时间</li>
			<li style="width:117px;">订单状态</li>
			<li style=" width:98px; border:none;">履行情况</li>
		</ul>
		<div class="huodonglist" >
		    <div id="tab1">
				<ul class="jiaoyi_list">
					<c:forEach items="${trade}" var="u">
						<li style="width:89px; color:#005EAC;">${u.eventBuyHouseOrder.orderNum}</li>
						<li style="width:230px; color:#6D6E71;">${u.eventBuyHouseOrder.orderName}</li>
						<li style="width:131px; color:#005EAC;">${u.eventBuyHouseOrder.orderDate}</li>
						<li style="width:87px; color:#005EAC;">${u.eventBuyHouseOrder.orderStatus}</li>
						<li style=" width:66px; color:#005EAC;">${u.exchangeType}</li>
					</c:forEach>
				</ul>
			<div id="page"></div>
		    </div>
		
		
			<div id="tab2" style="display:none;">
				<iframe frameborder="0" scrolling="no" style="height: 600px;" width="95%" src="getSeeHouseOrder?curPage=1&pageCount=2">
				</iframe>
			</div>
		
		
		    <div id="tab3" style="display:none;">
				<iframe frameborder="0" scrolling="no" style="height: 600px;" width="95%" src="getJoinHouseGroup?curPage=1&pageCount=2">
				</iframe>
		    </div>
		
		
		    <div id="tab4" style="display:none;">
				<iframe frameborder="0" scrolling="no" style="height: 600px;" width="95%" src="getActivityOrder?curPage=1&pageCount=2">
				</iframe>
		    </div>
		
		</div>
	 </div>
<!---End交易--->
</div>
<!--End右边-->    
</div>
</body>
</html>
