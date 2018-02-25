<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易介宝首页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
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
</head>

<body>
<!--头部-->
<div class="FlhTopOut">
	<div class="FlhTop">
        <div class="FlhLogo"></div>
		<div class="TopRight">
            <span class="FLHphone"><a href="../funlifun/index.html"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></a></span>
        </div>
		<div id="menu">
		     <ul>
<<<<<<< .mine
              <li><a href="index-a.html" id="cur">首页</a></li>
              <li><a href="index-geren.html">个人主页</a></li>
              <li><a href="index-b-a.html">客户</a></li>
              <li><a href="index-fang.html">房源</a></li>
              <li><a href="jiaoyiY4.html">订单</a></li>
              <li><a href="Y52xuexi.html">学习</a></li>
              <li><a href="<%=basePath%>friendsManage">好友</a></li>
              <li><a href="Y7chihewanle.html">吃喝玩乐</a></li>
               <li><a href="index-xiaoxi.html">消息</a></li>
=======
             <li><a href="IndexA" id="cur">首页</a></li>
              <li><a href="IndexGeren">个人主页</a></li>
              <li><a href="IndexBA">客户</a></li>
              <li><a href="IndexFang">房源</a></li>
              <li><a href="JiaoyiY4">订单</a></li>
              <li><a href="Y52xuexi">学习</a></li>
              <li><a href="IndexHaoyou">好友</a></li>
              <li><a href="Y7chihewanle">吃喝玩乐</a></li>
               <li><a href="IndexXiaoxi">消息</a></li>
>>>>>>> .r2333
		  </ul>
			          </div>
        
	</div>
</div>
<div class="FLHEscOUT">
	<div>
    	<font>欢迎您进入易介宝! <a href="denglu.html">[安全退出]</a></font>
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
                	<img src="images/1.jpg" /><font><a href="IndexRenshou">认售楼盘</a></font>                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="IndexATianjia">添加客户</a></font>
               </div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="Y03juluyuehui">记录约会</a></font>
               </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="RizhiY04Home">写日志</a></font>
              </div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><font><a href="Y13Xiangce">传靓照</a></font>               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/6.jpg" /><font><a href="KaixiaojiluY06">记录开销</a></font>
             </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/7.jpg" /><font><a href="HomejiaoyiY4">报名（下订单）</a></font>               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/8.jpg" /><font><a href="HomeTJFXY4">推荐分享</a></font>               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><font><a href="#">社交hub</a></font>
               </div>
                <div class="xian"></div>
            </li>
            <li>&nbsp;</li>
            <li>&nbsp;</li>
            <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><font><a href="#">我的财富</a></font>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><font><a href="#">积分商场</a></font>
               </div>
                <div class="xian"></div>
            </li>
			<li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><font><a href="#">积分兑换</a></font>
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
	  <div class="right-pot">
	      <a href="HomejiaoyiY4.html"><img src="images/blue.gif" border="0" /></a>
		  <span><a href="Y03juluyuehui.html"><img src="images/yellow.gif" border="0" /></a></span>
		  <a href="index-xiaoxi.html"><img src="images/red.gif" border="0" /></a> </div>
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
			    <ul>
				   <li>祝贺蜂蜜<a href="index-haoyou-right.html" style="color:#005EAC; text-decoration:underline;"><span class="zsh12">赵山河</span></a>成功销售“北京绿城Z字天上人间第一期B栋2203室”！</li>
				   <li><span class="dda">2012.03.21</span></li>
				</ul>
				<ul>
				   <li>祝贺蜂蜜<a href="index-haoyou-right.html" style="color:#005EAC; text-decoration:underline;"><span class="zsh12">赵山河</span></a>成功销售“北京绿城Z字天上人间第一期B栋2203室”！</li>
				   <li><span class="dda">2012.03.21</span></li>
				</ul>
                <ul >
				   <li>祝贺蜂蜜<a href="index-haoyou-right.html" style="color:#005EAC; text-decoration:underline;"><span class="zsh12">赵山河</span></a>成功销售"北京绿城Z字天上人间第一期B栋2203室"！</li>
				   <li><span class="dda">2012.03.21</span></li>
				</ul>
                <ul>
				   <li>祝贺蜂蜜<a href="index-haoyou-right.html" style="color:#005EAC; text-decoration:underline;"><span class="zsh12">赵山河</span></a>成功销售"北京绿城Z字天上人间第一期B栋2203室"！</li>
				   <li><span class="dda">2012.03.21</span></li>
				</ul>
                <ul style="border:none;">
				   <li>祝贺蜂蜜<a href="index-haoyou-right.html" style="color:#005EAC; text-decoration:underline;"><span class="zsh12">赵山河</span></a>成功销售"北京绿城Z字天上人间第一期B栋2203室"！</li>
				   <li><span class="dda">2012.03.21</span></li>
				</ul>
		      </div>
              
			   <div class="right-l-c-r">
			   <span class="biao"><img src="images/33.jpg" /></span>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b"><a href="index-b-right-zhao.html">赵山河</a></span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
               
			</div> 
			</div>
       		
        </div>
        <div class="Rightright">
          <ul class="Y1gerenzhuye">
              <li><a href="index-xiaoxi.html">客户点名</a>(<a href="index-xiaoxi.html" class="zsh12">1/13</a>)</li>
              <li><a href="index-xiaoxi.html">客户评论</a>(<a href="index-xiaoxi.html" class="zsh12">2/13</a>)</li>
              <li><a href="index-xiaoxi.html">好友分享</a>(<a href="index-xiaoxi.html" class="zsh12">1/13</a>)</li>
              <li><a href="index-xiaoxi.html">好友消息</a>(<a href="index-xiaoxi.html" class="zsh12">3/13</a>)</li>
              <li><a href="index-xiaoxi.html">互动请求</a>(<a href="index-xiaoxi.html" class="zsh12">1/13</a>)</li>
              <li><a href="index-xiaoxi.html">系统消息</a>(<a href="index-xiaoxi.html" class="zsh12">1/13</a>)</li>
          </ul>
          
            
          <div class="Out">
           <div class="rightTittle">
          	<font>我的客户列表</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
            <div class="Content">
           	<div class="right-l-c-l">
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b"><a href="index-b-right-zhao.html">赵山河</a></span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
               <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
               <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
               <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
               
			</div>
            <div class="pailies">
            <ul>
           <li>&gt;</li>
           <li>1</li>
           <li>&lt;</li>
         </ul>
         </div>
			</div>
          </div>
           <div class="Out" id="Out">
           <div class="rightTittle">
          	<font>蜂蜜推荐的楼盘</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
          <div class="Content" id="Content">
           	<ul class="corridorConter">
           		<li>
                	<a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html" target="_blank"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html" target="_blank" ><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html" target="_blank"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                 <li>
                	<a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html"  target="_blank"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html" target="_blank"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html" target="_blank"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
             
           </ul>
           <div class="pailies">
            <ul>
           <li>&gt;</li>
           <li>1</li>
           <li>&lt;</li>
         </ul>
         </div>
           </div>
           
         </div>  
		 
		 <div class="Out">
           <div class="rightTittle">
          	<font>今日到访的客户</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
            <div class="Content">
           	<div class="right-l-c-l">
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b"><a href="index-b-right-zhao.html">赵山河</a></span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
			   <ul>
			      <img src="images/cat.jpg" />
			      <li><span class="b">赵山河</span> <span class="d">深圳市</span> </li>
			   </ul>
           
			</div>
            
			</div>
          </div>
          
		   
		   <div class="Out">
           <div class="rightTittle" style=" margin:30px 0 0 0; float:left;">
          	<font>今日到访的同行</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
            <div class="Content">
           	   <div class="fangmis">
                 <dl>
                <a href="index-haoyou-xiangqing.html"><img src="images/mishu-mg.gif" border="0" /></a>
                <dd><a href="index-haoyou-xiangqing.html">赵山河</a></dd>
                <dd><span>常住地：北京</span><span>服务客户：12</span></dd>
                <dd>擅长楼盘：豪宅、别墅、城堡</dd>
                 </dl>
                </div>
                <div class="fangmis">
                 <dl>
                <a href="index-haoyou-xiangqing.html"><img src="images/mishu-mg.gif" border="0" /></a>
                <dd><a href="index-haoyou-xiangqing.html">赵山河</a></dd>
                <dd><span>常住地：北京</span><span>服务客户：12</span></dd>
                <dd>擅长楼盘：豪宅、别墅、城堡</dd>
                 </dl>
                </div>
                
           	  
                
                
           </div>
         
            
</div>
		 
	</div>	 
  </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>
