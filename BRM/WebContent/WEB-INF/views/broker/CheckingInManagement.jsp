<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"searchEmployeeCheckingIn?searchTimeStart="+"${strTime}"+"&searchTimeEnd="+"${endTime}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','员工编号','姓名', '部门','岗位','迟到','早退','旷工','事假','病假','婚嫁','产假','丧假','探亲假','年休假','加班'],
			colModel: [
					   {name:'employeeInfo.employeeId',key:true,hidden:true,summaryType:'avg',summaryTpl : '平均:'},
					   {name:'employeeInfo.employeeNum',width:175},
					   {name:'employeeInfo.userName'},
					   {name:'employeeInfo.organizationName'},
					   {name:'employeeInfo.postName'},
					   {name:'comeLateCNT'},
					   {name:'leaveEarlyCNT'},
					   {name:'absentCNT'},
					   {name:'leaveCNT'},
					   {name:'sickLeaveCNT'},
					   {name:'marriageCNT'},
					   {name:'maternityLeaveCNT'},
					   {name:'funeralLeaveCNT'},
					   {name:'homeLeaveCNT'},
					   {name:'annualLeaveCNT'},
					   {name:'extraWorkCNT'}
			           ],
			jsonReader:{
					root: 'EmployeeCheckingInList',
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
	
	function searchCheckingIn(){
		var organizationName = $("#organizationName").val();
		var idOrName = $("#idOrName").val();
		if(idOrName=='请输入关键字'){
			idOrName = '';
		}
		$("#list").setGridParam({url:"searchEmployeeCheckingIn"});
		$.extend($("#list").getGridParam('postData'),	{"organizationName":organizationName,"idOrName":idOrName});
		$("#list").trigger("reloadGrid");
	}
	
	/*查看历史记录*/
	function historyRecord(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==""){
			alert("请选择要查看的记录");
			return;
		}
		parent.showFrame('异常考勤历史查询窗口','CheckingInPage?page=CheckingInHistoryRecord&CheckingInIds='+rows,1150,380);
	}
</script>
</head>
<body>
<div class="right1">
      <form>
        <div class="R_top">
        	<ul class="s_font zp_font">
                <li><select name="organizationName" id="organizationName"><option value=''>部门</option><option value='开发部'>开发部</option><option value='人事部'>人事部</option></select></li>
                <li><input type="text" name="idOrName" id="idOrName" value="请输入关键字" style="width:80px; _border:medium none;"/></li>
                <li><input type="button" class="seach_but" onclick="searchCheckingIn()"/></li>
            </ul> 
        </div>
        <div class="r_but" style="margin-top:10px;">
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                     
                    <li><input type="button" value="查看历史记录" class="but1" onclick="historyRecord()" /></li>
                    <li><input type="button" value="原因说明" class="but1" onclick="javascript:alert('暂时不做,别点');" /></li>
                    
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