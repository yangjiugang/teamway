<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
	var type='';
	$(document).ready(function(){
		var types = ${types};
		var lev = "1:难;2:普通;3:易;";
		var state = "1:正常;0:废弃;";
		var tx = "1:单选;2:多选;3:问答;";
		for(var i=0;i<types.length;i++){
			type = type.concat(types[i].typeId, ":", types[i].typeName, ";");
			$("#typeId").append("<option value='" + types[i].typeId+"'>" + types[i].typeName+"</option>");
		}
		$("#list").jqGrid({
			url:"findQuestionLibrary",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','编号','题干', '题目类别','题型','分数','难易程度','创建日期','状态'],
			colModel: [{name:'questionId',hidden:true,key:true,editable:true},
				   		{name:'questionNum',width:100},
				   		{name:'questionContent'},
				   		{name:'typeId',width:80,align:'center',formatter:'select',edittype:'select',editoptions:{value:type}},
				   		{name:'questionType',width:80,align:'center',formatter:'select',edittype:'select',editoptions:{value:tx}},
						{name:'questionPoints',align:'center',width:50,editable:true},
						{name:'levelId',width:70,align:'center',formatter:'select',edittype:'select',editoptions:{value:lev}},
						{name:'createTime',align:'center',formatter:'date',formatoptions:{srcformat:'Y-m-d H:i',newformat:'Y-m-d H:i'}},
						{name:'questionStatus',align:'center',formatter:'select',edittype:'select',editoptions:{value:state}}],
			jsonReader:{
				root: 'rows',
				repeatitems: false
			},
			pager: '#pageList',
			height:'auto',//gridHeight()-$(".right1").height(),
			autowidth: true,
			hidegrid: true,
			multiselect: true,
			viewrecords: true,
			rowNum:pageSize[0]
		//	rowList:pageSize
		});
	});
	function add(){
		parent.showFrame("添加问题",'customAddTopicPage?paperId=0',450,550);
	}
	
	function del(){
		if(window.confirm("确定要删除吗?")){
			var rows=$("#list").jqGrid('getGridParam','selarrrow');
			if(rows==''){alert('请选择要删除的数据');return;}
			$.ajax({
				 url: 'updateLibraryState',
				 type: "POST",
				 dataType:"json",
				 data: "ids="+rows,
				 success: function(){
					 $("#list").trigger("reloadGrid");
				 }
			});
		}
	}
	function edit(v){
		var row=$("#list").jqGrid('getGridParam','selrow');
		if(row == null){alert("请选择要要修改的数据");return;}
		parent.showFrame("修改问题",'updateQuestionLibrary?id='+row+"&v="+v,450,550);
		
	}
	function search(){
		$.extend($('#list').getGridParam('postData'), $('#searchForm').getForm());
		$("#list").trigger("reloadGrid");
	}
</script>
</head>
<body>
<div class="right1">
  <div class="R_top">
  <form id="searchForm" >
  	<ul class="s_font">
      	 <li>题目难易程度：
      	  <label><input type="radio" name="levelId" value="1"/> 难</label>
      	  <label><input type="radio" name="levelId" value="2" /> 普通 </label>
      	  <label><input type="radio" name="levelId" value="3"/> 易</label></li>
          <li style="margin-left:40px;">
          	题目类型：<label><input type="radio" name="questionType" value="1"/> 单选</label>
          	<label><input type="radio" name="questionType" value="2" /> 多题</label>
           <label><input type="radio" name="questionType" value="3" /> 问答题</label></li>
          <li style="margin-left:40px;">题目名称：<input type="text" name="questionContent"/></li>
          <li>题目类别：<select id="typeId" name="typeId">
          				<option></option>
          			</select>
          </li>
          <li><input type="button" class="seach_but" onclick="search()" style="cursor: pointer;"/></li>
      </ul>
    </form>
  </div>
            
   <div class="r_but" >
   	<ul class="t_but12">
     <li><input type="button" value="添加" class="but1" onclick="add()" style="cursor: pointer;"/></li>
     <li><input type="button" value="修改" class="but1" onclick="edit()" style="cursor: pointer;" /></li>
	 <li><input type="button" value="删除" class="but1" onclick="del()" style="cursor: pointer;"/></li>
	 <li><input type="button" value="查看" class="but1" onclick="edit('view')"  style="cursor: pointer;"/></li>
	 <li><input type="button" value="Excel导入" class="but1" /></li>
	 <li><input type="button" value="Excel模板下载" class="but1" /></li>
     <li><input type="button" class="dy_but"/></li>
     <li><input type="button" class="email_but"/></li>
     <li><input type="button" class="fx_but"/></li>
   	</ul>
	</div> 
	<div id="gridContainer">
		<table id="list"></table>
		<div id="pageList">
	</div>
</div>     
</div>
</body>
</html>