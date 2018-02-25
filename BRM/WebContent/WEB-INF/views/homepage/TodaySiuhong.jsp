<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
    <%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>今日受访</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>

<script type="text/javascript">
	/* 转换状态 '提醒原因', */
	
	$(document).ready(function(){
		var n=9;
		$("#list").jqGrid({
			url:"homepage_todayAppointmentsAjax",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','编号','主访人编号', '主访人姓名','部门','岗位'],
			colModel: [{name:'talkId',hidden:true,key:true},
				   		{name:'testNum',width:125},
				   		{name:'talkToEmployeeNum'},
				   		{name:'talkToEmployeeName'},
						{name:'surveyOrganizationName'},
						{name:'surveyPostName'}],
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

</script>

<script type="text/javascript">
	
	// 打开详细页面
	function queryDetail(idArray,nameArr){
		parent.showFrame('约谈记录历史查询','broker_queryDetail?id='+idArray+'&name='+nameArr,840,750);
	}
	
	// 按钮点击查看多条记录
	function queryMoreDetail(){
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
			alert("请选择要查看的数据！");
			return false;
		}else{
			var nameArr = new Array();
			nameArr = rowNames.substring(0, rowNames.length-1).split(",");
			queryDetail(idArray,nameArr);
		}
	}
</script>
</head>

<body>
<!--end中间选项卡，面包屑-->
<!--中间-->
	<div class="right16">
    	
<div class="r_but05" >
		<div class="R_top">
              <ul class="s_font zp_font">
                   <li>日期  从<input class="Wdate" type="text" style="width:100px;" name="testStartTime" onclick="WdatePicker({readOnly:'true'})"/>
                                               到<input class="Wdate" type="text" style="width:100px;" name="testEndTime" onclick="WdatePicker({readOnly:'true'})"/> </li>
                  <li><input type="text" value="请输入关键字" style="width:80px; _border:medium none;"/></li>
                  <li><input type="button" class="seach_but"/></li>
              </ul> 
          </div>
            	<ul class="t_but12">
  					<authz:authorize ifAllGranted="FUNC_AUTH_HOM_10_01"><li><input type="button" value="查看" class="but1" onclick="queryMoreDetail();" /></li></authz:authorize>
                    
                    <li><input type="button" class="dy_but" /></li>
                  <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
   	  </ul> 
   	 
   	  </div>
         <div class="font_ul">
        	<p class="Number">共：<font>${todayAppointmentsCount }</font> 条</p>
      </div> 	
        
      <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	 </div>
        
    </div>
<!--end中间-->
</body>
</html>
