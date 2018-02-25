<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>    
    <%@include file="../common.jsp" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>今日面试</title>
  <link rel="stylesheet" media="screen" href="css/layout.css"/>
  <link rel="stylesheet" media="screen" href="css/index.css"/>

  <script type="text/javascript">
  var sex="0:男;1:女;";
	/* 转换状态 */
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"homepage_todayInterviewAjax",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','姓名','简历来源', '性别','出生日期','学历','毕业院校','工作年限','联系方式','约定面试日期'],
			colModel: [{name:'ri.taskId',hidden:true},
				   	   {name:'userName',width:125},
				   	   {name:'resumeFrom'},
				   	   {name:'userSex',formatter:'select',edittype:'select',editoptions:{value:sex}},
					   {name:'userBirthday',formatter:'date'},
					   {name:'highestEducationName'},
					   {name:'graduateSchool'},
					   {name:'workYears'},
					   {name:'userTelphone'},
					   {name:'rip.interviewTime'}],
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
function check(){
	var rows=$("#list").jqGrid('getGridParam','selarrrow');
	for(var i=0;i<rows.length;i++){
		alert($("#list").getRowData(rows[i])['ri.taskId']);	
	}
	
	
	/* var rowId = $("#list").jqGrid('getGridParam','selarrrow');
	alert(rowId); */
	
	   /* var testStartTime=$("#testStartTime").val();
	   var testEndTime=$("#testEndTime").val();
	   var keyW=$("#keyW").val();
	   var smallTime=$("#smallTime").val();
	   var bigTime=$("#bigTime").val();
	   var keyword=$("#keyword").val();
	   
   if(keyW.length!=0 && "请输入关键字" != keyW){
		   
	   }else{
		   keyW="";
	   }
	   keyword=keyW;
	   if(testStartTime.length!=0 && testEndTime.length==0){
		   alert("终止时间不能为空");
	   }else if(testStartTime.length==0 && testEndTime.length!=0){
		   alert("起止时间不能为空");
	   }else if(testStartTime.length!=0 && testEndTime.length!=0){
		   if(testStartTime > testEndTime){
			   alert("起止时间不能大于终止时间");
		   }else{
			   smallTime=testStartTime;
			   bigTime=testEndTime;
		   }
	   }	   
	  
	   alert(smallTime);
	   alert(bigTime);
	   alert(keyword); */
}

</script>
</head>
  
  <body>
  <!--end中间选项卡，面包屑-->
  <!--中间-->
      <div class="right16">
          <div class="R_top">
              <ul class="s_font zp_font">
                   <li>日期  从<input class="Wdate" type="text" style="width:100px;" id="testStartTime" name="testStartTime" onclick="WdatePicker({readOnly:'true'})"/>
                                               到<input class="Wdate" type="text" style="width:100px;" id="testEndTime" name="testEndTime" onclick="WdatePicker({readOnly:'true'})"/> </li>
                  <li><input id="keyword" type="text" value="请输入关键字" style="width:80px; _border:medium none;"/></li>
                  <li><input type="button" class="seach_but" onclick="check()"/></li>
              </ul> 
          </div>
          <div class="r_but" >
                  <ul class="t_but12">
                  	<authz:authorize ifAllGranted="FUNC_AUTH_HOM_05_01"><li><input type="button" class="addmsjl" onclick="javascript:location.href='MSLSCX.html';" /></li></authz:authorize>
    				<authz:authorize ifAllGranted="FUNC_AUTH_HOM_05_02"><li><input type="button" value="查看" class="but1" onclick="javascript:location.href='MSLSCX.html';" /></li></authz:authorize>

                      
                    <li><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
   	  </ul> 
   	  </div>
   	  
   	  <div class="font_ul">
        	<p class="Number">共：<font>${todayInterviewCount }</font> 条</p>
      </div>  	
   	  
   	   <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	  </div>
    </div>
    
<!--end中间-->
</body>
</html>
