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
	var types = ${types};
	for(var i=0;i<types.length;i++){
		type = type.concat(types[i].typeId, ":", types[i].typeName, ";");
	}
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"getQuestionPaper?typeId=${typeId}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','编号','问题名称', '描述','题数','创建时间','总分','问卷类型','引用次数','创建人'],
			colModel: [{name:'paperId',hidden:true,key:true},
				   		{name:'paperNum',width:128},
				   		{name:'paperName',align:'center'},
				   		{name:'paperDesc',align:'center'},
						{name:'paperQuestions',align:'center'},
						{name:'createTime',align:'center',width:180},
						{name:'totalPoints',align:'center'},
						{name:'typeId',align:'center',formatter:'select',edittype:'select',editoptions:{value:type}},
						{name:'paperUsed',align:'center'},
						{name:'createUser',align:'center'}],
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
		parent.showFrame('添加问卷','brokerPage?page=WenJuan',430,300);
	}
	
	function del(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){alert('请选择要删除的数据');return;}
		if(window.confirm("确定要删除吗?")){
			$.ajax({
				 url: 'delQuestionPaper',
				 type: "POST",
				 dataType:"json",
				 data: "ids="+rows,
				 success: function(){
					 $("#list").trigger("reloadGrid");
				 }
			});
		}
	}
	function edit(){
		var row=$("#list").jqGrid('getGridParam','selrow');
		if(row == null){alert("请选择要修改的数据");return;}
		parent.showFrame('修改问卷','getQuestionPaperById?paperId='+row,430,300);
		
	}
	function wjmanage(){
		var row=$("#list").jqGrid('getGridParam','selrow');
		if(row == null){alert("请选择一条数据");return;}
		parent.showFrame('问卷管理','wjManagePage?paperId='+row,830,520);
	}
	function search(){
		//$('#list').setGridParam({url:"findOrders.json"});
		$.extend($('#list').getGridParam('postData'), $('#searchForm').getForm());
		$("#list").trigger("reloadGrid");
	}
	function gxactivity(){
		var row=$("#list").jqGrid('getGridParam','selrow');
		if(row == null){alert("请选择要查看的数据");return;}
		parent.showFrame('问卷关联的活动','PaperyActivity?paperId='+row,800,600);
	}
</script>
</head>
<body>
<div class="right1">
        <div class="R_top">
        	<form id="searchForm">
        	<ul class="s_font">
            	<li>问卷创建人<select name="createUser">
            				<option value=""></option>
            				<option value="1">管理员</option>
            	  		   </select>
            	</li>
                <li>问卷名称：<input type="text" value="" id="paperName" name="paperName" /></li>
                <li><input type="button" class="seach_but" onclick="search()" style="cursor: pointer;"/></li>
            </ul>
            </form>
        </div>
        	<div class="r_but" >
            	<ul class="t_but12">
             	   <li><input type="button" value="添加" class="but1" onclick="add()" style="cursor: pointer;"/></li>
		           <li><input type="button" value="修改" class="but1" onclick="edit()" style="cursor: pointer;"/></li>
		           <li><input type="button" value="删除" class="but1" onclick="del()" style="cursor: pointer;"/></li>
		           <li><input type="button" value="查看关联调查活动" class="but1" onclick="gxactivity()" style="cursor: pointer;"/></li>
		           <li><input type="button" value="问题管理" class="but1" onclick="wjmanage()" style="cursor: pointer;"/></li>
		           <li><input type="button" class="dy_but"/></li>
		           <li><input type="button" class="email_but"/></li>
		           <li><input type="button" class="fx_but"/></li>
            	 </ul>
                <!--<input type="button" value="修改" class="but1" />
                <input type="button" value="删除" class="but1" />
                <input type="button" value="查看" class="but1" onclick="javascript:location.href='YG_Administration_CKDCDX.html';return false;" />
                <input type="button" value="添加" class="but1" />-->
        	</div> 
        <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	</div>
    </div>
</body>
</html>