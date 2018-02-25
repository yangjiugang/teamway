<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>提成记录</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>


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
	if(firstId!=""){
		showPush('findPushCashForEmployeeId?employeeId='+firstId);		
	}
});
function showPush(url){
	$("#list").jqGrid({
		url:url,
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','员工编号','员工姓名','隶属部门','员工岗位','提成金额','提成开始日期','提成结束时间'],
		colModel: [{name:'pushId',hidden:true,key:true},
		           {name:'employeeInfo.employeeNum'},
			   	   {name:'employeeInfo.userName',width:125},
			   	   {name:'employeeInfo.organizationName'},
			   	   {name:'employeeInfo.postName'},
			   	   {name:'pushMoney'},
			   	   {name:'pushStartDate',formatter:'date',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m-d'}},
			   	   {name:'pushEndDate',formatter:'date',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m-d'}}],
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
};
function showPushForEmployee(id){
	$('#list').setGridParam({url:"findPushCashForEmployeeId"});
	$.extend($('#list').getGridParam('postData'),  {"employeeId":id} ); 
    $("#list").trigger("reloadGrid");
}
</script>

</head>

<body>

<div class="myBox01">
<div class="myBox02">
<div class="HR_yidongweihu_Bottom myBox03">

<div class="HR_lishijixiaoContent jixiaoContent">
	<div class="M_left">
   		<dl class="year">
   		<c:forEach items="${employeeInfos}" var="employeeInfos">
   			<dd><a onclick="showPushForEmployee(${employeeInfos.employeeId});" style="cursor: pointer;">${employeeInfos.userName}</a></dd>
   		</c:forEach>
        </dl>
    </div>
	<div class="right">
        <div class="font_ul">        	
                 <div id="gridContainer">
					<table id="list"></table>
				</div> 
        </div>
    </div>
</div>
</div>
</div>
</div>
<div id="zzjs_zzjs2" style="padding:20px 20px 0 20px; display:none;">

<div class="HR_lishijixiao">
</div>
<div class="HR_lishijixiaoR"><input type="button" class="HR_SearchR_DY29" /><input type="button" class="HR_SearchR_BC29" /><input type="button" class="HR_SearchR_FX29" /></div></form>
</div>
</body>
</html>
