<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="js/page/page.css" type="text/css" />
<!---总体分类样式--->
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
	function getEventInfo(eventName,eventId){
		parent.document.getElementById('orderObj').value=eventName;
		parent.document.getElementById('synOrderObj').value=eventName;
		parent.document.getElementById('eventId').value=eventId;
		parent.document.getElementById('payAmount').value=0;
	}
	
	// 分页方法
	$(document).ready(function() {
		var strCurPage=${curPage};
		var strPageCount=${pageCount};
		$("#fenye").pager({curPage : strCurPage,pageSize:1,pageCount : strPageCount,goPageCall : goPage});
		
		function goPage(curPage, pageSize){
			document.location.href="queryEventInfoList?curPage="+curPage+"&pageSize="+pageSize;
		}
	});
</script>
</head>
	<body>
	<div class="Y4HJYR16">
		<ul>
			<c:if test="${empty lstEventInfo }">
				<span>
					暂无记录！
				</span>
			</c:if>
			<c:if test="${!empty lstEventInfo }">
				<c:forEach items="${lstEventInfo }" var="lstEventInfo">
					<span>
						<ul>
							<li>
								<a onclick="getEventInfo('${lstEventInfo.eventTitle }','${lstEventInfo.eventId }');" style="cursor: pointer;">
									<h3>${lstEventInfo.eventTitle }</h3>
								</a>
							</li>
							<li>开始时间:<fmt:formatDate value="${lstEventInfo.eventStartTime }" pattern="yyyy-MM-dd"/> </li>
							<li>活动地点:${lstEventInfo.eventAddress }</li>
						</ul>
					</span>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<div id="fenye">
				
	</div>
	</body>
</html>