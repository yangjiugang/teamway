<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的评论</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/huodong.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/iframeSetHeight.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<!--<script type="text/javascript" src="js/hide.js"></script>-->
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

function settab_zzjs(name,num,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
 }
 if(num==1)
 	$("#frameName").val("houseDiscuss");
 if(num==2)
	 	$("#frameName").val("eventInfo");
 if(num==3)
	 	$("#frameName").val("");
 if(num==4)
	 	$("#frameName").val("");
}
</script>
</head>

<body>
<!--头部-->
<input type="hidden" id="frameName" value="${frameName}" />
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
      <div style="overflow:hidden;">
		<div class="Rightleft">
             <%@ include file="FPublicNotice.jsp" %> 
        </div>
        <div class="Rightright">
        <%@ include file="Rnickname.jsp" %>
    </div>
      </div>
    	<!---评论--->
<div class="huodong">
<div class="huodong_tab">
<div class="huodong_tab_left"></div>
<ul><li id="zzjs1" onmouseover="settab_zzjs('zzjs',1,4)" class="on_zzjs">楼盘评论</li>
<li id="zzjs2" onmouseover="settab_zzjs('zzjs',2,4)">购房团评论</li>
<li id="zzjs3" onmouseover="settab_zzjs('zzjs',3,4)">活动评论  </li>
<li id="zzjs4" onmouseover="settab_zzjs('zzjs',4,4)">评论房秘书</li></ul>
<div class="huodong_tab_right">共计：<font><span id="pageCount">${count}</span></font>条</div>
</div>
<ul class="huodong_status">
<li style="width:121px;">名称</li>
<li style="width:419px;">评论内容</li>
<li style=" width:224px; border:none;"><font style="width:120px; display:block;">时间</font> </li>
</ul>

<div class="huodonglist">

<div id="zzjs_zzjs1">
	<iframe id="houseDiscuss" name="houseDiscuss" src="frame?frameName=houseDiscuss&curPage=1&pageSize=6"  style="scroll-face-color:#ffffff"
						width="100%" height="600" scrolling="no" frameborder="no">
	</iframe>
</div>


<div id="zzjs_zzjs2" style="display:none;">
<iframe id="eventInfo" name="eventInfo" src="frame?frameName=eventInfo&curPage=1&pageSize=6"  style="scroll-face-color:#ffffff"
						width="100%" height="500" onload="Javascript:SetWinHeight(this)" scrolling="no" frameborder="no">
	</iframe>
</div>

<div id="zzjs_zzjs3" style="display:none;">
<ul class="pinglun_list">
<li style="width:89px;">3绿城北京 - 天上人间展销会</li>
<li style="width:397px; color:#959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.</li>
<li>11.16 am14:30</li>
<li><a href="#" target="_blank">还要评论</a></li></ul>
<ul class="pinglun_list">
<li style="width:89px;">356绿城北京 - 天上人间展销会</li>
<li style="width:397px; color:#959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.</li>
<li>11.16 am14:30</li>
<li><a href="#" target="_blank">还要评论</a></li></ul>
</div>

<div id="zzjs_zzjs4" style="display:none;">
<ul class="pinglun_list">
<li style="width:89px;">123绿城北京 - 天上人间展销会</li>
<li style="width:397px; color:#959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.</li>
<li>11.16 am14:30</li>
<li><a href="#" target="_blank">还要评论</a></li></ul>
<ul class="pinglun_list">
<li style="width:89px;">绿城北京 - 天上人间展销会</li>
<li style="width:397px; color:#959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.</li>
<li>11.16 am14:30</li>
<li><a href="#" target="_blank">还要评论</a></li></ul></div>
</div></div>
<!---End评论--->
    </div>
<!--End右边-->    
</div>
</body>
</html>
