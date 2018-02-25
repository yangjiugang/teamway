<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#CheckingInListById").jqGrid({
		url:"getEmployeeCheckingInById?employeeCheckingInId="+"${firstId}",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','员工编号','姓名','开始日期 ','结束日期','异动类型','异动原因'],
		colModel: [
		           {name:'employeeId',hidden:true,key:true},
		           {name:'employeeInfo.employeeNum',width:100},
		           {name:'employeeInfo.userName',width:80},
		           {name:'startTime'},
		           {name:'endTime'},
		           {name:'checkingType',formatter:function(cellvalue, options, rowObject){
		        	   switch(cellvalue){
		        	   case 0:return "迟到";
		        	   case 1:return "早退";
		        	   case 2:return "旷工";
		        	   case 3:return "事假";
		        	   case 4:return "病假";
		        	   case 5:return "婚假";
		        	   case 6:return "产假";
		        	   case 7:return "丧假";
		        	   case 8:return "探亲假";
		        	   case 9:return "年休假";
		        	   case 10:return "加班";
		        	   }
		           }},
		           {name:'cause'}
		           ],
	jsonReader:{
		   	root: 'EmployeeCheckingInListById',
		   	repeatitems: false
	},
	pager: '#pageLists',
	height:'auto',
	width: 1000,
	hidegrid: true,
	multiselect: true,
	viewrecords: true,
	rowNum:pageSize[0],
	rowList:pageSize
	});
});
function changeUser(id){
	$("#CheckingInListById").setGridParam({url:"getEmployeeCheckingInById"});
	$.extend($("#CheckingInListById").getGridParam('postData'),{"employeeCheckingInId":id});
	$("#CheckingInListById").trigger("reloadGrid");
}
</script>
</head>
<body>
				<div class="HR_yidongweihu_Bottom myBox03" style="width:1200px;">
					<div class="HR_lishijixiaoContent jixiaoContent" style="width:1200px;">
						<div class="H_left">
							<ul class="ul_tittle">
							<c:forEach items="${employeeInfoList }" var="employeeInfo">
								<li><a onclick="changeUser(${employeeInfo.employeeId })" style="cursor: pointer;"><span
										class="aa"></span>${employeeInfo.userName }</a></li>								
							</c:forEach>
							</ul>
						</div>
						<div class="H_right">
						
							<div id="gridContainer">
								<table id="CheckingInListById"></table>
								<div id="pageLists"></div>
							</div>
							
						</div>
					</div>
				</div>


				<div class="HR_lishijixiaoContent"></div>
</body>
</html>