<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好友统计明细</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
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
<%@include file="EHeader.jsp" %>
<!--End头部-->
<div class="middle">

<!--右边-->
	<div class="jiangjie-a" style=" margin:30px 0 10px 0;">
	    <div class="kehu-c" style="border-bottom:none;">
		        <dl>
					<a href="index-haoyou-xiangqing.html"><img src="${userInfo.photoPath }" border="0" /></a>
					<dt><span><a href="#">发信息</a></span><span><a href="javaScript:sendMsg(${userInfo.userId})">留言</a></span><span><a href="HomeTJFXY4.html">推荐</a></span>姓名： <a href="index-haoyou-xiangqing.html">${userInfo.name}</a></dt>
					<dt>生日：<fmt:formatDate value="${userInfo.firstWorkDate}" pattern="yyyy年MM月dd日" type="date"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;常住地： ${userInfo.userCity }</dt>
					<dt>手机号：${userInfo.userInfoDetail.cellphone} &nbsp;&nbsp;&nbsp;  兴趣爱好：${userInfo.userInfoDetail.hobbies} </dt>
				</dl>
	       </div>  
		   </div>
<!--End右边--> 
<!---游购房团--->
<div class="huodong">
<div class="huodong_tab">
<div class="huodong_tab_left"></div>
<ul>
<li id="zzjs1" onmouseover="settab_zzjs('zzjs',1,8)" class="on_zzjs">关注楼盘(<span id="collectHouseSum">0</span>)</li>
<li id="zzjs2" onmouseover="settab_zzjs('zzjs',2,8)">认售楼盘(<span id="saleHouseSum">0</span>)</li>
<li id="zzjs3" onmouseover="settab_zzjs('zzjs',3,8)">喊价楼盘(<span id="priceHouseSum">0</span>)</li>
<li id="zzjs4" onmouseover="settab_zzjs('zzjs',4,8)">向好友推荐楼盘(<span id="friendHouseSum">0</span>)</li>
<li id="zzjs5" onmouseover="settab_zzjs('zzjs',5,8)">向客户推荐楼盘(<span id="customerHouseSum">0</span>)</li>
<li id="zzjs6" onmouseover="settab_zzjs('zzjs',6,8)">向客户推荐购房团(<span id="houseGroupSum">0</span>)</li>
<li id="zzjs7" onmouseover="settab_zzjs('zzjs',7,8)">好友数量(<span id="friendsSum">0</span>)</li>
<li id="zzjs8" onmouseover="settab_zzjs('zzjs',8,8)">评论内容(<span id="friendHouseSumaa">7</span>)</li>
</ul>
<!--<div class="huodong_tab_right"><a href="#" target="_blank">我要了解更多活动</a></div>-->
</div>

<div class="huodonglist">
<div id="zzjs_zzjs1">
				<iframe id="collectHouse" name="collectHouse" src="getStatInfo?getType=collectHouse&userId=${userId }&listType=house&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="550" scrolling="no" frameborder="no">
					</iframe>  
</div>

<div id="zzjs_zzjs2" style="display:none;">
					<iframe id="saleHouse" name="saleHouse" src="getStatInfo?getType=saleHouse&userId=${userId }&listType=house&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="550" scrolling="no" frameborder="no">
					</iframe>  
</div>
<div id="zzjs_zzjs3" style="display:none;">
					<iframe id="priceHouse" name="priceHouse" src="getStatInfo?getType=priceHouse&userId=${userId }&listType=house&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="550" scrolling="no" frameborder="no">
					</iframe>  
</div>
<div id="zzjs_zzjs4" style="display:none;">
					<iframe id="friendHouse" name="friendHouse" src="getStatInfo?getType=friendHouse&userId=${userId }&listType=house&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="550" scrolling="no" frameborder="no">
					</iframe>  
</div>
<div id="zzjs_zzjs5" style="display:none;">
					<iframe id="customerHouse" name="customerHouse" src="getStatInfo?getType=customerHouse&userId=${userId }&listType=house&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="550" scrolling="no" frameborder="no">
					</iframe>  
</div>

<div id="zzjs_zzjs6" style="display:none;">
					<iframe id="houseGroup" name="houseGroup" src="getStatInfo?getType=houseGroup&userId=${userId }&listType=houseGroup&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="550" scrolling="no" frameborder="no">
					</iframe> 
</div>
<div id="zzjs_zzjs7" style="display:none;">
					<iframe id="friends" name="friends" src="getStatInfo?getType=friends&userId=${userId }&listType=userFriend&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
						width="100%" height="550" scrolling="no" frameborder="no">
					</iframe> 
</div>
<div id="zzjs_zzjs8" style="display:none;">
<ul class="huodong_status">
<li style="width:121px;">评论时期</li>
<li style="width:119px;">评论对象</li>
<li style=" width:748px; border:none;">评论内容</li>
</ul>
<ul class="huodong_list">
<li style="width:89px;">2012-01-02</li>
<li style="width:87px;">北京三里屯房立方主题会所</li>
<li style="width:716px; color:#959698;">亚太广场是由江苏美乐地房地产开发有限公司投资和开发的项目.项目位于花桥国际商务城兆丰路18号,属于花桥国际商务城核心位置.</li>
</ul>
<ul class="tongj">
<li>统计：<span class="red">13</span>条</li>
</ul>
</div>

</div>
</div>
<!---End游购房团--->   
</div>
</body>
</html>
