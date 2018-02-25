<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		EmployeeAppraisalListInfo();
	});
	function EmployeeAppraisalListInfo() {
		$("#list").jqGrid({
			url:"searchHistoryAnalyse",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','年-月','部门','岗位','本月绩效得分','绩效工资发放比例'],
			colModel: [{name:'employeeInfo.employeeId',hidden:true},
					   {name:'appraisalStartDate',formatter:'date',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m'}},
				   	   {name:'employeeInfo.organizationName'},
				   	   {name:'employeeInfo.postName'},
				   	   {name:'appraisalResult'},
				   	   {name:'appraisalRate'}
				   	   ],
		jsonReader:{
			  root: 'HistoryAnalyseList',
	   repeatitems: false
		},
		pager: '#pageList',
		height:'auto',
		autowidth: true,
		hidegrid: true,
		multiselect: true,
		viewrecords: true,
		rowNum:pageSize[0],
		rowList:pageSize
		});
	}

	function searchInfo() {
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		var organizationId = $("#organizationId").val();
		var postId = $("#postId").val();
		alert(startTime+":"+endTime+":"+organizationId+":"+postId);
		$("#list").setGridParam({url:"searchHistoryAnalyse"});
		$.extend($("#list").getGridParam('postData'),	{"startTime":startTime,"endTime":endTime,"organizationId":organizationId,"postId":postId});
		$("#list").trigger("reloadGrid");
	}
</script>
</head>
<body>
	<div class="listY" style="width: 100%;">
		<div id="zzjs_zzjs1" style="margin: 20px 0;">

			<div class="HR_lishijixiao" style="width: 95%;">
				<div class="HR_lishijixiaoL">
					按日期 从 <input name="startTime" id="startTime" class="Wdate" onClick="WdatePicker({readOnly:'true'})"> 到 <input name="endTime" id="endTime" class="Wdate" onClick="WdatePicker({readOnly:'true'})">
					 <select id="organizationId">
						<option value="">部门</option>
						<c:forEach items="${organizationList }" var="organization">
							<option value="${organization.employeeInfo.organizationId}">${organization.employeeInfo.organizationName} </option>
						</c:forEach>
					</select> 
					<select id="postId">
						<option value="">岗位</option>
						<option value="1">总经理</option>
						<option value="3">技术总监</option>
						<option value="14">java工程师</option>
					</select> 
					<input type="button" class="HR_SearchL_button" onclick="searchInfo()"/>
				</div>
				<div class="HR_lishijixiaoR">
					<input type="button" class="HR_SearchR_QST" /><input type="button"
						class="HR_SearchR_CKXQ" /><input type="button"
						class="HR_SearchR_DY29" /><input type="button"
						class="HR_SearchR_BC29" /><input type="button"
						class="HR_SearchR_FX29" />
				</div>
			</div>
			<div id="gridContainer">
				<table id="list"></table>
				<div id="pageLists"></div>
			</div>
		</div>
	</div>
</body>
</html>