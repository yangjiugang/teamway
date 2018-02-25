<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全部客户</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/tanchu.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/layuod.css" type="text/css"/>
<link rel="stylesheet" href="css/button.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/openBox.js"></script>
<script type="text/javascript" src="js/DD_belatedPNG.js"></script>
<script type="text/javascript" src="js/tabs/tabs.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/picture.js"></script>
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
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
	$("#tabs").tabs({
		width:"850px",
		defCheck:"#tab1",
		functions:{
			"#tab1":doTab1,
			"#tab2":doTab2,
			"#tab3":doTab3,
			"#tab4":doTab4
		} 
	});
	$("#page").pager({curPage:1, pageSize:20, pageCount:30, goPageCall:goPage});
});

function doTab1(){
}
function doTab2(){
}
function doTab3(){
}
function doTab4(){
}

function goPage(curPage, pageSize) {
	alert("curPage:"+curPage+",pageSize="+pageSize);
}
</script>
<script>  
  DD_belatedPNG.fix('*');   
</script>
</head>


<body>
<!--头部-->
<div class="FlhTopOut">
	<div class="FlhTop">
        <div class="FlhLogo"></div>
		<div class="TopRight">
            <span class="FLHphone"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></span>
        </div>
		<div id="menu">
		     <ul>
					<li><a href="IndexA">首页</a></li>
					<li><a href="IndexGeren" id="cur">个人主页</a></li>
					<li><a href="IndexBA">客户</a></li>
					<li><a href="IndexFang">房源</a></li>
					<li><a href="JiaoyiY4">订单</a></li>
					<li><a href="Y52xuexi">学习</a></li>
					<li><a href="IndexHaoyou">好友</a></li>
					<li><a href="Y7chihewanle">吃喝玩乐</a></li>
					<li><a href="IndexXiaoxi">消息</a></li>
		  </ul>
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
				<span class="photo"><img src="${path }" onclick="showBox('photoBox',1)"/></span>
				<ul class="nickname">
					<li>昵称：魅力一抖</li>
					<li>姓名：赵美丽</li>
					<li>生日：8.26</li>
					<li><img src="images/8%.jpg" /></li>
				</ul>
				<span class="linkage"> <span style="margin: 0;"><a href="#" onclick="showBox('photoBox',1)">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a
						href="">[修改密码]</a></span>
				</span>
			</div>
			<div class="jieshao">
				<ul>
					<li>已有<span class="red">3</span>同行加你为好友
					</li>
					<li>已有<span class="red">3</span>客户点名你为房秘书
					</li>
				</ul>
			</div>
			<ul class="treeNav">


				<li>
					<div class="treefont">
						<img src="images/1.jpg" /><font><a
							href="Y03juluyuehuiKehu">约会管理</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/2.jpg" /><font><a
							href="KehuTianjiaZhuce">添加客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/3.jpg" /><font><a href="IndexBA">全部客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/4.jpg" /><font><a href="IndexBC">下过单的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/5.jpg" /><font><a href="IndexBE">看过房的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/6.jpg" /><font><a href="IndexBD">参加过购房团的客户</a>
						</font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/7.jpg" /><font><a href="IndexBF">参加过活动的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/8.jpg" /><font><a href="IndexBB">发表过评论的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><font><a href="#">客户分析</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><a href=""><font>我的财富</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><a href=""><font>积分商场</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><a href=""><font>积分兑换</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><font><a href="#">搜索房源</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><font><a href="#">购搜索房团</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/12.jpg" /><font><a href="#">搜索活动</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/12.jpg" /><font><a href="#">搜索蜂蜜</a></font>
					</div>
					<div class="xian"></div>
				</li>
			</ul>
		</div>
		</div>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">	  
	   <!-- 
	   <form action="queryLike">
         <ul class="Y01homeSOSO"> 
		   <li></li>
            <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="city"  value="请输入..." onFocus="this.value=''">
             </span>城市：</li>
			 <li></li>
           <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="sex" value="请输入..." onFocus="this.value=''">
             </span>性别：</li>
			 <li></li>
            <li><input class="Y01input" name="cusName" type="text" value="请输入关键词" onFocus="this.value=''"> <input type="submit" style="background-image:url('images/Y01SOSO.gif');" /></li>
         </ul>
         -->		   
	  <div class="Rightleft">
	  <div id="tabs" >
	    <div class="geren-t">
	           <ul>
		         <li id="#tab1" value=""  >全部客户（${size}）</li>
			     <li id="#tab2" value="0" >预备客户（${yubeiSize}）</li>
				 <li id="#tab3" value="1" >普通客户（${putongSize}）</li>
				 <li id="#tab4" value="2" >会员客户（${huiyuanSize}）</li>
		      </ul>
	         </div> 
	    	<div id="tab1">
	       <c:forEach items="${cusList}" var="list">
	  		<div class="kehu-c" >
	           <dl>
		          <a href="IndexKehuXiangqing?nameXiangqing=${list.customerInfoDetail.cusId}"><img src="images//mishu-mg.gif" border="0" /></a>
			      <dt><span><a href="#">统计数据</a></span><!-- <span><a href="#">发信息</a></span> -->
			      <span><a href="#" onclick="showBox('liuyanBox',${list.customerInfoDetail.cusId})">留言</a></span>
			      <span><a href="HomeTJFXY4">推荐</a></span>姓名： <a href="IndexKehuXiangqing?nameXiangqing=${list.customerInfoDetail.cusId}">${list.customerInfoDetail.name}</a></dt>
                  <dt>生日： <fmt:formatDate value="${list.customerInfoDetail.birthday}" type="date"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	客户类别：<c:if test="${list.customerInfoDetail.customerType == 1 }">预备客户</c:if>
                  	<c:if test="${list.customerInfoDetail.customerType == 2 }">普通客户</c:if>
                  	<c:if test="${list.customerInfoDetail.customerType == 3 }">会员客户</c:if></dt>
                  <dt>手机号：${list.customerInfoDetail.cellphone} &nbsp;&nbsp;&nbsp;  兴趣爱好：${list.customerInterests.interests}</dt>
		      </dl>	    
		     </div>  
		       </c:forEach>   
		       </div>
		       <div id="tab2">
		        <c:forEach items="${listYubei}" var="list">
		     <div class="kehu-c" >
	           <dl>
		          <a href="IndexKehuXiangqing?nameXiangqing=${list.customerInfoDetail.cusId}"><img src="images//mishu-mg.gif" border="0" /></a>
			      <dt><span><a href="#">统计数据</a></span><!-- <span><a href="#">发信息</a></span> --><span><a href="#" onclick="showBox('liuyanBox',${list.customerInfoDetail.cusId})">留言</a></span>
			      <span><a href="HomeTJFXY4">推荐</a></span>姓名： <a href="IndexKehuXiangqing?nameXiangqing=${list.customerInfoDetail.cusId}">${list.customerInfoDetail.name}</a></dt>
                  <dt>生日： <fmt:formatDate value="${list.customerInfoDetail.birthday}" type="date"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	客户类别：<c:if test="${list.customerInfoDetail.customerType == 1 }">预备客户</c:if>
                  	<c:if test="${list.customerInfoDetail.customerType == 2 }">普通客户</c:if>
                  	<c:if test="${list.customerInfoDetail.customerType == 3 }">会员客户</c:if>
                  	</dt>
                  <dt>手机号：${list.customerInfoDetail.cellphone} &nbsp;&nbsp;&nbsp;  兴趣爱好：${list.customerInterests.interests}</dt>
		      </dl>	       
		     </div>
		       </c:forEach>
		       </div>
		       <div id="tab3">
		        <c:forEach items="${listPutong}" var="listPutong">
		     <div class="kehu-c">
	           <dl>
		          <a href="IndexKehuXiangqing?nameXiangqing=${listPutong.customerInfoDetail.cusId}"><img src="images//mishu-mg.gif" border="0" /></a>
			      <dt><span><a href="#">统计数据</a></span><!-- <span><a href="#">发信息</a></span> --><span><a href="#" onclick="showBox('liuyanBox',${listPutong.customerInfoDetail.cusId})">留言</a></span>
			      <span><a href="HomeTJFXY4">推荐</a></span>姓名： <a href="IndexKehuXiangqing?nameXiangqing=${listPutong.customerInfoDetail.cusId}">${listPutong.customerInfoDetail.name}</a></dt>
                  <dt>生日： <fmt:formatDate value="${listPutong.customerInfoDetail.birthday}" type="date"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户类别：<c:if test="${listPutong.customerInfoDetail.customerType == 1 }">预备客户</c:if>
                  	<c:if test="${listPutong.customerInfoDetail.customerType == 2 }">普通客户</c:if>
                  	<c:if test="${listPutong.customerInfoDetail.customerType == 3 }">会员客户</c:if></dt>
                  <dt>手机号：${listPutong.customerInfoDetail.cellphone} &nbsp;&nbsp;&nbsp;  兴趣爱好：${listPutong.customerInterests.interests}</dt>
		      </dl>	    
		     </div>
		       </c:forEach>   
		       </div>
		       <div id="tab4">
		        <c:forEach items="${listHuiyuan}" var="listHuiyuan">
		     <div class="kehu-c">
	           <dl>
		          <a href="IndexKehuXiangqing?nameXiangqing=${listHuiyuan.customerInfoDetail.cusId}"><img src="images//mishu-mg.gif" border="0" /></a>
			      <dt><span><a href="#">统计数据</a></span><!-- <span><a href="#">发信息</a></span> --><span><a href="#" onclick="showBox('liuyanBox',${listHuiyuan.customerInfoDetail.cusId})">留言</a></span>
			      <span><a href="HomeTJFXY4">推荐</a></span>姓名： <a href="IndexKehuXiangqing?nameXiangqing=${listHuiyuan.customerInfoDetail.cusId}">${listHuiyuan.customerInfoDetail.name}</a></dt>
                  <dt>生日： <fmt:formatDate value="${listHuiyuan.customerInfoDetail.birthday}" type="date"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户类别：<c:if test="${listHuiyuan.customerInfoDetail.customerType == 1 }">预备客户</c:if>
                  	<c:if test="${listHuiyuan.customerInfoDetail.customerType == 2 }">普通客户</c:if>
                  	<c:if test="${listHuiyuan.customerInfoDetail.customerType == 3 }">会员客户</c:if></dt>
                  <dt>手机号：${listHuiyuan.customerInfoDetail.cellphone} &nbsp;&nbsp;&nbsp;  兴趣爱好：${listHuiyuan.customerInterests.interests}</dt>
		      </dl>	    
		     </div>  
		       </c:forEach>   
		       </div>
	  </div>
	  </div>
        <div class="Rightright">
          <!---Y2客户--->
<ul class="Y2kehu" style=" margin:38px 0 0 0;">
					<li><span>${countSkim}</span><a href="IndexBRight " target="_blank">关注楼盘数:</a></li>
					<li><span>${countCollect}</span><a href="IndexBRight" target="_blank">收藏楼盘数:</a></li>
					<li><span>${countPrice}</span><a href="IndexBRight" target="_blank">喊价次数:</a></li>
					<li><span>${countDiscuss}</span><a href="IndexBRight" target="_blank">评论次数:</a></li>
					<li><span>${countEvent}</span><a href="IndexBRight" target="_blank">看房次数:</a></li>
					<li><span>${countGroup}</span><a href="IndexBRight" target="_blank">参团次数:</a></li>
					<li><span>${countEvent}</span><a href="IndexBRight" target="_blank">参加活动:</a></li>
					<li><span>${countOrder}</span><a href="IndexBRight" target="_blank">成交套数:</a></li>
					<li><span></span><a href="IndexBRight" target="_blank">成交金额:</a></li>
					<li><span></span><a href="IndexBRight" target="_blank">我的推荐数:</a></li>
</ul>
<!---End Y2客户--->
</div>
    </div>
<!--End右边--> 
 <div class="tanchuc" id="liuyanBox">
 <form action="insertUserMsg?cusId=cusId&textMsg=textMsg" id="form1" method="post" >
     <div class="tanchusc">
      <div class="tanchuc-tel" >
         <img src="images/liuyan.png" width="146" height="52" />
         	<div style="width: 80px;height: 50px;margin-top: 8px;margin-right：10px;float: right;">
         		<input type="submit" value="[提交]" style="background-image: url('images/queding.png');width: 38px;height: 11px"/><br>
         		<input type="button" value="[退出]" style="background-image: url('images/tuichu.png');margin-top: 14px;width: 38px;height: 11px" id="exit"  onclick="closeBox('liuyanBox')" >
         	</div>
         </div>
      <div class="tanchuc-tel-right" ></div>
      </div>     
      <div class="tanchuc-co" >
         <div class="tanchuc-cos">
            <textarea cols="62" rows="5" name="textMsg"></textarea>
         </div>         
      </div>
      <div class="tanchuc-bottom">
         <div class="tanchuc-bottom-left"><img src="images/bottom-leftbg.png" width="17" height="16" /></div>
         <div class="tanchuc-bottom-con"></div>
         <div class="tanchuc-bottom-right"><img src="images/rightjiao-bg.png" width="16" height="16" /></div>
       </div>     
     </form>  
   </div>
   
    <div class="tanchuc" id="photoBox">
    <form action="ChangePhoto" id="form1" enctype="multipart/form-data" method="post">
     <div class="tanchusc">
      <div class="tanchuc-tel">
         <img src="images/genghuan.png" width="146" height="52" />
         <span><a href="#"  onclick="closeBox('photoBox')">[ 取消 ]</a></span>
         <span><input type="submit" value="[确定]"/></span>
      </div>
      <div class="tanchuc-tel-right"></div>
      </div>
      
      <div class="tanchuc-co">
         <div class="tanchuc-coa">
           <dl>
             <dt><img src="images/touxiang.jpg" width="103" height="104" id="touxiang"/> </dt>
             <dd>本地上传:<input type="file" id="file" name="filePath" style=" border: 1px solid #36A3E0; paading:2px; height:22px; margin:1px;"
             	onchange="getPath(this.value);"/></dd>
             <dd><a href="#" onclick="photoOpen();">头像相册</a></dd>
           </dl>  
           <div id="touPhoto" style="display: none">
      	    <ul class="xiangpian">
				<li><img src="images/Y13XCimg.jpg" id="img0" onload="DrawImage(this,103,104)" onclick="checkPhoto();"/></li>
				<li><img src="images/Y13XCimg.jpg" onload="DrawImage(this,103,104)"/></li>
				<li><img src="images/Y13XCimg.jpg" onload="DrawImage(this,103,104)"/></li>
				<li><img src="images/Y13XCimg.jpg" onload="DrawImage(this,103,104)"/></li>
				<li><img src="images/Y13XCimg.jpg" onload="DrawImage(this,103,104)"/></li>
			</ul>
      </div>       
         </div>      
         
      </div>
      <div class="tanchuc-bottom">
         <div class="tanchuc-bottom-left"><img src="images/bottom-leftbg.png" width="17" height="16" /></div>
         <div class="tanchuc-bottom-con"></div>
         <div class="tanchuc-bottom-right"><img src="images/rightjiao-bg.png" width="16" height="16" /></div>
      </div>
      </form>
   </div>  
   <script type="text/javascript">
   /* 弹出操作 */
	function photoOpen(){
			var Idiv=document.getElementById("touPhoto");
			Idiv.style.display="block";
		} 
		function checkPhoto(){
			var Idiv=document.getElementById("img0");
			var touxiang=document.getElementById("touxiang");
			touxiang.src=Idiv.src;
			alert(Idiv.src);
		}
		
	    //获取上传图片的本地路径 
	    function getPath(obj){ 
	    	alert(document.getElementById("file").files[0].getAsDataURL());
	    	document.getElementById("img").src = document.getElementById("file").files[0].getAsDataURL(); 

	    };
   </script>
</body>
</html>
