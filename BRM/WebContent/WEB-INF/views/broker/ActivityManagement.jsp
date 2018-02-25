<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript" src="js/common.js"></script>
<style>
	.ask_add tr {height:30px;font-size:13px;}
	#list{font-size:13px;}
	.ui-jqgrid-sortable{font-size:13px;font-weight: normal;}
</style>
<script>
	function showHtml(src,w,h){
		parent.showFrame('XX活动调查统计窗口',src,w,h);
	}
	
	function showHtml2(title,src,w,h){
		parent.showFrame(title,src,w,h);
	}
</script>
<script>
	var type='';
	var types = ${questionType};
	for(var i=0;i<types.length;i++){
		type = type.concat(types[i].typeId, ":", types[i].typeName, ";");
	}
	/* 转换状态 */
	var questionStatus ="0:未开始;1:进行中;2:已完成;3:终止;4:删除;";
	$(document).ready(function(){
		var n=${testStatus};
		$("#list").jqGrid({
			url:"getQuestionTest?testStatus="+n,
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','编号','调查名称', '调查类型','联络人','发起负责人','发起部门','发出时间','调查描述','调查状态','创建时间'],
			colModel: [{name:'testId',hidden:true,key:true},
				   		{name:'testNum',width:125},
				   		{name:'testName'},
				   		{name:'typeId',formatter:'select',edittype:'select',editoptions:{value:type}},
						{name:'contactUserName'},
						{name:'testInitiator'},
						{name:'initiateDeptName'},
						{name:'publishTime'},
						{name:'testDesc'},
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
	function release(){
		var row=$("#list").jqGrid('getGridParam','selarrrow');
		if(row ==''){
			alert('请选中要发布的数据');
		}
		else{
			if(row.length>1){
				alert('一次只能发布一个活动，请重新选择！');
			}
			else{
				showHtml2('发布调查活动窗口','ReleaseActivity?testId='+row,'',200,250);
				//$("#list").trigger("reloadGrid");
			}
		}
	}
	function add(){
		/* var v = window.showModalDialog('questionTestPage','','dialogWidth=430px;dialogHeight=535px');
		if(v == 'suc'){
			$("#list").trigger("reloadGrid");
		} */
		
		showHtml2("创建调查活动","questionTestPage?trainTaskId=0",430,410);
	}
	function seachForm() {
		$.extend($('#list').getGridParam('postData'), $('#searchForm').getForm());
		$('#list').trigger("reloadGrid", [{page:1}]); 
	}
	function edit(){
		var row=$("#list").jqGrid('getGridParam','selarrrow');
		if(row ==''){
			alert('请选中要修改的数据');
			return
		}
		var v = window.showModalDialog('getQuestionTestByTestNum?testId='+row,'','dialogWidth=430px;dialogHeight=535px');
		if(v == 'suc'){
			$("#list").trigger("reloadGrid");
		}
	}
	function delRows() {
			var rows=$("#list").jqGrid('getGridParam','selarrrow');
			if(rows ==''){
				alert('请选中要删除的活动');
				return
			}
			if (window.confirm("确定要删除吗？只有未开始的活动才能被删除！")){
				var newRows = '',n = 0;
				for(var i=0;i<rows.length;i++){
					var sr = rows[i];
					var a = $("#list").getRowData(sr)['testStatus'];
						if(a > 0){
							n++;
						}else{
							newRows += sr + ",";	
						}
				}
				newRows = newRows.substring(0,newRows.length-1);
				/* alert(n + '条数据不能删除'); */
				if(n==rows.length)
					return
					else{
					$.ajax({
						url:'updateTestStatusByTestNum',
						type:"post",
						dataType:"json",
						data: "testId="+newRows+"&testStatus=4",
						success: function(){
							 window.returnValue='suc';
							 alert('删除成功!');
							 $("#list").trigger("reloadGrid");
						 },
						 error:function(msg){
						 }
					});
				}
		} 
	}
	
	function stopQuestionTest(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows ==''){
			alert('请选中要终止的活动');
			return
		}
		if (window.confirm("确定要终止吗？只有进行中的活动才能被终止！")){
			var newRows = '',n = 0;
			for(var i=0;i<rows.length;i++){
				var sr = rows[i];
				var a = $("#list").getRowData(sr)['testStatus'];
					if(a != 1){
						n++;
					}else{
						newRows += sr + ",";	
					}
			}
			newRows = newRows.substring(0,newRows.length-1);
			/* alert(n + '条数据不能终止'); */
			if(n==rows.length)
				return
				else{
				$.ajax({
					url:'updateTestStatusByTestNum',
					type:"post",
					dataType:"json",
					data: "testId="+newRows+"&testStatus=3",
					success: function(){
						 window.returnValue='suc';
						 alert('终止成功!');
						 $("#list").trigger("reloadGrid");
					 },
					 error:function(msg){
					 }
				});
			}
		} 
	}
	
	
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
</head>
<body>
<div class="right1">
		<form id="searchForm">
        <div class="R_top">
        	<ul class="s_font">
            	<li>截止日期  从 <input class="Wdate" type="text" style="width:100px" name="testStartTime" onClick="WdatePicker({readOnly:'true'})"/> 到
            	 <input class="Wdate" type="text" style="width:100px" name="testEndTime" onClick="WdatePicker({readOnly:'true'})"/></li>
                <li>发起部门:<select style="height:22px;" name="initiateDeptName">
                		<option></option>
                	</select>
                </li>
                <li>
                	发起负责人:<select style="height:22px;" name="testInitiator">
                		<option ></option>
                	</select>
                </li>
                <li>
                	联络人:<select style="height:22px;" name="contactUserName">
                		<option></option>
                	</select>
                </li>
                <li>调查活动名称：</li>
                <li><input type="text" name="testName" style="width:80px;height:20px;_border:medium none;"/></li>
                <li><input type="button" class="seach_but" style="cursor: pointer;" onclick="seachForm()"/></li>
            </ul>
        </div>
            
            <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                     <li><input type="button" class="fbdc_but" onclick="parent.popupPostSelector()"/></li>
                     <li><input type="button" class="fbdc_but" onclick="release()"/></li>
                     <li><input type="button" class="cjdc_but" style="cursor: pointer;" onclick="add()"/></li>
                   <!--<li><input type="button" value="修改" class="but1" /></li>-->
                     <li><input type="button" value="修改" class="but1" /></li>               
                    <li><input type="button" value="删除" class="but1" style="cursor: pointer;" onclick="delRows()"/></li>
					<li><input type="button" value="详情查看" class="but1" onclick="selectUpdate()"/></li>
                   <!--<li><input type="button" value="发布" class="but1" onclick="javascript:location.href='Tianjiadiaochahuodong1.html';return false;"/></li>-->
                    <li><input type="button" value="终止调查活动" class="but1" onclick ="stopQuestionTest()"/></li>
                    <li><input type="button" value="参与调查活动" class="but1" onclick="questionnaireTest()" /></li>
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but" onclick ="sendCommonEmail('list','调查活动列表','typeId:0:未开始:1:进行中:2:已完成:3:终止:4:删除|testStatus:0:创建:1:发布:2:完成:3:终止:4:删除')"/></li>
                    <li><input type="button" class="fx_but"/></li>
            	 </ul> 
          </div> 
          </form>
    <div id="gridContainer">
		<table id="list"></table>
		<div id="pageList"></div>
	</div>
</div>
</body>
</html>