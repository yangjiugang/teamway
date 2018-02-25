<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<!---总体分类样式--->
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<link rel="stylesheet" href="js/page/page.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
	function getOrderObj(obj,eventId){
		parent.document.getElementById('orderObj').value=obj;
		parent.document.getElementById('synOrderObj').value=obj;
		parent.document.getElementById('eventId').value=eventId;
		// 看房不产生费用
		parent.document.getElementById('payAmount').value=0;
		parent.document.getElementById('synPayAmount').value=0;
	}
	
	// 分页方法
	$(document).ready(function() {
		var strCurPage=${curPage};
		var strPageCount=${pageCount};
		$("#fenye").pager({curPage : strCurPage,pageSize:1,pageCount : strPageCount,goPageCall : goPage});
		
		function goPage(curPage, pageSize){
			document.location.href="getSeeHouseInfoList?curPage="+curPage+"&pageSize="+pageSize;
		}
	});
</script>
</head>
	<body>
	<div class="Y4HJYR16">
		<ul>
			<c:if test="${empty lstSeeHouseInfo}">
				<span>
					暂无记录！
				</span>
			</c:if>
			<c:if test="${!empty lstSeeHouseInfo}">
				<c:forEach items="${lstSeeHouseInfo }" var="lstSeeHouseInfo">
					<span>
						<a href="" target="_blank"><img width="77" height="49" src="${lstSeeHouseInfo.houseLogo }" /></a>
						<ul>
							<li><a onclick="getOrderObj('${lstSeeHouseInfo.houseName }','${lstSeeHouseInfo.eventInfo.eventId }');" style="cursor: pointer;"><h3>${lstSeeHouseInfo.houseName }</h3></a></li>
							<li>${lstSeeHouseInfo.housePrice }元/m²</li>
							<li>${lstSeeHouseInfo.areaName }-${lstSeeHouseInfo.businessRegion }</li>
						</ul>
					</span>
				</c:forEach>
			</c:if>
		</ul>
		<div id="fenye">
				
		</div>
	</div>
	</body>
</html>