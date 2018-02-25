<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>考勤</title>

<script type="text/javascript">

$(document).ready(function(){
	
	//获取当前时间
	var myDate = new Date();
	var year = myDate.getFullYear();
	var month = myDate.getMonth();
	var day = myDate.getDate();
	
	
	$("#startTime").val(year+"-"+month+"-"+day);
	if(month!=12)
		$("#endTime").val(year+"-"+(month+1)+"-"+day);
	else
		$("#endTime").val(year+"-"+month+"-"+day);
	

$("#list").jqGrid({
	url:"getPunishment?userId=${userId}",
	datatype: 'json',
	mtype: 'POST',
	colNames: ['开始时间','结束时间','考勤类型','事由'],
	colModel: [ {name:'appraisal_start_date',align: 'center'},
		   		{name:'mainTalkEmployeeNum',align: 'center'},
		   		{name:'mainTalkEmployeeName',align: 'center'},
				{name:'talkToPostName',align: 'center'}
				],
	jsonReader:{
		root: 'punishments',
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
		var checkType = $("#checkType").val();
		var isSubmit=$("#isSubmit").val();
		var startTime=$("#startTime").val();
		var endTime=$("#endTime").val();
				
		$("#list").setGridParam({url:"getPunishment?userId=${userId}"});
		$.extend($("#list").getGridParam('postData'),
				{
					"checkType" : checkType,
					"isSubmit":isSubmit,
					"startTime":startTime,
					"endTime":endTime});
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
<form action="">
<input type="hidden" name="isSubmit" id="isSubmit" value="1"/>
    时间从
    <input class="Wdate" style="width:120px;" id="startTime" name="startTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
     到 
    <input class="Wdate"  style="width:120px;" id="endTime" name="endTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
		<select id="checkType" name="checkType">
			<option value="-1">考勤类型</option>
			<option value="0">迟到</option>
			<option value="1">早退</option>
			<option value="2">旷工</option>
			<option value="3">事假</option>
			<option value="4">病假</option>
			<option value="5">婚假</option>
			<option value="6">产假</option>
			<option value="7">丧假</option>
			<option value="8">探亲假</option>
			<option value="8">年休假</option>
			<option value="8">加班</option>
		</select>
		<input type="button" class="seach_but" onclick="findData()"/>
</form>
	</div>
	<div style="padding:15px 0 0 10px;">
		<div>
		<table id="list" style="font-size: 12px;"></table>
		<div id="pageList"></div>
		</div>
	</div>
</body>
</html>