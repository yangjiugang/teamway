<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
	<%@include file="MyFengMiTop.jsp" %>
	<!--End头部-->
	<div class="middle">
		<!--左边-->
		<%@include file="MyFengMiLeft.jsp" %>
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
