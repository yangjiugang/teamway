<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="js/page/page.css" type="text/css"/>
<!---总体分类样式--->
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/keku.css" type="text/css" />
</head>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
	function getCusName(userName,customerId,cellphone,cusId,customerType){
		parent.document.getElementById('userName').value = userName;
		parent.document.getElementById('customerId').value = customerId;
		parent.document.getElementById('customerPhone').value = cellphone;
		parent.document.getElementById('cusId').value = cusId;
		parent.document.getElementById('synUserName').value = userName;
		parent.document.getElementById('customerType').value = customerType;
	}
	
	// 分页方法
	$(document).ready(function(){
		var curPage=${curPage};
		var pageCount=${pageCount};
		$("#fenye").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage});
		
		// 分页回调方法
		function goPage(curPage, pageSize) {
			document.location.href="getCusTomerList?curPage="+curPage+"&pageSize="+pageSize;
		}
	});
</script>
<body>
	<ul class="Y4right16">
		<c:if test="${empty lstCustomerInfoDetail}">
			<span>
				暂无记录！
			</span>
		</c:if>
		<c:if test="${!empty lstCustomerInfoDetail}">
			<c:forEach items="${lstCustomerInfoDetail }" var="lstCustomerInfoDetail">
				<li>
					<a style="cursor: pointer;" onclick="getCusName('${lstCustomerInfoDetail.name }','${lstCustomerInfoDetail.customerId }','${lstCustomerInfoDetail.cellphone }','${lstCustomerInfoDetail.cusId }','${lstCustomerInfoDetail.customerType }');"><img src="${lstCustomerInfoDetail.photoPath }" /></a>
					<a style="cursor: pointer;" onclick="getCusName('${lstCustomerInfoDetail.name }','${lstCustomerInfoDetail.customerId }','${lstCustomerInfoDetail.cellphone }','${lstCustomerInfoDetail.cusId }','${lstCustomerInfoDetail.customerType }');"> ${lstCustomerInfoDetail.name }</a>
				</li>
			</c:forEach>
		</c:if>
	</ul>
	<div id="fenye">
								
	</div>
</body>
</html>