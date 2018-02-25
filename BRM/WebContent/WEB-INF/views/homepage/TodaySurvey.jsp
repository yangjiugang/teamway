<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
    <%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>今日调查</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
	function showHtml(src,w,h){
		parent.showFrame('活动调查统计窗口',src,w,h);
	}
	
	function showHtml2(title,src,w,h){
		parent.showFrame(title,src,w,h);
	}
</script>
<script type="text/javascript">
function selectUpdate(){
	var rows=$("#list").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('请选中您要查看详情的活动！！！');
	}else{
		if (rows.length>1) {
			alert('只能选择一个活动！！！请重新选择！！！');
		} else {
			showHtml('broker_activitySurveyStatistics?rows='+rows,800,700);
		}
	}
	
} 

function questionnaireTest(){
	var rows=$("#list").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('请选中您要进行问卷考试的活动！！！');
	}else{
		if (rows.length>1) {
			alert('只能选择一个活动！！！请重新选择！！！');
		} else {
			$.fc.ajaxSubmit({
				url:'${pageContext.request.contextPath}/broker_surveyActivityDetails',
				dataType:'json',
				data:"rows="+rows,
				callBackFn:function(msg){
					if(msg!=null){
						if((msg.testEndTime)<=(new Date().getTime())){
							 alert("调查活动已结束！不能参与！");
						}else{
							if(msg.testStatus==0){
								alert("调查活动还未发布！不能参与！");
							}else if(msg.testStatus==1){
								if(msg.qpe!=null){
									if(msg.qpe.isSubmit==1){
										alert("你已经参与调查！不能再参与！");
									}else{
										javascript:location.href='broker_questionnaireTest?rows='+rows;
									}
								}else{
									alert("系统出现异常，请稍后再试！");
								}
							}else if(msg.testStatus==2){
								alert("调查活动也结束！不能再参与！");
							}else if(msg.testStatus==3){
								alert("调查活动已终止！不能再参与！");
							}else if(msg.testStatus==4){
								alert("调查活动已删除！不能再参与！");
							}
						}
					}else{
						alert("系统出现异常，请稍后再试！");
					} 
				}
			});
		}
	}
}

</script>

<script type="text/javascript">
    var questionStatus ="0:未开始;1:进行中;2:已完成;3:终止;4:删除;";
    var method="0:内部匿名;1:内部实名 ;2:外部调查 ;";
	/* 转换状态 */
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"homepage_todaySurveyAjax",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','编号','活动名称', '调查类型','调查方式','联络人','发起负责人','发起部门','发出时间','截止时间','答题时长','答题有效数','活动状态','创建时间'],
			colModel: [{name:'testId',hidden:true,key:true},
				   		{name:'testNum',width:125},
				   		{name:'testName'},
				   		{name:'questionTestType.typeName'},
						{name:'testMethod',formatter:'select',edittype:'select',editoptions:{value:method}},
						{name:'contactUserName'},
						{name:'testInitiator'},
						{name:'initiateDeptName'},
						{name:'testStartTime'},
						{name:'testEndTime'},
						{name:'testDuration'},
						{name:'testEnableCnt'},
						{name:'testStatus',formatter:'select',edittype:'select',editoptions:{value:questionStatus}},
						{name:'createTime'}],
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
  					<authz:authorize ifAllGranted="FUNC_AUTH_HOM_08_01"><li><input type="button" value="查看" class="but1" onclick="selectUpdate();" /></li></authz:authorize>
                <authz:authorize ifAllGranted="FUNC_AUTH_HOM_08_02"><li><input type="button" value="参与调查活动" class="but1" onclick="questionnaireTest();" /></li></authz:authorize>
                    
                    <li><input type="button" class="dy_but" /></li>
                  <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
   	  </ul> 
   	  </div>
   	  
   	  <div class="font_ul">
        	<p class="Number">共：<font>${todaySurveyCount }</font> 条</p>
      </div>  	
   	  
   	   <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	  </div>
        
    </div>
    
<!--end中间-->
</body>
</html>
