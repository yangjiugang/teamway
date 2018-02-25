<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css"/>
<title>入职信息</title>
<style type="text/css">
	
</style>
</head>
<body>
	<div>
	<div class="HR_RZXXLeft">
		<p>
			<span>姓名：<input readonly="readonly"  readonly="readonly"  style="width:174px;" value="${extend.userName }"/></span>
			性别：<input readonly="readonly"  style="width:174px;" value="${extend.userSex }"/>
		</p>
		<p>
			<span>员工工号：<input readonly="readonly"  value="${extend.employeeNum }"/></span>
			英文名字：<input readonly="readonly"  value="${extend.englishName }"/>
		</p>
		<p>
			<span>联系电话：<input readonly="readonly"  value="${extend.telephone }"/></span>
			办公电话：<input readonly="readonly" value="${extend.officePhone }" />
		</p>
		<p>
			<span>
			最高学历：<input readonly="readonly"  value="${extend.highestEducation }"/>
			</span>
			毕业院校：<input readonly="readonly"  value="${extend.graduateSchool}"/>
		</p>
		<p>
		<span>户口所在城市：<input readonly="readonly" style="width:348px;" value="${extend.areaId }"/></span>
		</p>
		<p>
		<span>户口所在地：<input readonly="readonly" style="width:360px;" value="${extend.hkPlace }"/></span>
		</p>
		<p>
		<span>企业邮箱：<input readonly="readonly"  value="${extend.enterpriseMail }"/></span>
		社保电脑号：<input readonly="readonly" style="width:138px;" value="${extend.socialSecurityNum }"/>
		</p>
		<p>
		<span>岗位：<input readonly="readonly" value="${extend.postName }"/></span>
		隶属部门：<input readonly="readonly" value="${extend.organizationName }"/>
		</p>
		<p>
		<span>职系：<input readonly="readonly" value="${extend.jobGradeName }"/></span>
		职级：<input readonly="readonly" value="${extend.jobLevelName }"/>
		</p>
		<p>
		<span>入职时间：<input readonly="readonly" value=<fmt:formatDate value="${extend.entryDate }" pattern="yyyy年MM月dd日" type="date"/>  /></span>
		生效日期：<input readonly="readonly" value=<fmt:formatDate value="${extend.applyDate }" pattern="yyyy年MM月dd日" type="date"/>  />
		</p>
		<p>
		银行卡开户行：<input readonly="readonly" style="width:348px;" value="${extend.bankId }"/>
		</p>
		<p>
		<span>银行卡号：<input readonly="readonly" value="${extend.bankNum }"/></span>
		薪酬金额：<input readonly="readonly" value="${extend.salaryTotal }"/>
		</p>
	</div>
	<div class="HR_RZXXRight"><img src="images/poto-a.gif" /></div>
	</div>

</body>
</html>