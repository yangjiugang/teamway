<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加问卷问题</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script >
var type='';
$(document).ready(function(){
	var types = ${types};

	for(var i=0;i<types.length;i++){
		type = type.concat(types[i].typeId, ":", types[i].typeName, ";");
		$("#typeId").append("<option value='" + types[i].typeId+"'>" + types[i].typeName+"</option>");
	}
	var lev = "1:难;2:普通;3:易;";
	$("#list").jqGrid({
		url:"findQuestionLibrary",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','编号','题干', '题目类别','分数','难易程度','创建日期'],
		colModel: [{name:'questionId',hidden:true,key:true,editable:true},
			   		{name:'questionNum',width:100},
			   		{name:'questionContent'},
			   		{name:'typeId',width:80,align:'center',formatter:'select',edittype:'select',editoptions:{value:type}},
					{name:'questionPoints',align:'center',width:50,editable:true},
					{name:'levelId',width:70,align:'center',formatter:'select',edittype:'select',editoptions:{value:lev}},
					{name:'createTime',align:'center',formatter:'date',formatoptions:{srcformat:'Y-m-d H:i',newformat:'Y-m-d H:i'}}],
		jsonReader:{
			root: 'rows',
			repeatitems: false
		},
		pager: '#pageList',
		height:330,
		autowidth: true,
		hidegrid: true,
		multiselect: true,
		viewrecords: true,
		rowNum:15
	//	rowList:[15,30,50]
		});
	});
	function save(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){alert('请至少选择一条记录');return;}
		$.ajax({
			 type: "POST",
			 url: "saveQuestionLibraryFromStorage",
			 data: "paperId=" + $("#paperId").val()+"&ids="+rows,
			 success: function(data) {
				 alert('添加成功!');
				 parent.getChildFrame().reload();
				 parent.right.search();
				 parent.closeFrame();
			 }
		});
	}
	function search(){
		$.extend($('#list').getGridParam('postData'), $('#searchForm').getForm());
		$("#list").trigger("reloadGrid");
	}
</script>
</head>
<body>
<div class="HR_piliangTianjia_Bottom myBox03" style="padding-bottom:0px">
<form id="searchForm">
<div class="HR_piliangTianjiadiaochahuodong" style="margin-top:7px;">
题目类别：
<select name="typeId" id="typeId" style="width:150px;">
		<option value=""></option>
</select>
&nbsp;&nbsp;<input style="border:none;" type="button" class="HR_wenjuanwentiSoso" onclick="search()"/>
<input type="hidden" name="paperId" id="paperId" value="${paperId }"/>
<div class="HR_piliangTianjiaType">
题目难易程度：
<label><input type="radio" name="levelId"  value="1" />难 </label>
<label><input type="radio" name="levelId"  value="2" />普通 </label>
<label><input type="radio" name="levelId"  value="3" /> 一般</label></div>
<div class="HR_piliangTianjiaType">
题目类型：<input type="radio" name="questionType" value="1" /> 单选
<input type="radio" name="questionType" value="2" /> 多选
 <input type="radio" name="questionType" value="3" /> 问答题</div></form>
</div>
</div>
<br/>
<table id="list"></table>
<div id="pageList"></div>
<div class="HR_Tianjia_Submit" style="margin-top:5px;">
<input type="button" class="HR_Tianjia_Submit06" onclick="save()"/>
<input type="button" class="HR_Tianjia_Submit07" onclick="parent.closeFrame()"/>
</div>
</body>
</html>
