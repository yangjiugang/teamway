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
	EmployeeRewardPunishmentListInfo("${firstId}");
});
function EmployeeRewardPunishmentListInfo(id){
	$("#EmployeeRewardPunishmentListById").jqGrid({	
		url:"getRewardPunishmentById?employeeId="+id,
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','员工编号','姓名','事由发生日期 ','部门','岗位','职系','职等','事由','奖惩方法','奖惩金额'],
		colModel: [
		           {name:'employeeInfo.employeeId',hidden:true,key:true},
		           {name:'employeeInfo.employeeNum',width:100},
		           {name:'employeeInfo.userName',width:80},
		           {name:'causeDate',width:150,formatter:'date', formatoptions:{newformat:'Y-m-d'}},
		           {name:'organizationName'},
		           {name:'postName'},
		           {name:'jobGradeName'},
		           {name:'jobLevelName'},
		           {name:'praisePunishmentDesc'},
		           {name:'praisePunishmentMethod'},
		           {name:'praisePunishmentMoney'}
		           ],
		jsonReader:{
			root: 'EmployeeRewardPunishmentByIdList',
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
	$("#EmployeeRewardPunishmentListById").setGridParam({url:"getRewardPunishmentById"});
	$.extend($("#EmployeeRewardPunishmentListById").getGridParam('postData'),{"employeeId":id});
	$("#EmployeeRewardPunishmentListById").trigger("reloadGrid");
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
								<table id="EmployeeRewardPunishmentListById"></table>
								<div id="pageLists"></div>
							</div>
							
						</div>
					</div>
				</div>


				<div class="HR_lishijixiaoContent"></div>
</body>
</html>