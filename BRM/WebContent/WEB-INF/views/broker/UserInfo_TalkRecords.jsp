<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>面谈</title>
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
	url:"getTalkRecords?userId=${userId}",
	datatype: 'json',
	mtype: 'POST',
	colNames: ['talkId','约谈编号','主谈人工号','主谈人','约谈对象岗位','约谈对象','约谈方式','约谈地点','计划约谈时间'],
	colModel: [{name:'talkId',hidden:true,key:true},
		   		{name:'talkNum',align: 'center',width:60},
		   		{name:'mainTalkEmployeeNum',align: 'center',width:75},
		   		{name:'mainTalkEmployeeName',align: 'center',width:60},
				{name:'talkToPostName',align: 'center',width:100},
				{name:'talkToEmployeeName',align: 'center',width:60},
				{name:'talkType',align: 'center',width:60},
				{name:'talkPlace',align: 'center',width:60},
				{name:'planTalkTime',align: 'center',width:120}
				],
	jsonReader:{
		root: 'talkRecords',
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

	function findData(){
		var isSubmit=$("#isSubmit").val();
		var startTime=$("#startTime").val();
		var endTime=$("#endTime").val();
		var keyWord=$("#keyWord").val();
		var employeeId = $("#employeeId").val();
		
		$("#list").setGridParam({url:"getExternalList"});
		$.extend($("#list").getGridParam('postData'),	
				{
					"isSubmit":isSubmit,
					"startTime":startTime,
					"endTime":endTime,
					"keyWord":keyWord});
		$("#list").trigger("reloadGrid");
	}

	function setPersonSelectorVal(ids,names,nums){
		$("#employeeId").val(ids);
		$("#userName").val(names);		
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

	<select>
		<option>主谈人部门</option>
	</select>
	主谈人 <input id="userName" type="text" readonly="readonly" onclick="parent.popupPersonSelector({single:1})">
	<input type="hidden" id="employeeId" name="employeeId" value="">
	交流日期  从 
    <input class="Wdate" style="width:120px;" id="startTime" name="startTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
     到 <input class="Wdate"  style="width:120px;" id="endTime" name="endTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
         
	<input type="button" class="seach_but"/>
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