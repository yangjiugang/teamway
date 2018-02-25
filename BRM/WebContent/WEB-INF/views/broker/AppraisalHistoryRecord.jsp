<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	EmployeeAppraisalListInfo("${firstId}");
});
function EmployeeAppraisalListInfo(id){
	$("#list").jqGrid({	
		url:"getEmployeeAppraisalById?employeeId="+id,
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','员工编号','姓名', '部门','岗位','本月绩效得分','绩效工资发放比例','考核开始时间 ','考核结束时间 '],
		colModel: [
		           {name:'employeeInfo.employeeId',hidden:true,summaryType:'avg',summaryTpl : '平均:'},
		           {name:'employeeInfo.employeeNum',width:175},
		           {name:'employeeInfo.userName'},
		           {name:'employeeInfo.organizationName'},
		           {name:'employeeInfo.postName'},
		           {name:'appraisalResult'},
		           {name:'appraisalRate',formatter:'number',summaryType:'sum',summaryTpl : '总计:'},
		           {name:'appraisalStartDate'},
		           {name:"appraisalEndDate"}
		           ],
		jsonReader:{
			root: 'EmployeeAppraisalListById',
			repeatitems: false
		},
		pager: '#pageLists',
		height:'auto',
		width: 1000,
		hidegrid: true,
		multiselect: true,
		viewrecords: true,
		rowNum:pageSize[0],
		rowList:pageSize
	});
}

function changeUser(id){
	$("#list").setGridParam({url:"getEmployeeAppraisalById"});
	$.extend($("#list").getGridParam('postData'),{"employeeId":id});
	$("#list").trigger("reloadGrid");
}
</script>
</head>
<body>
				<div class="HR_yidongweihu_Bottom myBox03" style="width:1200px;">
					<div class="HR_lishijixiaoContent jixiaoContent" style="width:1200px;">
						<div class="H_left">
							<ul class="ul_tittle">
							<c:forEach items="${employeeInfoList }" var="employeeInfo">
								<li><a onclick="changeUser(${employeeInfo.employeeId })" style="cursor: pointer;"><span
										class="aa"></span>${employeeInfo.userName }</a></li>								
							</c:forEach>
							</ul>
						</div>
						<div class="H_right">
						
							<div id="gridContainer">
								<table id="list"></table>
								<div id="pageLists"></div>
							</div>
							
						</div>
					</div>
				</div>


				<div class="HR_lishijixiaoContent"></div>
</body>
</html>