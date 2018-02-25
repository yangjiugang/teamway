<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人首页</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var type="";
$(document).ready(function(){
	var types = ${libTypes};
	for(var i=0;i<types.length;i++){
		type = type.concat(types[i].typeId, ":", types[i].typeName, ";");
	}
	$("#list").jqGrid({
		url:"findTrainingScheduleByTaskId?taskId=${task.taskId}",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','课程名称','讲师', '开始时间','结束时间'],
		colModel: [{name:'scheduleId',hidden:true,key:true},
			   		{name:'courseName',width:125},
			   		{name:'teacher'},
					{name:'scheduleStartTime'},
					{name:'scheduleEndTime'}],
		jsonReader:{
			root: 'rows',
			repeatitems: false
		},
		pager: '#pageList',
		height:510,
		autowidth: true,
		hidegrid: true,
		viewrecords: true,
		});
	
	$("#list1").jqGrid({
		url:"findTrainingUsers?taskId=${task.taskId}",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','员工编号','姓名','部门','岗位','接受培训日期','培训评价','培训反馈','培训成绩'],
		colModel: [{name:'id',hidden:true,key:true},
			   		{name:'employeeNum',align:'center'},
			   		{name:'userName',align:'center'},
			   		{name:'organizationName'},
			   		{name:'postName'},
			   		{name:'trainingSignInTime'},
			   		{name:'trainingEstimate'},
			   		{name:'trainingSummarize'},
					{name:'examResults'}],
		jsonReader:{
			root: 'rows',
			repeatitems: false
		},
		pager: '#pageList1',
		height:510,
		width: 630,
		hidegrid: true,
		viewrecords: true,
		});
	
	$("#list2").jqGrid({
		url:"findQuestionLibraryByPaperId?paperId=${paper.paperId}",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','编号','题干', '题目类别','分数','难易程度','创建日期','状态'],
		colModel: [{name:'detailId',hidden:true,key:true,editable:true},
			   		{name:'questionNum',width:100},
			   		{name:'questionContent'},
			   		{name:'typeId',width:80,align:'center',formatter:'select',edittype:'select',editoptions:{value:type}},
					{name:'questionPoints',align:'center',width:50,editable:false},
					{name:'levelId',width:70,align:'center',formatter:'select',edittype:'select',editoptions:{value:'1:难;2:普通;3:易;'}},
					{name:'createTime',align:'center'},
					{name:'questionStatus',width:50,align:'center',formatter:'select',edittype:'select',editoptions:{value:'0:废弃;1:正常;'}}],
		jsonReader:{
			root: 'rows',
			repeatitems: false
		},
		pager: '#pageList2',
		height:375,
		width: 630,
		hidegrid: true,
		viewrecords: true,
		});
	});
	function change(n){
		for(var i=1;i<=5;i++){
			if(i==n){
				$("#div"+i).css("display","");	
			}else{
				$("#div"+i).css("display","none");
			}
		}
	}
</script>
</head>
<body>
<div class="HR_yidongweihu_Bottom myBox03">
<div class="HR_lishijixiaoContent jixiaoContent">
	<div class="H_left" style="height:560px;">
   		<ul class="ul_tittle">
        	<li><span class="aa"></span><a href="javascript:change(1)">培训基本情况</a></li>
            <li><span class="aa"></span><a href="javascript:change(2)">培训课程安排</a></li>
            <li><span class="aa"></span><a href="javascript:change(3)">受训人员</a></li>
            <li><span class="aa"></span><a href="javascript:change(4)">培训调查问卷</a></li>
            <li><span class="aa"></span><a href="javascript:change(5)">活动效果分析</a></li>
        </ul>
    </div>
<div class="H_right">
<div class="HR_huodongdiaochaC">
<div id="div1">
<h4>培训基本情况</h4>
<div class="HR_piliangTianjialishi">
培训活动名称：<input style="width:170px;" value="${task.taskName }" />
培训活动编号：<input style="width:153px;" value ="${task.taskNum }"/></div>
<div class="HR_piliangTianjialishi">
培训活动类型：
	<select style="width: 170px;height: 20px;">
		<c:forEach items="${types }" var="type">
			<c:if test="${type.typeId==task.trainingContentTypeId }">
				<option value="${type.typeId }">${type.typeName }</option>
			</c:if>
		</c:forEach>
	</select>
&nbsp;&nbsp;培训活动状态：
<c:if test="${task.taskStatus == 0 }">
	<input style="width:153px;" value="取消" />
</c:if>
<c:if test="${task.taskStatus == 1 }">
	<input style="width:153px;" value="进行中" />
</c:if>
<c:if test="${task.taskStatus == 2 }">
	<input style="width:153px;" value="已完成" />
</c:if>
<c:if test="${task.taskStatus == 3 }">
	<input style="width:153px;" value="取消" />
</c:if>
</div>

<div class="HR_piliangTianjialishi">
培训活动发起部门：<input style="width:147px;" value="${task.organizationalUnit }" />
培训活动发起人：<input style="width:138px;" value="${task.sponsor }"/></div>
<div class="HR_piliangTianjialishi">
培训活动联络人：<input style="width:159px;" value = "${task.contactPersonName }"/>
培训活动参与人数：<input style="width:130px;" value = "${task.planEmployees }"/></div>

<div class="HR_piliangTianjialishi">
培训活动开始时间：<input style="width:147px;" value="<fmt:formatDate type="date" value="${task.trainingStartTime }" />" />
培训活动截止时间：<input style="width:128px;" value = "<fmt:formatDate type="date" value="${task.trainingEndTime }" />" /></div>
<div class="HR_Tianjia_Casual">注意事项：
<textarea style="width:400px;" cols="" rows="">${task.trainingDesc }</textarea></div>
</div>
<div id="div2" style="display: none;">
<div style="margin-bottom: 3px;">培训课程安排</div>
<div id="gridContainer">
	<table id="list"></table>
	<div id="pageList"></div>
</div>
</div>
<div id="div3" style="display: none;">
<div style="margin-bottom: 3px;">受训人员</div>
<div id="gridContainer1" style="width:500px;">
	<table id="list1"></table>
	<div id="pageList1"></div>
</div>
</div>


<div id="div4" style="display: none;">
<h4 >培训调查问卷</h4>
<div class="HR_piliangTianjialishi">
问卷名称：<input style="width:170px;" value="${paper.paperName }"/>
问卷编号：<input style="width:153px;" value="${paper.paperNum }"/></div>
<div class="HR_piliangTianjialishi">
问卷分类：<input style="width:170px;" value="${paper.typeId }"/>
<div class="HR_Tianjia_Casual">问卷说明：<textarea style="width:400px;" name="" cols="" rows="">${paper.paperDesc }</textarea></div>
</div>
<div id="gridContainer2" style="width:500px;margin-top:5px;">
	<table id="list2"></table>
	<div id="pageList2"></div>
</div>
</div>

<div id="div5" style="display: none;">
<h4 style="margin-top:30px;">活动效果分析</h4>
<ul class="HR_huodongContent">
<li><img src="images/u51_original.gif" /><br />活动参与情况</li>
<li><img src="images/u51_original.gif" /><br />活动统计情况</li>
</ul>
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

<div class="HR_lishijixiaoContent">
</div>

</body>
</html>