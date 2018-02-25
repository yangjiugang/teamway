<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
$(document).ready(function(){
	var year = "${dateProperty.year}";
	var month = "${dateProperty.month}";
	if(year==""&&month==""){
		showThePush('pushThisYear');
	}if(year==""&&month=="13"){
		showThePush('pushThisYear');		
	}else{
		showThePush('pushThisYear?year='+year+"&month="+month);
	}
});

	function showHtml(title,src,w,h){
		parent.showFrame(title,src,w,h);
	};	
	
	function showThePush(url){
		$("#list").jqGrid({
			url:url,
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','员工编号','员工姓名','隶属部门','员工岗位','提成金额','提成开始时间','提成结束时间'],
			colModel: [{name:'employeeId',hidden:true},
			           {name:'employeeInfo.employeeNum'},
				   	   {name:'employeeInfo.userName',width:125},
				   	   {name:'employeeInfo.organizationName'},
				   	   {name:'employeeInfo.postName'},
				   	   {name:'pushMoney'},
				   	   {name:'pushStartDate',hidden:true,formatter:'date',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m-d'}},
				   	   {name:'pushEndDate',hidden:true,formatter:'date',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m-d'}}],
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
			height:'auto',
			rowList:pageSize
		}); 
	}
	
	function searchPush(){
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/searchPush',
			dataType:'json',
			data:"pushId="+pushId+"&pushMoney="+pushMoney,
			callBackFn:function(msg){
				parent.location.href='pushIndex';
			}
		});
	}

	//获得部门信息
	function getOrganizationName(){
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/getOrganizationName',
			dataType:'json',
			data:"pushId="+pushId+"&pushMoney="+pushMoney,
			callBackFn:function(msg){
				parent.location.href='pushIndex';
			}
		});
	}
	
	
	function pushAdjust(){
		var row=$("#list").jqGrid('getGridParam','selarrrow');
		var employeeId = $("#list").getCell(row,'employeeId');
		var pushStartDate = $("#list").getCell(row,'pushStartDate');
		var pushEndDate = $("#list").getCell(row,'pushEndDate');
		if(row == ''){
			alert("请选择你要调整的项目！");
		}else{
			if(row.length > 1){
				alert("只能选择一个项目！");
			}else{
				var date = new Date();
				var day = date.getDate();
				if(day<8){
					alert("职能调整当月提成！");
				}else{	
					$.fc.ajaxSubmit({
						url:'${pageContext.request.contextPath}/PushisNullOrNotNull',
						dataType:'json',
						data:"employeeId="+employeeId,
						callBackFn:function(msg){
							if(msg){
								showHtml('提成调整','pushAdjust?employeeId='+employeeId+'&pushStartDate='+pushStartDate+"&pushEndDate="+pushEndDate,700,220);									
							}else{
								showHtml('添加提成窗口','pushNewly?employeeId='+employeeId+'&pushStartDate='+pushStartDate+'&pushEndDate='+pushEndDate,700,300);
							}
						}
					});		
				}
			}
		}
	}
	
	function pushLook(){
		var row=$("#list").jqGrid('getGridParam','selarrrow');
		var employeeId=[];
		var employee=0;
		for(var i = 0 ; i < row.length ; i++){
			employee = $("#list").getCell(row[i],'employeeId');
			employeeId.push(employee);		
		};
		if(row == ''){
			alert("请选择你要查看的员工！");
		}else{
				showHtml('历史提成查看','pushLook?item='+employeeId,850,700);
		}
	}
	/**
	*添加提成
	*/
	function pushNewly(){
		var row=$("#list").jqGrid('getGridParam','selarrrow');
		if(row == ''){
			alert("请选择员工！");
		}else{
			if(row.length > 1){
				alert("只能选择一个员工！");
			}else{
				var employeeId = $("#list").getCell(row[0],'employeeId');
				var pushStartDate = $("#list").getCell(row,'pushStartDate');
				var pushEndDate = $("#list").getCell(row,'pushEndDate');
				showHtml('添加提成窗口','pushNewly?employeeId='+employeeId+'&pushStartDate='+pushStartDate+'&pushEndDate='+pushEndDate,700,300);
		}
		}
	}
	function findPushForTerm(){
		var organizationId = $("#organization").val();
		var organizationName = $("#organization").find("option:selected").text();
		var postId = $("#post").val();
		var postName = $("#post").find("option:selected").text();
		var jobGradeId = $("#jobGrade").val();
		var jobGradeName = $("#jobGrade").find("option:selected").text();
		var jobLevelId = $("#jobLevel").val();
		var jobLevelName = $("#jobLevel").find("option:selected").text();
		var term = $("#trem").val();
		 if(term=="请输入关键字"){
			 $("#trem").val(""); 
		 }
		if(organizationId!=""||organizationName!=""||postId!=""||postName!=""||jobGradeId!=""||jobGradeName!=""
		   ||jobLevelId!=""||jobLevelName!=""||term!=""){
			$('#list').setGridParam({url:"findPushForTrem"});
			$.extend($('#list').getGridParam('postData'),{"organizationId":organizationId,"organizationName":organizationName,"postId":postId,
				                                          "postName":postName,"jobGradeId":jobGradeId,"jobGradeName":jobGradeName,
	                                                      "jobLevelId":jobLevelId,"jobLevelName":jobLevelName,"trem":term}); 
		    $("#list").trigger("reloadGrid");
		}else{
			alert("请选择查询条件");
		}
	}
	
    function clearText(){
		 var keyword=$("#trem").val();
		 if(keyword=="请输入关键字"){
			 $("#trem").val(""); 
		 }
	}
	function initText(){
			var keyword=$("#trem").val();
			if(keyword==""){
				$("#trem").val("请输入关键字");
			}
	}
</script>
</head>

<body>
<div class="right1">
      <form>
        <div class="R_top">
        	<ul class="s_font zp_font">
            	<li><select id="organization">
            		<option value="1">开发部</option>
            	</select></li>
                <li><select id="post">
                	<option value="2">项目组长</option>
                	<option value="3">技术总监</option>
                	<option value="9">资深架构师</option>
                	<option value="12">java工程师</option>
                </select></li>
                <li><select id="jobGrade">
                	<option value="1">职系一</option>
                </select></li>
                <li><select id="jobLevel">
                	<option value="1">职级一</option>
                </select></li>
                <li><input type="text" value="请输入关键字" id="trem" onmouseup="clearText();" onblur="initText();"/></li>
                <li><input type="button" class="seach_but" onclick="findPushForTerm();"/></li>
            </ul> 
        </div>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                   	<authz:authorize ifAllGranted="FUNC_AUTH_BRO_12_02"><li><input type="button" class="addtc_but" onclick="pushNewly();"/></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_BRO_12_03"><li><input type="button" value="当月提成调整" class="but1" onclick="pushAdjust();"/></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_BRO_12_04"><li><input type="button" value="历史提成查看" class="but1" onclick="pushLook();"/> </li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_BRO_12_05"><li><input type="button" value="当月绩效导入" class="but1"  /></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_BRO_12_06"><li><input type="button" value="Excel模板下载" class="but1"  onclick="javascript:location.href='pushExcel'"/></li></authz:authorize>                
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but" onclick="sendCommonEmail('list','提成管理列表','');"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        </form> 
        <div class="font_ul">
            	<div id="gridContainer">
					<table id="list"></table>
					<div id="pageList"></div>
				</div> 
        </div>
    </div>
</body>
</html>
