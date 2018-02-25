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
		$("#list").jqGrid({
			url:"searchEmployeeAppraisal?month=${dateProperty.month}&year=${dateProperty.year}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','员工编号','姓名', '部门','岗位','本月绩效得分','绩效工资发放比例','开始时间'],
			colModel: [
			           {name:'employeeInfo.employeeId',hidden:true,summaryType:'avg',summaryTpl : '平均:'},
			           {name:'employeeInfo.employeeNum',width:175},
			           {name:'employeeInfo.userName'},
			           {name:'employeeInfo.organizationName'},
			           {name:'employeeInfo.postName'},
			           {name:'appraisalResult'},
			           {name:'appraisalRate',formatter:'number',summaryType:'sum',summaryTpl : '总计:'},
			           {name:'appraisalStartDate',hidden:true}
			           ],
			jsonReader:{
				root: 'EmployeeAppraisalList',
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
		parent.showFrame('新增绩效窗口','AppraisalManagementPage?page=AppraisalAdd',400,280);
	}
	function modifiInfo(){
		var recordId = $("#list").jqGrid('getGridParam','selrow');
		var temp = $("#list").jqGrid('getGridParam','selarrrow');
		var temps = String(temp).split(',');
		if(recordId==""||recordId==null){
			alert("请选择要修改的记录");
			return;
		}
		if(temps.length>1){
			alert("一次只能修改一条记录,请重新选择");
			return;
		}
		var time = $("#list").getCell(recordId,"appraisalStartDate");
		var employeeId = $("#list").getCell(recordId,"employeeInfo.employeeId");
		alert(time);
		var date = new Date();
		var thisMonth = getMonthStartDate(date.getFullYear(),date.getMonth()+1);
		var month = date.getMonth();
		var day = date.getDate();
		var lastMonth = date.setDate(1);
		date.setMonth(date.getMonth());
		var lastMonthDate = formatDate(date);
		alert("lastMonthDate : "+lastMonthDate);
		if(day<=8){
			if(time==lastMonthDate){
				parent.showFrame('当月绩效调整','AppraisalManagementPage?page=AppraisalUpdate&&employeeIds='+employeeId+"&type=modifi&startTime="+time,400,200);		
			}else{
				alert("只能调整上个月的绩效");
				return;
			}
		}else if(day>8){
			if(time==thisMonth){
				parent.showFrame('当月绩效调整','AppraisalManagementPage?page=AppraisalUpdate&&employeeIds='+employeeId+"&type=modifi&startTime="+time,400,200);
			}else{
				alert("只能调成本月绩效");
				return;
			}
		}
		
		//parent.showFrame('奖惩修改窗口','RewardPunishmentManagementPage?page=JiangChengAdd&recordId='+recordId+"&employeeIds="+employeeId+"&type=modifi",580,400);
	}
	
	//格式化日期：yyyy-MM-dd 
	function formatDate(date) { 
		var myyear = date.getFullYear(); 
		var mymonth = date.getMonth(); 
		var myweekday = date.getDate();			
			if(mymonth < 10){ 
			mymonth = "0" + mymonth; 
		} 
			if(myweekday < 10){ 
			myweekday = "0" + myweekday; 
		} 
		return (myyear+"-"+mymonth + "-" + myweekday); 
	}
	//获得本月的开始日期 
	function getMonthStartDate(nowYear,nowMonth){ 
		var monthStartDate = new Date(nowYear, nowMonth, 1); 
		return formatDate(monthStartDate); 
	} 


	/* 查看历史记录 */
	function historyRecord(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
			
		if(rows==""){
			alert("请选择要查看的记录");
			return;
		}
		var ids = String(rows).split(',');
		var id = "";
		for(var i=0;i<ids.length;i++){
			id =id+$("#list").getCell(ids[i],"employeeInfo.employeeId")+",";			
		}
		parent.showFrame('奖惩历史查询窗口','AppraisalManagementPage?page=AppraisalHistoryRecord&employeeIds='+id,1150,380);
	}	
	
	function searchInfo(){
		var organizationName = $("#organizationName").val();
		var postName = $("#postName").val();
		var jobGradeName = $("#jobGradeName").val();
		var jobLevelName = $("#jobLevelName").val();
		var idOrName = $("#idOrName").val();
		if(idOrName=="请输入关键字"){
			idOrName ="";
		}
		$("#list").setGridParam({url:"searchEmployeeAppraisal"});
		$.extend($("#list").getGridParam('postData'),	{"organizationName":organizationName,"postName":postName,"jobGradeName":jobGradeName,"jobLevelName":jobLevelName,"idOrName":idOrName});
		$("#list").trigger("reloadGrid");
	}
	
	function reloadGrid(){
		$("#list").trigger("reloadGrid");
	}
</script>
</head>
<body>
<div class="right1">
			 <div class="R_top">
	        	<ul class="s_font zp_font">
	            	<li><select id="organizationName"><option value="">部门</option><option value="开发部">开发部</option><option value="UED部">UED部</option><option value="行政部">行政部</option></select></li>
	                <li><select id="postName"><option value="">岗位</option><option value="java工程师">java工程师</option></select></li>
	                <li><select id="jobGradeName"><option value="">职系</option><option value="职系一">职系一</option><option value="职系二">职系二</option></select></li>
	                <li><select id="jobLevelName"><option value="">职等</option><option value="职级一">职级一</option><option value="职级二">职级二</option></select></li>
	                <li><input type="text" name="idOrName" id="idOrName" value="请输入关键字"/></li>
	                <li><input type="button" class="seach_but" onclick="searchInfo()"/></li>
	            </ul> 
	        </div>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                     <li><input type="button"class="addjx_but" onclick="add()" /></li>
                    <li><input type="button" value="当月绩效调整" class="but1"  onclick="modifiInfo()"  /></li>
                    <li><input type="button" value="历史绩效查看" class="but1" onclick="historyRecord()"  /></li>
                    <li><input type="button" value="当月绩效导入" class="but1"  /></li>
                    <li><input type="button" value="Excel模板下载" class="but1"  onclick="javascript:location.href='YG_Administration_DYXCFLSC1.html';return false;"/></li>
                    
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        
	    <div id="gridContainer">
			<table id="list"></table>
			<div id="pageList"></div>
		</div>
    </div>
</body>
</html>