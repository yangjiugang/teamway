<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script>
var n=0,arr= new Array();
var type='',last;
var types = ${types};
for(var i=0;i<types.length;i++){
	type = type.concat(types[i].typeId, ":", types[i].typeName, ";");
}
var status = "0:废弃;1:正常;";
var lev = "1:难;2:普通;3:易;";
$(document).ready(function(){
	$("#list").jqGrid({
		url:"findQuestionLibraryByPaperId?paperId=${paperId}",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','编号','题干', '题目类别','分数','难易程度','创建日期','状态','','顺序调整'],
		colModel: [{name:'detailId',hidden:true,key:true,editable:true},
			   		{name:'questionNum',width:100},
			   		{name:'questionContent'},
			   		{name:'typeId',width:80,align:'center',formatter:'select',edittype:'select',editoptions:{value:type}},
					{name:'questionPoints',align:'center',width:50,editable:true,editoptions:{maxlength:"3"},editrules:{integer:true,maxValue:100}},
					{name:'levelId',width:70,align:'center',formatter:'select',edittype:'select',editoptions:{value:lev}},
					{name:'createTime',align:'center'},
					{name:'questionStatus',width:50,align:'center',formatter:'select',edittype:'select',editoptions:{value:status}},
					{name:'questionOrder',hidden:true},
					{name:'',width:65,align:'center',editable:false,sortable:false,formatter:function(cellvalue, options, rowObject){return '<a href="javascript:changeOrder(\'up\','+rowObject['detailId']+','+n+')"><img src="images/HRS.gif"</a>&nbsp;<a href="javascript:changeOrder(\'down\','+rowObject['detailId']+','+n+')"><img src="images/HRS_DOWN.gif"</a>'}}],
		jsonReader:{
			root: 'rows',
			repeatitems: false
		},
		pager: '#pageList',
		height:425,
		autowidth: true,
		hidegrid: true,
		multiselect: true,
		viewrecords: true,
		rowNum:19,
	//	rowList:[20,40,60],
		afterInsertRow:function(rowid,rowdata,rowelem){
			arr[n] = rowid; n++;
		},
		onSelectRow: function(id) {
			if(id && id !=last) {
				$('#list').restoreRow(last);
				$('#list').editRow(id, true, null,null,'editQuestionPoint',null,function(){last=null;},function(status,xhr){
					var data = eval("("+xhr.responseText+")");
					alert(data.exception.message);
				});
				last = id;
			}
		}
	});
});
	function customAdd(){
		parent.showFrame("自定义添加问卷",'customAddTopicPage?paperId=${paperId}',450,550);
	}
	function StorageAdd(){
		parent.showFrame("从题库添加问卷",'StorageAddTopicPage?paperId=${paperId}',700,523);
	}
	
	function reload(){
		$("#list").trigger("reloadGrid");
	}
	function save(){
		jQuery("#list").jqGrid('saveRow',last,null,'editQuestionPoint');
		last = null;
	}
	function del(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){alert('请选择要删除的记录');return;}
		if(window.confirm("确定删除吗?")){
			$.ajax({
				 url: 'delQuestionPapersDetail',
				 type: "POST",
				 dataType:"json",
				 data: 'ids='+rows+"&paperId="+$("#paperId").val(),
				 success: function(){
					 $("#list").trigger("reloadGrid");
					 parent.iframe.search();
				 }
			});
		}
	}
	function changeOrder(type,id,n){
		var id_= 0;
		if(type=='up'){
			id_ = arr[n-1];
		}
		if(type=='down'){
			id_ = arr[n+1];
		}
		if(typeof(id_)=='undefined')return;
		var row = $('#list').getRowData(id);
		var row_= $("#list").getRowData(id_);
		$.ajax({
			 url: 'updateQuestionOrder',
			 type: "POST",
			 dataType:"json",
			 data: 'id='+id+"&order="+row['questionOrder']+"&id_="+id_+"&order_="+row_['questionOrder'],
			 success: function(){
				 $("#list").trigger("reloadGrid");
			 }
		});
	}
</script>
</head>
<body>


<div class="HR_wenjuanwentiButton" style="margin-left:1px;">
<input name="" type="button" value="自定义添加" onclick="customAdd()" />
<input name="" type="button" value="题库添加" onclick="StorageAdd()" />
<input name="" type="button" value="删除" onclick="del()"/>
<input name="" type="button" value="保存" onclick="save()"/>
<input type="hidden" id="paperId" value="${paperId }" />
</div>
<div id="gridContainer">
	<table id="list"></table>
	<div id="pageList"></div>
</div>
</body>
</html>
