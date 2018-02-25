<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/diaochahuodong.css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>在线简历设置编辑</title>
<script type="text/javascript">
	
	//提交数据
	function Submit(from){
		
		var accountId= document.resumeConfigFrom.accountId.value;
		var type = ${cfgResumeAccount.accountName};
		var vFlag = false;
		 var vMessage = "";
		 if(type==2){
			 if(resumeConfigFrom.memberName.value==""){
			 		vMessage+="会员名不能为空！\n";
			 		vFlag = true ;
			 }
			 
		 }
		 if(type==3){
			 if(resumeConfigFrom.memberName.value==""){
			 		vMessage+="当前城市不能为空！\n";
			 		vFlag = true ;
			 }
			 
		 }
       
        if(resumeConfigFrom.account.value==""){
		 		vMessage+="用户名不能为空！\n";
		 		vFlag = true ;
		 }
        if(resumeConfigFrom.accountPassword.value==""){
		 		vMessage+="密码不能为空！\n";
		 		vFlag = true ;
		 }
      
		if(vFlag){
			alert(vMessage);
			return;
		}
		
		if(accountId!=0){//修改
			document.resumeConfigFrom.action="updateCfgResumeAccount";
			resumeConfigFrom.submit();
		}else{//新增
			resumeConfigFrom.submit();
		}
		
		
	}
	//返回
	function rebound(){
		window.location.href('intoResumeConfig');
	}


</script>
</head>
<body>
	<form name="resumeConfigFrom" action="addResumeConfig" method="post">
		<input type="hidden" name="accountName" id="accountName" value="${cfgResumeAccount.accountName}">
		<input type="hidden" name="accountId" id="accountId" value="${cfgResumeAccount.accountId}">
		<input type="hidden" name="companyId" id="companyId" value="${cfgResumeAccount.companyId}">
		<div class="HR_zhaopinzh">
			<div class="HR_zhaopinzhT">
			<c:if test="${cfgResumeAccount.accountName==1}">
			<img src="images/cjol.gif" style="margin-bottom:-5px;" />&nbsp; &nbsp; 人才热线账号关联
			</c:if>
			<c:if test="${cfgResumeAccount.accountName==2}">
			<img src="images/51job.gif" style="margin-bottom:-5px;" />&nbsp; &nbsp;  前程无忧账号关联
			</c:if>
			<c:if test="${cfgResumeAccount.accountName==3}">
			<img src="images/58.gif" style="margin-bottom:-5px;" />&nbsp; &nbsp;  58同城账号关联
			</c:if>
			<c:if test="${cfgResumeAccount.accountName==4}">
			<img src="images/chinahr.gif" style="margin-bottom:-5px;" />&nbsp; &nbsp;  中华英才网账号关联
			</c:if>
			
			</div>
			<div class="HR_zhaopinzhB">
				<dl class="HR_zhaopinHY">
					<c:if test="${cfgResumeAccount.accountName==2}">
					<dt>会员名：<font color="red">*</font></dt><dd><input id="memberName" name="memberName" maxlength="15" value="${cfgResumeAccount.memberName }" /></dd>
					</c:if>
					<c:if test="${cfgResumeAccount.accountName==3}">
					<dt>当前城市：<font color="red">*</font></dt><dd><input id="memberName" name="memberName" maxlength="15" value="${ cfgResumeAccount.memberName}"  /></dd>
					</c:if>
					<dt>用户名：<font color="red">*</font></dt><dd><input id="account" name="account" maxlength="15" value="${cfgResumeAccount.account}" /></dd>
					<dt>密 &nbsp;&nbsp;码：<font color="red">*</font></dt><dd><input type="password" maxlength="15" id="accountPassword" name="accountPassword" value="${cfgResumeAccount.accountPassword }" /></dd>
				</dl>
				<div>
					<input type="button" class="HR_zhaopin_Submit" onclick="Submit(this.from)" />&nbsp;&nbsp;
					<input type="button" value="&nbsp;返&nbsp;回&nbsp;" onclick="rebound()" />
				</div>
			</div>
		</div>
		
		
	</form>
	
</body>
</html>