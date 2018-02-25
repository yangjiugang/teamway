<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相册 - 我的蜂蜜</title>
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
                	<img src="images/10.jpg" /><a href="zl.html"><font>资料</font></a>
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
    <!--右边-->
		<div class="FLHRight">
			<!---传靓照--->
			<div class="Y04rizhi">
				<ul class="Y13xiangce">
					<li><input type="image" name="imageField" id="imageField"
						src="images/Y13scxzp.gif" onclick="showBox('box')"/>
					</li>
					<c:forEach items="${photosList}" var="photosList">
						<li><a href="Y13Xiangxi?photoId=${photosList.photoId}"><img
							src="${photosList.photoPath}" onload="DrawImage(this,100,67)"/></a></li>
					</c:forEach>
				</ul>
				<div class="Y04rizhi_tab">
					<ul>
						<li id="zzjs1" onclick="settab_zzjs('zzjs',1,2)" class="on_zzjs">所有相册</li>
						<li id="zzjs2" onclick="settab_zzjs('zzjs',2,2)">最新照片</li>
					</ul>
				</div>
				<div class="Y04rizhilist">
					<div id="zzjs_zzjs1">
						<ul class="Y13SYXB">
						<c:forEach items="${setList}" var="setList">
							<li><a href="Y13XiangceLB?setName=${setList.setName}"><img
									src="images/Y13SYXB1.jpg" /></a>
								<dt>${setList.setName}</dt></li>
						</c:forEach>
						</ul>
					</div>

					<div id="zzjs_zzjs2" style="display: none;">
						<ul class="Y13XCimg">
						<c:forEach items="${photosList}" var="ph1otosList">
							<li><a href="Y13xiangxi.html"><img
									src="${photosList.photoPath}" onload="DrawImage(this,170,131)" onmouseup="DrawImage(this,0,0)"/></a></li>
						</c:forEach>
						</ul>
					</div>


				</div>
			</div>
			<!---End 传靓照--->
		</div>
		<!--End右边-->
	</div>
	
	<!-- Start 上传图片 -->
	<div id="box" class="tanchuc">
			<form method="post" action="UploadPhotoServlet">
	<div style="height: 300px;background-color:#C5D9FF;width: 550px;">
		<div id="content" style="background-color: white;width: 530px;background-color: #C5D9FF;">
				<div
					style="width:524px; display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 4px;height: 18px;float: left;">
					<span id="spanButtonPlaceholder"></span>
					<input id="btnUpload" type="button" value="上  传"
						onclick="startUploadFile();" class="btn3_mouseout" style="margin-bottom: 12px;"/>
					<input id="btnCancel" type="button" value="取消上传"
						onclick="cancelUpload();" disabled="disabled" class="btn3_mouseout" style="margin-bottom: 12px"/>
					<input disabled="disabled" type="text" readonly="readonly" class="btn3_mouseout" id="xiangce" value="选择相册:" style="height18px;width:58px;;margin-bottom: 12px;background-color: #C5D9FF;" onclick="xuanZe();" onclick="xuanZe();" >
					<select name="photoSet" id="openPhoto" style="width: 80px;margin-bottom: 12px;margin-right: 4px;" onchange="aa();">
					<option  value="0"></option>
					<c:forEach items="${setList}" var="setList">
						<option value="${setList.setId}">${setList.setName}</option>
					</c:forEach>
					</select>
					<input onclick="newSet();" class="btn3_mouseout" type="button" value="创建相册" style="margin-bottom: 12px;padding: 4px;" />
					<input id="btnUpload" class="btn3_mouseout" style="margin-bottom: 12px;" type="button" value="退出" onclick="closeBox('box')" style="padding: 4px ">
		</div>
		<div id="divFileProgressContainer" style="height: 30px;" ><div id="newPhotoDiv"  style="float: right;display: none"><span >请输入相册名：<input id="setxin" value="" type="text" name="setPhoto"/></span></div></div>
		<div id="thumbnails" style="background-color: #C5D9FF;width: 530px;">
				<table id="infoTable" border="0" width="100%" style="display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 4px;margin-top:8px;">
				</table>
		</div>
	</div>
	</div>
	</form>
	</div>
	<!-- end 上传图片 -->
</body>
</html>