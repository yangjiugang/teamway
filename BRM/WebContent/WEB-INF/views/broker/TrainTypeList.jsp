<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"findTrainTypeList",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','类别名称','创建日期','创建人'],
			colModel: [{name:'typeId',hidden:true,key:true,editable:true},
				   		{name:'typeName',width:100,align:'center'},
						{name:'createTime',align:'center'},
						{name:'createUser',align:'center'}],
			jsonReader:{
				root: 'rows',
				repeatitems: false
			},
			pager: '#pageList',
			height:'auto',
			autowidth: true,
			hidegrid: true,
			multiselect: true,
			viewrecords: true,
			rowNum:pageSize[0]
		});
	});
	function add(){
		parent.showFrame('添加活动类型','trainTypeAdd',410,180);
	}
	function edit(){
		var row=$("#list").jqGrid('getGridParam','selrow');
		if(row == null){alert("请选择要修改的数据");return;}
		parent.showFrame('修改活动类型','findTrainTypeById?typeId='+row,430,200);
	}
	function search(){
		$("#list").trigger("reloadGrid");
	}
	function del(){
		var row=$("#list").jqGrid('getGridParam','selarrrow');
		if(row == ''){alert("请选择要删除的数据");return;}
		if(window.confirm("确定要删除吗?")){
			$.ajax({
				 url: 'delTrainType',
				 type: "POST",
				 dataType:"json",
				 data: "ids="+row,
				 success: function(){
					 search();
				 }
			});
		}
	}
</script>
</head>
<body>
<div class="right1" style="margin-top:5px;margin-right:0;">
   <div class="r_but" >
   	   <ul class="t_but12">
       <li><input type="button" value="添加" class="but1" onclick="add()" style="cursor: pointer;"/></li>
       <li><input type="button" value="修改" class="but1" onclick="edit()" style="cursor: pointer;" /></li>
    <li><input type="button" value="删除" class="but1" onclick="del()" style="cursor: pointer;" /></li>
       </ul>
   </div> 
</div>
<div id="gridContainer">
  <table id="list"></table>
  <div id="pageList"></div>
</div>
</body>
</html>