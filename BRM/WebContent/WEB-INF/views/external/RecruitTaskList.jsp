<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#list").jqGrid({
			url:"getRecruitTask?userId=${userId}",
			datatype: 'json',
			mtype: 'POST',
			colNames: [
			           'taskId',
			           'companyId',
			           '任务单号', 
			           '用工部门',
			           '待聘岗位',
			           '任务描述',
			           '用工人数',
			           '发出日期',
			           '希望到岗日期',
			           '申请人',
			           '申请时间',
			           '配对简历数',
			           '已到岗人数',
			           '任务单状态',
			           '任务单创建时间'
			          ],
			colModel: [{name:'taskId',hidden:true,key:true},
				   		{name:'companyId',hidden:true},
				   		{name:'taskNum',align: 'center'},
						{name:'organizationName'},
						{name:'postName',align: 'center'},
						{name:'taskDesc',align: 'center'},
						{name:'userCnt',align: 'center'},
						{name:'recruitDate',align: 'center'},
						{name:'hopeWorkDate',align: 'center'},
						{name:'requireUserName',align: 'center'},
						{name:'requireDate',formatter:'date',formatoptions:{srcformat:'Y-m-d H:i',newformat:'Y-m-d H:i'}},
						{name:'matchUsers',align: 'center'},
						{name:'recruitMembers',align: 'center'},
						{name:'taskStatus',align: 'center'},
						{name:'taskCreateTime',align: 'center'}
						],
			jsonReader:{
				root: 'tasks',
				repeatitems: false
			},
			pager: '#pageList',
			height:'auto',
			autowidth: true,
			hidegrid: true,
			multiselect: true,
			rowNum:pageSize[0],
			rowList:pageSize
		});
	});
	
	function updateTask(){
		var rowId = $("#list").jqGrid('getGridParam','selarrrow');
		var companyId = $("#list").getRowData(rowId)['companyId'];
		if(rowId!=""){
			if(rowId.length>1){
				alert('只能选择一个任务！！！请重新选择！！！');
			}else{
				$.ajax({
					 url: 'updateTaskResult?userId=${userId}&tid='+rowId+'&companyId='+companyId,
					 type: "POST",
					 dataType:"json",
					 success: function(){
						 alert('匹配成功!');
						 $("#list").trigger("reloadGrid");
					 }
				});
			}
		}else{
			alert('请勾选任务进行操作！');
		}
	}
</script>
</head>
<body>
	 <div>
	 		<span style="margin-right: 10px;"><input type="button" value="  " onclick="updateTask()" class="HR_Submit_qdtj29" /></span>
        	<table id="list" style="font-size: 12px;"></table>
        	<div id="pageList"></div>
        </div>
</body>
</html>