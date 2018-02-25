<%
/**********************************************************************
 * 在线抓取简历 人才热线列表
 * 2011-3-20 邓祥 新建
 **********************************************************************/
%>
<%@ include file="../common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>58同城</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>

<script type="text/javascript">

	/**
	* 获取选择的项目数量
	* form 页面Form对象
	*/
	function getCheckNum(obj){
		var selProjectId="";
		var ilength=0;
		if(obj != null){
			var objlenth = obj.length;
			if (objlenth>1){
				for(var i = 0;i < objlenth;i++){
					if (obj[i].checked==true){
						if(selProjectId==""){
							selProjectId = obj[i].value;
						}else{
							selProjectId = selProjectId +"," + obj[i].value;
						}
						ilength++;
					}
				}
			}else{
				if (obj.checked==true){
					ilength++;
					selProjectId = obj.value;
				}
			}
		}
		return ilength;
	}

	//分页
	function __doPostBack(eventTarget, eventArgument) {
		$("#eventTarget").val(eventTarget);
		$("#eventargument").val("");//清空下载参数 
		myform.submit();
	}
	
	//下载简历
	function downloadResume(form) {
		$("#eventTarget").val("ctl00$M$mFunc");
		$("#eventargument").val("-2\\7764217");
		var ilength=getCheckNum(form.idList); //获取选中简历数
		if (ilength==0) {
			alert('没有选择记录！');
            return;
		}
		var obj=form.idList;
		var checkboxId = '';
		
		if (obj.length != null){
			for(var i = 0;i < obj.length;i++){
				if (obj[i].checked==true ){
					checkboxId += obj[i].id+",";
					
				}
				
			}
			
		}
		checkboxId = checkboxId.substring(0, checkboxId.length);
		alert(checkboxId);
		document.myform.checkboxId.value=checkboxId;
		myform.submit();
	}
	
	//查看简历
	function consult(form) {
		
		var ilength=getCheckNum(form.idList); //获取选中简历数
		if (ilength==0) {
			alert('没有选择记录！');
            return;
		}
		if(ilength>1){
			alert('只能选择一条记录！');
            return;
		}
		var obj=form.idList;
		//var checkboxId = new Array(); 
		var resumeId ;
		if (obj.length != null){
			for(var i = 0;i < obj.length;i++){
				if (obj[i].checked==true){
					resumeId = obj[i].resumeId;
				}
			}
			
		}
		//document.myform.action="particular";
		//document.myform.checkboxId.value=checkboxId;
		//var xx = $("#myform").formSerialize();
		ShowIframe('简历查看','particular?resumeId='+resumeId,850,500);
	}
	
	//列表上点击查看
	function consult1(resumeId) {
		
		ShowIframe('简历查看','particular?resumeId='+resumeId,850,500);
	}

</script>
</head>
<body>
<!--end中间选项卡，面包屑-->
<!--中间-->
	<form name="myform" id="myform" action="search58" method="post">
        
		<div style="text-align: center;border-bottom: 1px solid #A8CBFE">
			
			<span id="ctl00_M_labKey" style="color:#719DD9;font-weight:bold;">关键字:</span>
			<input type="text" id="key" name="key" value="${parameter.key}"  style="width:450px;">
			<input type="submit" class="seach_but" value="&nbsp;搜&nbsp;索&nbsp;"/>
			
		</div>
		
	
		<div class="middle">

			<div class="HR_ListSOSO">
				<span>
					<input type="button" value="查看" class="but1" onclick="consult(this.form)"/> 
					<input type="button" value="收藏" class="but1" /> 
					<input type="button" value="发送面试官" class="but1" /> 
					<input type="button" value="下载联系方式" class="but1" onclick="downloadResume(this.form)"/> 
					<input type="button" value="加入人才库" class="but1" /> 
					<input type="button" value="导出列表" class="but1" />
				</span>
			当前搜索关键字： <b>${parameter.key}</b>  搜索完成 ${sAll}
			</div>

			<table cellpadding="0" cellspacing="1" class="ListTableBody" width="100%">
	               <colgroup>
	                   <col width="3%" />
	                   <col width="5%" />
	                   <col width="15%" />
	                   <col width="6%" />
	                   <col width="7%" />
	                   <col width="9%" />
	                   <col width="9%" />
	                   <col width="9%" />
	                   <col width="9%" />
	                   <col width="9%" />
	               </colgroup>
	               <tr class="ListBg">
		               <td align="center">
		                   <!--<input Value="" id="ctl00_M_dtgResumeList_ctl01_Key" type="checkbox" name="ctl00$M$dtgResumeList$ctl01$Key" />  -->
		               </td>
		               <td align="center">姓名 </td>
		               <td align="center">目前岗位</td>
		               <td align="center"> 性别</td>
		               <td align="center">年龄</td>
		               <td align="center">学历</td>
		               <td align="center">工作经验</td>
		               <td align="center">当前地区 </td>
		               <td align="center">期望月薪</td>
		               <td align="center">更新日期</td>
	           	   </tr>
	       	   	   <c:forEach items="${userResume}" var="userResume">
			           <tr>
			               <td align="center" rowspan="2">
			                   <input type="checkbox"
			                   		  Value="${userResume.resumeUserId }" 
			                   		  id="${userResume.resumeUserId }" 
			                   		  name="idList" />
			               </td>
			               <td align="center" rowspan="2" valign="middle">
			                   <a id="${userResume.resumeUserId }" onclick="consult1(${userResume.resumeUserId })" target="_blank">
			                   ${userResume.userName}</a>
			               </td>
			               <td align="center">
			                   ${userResume.presentPost}</td>
			               <td align="center">
			               		 <c:if test="${userResume.userSex==0}">
									男
								</c:if>
								 <c:if test="${userResume.userSex==1}">
									女
								</c:if>
			                    	
			               </td>
			               <td align="center">
			                   ${userResume.year}</td>
			               <td align="center">
			                   ${userResume.highestEducationName}</td>
			               <td align="center"> 
			                   ${userResume.workYears}</td>
			               <td align="center">
			               	   ${userResume.userAddress} </td>
			               <td align="center">
			                   ${userResume.presentSalaryMonth}</td>
			               <td align="center">
			                   ${userResume.updateDate}</td>
			           </tr>
			           <tr>
			               <td colspan="8">
			                   <br />
			                     ${userResume.resumeDepict}
			                   <br />
			               </td>
			           </tr>
				</c:forEach>
			</table>
			<br />
			<table class="ListTableFoot" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<a href="${upPage }">上一页</a> &nbsp; 
					<a href="${toPage }">下一页</a> &nbsp; 
					</td>
				</tr>
			</table>
	</div>
</form>
</body>
</html>