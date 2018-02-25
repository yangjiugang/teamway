<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>房源</title>

<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>

<script type="text/javascript" src="js/page/page.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />



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
	var curPage = ${curPage};
	var pageCount = ${pageCount};
	$(document).ready(function(){
		$("#page").pager({curPage:curPage, pageSize:3, pageCount:pageCount, goPageCall:goPage});
	});
	
	function goPage(curPage, pageSize) {
		window.location.href = "${pageContext.request.contextPath}/fangyuanAll?curPage="+curPage+"&pageSize="+pageSize;
	}
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
              <li><a href="index-a.html">首页</a></li>
              <li><a href="index-geren.html">个人主页</a></li>
              <li><a href="index-b-a.html">客户</a></li>
              <li><a href="fangyuanAll">房源</a></li>
              <li><a href="jiaoyiY4.html">订单</a></li>
              <li><a href="Y52xuexi.html">学习</a></li>
              <li><a href="index-haoyou.html">好友</a></li>
              <li><a href="Y7chihewanle.html">吃喝玩乐</a></li>
               <li><a href="index-xiaoxi.html">消息</a></li>
		  </ul>
			          </div>
        
	</div>
</div>
<div class="FLHEscOUT">
	<div>
    	<font>欢迎您进入房乐会! <a href="denglu.html">[安全退出]</a></font>
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
		<div class="jieshao">
		   <ul>
		   <li> 已有<span class="red">3</span>同行加你为好友</li> 
           <li> 已有<span class="red">3</span>客户点名你为房秘书</li>
		   </ul>
		 </div>
        <ul class="treeNav">
		   
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="#">我发布的房源</a></font>
                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="fangyuanAll">我认售的房源</a></font> 
				</div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="fangyuanxue">我学习过的房源</a></font>               </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="index-fang-b.html">我的客户关注的房源</a></font>               </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><font><a href="index-fang-c.html">我的客户收藏的房源</a></font>               </div>
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
                	<img src="images/10.jpg" /><font><a href="../funlifun/monopolyofsale.html">搜索房源</a></font>               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><font><a href="../funlifun/monopolyofsale(L).html">搜索购房团</a></font>               </div>
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
                	<img src="images/12.jpg" /><font><a href="../funlifun/monopolyofsaleM2.html">搜索蜂蜜</a></font>
               </div>
                <div class="xian"></div>
            </li>
        </ul>
    </div>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
	   
	   <form method="post" action="***">
         <ul class="Y01homeSOSO">
		  <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="city"  value="请输入..."/>
             </span>城市：</li>
            <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="price"  value="请输入..."/>
             </span>价格：</li>
			 <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="brokerage"  value="请输入..."/>
             </span>佣金比率：</li>
           <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="openDate" value="请输入..."/>
             </span>开盘时间：</li>
			 <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="ContractPeriod"  value="请输入..."/>
             </span>签约时期：</li>
			 <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="sales"  value="请输入..."/>
             </span>促销活动：</li>
			 <li><span><input class="Y01homeSOSOinput" type="text" id="txt" name="housesActuality"  value="请输入..."/>
             </span>楼盘现状：</li>
            <li><input class="Y01input" name="searchkey" type="text" value="请输入关键词" onFocus="this.value"/>
                <input name="button" type="image" src="images/Y01SOSO.gif"/>
           </li>
         </ul>
        </form>

	   <div class="Rightleft">
	    <div class="jiange-z">
                  <span class="tltle-wenzi">我认售的房源</span>
                  <span  class="title-line" style="width:414px;"></span>
              </div> 
			<div class="fangy"> 

			 <c:forEach items="${fangyuanInfo}" var="u">
					<div class="fangy-c">
						<span class="ico">
							<a href="../funlifun/lifang/index-gonggao.html" >
								<img src="${u.houseInfo.housePic}" height="128" wide="199"/> <!-- (1图片路径) -->
							</a>
						</span> 
				        <dl>
						    <dd>
							    <a href="#"style="margin:0px;">营销统计</a>
							    <a href="HomeTJFXY4.html">推荐分享</a>
							    <a href="../funlifun/lifang/index-gonggao.html">喊价</a>
							    <a href="../funlifun/lifang/index-gonggao.html" >评论</a>
						    </dd>
						    
						    <dt style="margin:10px 0 0 0;">
							    <span>楼盘名称：</span>
							    <span style="color:#C0091D;">  ${u.houseInfo.houseName}  </span>
						    </dt>
							<dt>
								<span>价格：</span>   ${u.houseInfo.housePrice}元/m 
							</dt>
							<dt>
								<span>户型：</span>   ${u.houseInfo.houseStructureType}
							</dt>
							                          
							<dd>
								<img src="images/regie.jpg" alt="新房专卖" style="margin-bottom:-7px;" />
								&nbsp;-&nbsp;${u.fcSysArea.areaName}&nbsp;-&nbsp;${u.houseInfo.businessRegion}&nbsp;-&nbsp;山景&nbsp;-&nbsp;别墅
							</dd>
						</dl>
					</div>
	        </c:forEach>
	        <div id="page"></div>
	 </div>
	 
	
	
	  
	  <span style="margin:150px 0 20px 50px; float:left; display:inline;"><img src="images/pinglun-bg.gif" /></span>
	  
	  </div>
        <div class="Rightright">
          <!---Y2客户--->
		<ul class="Y2fang">
			<li><span>　</span><span>我的客户</span><span>所有客户</span></li>
			<li><span><a href="index-fang-right.html">客户关注数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">客户收藏数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">客户喊价数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">客户评论数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">看房客户数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">订购客户数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">签约客户数:</a></span><span>21</span><span>21</span></li>
			<li></li>
			<li><span>　</span><span>我的好友</span><span>所有蜂蜜</span></li>
			<li><span><a href="index-fang-right.html">蜂蜜关注数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">蜂蜜认售数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">蜂蜜喊价数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">蜂蜜评论数:</a></span><span>21</span><span>21</span></li>
			<li><span><a href="index-fang-right.html">游客关注数:</a></span><span>21</span><span>21</span></li>
		</ul>
		<!---End Y2客户--->
          
            
      </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>
