<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
    <%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>今日培训</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
	/* 转换状态 */
	$(document).ready(function(){
		$("#list").jqGrid({
			url:"homepage_todayTrainingAjax",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','培训活动编号','培训活动名称', '发起部门','培训类型','讲师','计划学员人数','时间','地点'],
			colModel: [{name:'taskId',hidden:true,key:true},
				   		{name:'taskNum',width:125},
				   		{name:'taskName'},
				   		{name:'organizationalUnit'},
						{name:'tct.typeName'},
						{name:'ts.teacher'},
						{name:'planEmployees'},
						{name:'ts.scheduleStartTime'},
						{name:'taskPlace'}],
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
function detail(){
	var rows=$("#list").jqGrid('getGridParam','selarrrow');
	if(rows==''){alert('请选择要查看的记录');return;}
	if(rows.length > 1){
		alert("只能选择一条数据查看!");return;
	}
	parent.ShowIframe("培训活动统计",'findTrainTaskDetail?taskId='+rows,780,620);
}

function questionnaireTest(){
	var rows=$("#list").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('请选中您要进行操作的数据！！！');
	}else{
		if (rows.length>1) {
			alert('只能选择一条数据！！！请重新选择！！！');
		} else {
			
			$.fc.ajaxSubmit({
				url:'${pageContext.request.contextPath}/homepage_todayTrainingAjax2',
				dataType:'json',
				data:"taskId="+rows,
				callBackFn:function(msg){
					if(msg!=0){
						$.fc.ajaxSubmit({
							url:'${pageContext.request.contextPath}/broker_surveyActivityDetails',
							dataType:'json',
							data:"rows="+msg,
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
					}else{
						alert("培训还未评估！！");	
					}
                    					
				}
			});
		}
	}
}


</script>
</head>

<body>
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
                    <authz:authorize ifAllGranted="FUNC_AUTH_HOM_07_01"><li><input type="button" value="查看" class="but1" onclick="detail();" /></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_HOM_07_02"><li><input type="button" value="参与培训评估" class="but1" onclick="questionnaireTest();" /></li></authz:authorize>
                    
                    <li><input type="button" class="dy_but" /></li>
                  <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
   	  </ul> 
   	  </div>
   	  
   	  <div class="font_ul">
        	<p class="Number">共：<font>${todayTrainingCount }</font> 条</p>
      </div>  	
   	  
   	   <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	  </div>
        
    </div>
    
<!--end中间-->
</body>
</html>
