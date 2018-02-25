<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>形象礼仪 - 学习</title>
<link rel="stylesheet" href="css/eagent/study_layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/study_index.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/iframeSetHeight.js"></script>

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
<%@ include file="EHeader.jsp" %>
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
                	<img src="images/1.jpg" /><font><a href="eagent_study_jumpClubStudy?type=0">形象礼仪</a></font>
              </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="eagent_study_jumpClubStudy?type=1">销售技巧</a></font>
               </div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="eagent_study_jumpClubStudy?type=2">行业政策</a></font>
               </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="eagent_study_jumpClubStudy?type=3">其他学习</a></font>
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
    <!---学习--->

	<iframe id="select" name="select" src="frameClubStudy?type=${type }&format=0&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
							width="100%" height="320" scrolling="no" frameborder="no">
	</iframe>
    
    <iframe id="select" name="select" src="frameClubStudy?type=${type }&format=1&curPage=1&pageSize=5"  style="scroll-face-color:#ffffff"
							width="100%" height="320" scrolling="no" frameborder="no">
	</iframe>
<!---End 页面切换--->
    </div>
    <!---End 学习--->
  </div>
<!--End右边-->    
</div>
</body>
</html>
