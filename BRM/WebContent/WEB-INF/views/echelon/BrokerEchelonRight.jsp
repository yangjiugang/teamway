<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人梯队管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript" src="/js/lazyload/jquery.lazyload.js"></script> 
</head>
<script type="text/javascript">
	//查询列表数据
	$(document).ready(function(){
		$("#tab_List").jqGrid({
			url : "echelon_queryEchelonInfo",
			datatype : 'json',
			mtype : 'POST',
			colNames : ['id','员工编号','姓名','','部门','岗位','职系','职等','薪酬等级','性别','出生日期','学历','毕业院校','接受培训','受访','入职时间','进入梯队时间'],
			colModel : [{name : 'employeeId',hidden : true,key : true},
			            {name : 'employeeNum',width : 125},
			            {name : 'userName'},
			            {name : 'userName1',hidden : true,formatter:function(cellvalue,options,rowObject){return rowObject['userName']}},
			            {name : 'organizationName'},
			            {name : 'postName'},
			            {name : 'jobGradeName'},
			            {name : 'jobLevelName'},
			            {name : 'salaryLevelOrder'},
			            {name : 'userSex'},
			            {name : 'userBirthday',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'highestEducation'},
			            {name : 'graduateSchool'},
			            {name : 'bankNum'},
			            {name : 'lastContactEmployee'},
			            {name : 'entryDate',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'fpsgTime',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}}],
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
	
	// 刷新页面
	function refurbish(){
		$("#tab_List").trigger("reloadGrid");
	}
	function search(){
		refurbish();
	}
	
	// 条件查询
	function queryCondition(){
		$.extend($('#tab_List').getGridParam('postData'), $('#broketEchelonForm').getForm());
		refurbish();
	}
	
	// 移除梯队
	function removeEchelon(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow').toString();
		var array = new Array();
		var arrNames = "";
		array = rowId.split(",");
		for(var i = 0; i < array.length; i++){
			rowName = $("#tab_List").getRowData(array[i]);
			arrNames += rowName['userName1'] += ",";
		}
		arrNames = arrNames.substring(0, arrNames.length-1);
		if(confirm("确定要将  "+arrNames+" 移出梯队吗？")){
			if(rowId == ''){
				alert("请选择要移出梯队的人！");
				return false;
			}else{
				$.ajax({
					url : "echelon_removeEchelonInfo?employeeId="+rowId,
					dataType : 'json',
					data : "infoId=" + rowId,
					success:function(data){
						if(data.iFlag > 0){
							alert("移除梯队成功！");
							refurbish();
						}else{
							alert("移除梯队失败！");
							return false;
						}
					}
				});
			}
		}else{
			return false;
		}
	}
	
	// 打开调查活动窗口
	function surActivity(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		if(rowId == ''){
			alert("您还没有选择给谁发送调查活动通知！");
			return false;
		}else{
			parent.showFrame('关联调查活动','echelon_JSPForWardParame?jspName=SurveyActivity&parame='+rowId,840,240);
		}
	}
	
	// 打开培训活动窗口
	function trainActivity(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		if(rowId == ''){
			alert("您还没有选择给谁发送培训活动通知！");
			return false;
		}else{
			parent.showFrame('关联培训活动 ','echelon_JSPForWardParame?jspName=TrainActivity&parame='+rowId,840,240);
		}
	}
	
	// 发送约谈提醒
	function sendRemind(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		var strRow = rowId.toString();
		var idArray = new Array();
		idArray = strRow.split(",");
		var rowName="";
		var rowNames = "";
		for(var i = 0; i < idArray.length; i++){
			rowName = $("#tab_List").getRowData(idArray[i]);
			rowNames += rowName['userName1'] += ",";
		}
		if(rowId == ''){
			alert("您还没有选择给谁发送提醒！");
			return false;
		}else{
			var nameArr = new Array();
			nameArr = rowNames.substring(0, rowNames.length-1).split(",");
			parent.showFrame('约谈通知窗口 ','broker_sendCommRemind?idArray='+idArray+'&nameArr='+nameArr,670,260);
		}
	}
	
	// 查看经纪人详细档案
	function queryEmployeeDetailInfo(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		if(rowId == ""){
			alert("请选择要查看的经纪人！");
			return false;
		}else{
			parent.showFrame('员工详细资料 ','jumpUserInfo?userId=' + rowId,820,800);
		}
	}
</script>
<body>
	<div class="right1">
		<form id="broketEchelonForm">
	        <div class="R_top">
	        	<ul class="s_font zp_font">
	            	<li class="time">时间  从 
		            	<input class="Wdate" name="startTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})"> 到 
		            	<input class="Wdate" name="endTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
	                <li>
		                <select style="width:80px;" id="orgClass" name="orgClass">
		                	<option value="1">总经办</option>
		                	<option value="2">技术部</option>
		                	<option value="3">运营部</option>
		                	<option value="4">采购部</option>
		                	<option value="5">运维部</option>
		                	<option value="6">渠道部</option>
		                	<option value="7">人事部</option>
		                </select>
	                </li>
	                <li><input type="text" name="keyWord" tip="请输入关键字"/></li>
	                <li><input type="button" class="seach_but" onclick="queryCondition()"/></li>
	            </ul> 
	        </div>
	        <div class="r_but" style="margin-top:10px;">
	           	<ul class="t_but12">
	              		<li><input type="button" value="调 查" class="but1" onclick="surActivity()" /></li>
	                   <li><input type="button" value="培 训" class="but1" onclick="trainActivity()" /></li>
	                   <li><input type="button" value="详细档案" class="but1" onclick="queryEmployeeDetailInfo()" id="detailInfo" /></li>
	                   <li><input type="button" value="移出梯队" class="but1" onclick="removeEchelon()" /></li>
	                   <li><input type="button" value="约谈" class="but1" onclick="sendRemind()" /></li>
	                   <li><input type="button" value="活动通知" class="but1" onclick="javascript:location.href='huodongtongzhi.html';"  /></li>
	                   
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