<%@page import="java.io.PrintWriter"%>
<%@page import="com.fc.brms.common.util.ChartUtil"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>XX活动调查统计窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link href="js/page/page.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/date/WdatePicker.js"></script>
<script type="text/javascript">
	
	function date2str(x,y) {
		 var z = {M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
		 y = y.replace(/(M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-2)});
		 return y.replace(/(y+)/g,function(v) {return x.getFullYear().toString().slice(-v.length)});
	}
	$(document).ready(function(){
		clickEvent(1);
	});
</script>

<script type="text/javascript">
  var paperId=${questionTest.paperId};
  var testId=${questionTest.testId };
  function clickEvent(key){
	switch (key) {
	case 1:
		$("#model_1").css("display","block");
		$("#model_2").css("display","none");
		$("#model_3").css("display","none");
		$("#model_4").css("display","none");
		break;
     case 2:
    	$("#model_1").css("display","none");
 		$("#model_2").css("display","block");
 		$("#model_3").css("display","none");
 		$("#model_4").css("display","none");
 		questionLibraryPage(1,10);
		break;
     case 3:
    	$("#model_1").css("display","none");
  		$("#model_2").css("display","none");
  		$("#model_3").css("display","block");
  		$("#model_4").css("display","none");
  		employeeInfoPage(1,10);
 		break;
	default:
		$("#model_1").css("display","none");
		$("#model_2").css("display","none");
		$("#model_3").css("display","none");
		$("#model_4").css("display","block");
		break;
	}
  }
  
	function questionLibraryPage(curPage, pageSize){
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/broker_questionLibrary',
			dataType:'json',
			data:"page="+curPage+"&rows="+pageSize+"&paperId="+paperId,
			callBackFn:function(msg){
				if(msg.datas!=""){
					$("#subject_1").css("display","none");
					$("#subject_1_1").empty();
					for(var i=0;i<msg.datas.length;i++){
						 $("#subject_1_1").append("<ul class='HR_hddc10B'><li>"+msg.datas[i].questionNum+"</li>"
								+"<li style='width: 20%;'>"+msg.datas[i].questionContent+"</li>"
								+"<li>"+typeName(msg.datas[i].questionType)+"</li><li>"+msg.datas[i].questionTypeClass.typeName+"</li>"
								+"<li>"+msg.datas[i].questionPoints+"</li><li>"+msg.datas[i].questionLevel.levelName+"</li>"
								+"<li>"+date2str(new Date(msg.datas[i].createTime),"yyyy-MM-dd")+"</li>"
								+"<li>"+status(msg.datas[i].questionStatus)+"</li></ul>"); 
					}	
					$("#questionLibraryPage").pager({curPage:msg.page, pageSize:pageSize, pageCount:msg.total, goPageCall:questionLibraryPage});
				}else{
					$("#subject").css("display","none");
	 				$("#subject_1").css("display","block");
				}	
			}
		});
	}
	
	function employeeInfoPage(curPage, pageSize){
		var userName=$("#userName").val();
		var departmentName=$("#departmentName").val();
		var smallScore=$("#score").val();
		var bigScore=$("#score1").val();
		var smallTime=$("#smallTime").val();
		var bigTime=$("#bigTime").val();
		 $.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/broker_findEmployInfo',
			dataType:'json',
			data:"page="+curPage+"&rows="+pageSize+"&testId="+testId+"&userName="+userName+"&organizationName="+departmentName+"&smallScore="+smallScore+"&bigScore="+bigScore+"&smallTime="+smallTime+"&bigTime="+bigTime,
			callBackFn:function(msg){
				 if(msg.datas!=""){
					$("#employeeInfo1").css("display","none");
					$("#employeeInfo_1").empty();
					for(var i=0;i<msg.datas.length;i++){
						$("#employeeInfo_1").append(
								"<ul class='HR_hddcGL10B'><li style='width: 14%;'>"+msg.datas[i].employeeNum+"</li><li style='width: 20%;'>"+msg.datas[i].userName+"</li>"
								+"<li>"+msg.datas[i].postName+"</li><li style='width: 14%;'>"+msg.datas[i].organizationName+"</li>"
								+"<li>"+date2str(new Date(msg.datas[i].submitTime),"yyyy-MM-dd hh:mm")+"</li>"
								+"<li>"+msg.datas[i].score+"</li><li>"+isSubmit(msg.datas[i].isSubmit)+"</li></ul>"
						);	 
					}	 
					$("#infoPage").pager({curPage:msg.page, pageSize:pageSize, pageCount:msg.total, goPageCall:questionLibraryPage});
				}else{
					$("#employeeInfo").css("display","none");
	 				$("#employeeInfo1").css("display","block");
				}	 
			}
		});
	}
    
	function search(){
		if(fairlyDate()!=false){
			var bigScore=$("#score1").val();
			var smallScore=$("#score").val();
			if(isNum(smallScore)!=false && isNum(bigScore)!=false){
				if (bigScore.length!=0&&smallScore.length!=0) {
					if (bigScore<smallScore) {
						alert("开始分数不能大于结束分数！");
					}else{
						employeeInfoPage(1,10);
					}
				}else{
					employeeInfoPage(1,10);	
				}
				
			}
		}
	}
</script>

<script type="text/javascript">
      //时间作比较   
	function toDate(str){
	    var sd=str.split("-");
	    return new Date(sd[0],sd[1],sd[2]);
	}
	
	function fairlyDate(){
		var date1=$("#testStartTime").val();
		var date2=$("#testEndTime").val();
		var d1=toDate(date1);
		var d2=toDate(date2);
		if(d1>d2){
			alert("时间输入有误！起止时间不能大于终止时间！");
			return false;
		}		
	}

	
	function typeName(typeName){
		var questionTypeName="";
		switch (typeName) {
		case 1:
			questionTypeName="单选";
			break;
	     case 2:
	    	 questionTypeName="多选";
			break;
		default:
			questionTypeName="问答";
			break;
		}
		return questionTypeName;
	}
	
	function status(sta){
		var status="";
		switch (sta) {
		case 0:
			status="删除/废弃";
			break;
	    default:
	    	status="正常";
			break;
		}
		return status;
	}
	
	function isSubmit(sta){
		var status="";
		switch (sta) {
		case 0:
			status="未交卷";
			break;
	    default:
	    	status="已交卷";
			break;
		}
		return status;
	}
	
	function isNum(val){
		if (isNaN(val)) {
			alert("请输入数字!分数只能是数字！");
			return false;
		}
	}
	
</script>
</head>
<body>

				<div class="HR_yidongweihu_Bottom myBox03">
					<div class="HR_lishijixiaoContent jixiaoContent">
						<div class="H_left">
							<ul class="ul_tittle">
								<li><a onclick="clickEvent(1)" style="cursor: pointer;"><span class="aa"></span>活动基本情况</a></li>
								<li><a onclick="clickEvent(2)" style="cursor: pointer;"><span class="aa"></span>活动问卷详情</a></li>
								<li><a onclick="clickEvent(3)" style="cursor: pointer;"><span class="aa"></span>参与对象详情</a></li>
								<li><a onclick="clickEvent(4)" style="cursor: pointer;"><span class="aa"></span>活动统计</a></li>
							</ul>
						</div>
						<div class="H_right">
							<div class="HR_huodongdiaochaC">
							
							 <div id="model_1">
								<h4>活动基本情况</h4>
								<div class="HR_piliangTianjialishi">
									活动名称：<input style="width: 170px;" value="${questionTest.testName }"/>活动编号：<input
										style="width: 153px;" value="${questionTest.testNum }"/>
								</div>
								<div class="HR_piliangTianjialishi">
									活动类型：<input style="width: 170px;" value="${questionTest.questionTestType.typeName }"/>
									<c:if test="${questionTest.testStatus==0 }">
									        活动状态：<input style="width: 153px;" value="创建" />
									</c:if>
									<c:if test="${questionTest.testStatus==1 }">
									        活动状态：<input style="width: 153px;" value="发布" />
									</c:if>
									<c:if test="${questionTest.testStatus==2 }">
									        活动状态：<input style="width: 153px;" value="完成" />
									</c:if>
									<c:if test="${questionTest.testStatus==3 }">
									        活动状态：<input style="width: 153px;" value="终止" />
									</c:if>
									<c:if test="${questionTest.testStatus==4 }">
									        活动状态：<input style="width: 153px;" value="删除 " />
									</c:if>
								</div>
								<div class="HR_piliangTianjialishi">
									活动发起部门：<input style="width: 147px;" value="${questionTest.initiateDeptName }" />活动发起人：<input
										style="width: 138px;"  value="${questionTest.testInitiator }"/>
								</div>
								<div class="HR_piliangTianjialishi">
									活动联络人：<input style="width: 159px;"  value="${questionTest.contactUserName }"/>活动参与人数：<input
										style="width: 130px;"  value="${questionTest.testUserCnt }"/>
								</div>
								<div class="HR_piliangTianjialishi">
									答题有效数：<input style="width: 159px;"  value="${questionTest.testEnableCnt }"/>答题时长：<input
										style="width: 153px;"  value="${questionTest.testDuration }分钟"/>
								</div>
								<div class="HR_piliangTianjialishi">
									活动开始时间：<input style="width: 147px;"  value="<fmt:formatDate value='${questionTest.testStartTime }' type='both' dateStyle='medium'
	                                      timeStyle='medium' pattern='yyyy-MM-dd HH:mm'/>"/>
	                                                                                     活动截止时间：<input
										  style="width: 128px;" value="<fmt:formatDate value='${questionTest.testEndTime}' type='both' dateStyle='medium'
	                                      timeStyle='medium' pattern='yyyy-MM-dd HH:mm'/>" />
								</div>
								<div class="HR_Tianjia_Casual">
									活动说明：
									<textarea style="width: 400px;" name="" cols="" rows="">${questionTest.testDesc }</textarea>
								</div>
								<div class="HR_piliangTianjialishi">
								    <c:if test="${questionTest.testMethod==0 }">
								              调查方式：<input style="width: 170px;"  value="内部匿名"/>
								    </c:if>
								    <c:if test="${questionTest.testMethod==1 }">
								              调查方式：<input style="width: 170px;"  value="内部实名"/>
								    </c:if>
								    <c:if test="${questionTest.testMethod==2 }">
								              调查方式：<input style="width: 170px;"  value="外部调查"/>
								    </c:if>
								</div>
                            </div>
                            
                            <div id="model_2" style="display:none;">
								<h4 style="margin-top: 30px;">活动问卷详情</h4>
								<div class="HR_piliangTianjialishi">
									问卷名称：<input style="width: 170px;" value="${questionPapers.paperName }" />问卷编号：<input
										style="width: 153px;" value="${questionPapers.paperNum }"/>
								</div>
								<div class="HR_piliangTianjialishi">
									问卷分类：<input style="width: 170px;" value="${questionPapers.questionPaperType.typeName }"/>
									<c:if test="${questionTest.testAnswer==0 }">
									    问卷呈现方式：<input	style="width: 130px;" value="每页一题" />
									</c:if>
									<c:if test="${questionTest.testAnswer==1 }">
									    问卷呈现方式：<input	style="width: 130px;" value="每页10题 " />
									</c:if>
									
								</div>
								<div class="HR_Tianjia_Casual">
									问卷说明：
									<textarea style="width: 400px;" name="" cols="" rows="">${questionPapers.paperDesc }</textarea>
								</div>
                             
                             
                             
								<h4 style="margin-top: 30px;">问卷关联题目详情</h4>
								<ul class="HR_hddc10">
									<li>编号</li>
									<li style="width: 20%;">题目</li>
									<li>题型</li>
									<li>题目类别</li>
									<li>分数</li>
									<li>难易程度</li>
									<li>创建日期</li>
									<li>状态</li>
								</ul>
                                <div id="subject">
	                                  <div id="subject_1_1">
			                                
									  </div>  
									  <div id="questionLibraryPage" style="margin-top: 30px;"></div>
								</div>	
								<div id="subject_1">
			                                                               没有找到符合要求的题目！
								</div>
                            </div>

                            <div id="model_3" style="display: none;">
								<h4 style="margin-top: 30px;">参与对象详情</h4>
								<div class="HR_piliangTianjialishi">
									参与人姓名：<input id="userName" style="width: 159px;"/>部门：<input
										style="width: 130px;" id="departmentName"/>
								</div>
								<div class="HR_piliangTianjialishi">
									分数：<input id="score" style="width: 50px;" onblur="isNum(this.value);"/>到
									      <input id="score1" style="width: 50px;" onblur="isNum(this.value);"/>参与日期：
									    <input class="Wdate" type="text" style="width:90px" id="smallTime" name="testStartTime" onclick="WdatePicker({readOnly:'true'})" />
									     到<input class="Wdate" type="text" style="width:90px" id="bigTime" name="testEndTime" onclick="WdatePicker({readOnly:'true'})"/> 
									     <input style="border: none; margin-left: 40px;" type="button" onclick="search();"
										class="HR_wenjuanwentiSoso" />
								</div>
								<div class="HR_piliangTianjiaContent">
									<ul class="HR_hddc10">
										<li style="width: 14%;">编号</li>
										<li style="width: 20%;">参与人姓名</li>
										<li>岗位</li>
										<li style="width: 14%;">部门</li>
										<li>参与日期</li>
										<li>得分</li>
										<li>状态</li>
									</ul>
									<div id="employeeInfo">
									    <div id="employeeInfo_1">
											<ul class="HR_hddcGL10B">
												<li style="width: 14%;">HR89757</li>
												<li style="width: 20%;">后台程序设计</li>
												<li>技术部</li>
												<li style="width: 14%;">技术部</li>
												<li>2012.3.20</li>
												<li>40</li>
												<li>已完成</li>
											</ul>
										</div>
										<div id="infoPage"></div>
									</div>
									<div id="employeeInfo1">
									    <p style="float: left;">没有找到相对应的参与人！</p>
									</div>
								</div>
							</div>
							 <%
								DefaultPieDataset piedataset=(DefaultPieDataset)request.getAttribute("date");
								String p = ChartUtil.generatePieChart(piedataset,"活动参与情况",400,225,null, new PrintWriter(out));
								String p1 = request.getContextPath() + "/servlet/DisplayChart?filename=" + p;
								DefaultPieDataset piedataset2=(DefaultPieDataset)request.getAttribute("date2");
								String p2 = ChartUtil.generatePieChart(piedataset2,"活动统计情况",400,225,null, new PrintWriter(out));
								String p12 = request.getContextPath() + "/servlet/DisplayChart?filename=" + p2;
							%> 
							<div id="model_4" style="display: none;">	
								<h4 style="margin-top: 30px;">活动统计情况</h4>
								 <ul class="HR_huodongContent">
									<li><img src="<%= p1 %>" width=500 height=300 border=0 usemap="#<%= p %>" /></li>
								</ul>
								<ul class="HR_huodongContent">
									<li><img src="<%= p12 %>" width=500 height=300 border=0 usemap="#<%= p2 %>" /></li>
								</ul> 
							</div>
							
				</div>

			</div>
		</div>
	</div>
</body>
</html>
