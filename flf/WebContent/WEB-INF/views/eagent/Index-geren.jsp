<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易介宝个人主页</title>
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
    	<font>欢迎您进入房乐会! <a href="Denglu">[安全退出]</a></font>
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
                	<img src="images/1.jpg" /><font><a href="IndexGerenZiliao">资料</a></font>
              </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="RizhiY04">日志</a></font>
               </div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="Y13XiangceGeren">相册</a></font>               </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="GRZYkxjlY06">开销</a></font>
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
		         <li><a href="#" id="cuter">我的动态</a></li>
			     <li><a href="#">好友动态</a></li>
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
		 
		 <div class="Out">
		   <div class="geren-ts">
		     <ul>
		         <li><a href="#" id="cuter">我的分享</a></li>
			     <li><a href="#">好友分享</a></li>
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
           		<li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html" ><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                 <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html" ><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
             
           </ul>
           </div>
         </div>  
         
         <div class="Out" id="Out">
           <div class="rightTittle">
          	<font>我的旅游购房团</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
          <div class="Content" id="Content">
           	
            <ul class="lygft10">
     <li><a href="../funlifun/line.html">年假特辑-北京6日团</a></li>
     <li>出团时间：2011.12.11-2011.12.30</li>
     <li>特价：<b>3888</b>元</li></ul>
     <ul class="lygft10">
     <li><a href="../funlifun/line.html">年假特辑-北京6日团</a></li>
     <li>出团时间：2011.12.11-2011.12.30</li>
     <li>特价：<b>3888</b>元</li></ul>
     <ul class="lygft10">
     <li><a href="../funlifun/line.html">年假特辑-北京6日团</a></li>
     <li>出团时间：2011.12.11-2011.12.30</li>
     <li>特价：<b>3888</b>元</li></ul>
     <ul class="lygft10">
     <li><a href="../funlifun/line.html">年假特辑-北京6日团</a></li>
     <li>出团时间：2011.12.11-2011.12.30</li>
     <li>特价：<b>3888</b>元</li></ul>
     <ul class="lygft10">
     <li><a href="../funlifun/line.html">年假特辑-北京6日团</a></li>
     <li>出团时间：2011.12.11-2011.12.30</li>
     <li>特价：<b>3888</b>元</li></ul>            
            
           </div>
         </div>  
		 <div class="Out" id="Out">
           <div class="rightTittle">
          	<font>我的好友</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
          <div class="Content">
           	<div class="right-l-c-l">
			  
             <div class="fangmis">
                 <dl>
                <img src="images/mishu-mg.gif" border="0" />
                <dd>赵山河</dd>
                <dd><span>常住地：北京</span><span>服务客户：12</span></dd>
                <dd>擅长楼盘：豪宅、别墅、城堡</dd>
                 </dl>
                </div>
                <div class="fangmis">
                 <dl>
                <img src="images/mishu-mg.gif" border="0" />
                <dd>赵山河</dd>
                <dd><span>常住地：北京</span><span>服务客户：12</span></dd>
                <dd>擅长楼盘：豪宅、别墅、城堡</dd>
                 </dl>
                </div>
                <div class="fangmis">
                 <dl>
                <img src="images/mishu-mg.gif" border="0" />
                <dd>赵山河</dd>
                <dd><span>常住地：北京</span><span>服务客户：12</span></dd>
                <dd>擅长楼盘：豪宅、别墅、城堡</dd>
                 </dl>
                </div> 
              
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
