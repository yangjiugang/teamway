<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	function getOrderObj(obj,homePrice,houseId){
		parent.document.getElementById('orderObj').value=obj;
		parent.document.getElementById('synOrderObj').value=obj;
		parent.document.getElementById('payAmount').value=homePrice;
		parent.document.getElementById('houseId').value=houseId;
	}
	
	// 分页方法
	$(document).ready(function() {
		var strCurPage=${curPage};
		var strPageCount=${pageCount};
		$("#fenye").pager({curPage : strCurPage,pageSize:1,pageCount : strPageCount,goPageCall : goPage});
		
		function goPage(curPage, pageSize){
			document.location.href="getHouseInfoList?curPage="+curPage+"&pageSize="+pageSize;
		}
	});
</script>
</head>
	<body>
	<div class="Y4HJYR16">
		<ul>
			<c:if test="${empty lstHouseInfo}">
				<span>
					暂无记录！
				</span>
			</c:if>
			<c:if test="${!empty lstHouseInfo}">
				<c:forEach items="${lstHouseInfo }" var="lstHouseInfo">
					<span>
						<a href="" target="_blank"><img width="77" height="49" src="${lstHouseInfo.houseLogo }" /></a>
						<ul>
							<li><a onclick="getOrderObj('${lstHouseInfo.houseName }','${lstHouseInfo.houseSaleControlInfo.homePrice }','${lstHouseInfo.houseId }');" style="cursor: pointer;"><h3>${lstHouseInfo.houseName }</h3></a></li>
							<li>${lstHouseInfo.housePrice }元/m²</li>
							<li>${lstHouseInfo.areaName }-${lstHouseInfo.businessRegion }</li>
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