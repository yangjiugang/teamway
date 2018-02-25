<%
/**********************************************************************
 * 招聘管理菜单
 * 2011-3-22 邓祥 新建
 **********************************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人管理-招聘管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
	  
	  function goToJsp(iframeName,sendPage){
		document.getElementById(iframeName).src=sendPage;
	  }
	  
	  //添加招聘任务
	  function intoRecruitTask(){
		  parent.showFrame('添加招聘任务','intoRecruitTask',500,500);
	  }
	  
	//查看招聘任务
	  function recruitTaskById(){
			var taskId = $("#taskId").val();
			if(taskId==""||taskId==null){
				alert("您没有选择招聘任务");
				return;
			}
			parent.showFrame('查看招聘任务','recruitTaskById?taskId='+taskId,500,500);
	  }
	
	 //终止招聘任务
	  function closeRecruitTask(){
			var taskId = $("#taskId").val();
			if(taskId==""||taskId==null){
				alert("您没有选择招聘任务");
				return;
			}
			
			 var answer = confirm("您确定要终止该任务吗？");
			 if(answer){
				 location.href('closeRecruitTask?taskId='+taskId);
				 
			 }
			 reload();
	  }	
		
	
	//添加招聘任务 后刷新列表
	  function reload(){
		  window.location.reload(true);
		  //alert("ddd");
		 /// window.location.href('retainManage');
		 
	  }
	
	  function setTaskId(taskId){
		  $("#taskId").val(taskId);
		  parent.window.changeRight('intoRetainManageList?taskId='+taskId); 
	  }
	 
	  
	  
	  
</script>
</head>
<body >
		<div class="left1">
	    	<ul class="left_top zp_ltop">
	        	<li style="border:none; width:170px;">
	        		<a onclick="goToJsp('right','Recruitment.html')">招聘工作统计分析</a>
	        	</li>
	         </ul>
	        
	         
	         <ul class="left_top">
	        	<li><a onclick="intoRecruitTask();" >添加招聘任务</a></li>
	        	<li><a onclick="closeRecruitTask();">终止招聘任务</a>
	        	</li><li style="border:none;"><a onclick="recruitTaskById();">查看招聘任务</a></li>
	         </ul>  
	        <form>
	        <dl class="checkbox">
	        	<input type="hidden" id ="taskId" value=""/>
	            <dt><img src="images/tree2.jpg" />全部招聘任务 (N)</dt>
	        	<dt><img src="images/tree1.jpg" />未完成招聘任务 (N) </dt>
	        	<c:forEach items="${recruitTask1}" var="recruitTask1" varStatus="status">
	        		 <dd><a onclick="setTaskId(${recruitTask1.taskId });">${recruitTask1.organizationName } ${recruitTask1.postName } 
	        		 		(<font title="已入职">3</font>/<font title="未入职">5</font>) 
	        		 		<fmt:formatDate value="${recruitTask1.hopeWorkDate }" pattern="yyyy-MM-dd" type="date"/>
	        		 		到岗(5) 
	        		 	</a>
	        		 </dd>
	        	</c:forEach>
	          
	            <dt><img src="images/tree1.jpg" />已完成${state}招聘任务 (N) </dt>
	            
	            <c:forEach items="${recruitTask2}" var="recruitTask2" varStatus="status">
	        		 <dd><a onclick="setTaskId(${recruitTask2.taskId });">${recruitTask2.organizationName } ${recruitTask2.postName } 
			        		 (<font title="已入职">3</font>/<font title="未入职">5</font>) 
			        		 <fmt:formatDate value="${recruitTask2.hopeWorkDate }" pattern="yyyy-MM-dd" type="date"/>
			        		 到岗(5) 
		        		 </a>
	        		 </dd>
	        	</c:forEach>
	            <dt><img src="images/tree2.jpg" />已取消招聘任务 (N) </dt>
	             <c:forEach items="${recruitTask3}" var="recruitTask3" varStatus="status">
	        		 <dd><a onclick="setTaskId(${recruitTask3.taskId });">${recruitTask3.organizationName } ${recruitTask3.postName } 
		        		 (<font title="已入职">3</font>/<font title="未入职">5</font>) 
		        		<fmt:formatDate value="${recruitTask3.hopeWorkDate }" pattern="yyyy-MM-dd" type="date"/>
		        		 到岗(5) 
		        		 </a>
	        		 </dd>
	        	</c:forEach>
	        </dl>
	        </form>
	    </div>
<c:if test="${state==1}">
      	<script>alert("操作成功");</script>
      </c:if>
</body>
</html>