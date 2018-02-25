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
			url : "echelon_queryTrainActivity",
			datatype : 'json',
			mtype : 'POST',
			colNames : ['id','培训活动编号','培训活动名称','发起部门','培训类型','讲师','计划学员人数','实际参加人数','时间','地点'],
			colModel : [{name : 'taskId',hidden : true,key : true},
			            {name : 'taskNum',width : 125},
			            {name : 'taskName'},
			            {name : 'organizationalUnit'},
			            {name : 'taskType'},
			            {name : 'ts.teacher'},
			            {name : 'planEmployees'},
			            {name : 'actualEmployees'},
			            {name : 'trainingDtartTime',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'taskPlace'}],
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
	
	// 发送培训活动通知
	function sendTrainInform(){
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
				url : "echelon_sendTrainActivityInform",
				dataType : 'json',
				data : "taskId=" + rowId +
				       "&strEmployeeId=" + employeeId,
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
	<form name="trainActivityForm">
		<input type="hidden" id="employeeId" value="${employeeId }" />
		<!-- 查询数据列表  start -->
		<div id="gridContainer">
			<table id="tab_List"></table>
			<div id="pageList"></div>
		</div>
		<!-- 查询数据列表  end -->
	    <div class="HR_yidongweihu_Submit">
		    <input type="button" class="HR_fspxtz" onclick="sendTrainInform();"/> 
		    <input type="button" class="HR_tiajpxhd" onclick="javascript:location.href='tianjiaxinpeixun.html';"/>
	    </div>
    </form>
</body>
</html>