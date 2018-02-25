<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>约谈活动管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">

	$(document).ready(function(){
		var url = "broker_queryCommActivty";
		var scope = "${scope}";
		if("yesterDay" == scope){
			url = "broker_queryCommActivty?scope=yesterDay";
		}else if("thisWeek" == scope){
			url = "broker_queryCommActivty?scope=thisWeek";
		}else if("thisMonth" == scope){
			url = "broker_queryCommActivty?scope=thisMonth";
		}
		$("#tab_List").jqGrid({
			url : url,
			datatype : 'json',
			mtype : 'POST',
			colNames : ['id','主谈人编号','岗位','受访人编号','岗位','调研对象','岗位','类型','活跃程度'],
			colModel : [{name : 'talkId',hidden : true,key : true},
			            {name : 'mainTalkEmployeeNum',width : 125},
			            {name : 'mainTalkPostName'},
			            {name : 'talkToEmployeeNum'},
			            {name : 'talkToPostName'},
			            {name : 'surveyEmployeeName'},
			            {name : 'surveyPostName'},
			            {name : 'surveyType'},
			            {name : 'stableProcess'}],
			jsonReader : {
				root : 'lstEmployeeTalkRecord',
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
	
	// 查看约谈记录
	function queryCommRecord(){
		var arr = new Array();
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		var arr = rowId.toString().split(',');
		if(arr.length > 1){
			alert("不能选择多条记录，请选择单条记录！");
			return false;
		}else if(arr == ''){
			alert("请选择一条记录！");
			return false;
		}
		parent.showFrame('查看约谈记录','broker_commHistoryDetail?talkId='+rowId,800,700);
	}
	
	// 约谈活动条件查询
	function queryCondition() {
		var commStartTime = $("input[name=commStartTime]").val();
		var commEndTime = $("input[name=commEndTime]").val();
		var keyWord = $("#keyWord").val();
		if ('' == commStartTime) {
			alert("开始时间不能为空！");
			return false;
		} else if ('' == commEndTime) {
			alert("结束时间不能为空！");
			return false;
		}if (commEndTime < commStartTime) {
			alert("开始时间不能大于结束时间！");
			return false;
		} else {
			$.extend($('#tab_List').getGridParam('postData'), $('#searchForm').getForm());
			$("#tab_List").trigger("reloadGrid");
		}
	}
</script>
</head>
<body>
	<div class="right1">
		<form id="searchForm">
	        <div class="R_top">
	        	<ul class="s_font zp_font">
	            	<li class="time">约谈日期  从
	            	<input class="Wdate" name="commStartTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})"> 到 
	            	<input class="Wdate" name="commEndTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
	                <li><select><option>部门</option></select></li>
	                <li><select><option>岗位</option></select></li>
	                <li><select style="width:130px;"><option>约谈原因</option></select></li>
	                <li><input type="text" tip="请输入关键字" name="keyWord" style="width:80px; _border:medium none;"/>
	                </li>
	                <li><input type="button" class="seach_but" style="cursor: pointer;" onclick="queryCondition();"/></li>
	            </ul> 
	        </div>
	        <div class="r_but" style="margin-top:10px;">
            	<ul class="t_but12">
                    <li><input type="button" value="查看约谈记录" class="but1" onclick="queryCommRecord();" /></li>
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
            	 </ul> 
	        </div> 
		</form> 
		<!-- 查询数据列表  start -->
		<div id="gridContainer">
			<table id="tab_List"></table>
			<div id="pageList"></div>
		</div>
		<!-- 查询数据列表  end -->
	</div>
</body>
</html>