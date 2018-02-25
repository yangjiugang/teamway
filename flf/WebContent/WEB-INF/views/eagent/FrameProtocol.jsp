<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>形象礼仪 - 学习</title>
<link rel="stylesheet" href="css/eagent/study_layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/study_index.css" type="text/css" />
<link href="css/eagent/yijiebao.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var curPage=${curPage};
		var pageCount=${pageCount};	
		$("#fenye").pager({curPage:curPage,pageSize:5, pageCount:pageCount, goPageCall:goPage});
		
		function goPage(curPage, pageSize){
			window.location.href="getUserInfoList?curPage="+curPage+"&pageSize="+pageSize+"&userId=1";
		}
	});
</script>
</head>
<body>
<div class="Y52xuexi">
	<div class="Y52xuexi_top">
		<div class="Y52xuexi_top_left">
			<c:if test="${type==0 }">
				${format==0?"文字书刊":"音频视频" }类学习资料
			</c:if>
			<c:if test="${type==1 }">
				${format==0?"文字书刊":"音频视频" }类学习资料
			</c:if>
			<c:if test="${type==2 }">
				${format==0?"文字书刊":"音频视频" }类学习资料
			</c:if>
			<c:if test="${type==3 }">
				${format==0?"文字书刊":"音频视频" }类学习资料
			</c:if>
		</div>
		<div class="Y52xuexi_top_right"><img src="images/zhankai(black)1.jpg" /></div>
	</div>
		<div class="Y52xuexiTitle">
		<div class="Y52xuexiTitle1">序号</div>
		<div class="Y52xuexiTitle2">标题</div>
		<div class="Y52xuexiTitle3">日期</div>
		</div>
	<c:forEach items="${clubStudyDataList }" var="clubStudyData">
		<div class="Y52xuexiNo">
		<div class="Y52xuexiNo1">${clubStudyData.dataId }</div>
		<div class="Y52xuexiNo2"><a target="_blank" href="showStudyInfo?dataId=${clubStudyData.dataId }">${clubStudyData.dataTitle}</a></div>
		<div class="Y52xuexiNo3">[<fmt:formatDate value="${clubStudyData.uploadDateAt}" pattern="yyyy-MM-dd" type="date"/>]</div>
		</div>
	</c:forEach>
</div>
<!---统计--->
<p class="Y04tong">统计：${count }条信息</p>
<!---End 统计--->
<div id="fenye"></div>
</body>
</html>