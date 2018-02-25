<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/huodong.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var curPage=${curPage};
	var pageCount=${pageCount};
	
	$("#fenye").pager({curPage:curPage,pageSize:6, pageCount:pageCount, goPageCall:goPage});
	
	function goPage(curPage, pageSize){
		var frameName= $("#frameName").val();
		location.href="frame?frameName="+frameName+"&curPage="+curPage+"&pageSize="+pageSize;
	}
});
</script>
<title>Insert title here</title>

</head>
<body>
<input type="hidden" id="frameName" value="${frameName}" />
<c:forEach items="${discussList}" var="discuss" varStatus="status">
	<ul class="pinglun_list">
	<c:forEach items="${discuss.houseInfo }" var="info">
		<li style="width:89px;">${info.houseName }</li>
	</c:forEach>
		<li style="width:397px; color:#959698;">${discuss.content}</li>
		<li>
			<fmt:formatDate value="${discuss.createDate}" pattern="MM.dd a hh:mm" type="date"/>
		</li>
		<li><a href="houseInfoRemark?houseId=${discuss.houseId }&userType=&doRemark=y&curPage=1&pageSize=10" target="_blank">还要评论</a></li>
	</ul>
</c:forEach>
<div id="fenye"></div>
</body>
</html>