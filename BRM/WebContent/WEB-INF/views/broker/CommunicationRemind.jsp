<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>沟通提醒</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">

	// 刷新页面
	function search(){
		$("#tab_List").trigger("reloadGrid");
	}
	
	$(document).ready(function(){
		$("#tab_List").jqGrid({
			url : "broker_CommRemindList",
			datatype : 'json',
			mtype : 'POST',
			colNames : ['id','编号','姓名','部门','岗位','提醒时间','提醒人'],
			colModel : [{name : 'fcSysMsg.msgId',hidden : true,key : true},
			            {name : 'employeeNum',width : 125},
			            {name : 'userName',formatter: showLink},
			            {name : 'organizationName'},
			            {name : 'postName'},
			            {name : 'fcSysMsg.sendTime',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'remindName'}],
			jsonReader : {
				root : 'lstData',
				repeatitems : false
			},
			pager : '#pageList',
			height : 'auto',
			autowidth : true,
			hidegrid : true,
			multiselect : true,
			viewrecords : true,
			rowNum : pageSize[0],
			height:'auto',
			rowList : pageSize
		});
	});
	
	function showLink(cellvalue,options,rowObject){
		return "<a href='#'>"+rowObject['userName']+"</a>";
	}
	
	// 打开约谈信息录入页面
	function addCommPage(){
		parent.showFrame('约谈信息记录','broker_pageForWard?url=AddCommuncation',840,750);
	}
	
	// 删除提醒
	function deleteRemind(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		if(rowId == ''){
			alert("请选要删除的数据！");
			return false;
		}
		if(confirm("确定要删除提醒吗？")){
			$.ajax({
				url : "broker_deleteCommRemind",
				dataType : 'json',
				data : "msgId=" + rowId,
				success:function(data){
						alert("删除成功！");
						search();
				}
			});
		}
		else{
			return false;
		}
	}
	
	// 查看访谈记录
	function queryCommRecord(){
		var arr = new Array();
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		var arr = rowId.toString().split(',');
		if(arr.length > 1){
			alert("不能选择多条记录，请选择单条记录！");
			return false;
		}else if(arr == ''){
			alert("请选择一条记录！");
			return false;
		}
		parent.showFrame('查看约谈记录','broker_commHistoryDetail?talkId='+rowId,800,700);
	}
	
	// 约谈提醒条件查询
	function queryCondition() {
		var commStartTime = $("input[name=commStartTime]").val();
		var commEndTime = $("input[name=commEndTime]").val();
		var keyWord = $("#keyWord").val();
		if ('' == commStartTime) {
			alert("开始时间不能为空！");
			return false;
		} else if ('' == commEndTime) {
			alert("结束时间不能为空！");
			return false;
		}if (commEndTime < commStartTime) {
			alert("开始时间不能大于结束时间！");
			return false;
		} else {
			$.extend($('#tab_List').getGridParam('postData'), $('#searchForm').getForm());
			$("#tab_List").trigger("reloadGrid");
		}
	}
</script>
</head>
<body>
	<div class="right1">
	    <form id="searchForm">
	        <div class="R_top">
	        	<ul class="s_font zp_font">
	            	<li>约谈日期  从
	            		<input class="Wdate" name="commStartTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">到
	            		<input class="Wdate" name="commEndTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
	            	</li>
	                <li><select><option>部门</option></select></li>
	                <li><select><option>岗位</option></select></li>
	                <li><select style="width:130px;"><option>约谈原因</option></select></li>
	                <li>
	                	<input type="text" tip="请输入关键字" id="keyWord" style="width:80px; _border:medium none;"/>
	                </li>
	                <li><input type="button" class="seach_but" onclick="queryCondition();"/></li>
	            </ul>
	        </div>
	        <div class="r_but" style="margin-top:10px;">
	           	<ul class="t_but12">
	                   <li><input type="button" class="but1" value="删除" onclick="deleteRemind();"/></li>
	                   <li><input type="button" value="查看访谈记录" class="but1" onclick="queryCommRecord();" /></li>
	                   <li><input type="button" value="添加访谈记录" class="but1" onclick="addCommPage();" /></li>
	                   <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
	                   <li><input type="button" class="email_but"/></li>
	                   <li><input type="button" class="fx_but"/></li>
	           	</ul>
	        </div>
		</form>
        <!-- 查询数据列表  start -->
		<div id="gridContainer">
			<table id="tab_List"></table>
			<div id="pageList"></div>
		</div>
		<!-- 查询数据列表  end -->
    </div>
</body>
</html>