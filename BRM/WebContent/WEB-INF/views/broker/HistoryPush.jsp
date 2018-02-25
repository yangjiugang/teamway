<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>历史绩效结构分析窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>


<script type="text/javascript">
function settab_zzjs(name,num,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
 }
}
$(document).ready(function(){
	var firstId = "${firstId}";
	if(firstId!=''){
		findPostAjax(firstId);
	}
	showHistoryPush('historyPushJqGrid');
	});
function showHistoryPush(url){
	$("#list").jqGrid({
		url:url,
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','类型','年-月','部门','岗位','提成金额'],
		colModel: [{name:'id',hidden:true},
		           {name:'type'},
				   {name:'pushStartDate',formatter:'date',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m'}},
			   	   {name:'employeeInfo.organizationName'},
			   	   {name:'employeeInfo.postName'},
			   	   {name:'pushMoney'}],
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
	addRowDate(0,0,"","");	
}

function findHistoryPushForTerm(){
	var organizationId = $("#organization").val();
	var organizationName = $("#organization").find("option:selected").text();
	var postId = $("#post").val();
	var postName = $("#post").find("option:selected").text();
	var startDate = $("#start").val();
	var endDate = $("#end").val();
	if(organizationId!=""||organizationName!=""||postId!=""||postName!=""||startDate!=""||endDate!=""){
		$('#list').setGridParam({url:"historyPushTerm"});
		$.extend($('#list').getGridParam('postData'),{"organizationId":organizationId,"organizationName":organizationName,"postId":postId,
			                                          "postName":postName,"startDate":startDate,"endDate":endDate}); 
	    $("#list").trigger("reloadGrid");
		addRowDate(organizationId,postId,startDate,endDate);	
	}else{
		alert("请选择查询条件");
	}
}

function addRowDate(organizationId,postId,startDate,endDate){
	var first = 8888;
	var second = first+1;
 	$("#list").jqGrid("delRowData",first);
	$("#list").jqGrid("delRowData",second);
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/historyPushSumAvg',
		dataType:'json',
		data:"organizationId="+organizationId+"&postId="+postId+"&startDate="+startDate+"&endDate="+endDate,
		callBackFn:function(msg){
			if(msg){
					var dataRow = {   
					    	type : "总和",  
					    	pushDate : "",  
					    	organizationName : "",  
					    	postName : "",  
					    	pushMoney : (msg.sum)  
					    };   
					    var dataRow1 = {   
					        type : "平均", 
					        pushDate : "",  
					        organizationName : "",  
					        postName : "",  
					       	pushMoney : (msg.avg).toFixed(2)  
					    }; 
						var fo = $("#list").getCell(first,"pushMoney");
					       
					  	if(!fo){
					  	  $("#list").jqGrid("addRowData", second, dataRow1, "first");  
					      $("#list").jqGrid("addRowData", first, dataRow, "first");   
				}				
			}
		}
	});
}

function findPostAjax(organizationId){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/findPostAjax',
		dataType:'json',
		data:"organizationId="+organizationId,
		callBackFn:function(msg){
			if(msg.datas){
				for(var i = 0 ; i < msg.datas.length ; i++){
					$("#post").empty();
					$("#post").append(
							"<option value='"+msg.datas[i].postId+"'>"+msg.datas[i].postName+"</option>"		
						);
				}
			}
		}
	});
}
</script>

</head>

<body>
<!--<div class="HR_yidongweihu_Bottom myBox03" style="width:100%;">
<div class="tabY"  style="width:100%;">
<ul><li id="zzjs1" onClick ="settab_zzjs('zzjs',1,2)" class="on_zzjs">平均绩效</li>
<li id="zzjs2" onClick ="settab_zzjs('zzjs',2,2)">绩效总分</li>
</ul></div>
-->
<div class="listY"  style="width:100%;">
<div id="zzjs_zzjs1" style=" margin:20px 0;">

<div class="HR_lishijixiao"  style="width:95%;">
<form>
<div class="HR_lishijixiaoL">
按日期 从<input type="text" id="start" class="Wdate" type="text" style="width:100px" name="start" onclick="WdatePicker({readOnly:'true',maxDate:'#F{$dp.$D(\'end\')||\'%y-%M-%d\'}'})" /> 
            	                      到 <input type="text" id="end" class="Wdate" type="text" style="width:100px" name="end" onclick="WdatePicker({readOnly:'true',minDate:'#F{$dp.$D(\'start\')}',maxDate:'%y-%M-%d'})"/>
    <select id="organization" onchange="findPostAjax($('#organization').val());">
    <c:forEach items="${cfgOrganizations}" var="cfgOrganizations">
    	<option value="${cfgOrganizations.organizationId}">${cfgOrganizations.organizationName}</option>
    </c:forEach>
	</select>
	<select id="post">
	</select>
<input type="button" class="HR_SearchL_button" onclick="findHistoryPushForTerm();"/>
</div>
<div class="HR_lishijixiaoR"><input type="button" class="HR_SearchR_QST" /><input type="button" class="HR_SearchR_CKXQ" /><input type="button" class="HR_SearchR_DY29" /><input type="button" class="HR_SearchR_BC29" /><input type="button" class="HR_SearchR_FX29"/></div></form>
</div>
<div class="HR_lishijixiaoContent" style="width:100%;">
	<div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	</div> 

<!-- <dl class="HR_lishijixiaoList"  style="width:100%;">
<dt>全部</dt>
<dd>年月</dd>
<dd>部门</dd>
<dd>岗位</dd>
<dd>本月提成得分</dd>
</dl>

<div class="HR_lishijixiaoList" style="width:100%;">
<dl class="HR_lishijixiaoList">
<dt>总合</dt>
<dd>&nbsp;</dd>
<dd>&nbsp;</dd>
<dd>&nbsp;</dd>
<dd>100</dd>
</dl>
</div>

<div class="HR_lishijixiaoList" style="width:100%;">
<dl class="HR_lishijixiaoList">
<dt>平均</dt>
<dd>&nbsp;</dd>
<dd>&nbsp;</dd>
<dd>&nbsp;</dd>
<dd>100</dd>
</dl>
</div> -->

</div>
</div>

 </div>
</body>
</html>