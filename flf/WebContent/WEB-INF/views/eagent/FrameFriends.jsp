<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function(){
		var curPage=${curPage};
		var pageCount=${pageCount};
		$("#fenye").pager({curPage:curPage,pageSize:3, pageCount:pageCount, goPageCall:goPage});
		
		function goPage(curPage, pageSize){
			var frameName="${frameName}";
			var sex="${sex}";
			var city="${city}";
			if(strTrim(sex)==""){
				sex="";
			}else if(isNaN(sex)){
				alert("sex is not a number");
				sex="";
			}
			if(strTrim(city)=="")
				city="";
			
			location.href="myFriends?frameName="+frameName+"&sex="+sex+"&city="+city+"&curPage="+curPage+"&pageSize="+pageSize;
		}
		
		function strTrim(str){   
		    return str.replace(/(^\s*)|(\s*$)/g,   "");  
		}
		
	});
	function sendMsg(id){
		parent.setFriendId();
		parent.document.getElementById("friendId").value=id;
	}
	function showStat(id){
		parent.showStatInfo(id);
	}
</script>

</head>
<body>
	<c:forEach items="${friends}" var="friend">
	<div class="kehu-c">
		<dl>
		 <a href="index-haoyou-xiangqing.html"><img src="${friend.userInfo.photoPath }" border="0" /></a>
		<dt><span><a href="javaScript:showStat(${friend.userInfo.userId})">详细统计</a></span><span><a href="#">发信息</a></span><span><a href="javaScript:sendMsg(${friend.userInfo.userId})">留言</a></span><span><a href="HomeTJFXY4.html">推荐</a></span>姓名： <a href="index-haoyou-xiangqing.html">${friend.userInfo.name}</a></dt>
		<dt>生日：<fmt:formatDate value="${friend.userInfo.firstWorkDate}" pattern="yyyy年MM月dd日" type="date"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;常住地： ${friend.userInfo.userCity }</dt>
		<dt>手机号：${friend.userInfoDetail.cellphone} &nbsp;&nbsp;&nbsp;  兴趣爱好：${friend.userInfoDetail.hobbies} </dt>
		</dl>
	</div>	  
	</c:forEach> 
	<div id="fenye"></div>
</body>
</html>