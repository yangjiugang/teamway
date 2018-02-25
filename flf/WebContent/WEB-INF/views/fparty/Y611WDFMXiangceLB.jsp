<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>相册列表 - 我的蜂蜜</title>
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
	<%@include file="MyFengMiTop.jsp" %>
	<!--End头部-->
	<div class="middle">
		<!--左边-->
		<%@include file="MyFengMiLeft.jsp" %>
	<!--右边-->
		<div class="FLHRight">
			<!---传靓照--->
			<div class="Y04rizhi">
				<div class="Y04rizhilist">
					<div class="Y13ZXZPs">
						<ul class="Y13xiangce">
					<li><input type="image" name="imageField" id="imageField"
						src="images/Y13scxzp.gif" onclick="showBox('box')"/></li>
						<c:forEach items="${photosList}" var="photosList">
					<li><a href="Y13Xiangxi?photoId=${photosList.photoId}"><img
							src="${photosList.photoPath}" onload="DrawImage(this,100,67)"/></a></li>
							</c:forEach>
					</ul>
					</div>
					<ul class="Y13XCimg">
					<c:forEach items="${photos}" var="photos">
						<li><a href="Y13Xiangxi?photoId=${photos.photos.photoId}"><img
								src="${photos.photos.photoPath}" onload="DrawImage(this,170,131)"/></a><br />
								<a href="DeletePhoto?photoId=${photos.photos.photoId}"><img src="images/Y13X.gif" style="margin-top:5px;" /> 删除</a></li>
						
					</c:forEach>
					</ul>
					<!---页面切换--->
					<div id="fenyeyi">
						<ul>
							<li><a href="">&lt;</a></li>
							<li><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li><a href="">5</a></li>
							<li><a href="">6</a></li>
							<li style="border: none;">&hellip;</li>
							<li><a href="">99</a></li>
							<li><a href="">100</a></li>
							<li><a href="">&gt;</a></li>
						</ul>
						<span><form>
								跳转：<input type="text" class="Gotext" /> 页&nbsp;<input
									type="image" src="images/Go.jpg"
									style="position: absolute; bottom: 2px; _bottom: 3px;" />
							</form></span>
					</div>
					<!---End 页面切换--->
					<div class="Y13pinglun">
						<div class="Y13pinglun1">
							<img src="images/Y1350.jpg" />
						</div>
						<div class="Y13pinglun2">
							<textarea name="" cols="" rows=""></textarea>
							<BR />
							<input type="image" src="images/Y13FBPL.gif" />
						</div>
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
