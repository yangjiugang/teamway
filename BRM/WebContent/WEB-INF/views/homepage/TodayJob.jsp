<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
    <%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>今日入职</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>

<script type="text/javascript">
  var questionStatus="0:已发offer,未入职;1:推迟入职;2:取消入职;3:已入职;";
  var sex="0:男;1:女;";
	/* 转换状态 */
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"homepage_todayJobAjax",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','姓名','简历来源', '性别','出生日期','学历','毕业院校','工作年限','联系方式','面试记录数','约定入职日期','入职状态'],
			colModel: [{name:'ri.interviewId',hidden:true,key:true},
				   		{name:'userName',width:125},
				   		{name:'resumeFrom'},
				   		{name:'userSex',formatter:'select',edittype:'select',editoptions:{value:sex}},
						{name:'userBirthday',formatter:'date'},
						{name:'highestEducationName'},
						{name:'graduateSchool'},
						{name:'workYears'},
						{name:'userTelphone'},
						{name:'ri.interviewCnt'},
						{name:'ri.entryDate',formatter:'date'},
						{name:'ri.entryStatus',formatter:'select',edittype:'select',editoptions:{value:questionStatus}}],
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
  				<authz:authorize ifAllGranted="FUNC_AUTH_HOM_06_01"><li><input type="button" value="查看" class="but1" onclick="javascript:location.href='YG_Administration_YGXXZL.html';" /></li></authz:authorize>
                <authz:authorize ifAllGranted="FUNC_AUTH_HOM_06_02"><li><input type="button" value="管理新入职" class="but1" onclick="javascript:location.href='YG_Administration_BLRZ.html';" /></li></authz:authorize>
                    
                    <li><input type="button" class="dy_but" /></li>
                  <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
   	  </ul> 
   	  </div>
   	  
   	  <div class="font_ul">
        	<p class="Number">共：<font>${todayJobCount }</font> 条</p>
      </div>
      
      <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	  </div>  	
	  
    </div>
<!--end中间-->
</body>
</html>
