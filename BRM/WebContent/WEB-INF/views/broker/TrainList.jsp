<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
	//0未开始；1 进行中；2 已完成 ；3 取消
	var status = "0:未开始;1:进行中;2:已完成;3:取消";
	var organization='';
	$(document).ready(function(){
		var organizations = ${organizations};
		for(var i=0;i<organizations.length;i++){
			organization = organization.concat(organizations[i].organizationId, ":", organizations[i].organizationName, ";");
			$("#organizationId").append("<option value='"+organizations[i].organizationId+"'>"+organizations[i].organizationName+"</option>");
		}
		$("#list").jqGrid({
			url:"findTrainingTasks?taskStatus=${taskStatus}&flag=${flag}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','活动编号','活动名称', '发起部门','讲师','计划参加人数','实际参加人数','创建时间','地点','状态'],
			colModel: [{name:'taskId',hidden:true,key:true},
				   		{name:'taskNum',width:125},
				   		{name:'taskName'},
				   		{name:'organizationId',formatter:'select',edittype:'select',editoptions:{value:organization}},
						{name:'teacher'},
						{name:'planEmployees'},
						{name:'actualEmployees'},
						{name:'trainingStartTime'},
						{name:'taskPlace'},
						{name:'taskStatus',align:'center',formatter:'select',edittype:'select',editoptions:{value:status}}],
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
			rowNum:pageSize[0],
			rowList:pageSize
		});
	});
	
	function search() {
		$('#list').setGridParam({url:"findTrainingTasks"});
		$.extend($('#list').getGridParam('postData'), $('#searchForm').getForm());
		$('#list').trigger("reloadGrid", [{page:1}]); 
	}
	
	function add(){
		parent.ShowIframe("添加培训活动",'trainAdd',580,680);
	}
	function update(){
		var row=$("#list").jqGrid('getGridParam','selarrrow');
		if(row == ''){alert("请选择要修改的数据");return;}
		if(row.length > 1){
			alert("只能选择一条数据修改!");return;
		}
		parent.ShowIframe("修改培训活动",'findTrainTaskById?taskId='+row,580,610);
	}
	function del(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){alert('请选择要取消的记录');return;}
		var flag = false;
		for(var i=0;i<rows.length;i++){
			var a = $("#list").getRowData(rows[i]);
			if(a['taskStatus'] != 0){
				alert('只能取消状态为未开始的记录!');
				flag = true;break;
			}
		}
		if(flag)return;
		if(window.confirm("确定取消吗?")){
			$.ajax({
				 url: 'delTainingTask',
				 type: "POST",
				 dataType:"json",
				 data: 'ids='+rows,
				 success: function(data){
					alert('取消成功!');
					search();
				 }
			});
		}
	}
	function detail(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){alert('请选择要查看的记录');return;}
		if(rows.length > 1){
			alert("只能选择一条数据查看!");return;
		}
		parent.ShowIframe("培训活动统计",'findTrainTaskDetail?taskId='+rows,780,620);
	}
	function addActivity(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){alert('请选择要查看的记录');return;}
		if(rows.length > 1){
			alert("只能选择一条数据!");return;
		}
		parent.ShowIframe("创建调查活动","questionTestPage?trainTaskId="+rows,430,410);
	}
	function publish(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){alert('请选择要发布的记录');return;}
		if(rows.length > 1){
			alert("只能选择一条数据!");return;
		}
		var data = $("#list").getRowData(rows);
		if(data['taskStatus'] != 0){
			alert("只能对未开始的记录进行发布!");return;
		}
		parent.ShowIframe("发布活动","trainPublishPage?taskId="+rows,350,200);
	}
</script>
</head>
<body>
<div class="right1">
		<form id="searchForm">
        <div class="R_top">
        	<ul class="s_font">
            	<li>培训日期  从 <input class="Wdate" type="text" style="width:100px" name="trainingStartTime" onClick="WdatePicker({readOnly:'true'})"> 到
            	 <input class="Wdate" type="text" style="width:100px" name="trainingEndTime" onClick="WdatePicker({readOnly:'true'})"></li>
                <li><select style="height:22px;" name="organizationId" id="organizationId" >
                		<option value="0">发起部门</option>
                	</select>
                </li>
                <li>
                	<select style="height:22px;" name="userId">
                		<option value="">联络人</option>
                		<option value="1">张三</option>
                		<option value="2">里斯</option>
                	</select>
                </li>
                <li>
                	<select style="height:22px;" name="taskStatus">
                		<c:if test="${taskStatus==-1}">
                			<option value="-1" selected="selected">任务状态</option>
                		</c:if>
                		<c:if test="${taskStatus!=-1}">
                			<option value="-1" >任务状态</option>
                		</c:if>
                		<c:if test="${taskStatus==0}">
                			<option value="0" selected="selected">未开始</option>
                		</c:if>
                		<c:if test="${taskStatus!=0}">
                			<option value="0">未开始</option>
                		</c:if>
                		<c:if test="${taskStatus==1}">
                			<option value="1" selected="selected">进行中</option>
                		</c:if>
                		<c:if test="${taskStatus!=1}">
                			<option value="1">进行中</option>
                		</c:if>
                		<c:if test="${taskStatus==2}">
                			<option value="2" selected="selected">已完成</option>
                		</c:if>
                		<c:if test="${taskStatus!=2}">
                			<option value="2">已完成</option>
                		</c:if>
                		<c:if test="${taskStatus==3}">
                			<option value="3" selected="selected">取消</option>
                		</c:if>
                		<c:if test="${taskStatus!=3}">
                			<option value="3">取消</option>
                		</c:if>
                	</select>
                </li>
                <li>活动名称：</li>
                <li><input type="text" name="taskName" style="width:80px;height:20px;_border:medium none;"/></li>
                <li><input type="button" class="seach_but" style="cursor: pointer;" onclick="search()"/></li>
            </ul>
            <input type="hidden" name="flag" value = "${flag }" id="flag" />
        </div>
        <div class="r_but" >
           	<ul class="t_but12">
                <li><input type="button" class="fbpx_but"  style="cursor: pointer;" onclick="publish()"/></li>
                 <li><input type="button" class="cjpx_but" onclick="add()" style="cursor: pointer;"/></li>
                 <li><input type="button" value="修改培训活动" class="but1" onclick="update()" style="cursor: pointer;"/></li>
                <li><input type="button" value="取消培训活动" class="but1" onclick="del()" style="cursor: pointer;" /></li>
                <li><input type="button" value="活动评估" class="but1" onclick="addActivity()" style="cursor: pointer;" /></li>
                <li><input type="button" value="查看培训详情" class="but1"  onclick="detail()" style="cursor: pointer;" /></li>
                <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                <li><input type="button" class="email_but"/></li>
                <li><input type="button" class="fx_but"/></li>
           	</ul> 
       	</div>
      </form>
    <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	</div>
</div>
</body>
</html>