<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$("#EmployeeRewardPunishmentList").jqGrid({
			url:"searchEmployeeRewardPunishment?recordType="+"${type}"+"&causeDateStart="+"${causeDateStart}"+"&causeDateEnd="+"${causeDateEnd}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','recordId','员工编号','姓名', '部门','岗位','职系','职等','事由','奖惩方法','奖惩金额'],
			colModel: [
			           {name:'employeeInfo.employeeId',hidden:true,summaryType:'avg',summaryTpl : '平均:'},
			           {name:'recordId',hidden:true,key:true},
			           {name:'employeeInfo.employeeNum',width:175},
			           {name:'employeeInfo.userName'},
			           {name:'organizationName'},
			           {name:'postName'},
			           {name:'jobGradeName'},
			           {name:'jobLevelName'},
			           {name:'praisePunishmentDesc'},
			           {name:'praisePunishmentMethod'},
			           {name:'praisePunishmentMoney',formatter:'number',summaryType:'sum',summaryTpl : '总计:'}],
			jsonReader:{
				root: 'EmployeeRewardPunishmentList',
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
	
	function add(){
		parent.showFrame('奖惩录入窗口','RewardPunishmentManagementPage?page=JiangChengInsert',580,400);
	}
	function modifiInfo(){
		var recordId = $("#EmployeeRewardPunishmentList").jqGrid('getGridParam','selrow');
		var temp = $("#EmployeeRewardPunishmentList").jqGrid('getGridParam','selarrrow');
		var temps = String(temp).split(',');
		if(recordId==""||recordId==null){
			alert("请选择要修改的记录");
			return;
		}
		if(temps.length>1){
			alert("一次只能修改一条记录,请重新选择");
			return;
		}
		var employeeId = $("#EmployeeRewardPunishmentList").getCell(recordId,"employeeInfo.employeeId");
		parent.showFrame('奖惩修改窗口','RewardPunishmentManagementPage?page=JiangChengAdd&recordId='+recordId+"&employeeIds="+employeeId+"&type=modifi",580,400);
	}
	/* 查看历史记录 */
	function historyRecord(){
		var rows=$("#EmployeeRewardPunishmentList").jqGrid('getGridParam','selarrrow');
			
		if(rows==""){
			alert("请选择要查看的记录");
			return;
		}
		var ids = String(rows).split(',');
		var id = "";
		for(var i=0;i<ids.length;i++){
			id =id+$("#EmployeeRewardPunishmentList").getCell(ids[i],"employeeInfo.employeeId")+",";			
		}
		parent.showFrame('奖惩历史查询窗口','RewardPunishmentManagementPage?page=JiangChengHistoryRecord&employeeIds='+id,1150,380);
	}	
	
	/* 删除 */
	function deleteEmployeeRewardPunishment(){
		var rows=$("#EmployeeRewardPunishmentList").jqGrid('getGridParam','selarrrow');
		if(rows==""){
			alert("请选择要删除的记录");
			return;
		}
		if(confirm("删除提示")){
			$.ajax({
				url:'${pageContext.request.contextPath}/deleteEmployeeRewardPunishment',
				dataType:'json',
				data:"recordIds="+rows, 
				success:function(){
					parent.reload();
				}
			});
		}
	}
	function searchInfo(){
		var causeDateStart = $("#causeDateStart").val();
		var causeDateEnd = $("#causeDateEnd").val();
		var recordType = $("#recordType").val();
		var praisePunishmentMethod = $("#praisePunishmentMethod").val();
		var organizationName = $("#organizationName").val();
		var idOrName = $("#idOrName").val();
		if(idOrName=="请输入关键字"){
			idOrName ="";
		}
		if(praisePunishmentMethod=="奖惩方式"){
			praisePunishmentMethod = "";
		}
		if(organizationName=="部门"){
			organizationName = "";
		}
		$("#EmployeeRewardPunishmentList").setGridParam({url:"searchEmployeeRewardPunishment"});
		$.extend($("#EmployeeRewardPunishmentList").getGridParam('postData'),	{"causeDateStart":causeDateStart,"causeDateEnd":causeDateEnd,"recordType":recordType,"praisePunishmentMethod":praisePunishmentMethod,"organizationName":organizationName,"idOrName":idOrName});
		$("#EmployeeRewardPunishmentList").trigger("reloadGrid");
	}
</script>
</head>
<body>
<div class="right1">
		<form action="searchEmployeeRewardPunishment" method="post" name="search">
		<input type="hidden" value="search" name="type" id="type">
	        <div class="R_top">
	        	<ul class="s_font">
	            	<li class="time">日期  从 <input name="causeDateStart" id="causeDateStart" class="Wdate" onClick="WdatePicker({readOnly:'true'})"> 到 <input name="causeDateEnd" id="causeDateEnd" class="Wdate" onClick="WdatePicker({readOnly:'true'})"></li>
	                <li><select id="recordType" name="recordType"><option value="0">奖惩类型</option><option value="1">嘉奖</option><option value="2">处罚</option></select></li>
	                <li><select id="praisePunishmentMethod" name="praisePunishmentMethod"><option value="奖惩方式">奖惩方式</option><option value="现金发放">现金发放</option><option value="其他方式">其他方式</option></select></li>
	                <li><select id="organizationName"><option value="">部门</option><option value="开发部">开发部</option><option value="UED部">UED部</option><option value="行政部">行政部</option></select></li>
	                <li><input type="text" value="请输入关键字" style="width:80px; _border:medium none;" name="idOrName" id="idOrName"/></li>
	                <li><input type="button" class="seach_but" onclick="searchInfo()"/></li>
	            </ul> 
	        </div>
        </form>
        <div class="r_but" style="margin-top:10px;">
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                     <li><input type="button" class="addjc_but"onclick="add()"/></li>
             		 <li><input type="button" value="修改" class="but1" onclick="modifiInfo()"/></li>
               		<li><input type="button" value="删除" class="but1" onclick="deleteEmployeeRewardPunishment()"/></li>
                    <li><input type="button" value="历史奖惩查看" class="but1" onclick="historyRecord()" /></li>
                    
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
            	 </ul> 
        	</div> 
        
	    <div id="gridContainer">
			<table id="EmployeeRewardPunishmentList"></table>
			<div id="pageList"></div>
		</div>
    </div>
</body>
</html>