<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/portal/fms13.css" rel="stylesheet" type="text/css" />
<link href="css/portal/basic.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
		function closeDiv(){
			window.parent.document.getElementById('showInfo').style.display="none";
		}
</script>
</head>
<body>
<div style="width:870px; height:480px; background:#fff; OVERFLOW: scroll; overflow-x:hidden; border:4px solid #18E5E6;">

<div class="fms13">
<ul class="fms13Left">
<li><img src="${userInfo.photoPath}" /></li>
<c:forEach items="${userPhotos}" var="photo">
	<li><img src="${photo.photoPath}" /></li>
</c:forEach>
</ul>
<div class="fms13Right">

<div class="fms13RightTop">
<div class="fms13RightTopL">
<ul class="fms13RightTopLT">
<li>经纪人： ${userInfo.name}</li>
<li>&nbsp;</li>
<li>性别：${userInfo.sex==0 ? "男":"女"}</li>
<li>年龄：43岁</li>
<li>所在地：${userInfo.userCity}</li>
<li>入行时间：<fmt:formatDate value="${userInfo.firstWorkDate}" pattern="yyyy-MM-dd" type="date"/></li>
<li>关注人数：${userInfo.bhri }人</li>
<li>诚信指数：${userInfo.trustrank}</li>
</ul>

</div>
<div class="fms13RightTopR"><a href="#"><img src="images/xwb.gif" /></a></div>
</div>

<div class="fms13RightBottom">
自我评价：<br />
<p>    ${userInfo.userDesc}</p>
</div>
<div class="fms13RightBottom">
工作简历：<br />
<p>    不管你是烹饪高手、音乐王子、电影达人还是狂热驴友……百度空间都将给你一个最
佳的展示平台，一起来秀出你自己，分享你的达人经历吧！不管你是烹饪高手、音乐王子、
电影达人还是狂热驴友……百度空间都将给你一个最佳的展示平台，一起来秀出你自己，
分享你的达人经历吧！</p>
</div>
<div class="fms13RightBottom">
客户评论：<br />
<p>    不管你是烹饪高手、音乐王子、电影达人还是狂热驴友……百度空间都将给你一个最
佳的展示平台，一起来秀出你自己，分享你的达人经历吧！不管你是烹饪高手、音乐王子、
电影达人还是狂热驴友……百度空间都将给你一个最佳的展示平台，一起来秀出你自己，
分享你的达人经历吧！</p>
</div></div>


</div>

<div class="fms16gbx"><img src="images/x.png" onclick="closeDiv()" style="cursor: crosshair;" /></div>
</div>

</body>
</html>