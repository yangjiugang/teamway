<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" href="css/layout.css" />
<link rel="stylesheet" media="screen" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//查询列表数据
	$(document).ready(function(){
		$("#tab_List").jqGrid({
			url : "echelon_querySurveyActivity",
			datatype : 'json',
			mtype : 'POST',
			colNames : ['id','编号','活动名称','联络人','发起负责人','发出时间','截止日期','发出样本数','回收样本数','调查类型','活动状态'],
			colModel : [{name : 'testId',hidden : true,key : true},
			            {name : 'testNum',width : 125},
			            {name : 'testName'},
			            {name : 'contactUserName'},
			            {name : 'testInitiator'},
			            {name : 'testStartTime',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'testEndTime',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'testEnableCnt'},
			            {name : 'testUserCnt'},
			            {name : 'typeId'},
			            {name : 'testStatus'}],
			jsonReader : {
				root : 'lstData',
				repeatitems : false
			},
			pager : '#pageList',
			height : 'auto',
			autowidth : true,
			hidegrid : true,
			multiselect : true,
			viewrecords : true,
			rowNum : pageSize[0],
			height:'auto',
			rowList : pageSize
		});
	});
	
	// 发送调查活动通知
	function sendSurveyInform(){
		var employeeId = $("#employeeId").val();
		var array = new Array();
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow').toString();
		if("" == rowId){
			alert("请选择一个活动！");
			return false;
		}else{
			array = rowId.split(",");
			if(array.length > 1){
				alert("不能选择多个活动，请选择一个活动！");
				return false;
			}
			$.ajax({
				url : "echelon_sendSurActivityInform",
				dataType : 'json',
				data : "testId=" + rowId +
				       "&employeeId=" + employeeId,
				success:function(data){
					if(data.iFlag > 0){
						alert("发送成功！");
						parent.right.refurbish();
						parent.closeFrame();
					}else if(data.iFlag == -1){
						alert("发送失败！");
						return false;
					}
				}
			});
		}
	}
</script>
</head>
<body>
	<form name="surveyActivityForm">
	<input type="hidden" id="employeeId" value="${employeeId }" />
		<!-- 查询数据列表  start -->
		<div id="gridContainer">
			<table id="tab_List"></table>
			<div id="pageList"></div>
		</div>
		<!-- 查询数据列表  end -->
	    <div class="HR_yidongweihu_Submit">
	    	<input type="button" class="HR_fsdctz" onclick="sendSurveyInform()"/>
	       	<input type="button" class="HR_tjdchd" onclick="javascript:location.href='Tianjiadiaochahuodong.html';" />
	    </div>
    </form>
</body>
</html>