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
	// 分页方法
	$(document).ready(function(){
		var curPage=${curPage };
		var pageCount=${pageCount };
		$("#fenye").pager({curPage : curPage,pageSize:4,pageCount : pageCount,goPageCall : goPage});
		// 分页回调方法
		function goPage(curPage, pageSize) {
			window.location.href="getTourismLine?curPage="+curPage+"&pageSize="+pageSize;
		}
	});
	
	function getTourismLine(groupName,groupPrice,joinCnt,houseGroupId){
		parent.document.getElementById('orderObj').value=groupName;
		parent.document.getElementById('payAmount').value=groupPrice;
		parent.document.getElementById('joinCnt').value=joinCnt;
		parent.document.getElementById('houseGroupId').value=houseGroupId;
		parent.document.getElementById('synPayAmount').value=groupPrice;
		parent.document.getElementById('synOrderObj').value=groupName;
	}
</script>
</head>
	<body>
	<div class="Y4HJYR16">
		<ul>
			<c:if test="${empty houseGroupInfo }">
				<span>
					暂无记录！
				</span>
			</c:if>
			<c:if test="${!empty houseGroupInfo }">
				<c:forEach items="${houseGroupInfo }" var="houseGroupInfo">
					<span>
						<a target="_blank"><img width="77" height="49" src="${houseGroupInfo.picPath }" /></a>
						<ul>
							<li>
								<a onclick="getTourismLine('${houseGroupInfo.groupName }','${houseGroupInfo.groupPrice }','${houseGroupInfo.joinCnt }','${houseGroupInfo.houseGroupId }')" style="cursor: pointer;">
									<h3>${houseGroupInfo.groupName }</h3>
								</a>
							</li>
							<li>发团时间:<fmt:formatDate value="${houseGroupInfo.groupStartDate }" pattern="yyyy-MM-dd"/> </li>
							<li>截至时间:<fmt:formatDate value="${houseGroupInfo.groupDeadlineDate }" pattern="yyyy-MM-dd"/> </li>
							<li>参团价格:${houseGroupInfo.groupPrice }元</li>
							<c:if test="${houseGroupInfo.houseProperties == 1 }">
								<li>普通住宅</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 2 }">
								<li>花园洋房</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 3 }">
								<li>别墅</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 4 }">
								<li>商住楼</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 5 }">
								<li>写字楼</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 6 }">
								<li>商铺</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 7 }">
								<li>厂房</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 8 }">
								<li>仓库</li>
							</c:if>
							<c:if test="${houseGroupInfo.houseProperties == 9 }">
								<li>其他</li>
							</c:if>
						</ul>
					</span>
				</c:forEach>
			</c:if>
		</ul>
		<!---页面切换--->
		<div id="fenye">
			
		</div>
	</div>
	</body>
</html>