<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>请查看大图 - 我的蜂蜜</title>
<link rel="stylesheet" href="css/layout.css" type="text/css" />
<link rel="stylesheet" href="css/index.css" type="text/css" />
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
<!---总体分类样式--->
<link href="css/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>

<body>
<!--头部-->
<div class="FlhTopOuts">
	<div class="FlhTops">
    <div class="FlhLogos"></div>
        <div class="Y611grzy"><a href="#">赵美丽</a>的个人主页</div>
  <div class="TopRights">
            <span class="FLHMaps"><div>房立方</div><img  src="images/mapImg.png"/><font>主题会所分布网点</font></span>
            <span class="FLHphones"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></span>
        </div>
	</div>
</div>
<div class="FLHEscOUTs">
	<div>
    	<font>赵美丽欢迎你进入Ta的个人主页!</font>
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
<ul class="Y611wdfm">
<li><a href="#">[给Ta留言]</a></li>
<li><a href="#">[给Ta发消息]</a></li>
</ul>
        </div>
    	<ul class="treeNav">
        <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><a href="Y611WDFM.html"><font>Ta的个人主页</font></a>
               </div>
                <div class="xian"></div>
</li>
		              <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><a href=""><font>资料</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><a href="Y611WDFM-xiangce.html"><font>相册</font></a>
             </div>
                <div class="xian"></div>
            </li>
			<li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><a href="Y611WDFM-rizhi.html"><font>日志</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><a href="Y611WDFM-kaixiaojilu.html"><font>开销记录</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/10.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="Y611WDFM-fang.html">Ta分享给我的楼盘</a></div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="Y611WDFM-lygft.html">Ta分享给我的旅游购房团</a></div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/12.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">Ta分享给我的活动</a></div>
                <div class="xian"></div>
            </li>
            
        </ul>
    </div>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
	   <!---传靓照--->
		<div class="Y04rizhi">
<div class="Y13ZPXQ"><img src="images/Y13ZPXQ.jpg" /></div>

</div>
       <!---End 传靓照---> 
    </div>
<!--End右边-->    
</div>
</body>
</html>
