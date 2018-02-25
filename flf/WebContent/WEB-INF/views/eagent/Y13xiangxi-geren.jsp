<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>请查看大图 - 个人主页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<!--<link rel="stylesheet" href="css/index.css" type="text/css" />-->
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/picture.js"></script>

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
<link href="css/eagent/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->

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
						<img src="images/1.jpg" /><font><a
							href="IndexRenshou">认售楼盘</a></font>
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
						<img src="images/3.jpg" /><font><a
							href="Y03juluyuehui">记录约会</a></font>
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
						<img src="images/5.jpg" /><font><a href="Y13Xiangce">传靓照</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/6.jpg" /><font><a
							href="KaixiaojiluY06">记录开销</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/7.jpg" /><font><a href="HomejiaoyiY4">报名（下订单）</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/8.jpg" /><font><a href="HomeTJFXY4">推荐分享</a></font>
					</div>
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
	   <!---传靓照--->
		<div class="Y04rizhi">
        <div class="Y13ZXZP">&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/zz.gif" /> 左转</a> &nbsp;|&nbsp; 
        <a href="#"><img src="images/yz.gif" /> 右转</a> &nbsp;|&nbsp; <a href="#"><img src="images/mh.gif" /> 美化</a> 
        &nbsp;|&nbsp; <a href="#"><img src="images/zy.gif" /> 转移</a> &nbsp;|&nbsp;   <a href="#"><img src="images/bj.gif" /> 编辑&nbsp; <img src="images/Y13S.gif" />
        </a> &nbsp;|&nbsp; <a href="DeletePhoto?photoId=${photos.photoId}"><img src="images/Y13X.gif" /> 删除</a>  &nbsp;|&nbsp; <a href="#">复制链接 <img src="images/Y13S.gif" /></a></div>
		<div class="Y13ZPXQ26" align="center"><img src="${photos.photoPath }" onload="DrawImage(this,734,710)"/></div>
		<p class="Y13ZPXQ26ckdt"><span><a href="#"><img src="images/ckdt.gif" /> 查看大图</a></span><a href="#">单击此处添加描述</a></p>
		</div>
       <!---End 传靓照---> 
    </div>
<!--End右边-->    
</div>






</body>
</html>
