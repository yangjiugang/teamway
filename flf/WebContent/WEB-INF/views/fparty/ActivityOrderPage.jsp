<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的交易</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/huodong.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/dataValidate.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>

<script type="text/javascript">
	
	// 分页方法
	$(document).ready(function() {
		
		var strCurPage=${curPage};
		var strPageCount=${pageCount};
		$("#fenye").pager({curPage : strCurPage,pageSize:1,pageCount : strPageCount,goPageCall : goPage});
		
		function goPage(curPage, pageSize){
			document.forms["activityOrderForm"].action="getActivityOrder?curPage="+curPage+"&pageSize="+pageSize;
			document.forms["activityOrderForm"].submit();
		}
	});
	
	
</script>
<!---总体分类样式--->
<link href="css/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>

<body>
	<form name="activityOrderForm" method="post">
		<ul class="jiaoyi_list">
			<c:forEach items="${lstEventInfo}" var="u">
				<li style="width:89px; color:#005EAC;">${u.eventNum }</li>
				<li style="width:230px; color:#6D6E71;">${u.eventTitle }</li>
				<li style="width:131px; color:#005EAC;">
					<fmt:formatDate value="${u.eventInfoCustomer.createAt }" pattern="yyyy-MM-dd hh:mm" />
				</li>
				<li style="width:87px; color:#005EAC;">${u.eventInfoCustomer.isCheckin }</li>
				<c:if test="${u.eventInfoCustomer.isCheckin == 1 }">
					<li style=" width:66px; color:#005EAC;">
						到场
					</li>
				</c:if>
				<c:if test="${u.eventInfoCustomer.isCheckin == 0 }">
					<li style=" width:66px; color:#005EAC;">
						未到场
					</li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="fenye">
	</div>
	</form>
</body>
</html>
