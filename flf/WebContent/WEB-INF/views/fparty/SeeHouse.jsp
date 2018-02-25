<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房乐会-参加实地看房</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/fparty/kehu.css" />
<link rel="stylesheet" type="text/css" href="css/fparty/yijiebao.css" />
<link rel="stylesheet" href="js/page/page.css" type="text/css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".Out").each(function() {
			var obj = $(this);
			obj.find(".updown").toggle(function() {
				$(this).attr("src", "images/zhankai.jpg");
				obj.find(".ycLi").slideUp('slow');
			}, function() {
				$(this).attr("src", "images/zhankai1.jpg");
				obj.find(".ycLi").slideDown('slow');
			});
		});
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

	// 分页方法
	$(document).ready(function() {
		var strCurPage=${curPage};
		var strPageCount=${pageCount};
		$("#fenye").pager({curPage : strCurPage,pageSize:1,pageCount : strPageCount,goPageCall : goPage});
		
		function goPage(curPage, pageSize){
			document.location.href="participateSeeHouse?curPage="+curPage+"&pageSize="+pageSize;
		}
	});
	
	function synValue(houseName){
		$("#orderObj").val(houseName);
	}
	
	function queryHouse(){
		document.forms["seeHouseForm"].action="participateSeeHouse";
		document.forms["seeHouseForm"].submit();
	}
	
	function selectAdd(eventId){
		document.location.href="registSeeHouse?eventId="+eventId;
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
            <span class="FLHphone"><a href="../funlifun/index.html"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></a></span>
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
            	<span style="margin:0;"><a href="">[更换头像]</a></span><span><a href="register1.html">[完善资料]</a></span><span><a href="">[修改密码]</a></span>           
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
                	<img src="images/2.jpg" /><a href="loupan.html"><font>我的楼盘</font></a><!--<span id="FLHli1"><img src="images/zhankai.jpg" /></span><span id="FLHli01" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>-->
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
                	<img src="images/3.jpg" /><a href="lvyougoufantuan.html"><font>我的旅游购房团</font></a><!--<span id="FLHli2"><img src="images/zhankai.jpg" /></span><span id="FLHli02" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>-->
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
                	<img src="images/4.jpg" /><a href="huodong.html"><font>我的活动</font></a><!--<span id="FLHli3"><img src="images/zhankai.jpg" /></span><span id="FLHli03" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>-->
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
                	<img src="images/6.jpg" /><a href="wdfm/Y611WDFM.html"><font>我的蜂蜜</font></a><!--<span><img src="images/+.jpg" /></span>-->
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
		<!--表单--->
        <form>
        	<ul class="kanfang_from">       	
                <li style=" clear:both; width:600px;"><label>订单类型：</label>看房团</li>        
                <li><label>执行时间：</label><input type="text" onfocus="this.blur()" /></li>
                <li><label>订单对象：</label><input type="text" onfocus="this.blur()" id="orderObj" /></li>
                <li style="float:right; margin-right:50px;"></li>
            </ul>
        </form>
        <!--END表单--->
        <!--房源查询-->
        <div class="Rightleft1">
	    <div class="jiange-z">
	        <span class="tltle-wenzi">查询房源</span>
	        <span  class="title-line" style="width:670px;">
	        	<form name="seeHouseForm">
	        		<input type="text" name="queryObj" style="margin-bottom: 13px;" class="kanfang_text"  onFocus="if(this.value=='请输入关键词'){this.value=''}" onblur="if(this.value==''){this.value='请输入关键词'}" value="请输入关键词"/>
	        		<img alt="查找" style="cursor: pointer;" src="images/Y01SOSO.gif" onclick="queryHouse()" >
	        	</form>
	        </span>
        </div> 
		<div class="fangy">
			<c:forEach items="${lstHouseInfo}" var="u">
				<div class="fangy-c">
					<span class="ico"><a href=""><img src="${u.houseLogo }" /></a></span>
			        <dl>
				    <dd><a style="cursor: pointer;" onclick="selectAdd('${u.eventInfo.eventId }')">选择</a></dd>
				    <dt style="margin:10px 0 0 0;"><span>楼盘名称：</span><span style="color:#C0091D;"><a style="cursor: pointer;" onclick="synValue('${u.houseName }')">${u.houseName }</a></span></dt>
					<dt><span>价格：</span>${u.housePrice }元/m&sup2;</dt>
					<dt><span>户型：</span>${u.houseStructureType }</dt>
					<dd><img src="images/regie.jpg" alt="新房专卖" style="margin-bottom:-7px;" />${u.houseNameExtend }</dd>
					</dl>
				</div>
			</c:forEach>
 		</div>
        <!--end查询-->
        
        <!--页面切换--> 
        <div id="fenye">
				
		</div>
	   <!--页面切换--> 
    </div>
<!--End右边-->    
</div>
</body>
</html>