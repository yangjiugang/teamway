<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>培训</title>

<script type="text/javascript">

$(document).ready(function(){

$("#list").jqGrid({
	url:"getTrainTask?userId=${userId}",
	datatype: 'json',
	mtype: 'POST',
	colNames: ['taskId','培训活动编号','培训活动名称','发起部门','培训类型','讲师','计划人数','实际人数','开始时间'],
	colModel: [{name:'talkId',hidden:true,key:true},
		   		{name:'taskNum',align: 'center',width:90},
		   		{name:'taskName',align: 'center',width:90},
		   		{name:'organizationalUnit',align: 'center',width:60},
				{name:'taskType',align: 'center',width:60},
				{name:'teacher',align: 'center',width:80},
				{name:'planEmployees',align: 'center',width:60},
				{name:'actualEmployees',align: 'center',width:60},
				{name:'trainingStartTime',align: 'center',width:100}
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
</script>
<script type="text/javascript">
	function findData(){
		var isSubmit=$("#isSubmit").val();
		var taskType=$("#taskType").val();
		var keyWord=$("#keyWord").val();
		
		
		$("#list").setGridParam({url:"getTrainTask?userId=${userId}"});
		$.extend($("#list").getGridParam('postData'),	
				{
					"isSubmit":isSubmit,
					"taskType":taskType,
					"keyWord":keyWord});
		$("#list").trigger("reloadGrid");
	}
	
	
</script>

<style type="text/css">
	.SOSO26{ margin-left:10px;}
	.SOSO26 select{ margin-right:5px;}
	.seach_but{background:url(images/SearchBut29.jpg) no-repeat; width:46px; height:21px; margin:2px 0 0 5px; border:medium none;}
	.font_ul26{ clear:both; width:100%; overflow:hidden; color:#000;}
	.f_ul26 li{ float:left; width:8%; text-align:center; font-family:"新宋体", "宋体"; line-height:25px;}
	.nul126 li{ border-top:#d2e5f3 1px solid; height:45px; line-height:45px;}
	.nul126 .f_ul li{ border:none; width:8%;}
	.nul126 .f_ul li a{ color:#0160a1;}
	.Number26{ margin-left:30px; color:#000;}
	.Number26 font{ font-size:12px; color:#F00; font-weight:bold;}
</style>

</head>
<body>
	<div class="SOSO26">
		<select id="taskType" name="taskType">
			<option value="-1">培训类型</option>
			<option value="0">外训</option>
			<option value="1">内训</option>
			<option value="2">内外结合</option>
		</select>
		<input type="hidden" id="isSubmit" name="isSubmit" value="1">
		<input type="text" id="keyWord" name="keyWord" tip="请输入关键字">
		<input type="button" class="seach_but" onclick="findData()"/>
	</div>
<div style="padding:15px 0 0 10px;">
	<div>
		<table id="list" style="font-size: 12px;"></table>
		<div id="pageList"></div>
	</div>
</div>
</body>
</html>