<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link href="js/page/page.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script type="text/javascript">
var type='',last;
//var types = ${types};
//for(var i=0;i<types.length;i++){
//	type = type.concat(types[i].typeId, ":", types[i].typeName, ";");
//}
var status = "0:废弃;1:正常;";
var lev = "1:难;2:普通;3:易;";
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"findQuestionLibraryByPaperId?paperId=${paper.paperId}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','编号','题干', '题目类别','分数','难易程度','创建日期','状态'],
			colModel: [{name:'detailId',hidden:true,key:true,editable:true},
				   		{name:'questionNum',width:115},
				   		{name:'questionContent'},
				   		{name:'typeId',width:80,align:'center',formatter:'select',edittype:'select',editoptions:{value:type}},
						{name:'questionPoints',align:'center',width:50,editable:true,editoptions:{maxlength:"3"},editrules:{integer:true,maxValue:100}},
						{name:'levelId',width:70,align:'center',formatter:'select',edittype:'select',editoptions:{value:lev}},
						{name:'createTime',align:'center'},
						{name:'questionStatus',width:50,align:'center',formatter:'select',edittype:'select',editoptions:{value:status}}],
			jsonReader:{
				root: 'rows',
				repeatitems: false
			},
			pager: '#pageList',
			height:478,
			width:666,
			hidegrid: true,
			viewrecords: true,
			rowNum:19,
		});
		
		$("#activitylist").jqGrid({
			url:"findQuestionTestByPaperId?paperId=${paper.paperId}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','编号','调查名称', '调查类型','联络人','发起负责人','发起部门','发出时间','调查描述','调查状态','创建时间'],
			colModel: [{name:'testId',hidden:true,key:true},
				   		{name:'testNum',width:125},
				   		{name:'testName'},
				   		{name:'typeId'},
						{name:'contactUserName'},
						{name:'testInitiator'},
						{name:'initiateDeptId'},
						{name:'publishTime'},
						{name:'testDesc'},
						{name:'testStatus'},
						{name:'createTime'}],
			jsonReader:{
				root: 'rows',
				repeatitems: false
			},
			pager: '#activitypageList',
			height:495,
			width:666,
			hidegrid: true,
			viewrecords: true,
			rowNum:19,
		});
	});
  function clickEvent(key){
	switch (key) {
	case 1:
		$("#model_1").css("display","block");
		$("#model_2").css("display","none");
		$("#model_3").css("display","none");
		break;
     case 2:
    	$("#model_1").css("display","none");
 		$("#model_2").css("display","block");
 		$("#model_3").css("display","none");
		break;
     case 3:
    	$("#model_1").css("display","none");
  		$("#model_2").css("display","none");
  		$("#model_3").css("display","block");
 		break;
	default:
		$("#model_1").css("display","none");
		$("#model_2").css("display","none");
		$("#model_3").css("display","block");
		break;
	}
  }
  function method(type){
	 if(type==1){
		 $("#gridContainer").css("display","");
		 $("#wdfs").css("display","none");
		 $("#span_a1").css("border","none");
		 $("#span_a2").css("border-bottom","1px solid #D24523");
	 }
	 if(type==2){
		 $("#gridContainer").css("display","none");
		 $("#wdfs").css("display","");
		 $("#span_a2").css("border","none");
		 $("#span_a1").css("border-bottom","1px solid #D24523");
	 }
  }
</script>
</head>
<body>
<div class="HR_yidongweihu_Bottom myBox03">
 <div class="HR_lishijixiaoContent jixiaoContent">
	<div class="H_left" style="height:550px">
		<ul class="ul_tittle">
			<li><a href="javascript:clickEvent(1)"style="cursor: pointer;"><span class="aa"></span>活动问卷详情</a></li>
			<li><a href="javascript:clickEvent(2)" style="cursor: pointer;"><span class="aa"></span>活动题目详情</a></li>
			<li><a href="javascript:clickEvent(3)" style="cursor: pointer;"><span class="aa"></span>关联调查活动</a></li>
		</ul>
	</div>
	<div class="H_right">
		<div class="HR_huodongdiaochaC" style="padding: 0 10px;">
			<div id="model_1">
				<h4>活动问卷详情</h4>
				<div class="HR_piliangTianjialishi">
				问卷名称：<input style="width:170px;" value="${paper.paperName }"/>
				问卷编号：<input style="width:153px;" value="${paper.paperNum }"/></div>
				<div class="HR_piliangTianjialishi">
				问卷分类：<input style="width:170px;" value="${paper.typeId }"/>
				</div>
				<div class="HR_Tianjia_Casual">
				问卷说明：<textarea style="width:400px;" name="" cols="" rows="">${paper.paperDesc }</textarea>
				</div>
			</div>
			<div id="model_2" style="display:none;width: 630px;">
	        	问卷关联题目详情<br/>
	        	<div style="margin-top:2px;text-align: right;">
	        		<span id="span_a1"><a href="javascript:method(1)" style="color:#D24523">列表方式</a></span>&nbsp;&nbsp;
					<span id="span_a2" style="border-bottom: 1px solid #D24523"><a href="javascript:method(2)" style="color:#D24523">答题方式</a></span>
				</div>
				<div id="gridContainer" style="margin-top:5px;">
					<table id="list"></table>
					<div id="pageList"></div>
				</div>
				<div id="wdfs" style="display: none">
				
				<div class="tm" style="padding-left:30px;">
					<c:forEach items="${librarys }" var="li" varStatus="n">
						<c:if test="${li.questionType==1 }">
				      	<br/>
				         <dl>
				            <dt style="font-size:14px;margin-bottom: 5px;">${n.count }. ${li.questionContent}</dt>
				            <c:if test="${li.answer !=null || li.answer == ''}">
				            	<dd ><input type="radio" name="${li.questionNum }" ${li.isRight==1?'checked':'' } />&nbsp;&nbsp; xx ${li.answer}</dd>
				            </c:if>
				            <c:if test="${li.answer2 !=null || li.answer2==''}">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight2==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer2}</dd>
				            </c:if>
				            <c:if test="${li.answer3 !=null || li.answer3 == ''}">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight3==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer3}</dd>
				            </c:if>
				            <c:if test="${li.answer4 !=null || li.answer4 == ''}">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight4==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer4}</dd>
				            </c:if>
				            <c:if test="${li.answer5 !=null || li.answer5 == ''}">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight5==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer5}</dd>
				            </c:if>
				            <c:if test="${li.answer6 !=null || li.answer6 == ''}">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight6==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer6}</dd>
				            </c:if>
				            <c:if test="${li.answer7 !=null || li.answer7=='' }">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight7==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer7}</dd>
				            </c:if>
				            <c:if test="${li.answer8 !=null || li.answer8 == ''}">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight8==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer8}</dd>
				            </c:if>
				            <c:if test="${li.answer9 !=null || li.answer9 == ''}">
				            	<dd><input type="radio" name="${li.questionNum }" ${li.isRight9==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer9}</dd>
				            </c:if>
				         </dl>
				         <br/>
				         </c:if>
				         <c:if test="${li.questionType==2 }">
				      	 <br/>
				         <dl>
				            <dt style="font-size:14px;margin-bottom: 5px;">${n.count }. ${li.questionContent}</dt>
				            <c:if test="${li.answer !=null || li.answer == ''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight==1?'checked':'' } />&nbsp;&nbsp;xx ${li.answer}</dd>
				            </c:if>
				            <c:if test="${li.answer2 !=null || li.answer2==''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight2==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer2}</dd>
				            </c:if>
				            <c:if test="${li.answer3 !=null || li.answer3 == ''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight3==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer3}</dd>
				            </c:if>
				            <c:if test="${li.answer4 !=null || li.answer4 == ''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight4==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer4}</dd>
				            </c:if>
				            <c:if test="${li.answer5 !=null || li.answer5 == ''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight5==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer5}</dd>
				            </c:if>
				            <c:if test="${li.answer6 !=null || li.answer6 == ''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight6==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer6}</dd>
				            </c:if>
				            <c:if test="${li.answer7 !=null || li.answer7=='' }">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight7==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer7}</dd>
				            </c:if>
				            <c:if test="${li.answer8 !=null || li.answer8 == ''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight8==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer8}</dd>
				            </c:if>
				            <c:if test="${li.answer9 !=null || li.answer9 == ''}">
				            	<dd><input type="checkbox" name="${li.questionNum }" ${li.isRight9==1?'checked':'' }/>&nbsp;&nbsp; ${li.answer9}</dd>
				            </c:if>
				         </dl>
				         <br/>
				         </c:if>
				          <c:if test="${li.questionType==3 }">
				             <br/>
					         <dl>
					            <dt style="font-size:14px;margin-bottom: 5px;">${n.count }. ${li.questionContent}</dt>
					            <dd>${li.answer}</dd>
					         </dl>
					         <br/>
				         </c:if>
				         <div style="margin-top:3px;border-bottom: 1px solid #D8E9F4;"></div>
			         </c:forEach>
			   </div>
				
				</div>
	        </div>
            <div id="model_3" style="display: none;">
				关联调查活动
				<div id="gridContainer" style="margin-top:5px;">
					<table id="activitylist"></table>
					<div id="activitypageList"></div>
				</div>
			</div>
        </div>
	</div>
  </div>
</div>
</body>
</html>
