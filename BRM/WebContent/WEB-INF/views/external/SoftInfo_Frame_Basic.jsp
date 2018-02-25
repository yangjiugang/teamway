<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>

<style>
.HR_RZXXLeft{ float:left; width:530px;}
.HR_RZXXLeft p{ margin-left:20px; padding:5px 0; margin-bottom:5px;}
.HR_RZXXLeft p input{ width:150px; margin:0 5px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff;}
.HR_RZXXLeft p span{ margin-right:20px;}
.HR_RZXXRight{ float:right; width:120px; text-align:center;}
</style>

</head>
<body>
<div class="HR_RZXXLeft">
<p>
	<span>人才编号：<input class="rzblInput" value="${basic.userNum }" readonly="readonly"/></span>
	姓名：<input class="rzblInput" value="${basic.userName }" readonly="readonly" style="width:175px;"/>
</p>
<p>
	<span>性别：<input class="rzblInput" value="${basic.userSex==0?'男':'女' }" readonly="readonly" style="width:175px;"/></span>
	出生日期：<input class="rzblInput" value='<fmt:formatDate value="${basic.userBirthday }" pattern="yyyy年MM月dd日" type="date"/>' readonly="readonly"/>
	
</p>
<p>
	<span>Email：<input class="rzblInput" value="${basic.email }" readonly="readonly" style="width:167px;"/></span>
	联系电话：<input class="rzblInput" value="${basic.userTelphone }" readonly="readonly"/>
</p>
<p>
	户口所在地：<input class="rzblInput" value="${basic. hkPlace}" readonly="readonly" style="width:380px;"/>
</p>
<p>
	目前居住地：<input class="rzblInput" value="${basic.userAddress }" readonly="readonly" style="width:380px;"/>
</p>

<p>
	<span>证件类型：<input class="rzblInput" value='<c:if test="${basic.certificateType==0 }">身份证</c:if><c:if test="${basic.certificateType==1 }">护照</c:if><c:if test="${basic.certificateType==2 }">其他</c:if>'
	  readonly="readonly"/></span>
	证件号码：<input class="rzblInput" value="${basic.certificateNum }" readonly="readonly"/>
</p>
<p>
	<span>籍贯：<input class="rzblInput" value="${basic.birthPlace }" readonly="readonly" style="width:175px;"/></span>
	身高：<input class="rzblInput" value="${basic.userHeight }" readonly="readonly" style="width:175px;"/>
</p>
<p> 
	<span>最高学历：<input class="rzblInput" value='<c:if test="${basic.highestEducation == 0}">高中</c:if><c:if test="${basic.highestEducation == 1}">中专</c:if><c:if test="${basic.highestEducation == 2}">大专</c:if><c:if test="${basic.highestEducation == 3}">本科</c:if><c:if test="${basic.highestEducation == 4}">硕士研究生</c:if><c:if test="${basic.highestEducation == 5}">博士研究生</c:if><c:if test="${basic.highestEducation == 6}">博士后</c:if>' 
	 readonly="readonly"/></span>
	最高学历名称：<input class="rzblInput" value="${basic.highestEducationName }" readonly="readonly" style="width:128px;"/>
</p>
<p>
	<span>学位：<input class="rzblInput" value='<c:if test="${basic.degree == 0}">无</c:if>  <c:if test="${basic.degree == 1}">学士</c:if><c:if test="${basic.degree == 2}">双学士</c:if><c:if test="${basic.degree == 3}">硕士</c:if><c:if test="${basic.degree == 4}">博士</c:if>'
	readonly="readonly" style="width:175px;"/></span>
	专业：<input class="rzblInput" value="${basic.profession }" readonly="readonly" style="width:175px;"/>
</p>
<p>
	<span>毕业院校：<input class="rzblInput" value="${basic.graduateSchool }" readonly="readonly"/></span>
	毕业时间：<input class="rzblInput" value='<fmt:formatDate value="${basic.graduateDate }" pattern="yyyy年MM月dd日" type="date"/>'  readonly="readonly"/>
</p>
<p>
	工作年限：<input class="rzblInput" value="${basic.workYears==''? 0:basic.workYears }年" readonly="readonly"/>
</p>
<p>
	<span>婚姻：<input class="rzblInput" value="${basic.isMarry==1?'单身':'已婚' }" readonly="readonly" style="width:175px;"/></span>
	政治身份：<input class="rzblInput" value='<c:if test="${basic.politicalConnection ==0}">无党派</c:if>  <c:if test="${basic.politicalConnection ==1}">民主党派</c:if> <c:if test="${basic.politicalConnection ==2}">党员</c:if> '
	readonly="readonly"/>
</p>	
<p>
	<span>目前行业：<input class="rzblInput" value="${basic.presentBusiness }" readonly="readonly"/></span>
	目前岗位：<input class="rzblInput" value="${basic.presentPost }" readonly="readonly"/></p>
<p>
	<span>目前月薪：<input class="rzblInput" value="${basic.presentSalaryMonth }" readonly="readonly"/></span>
	目前年薪：<input class="rzblInput" value="${basic.presentSalaryYear }" readonly="readonly"/>
</p>
<p>

	<span>求职状态：<input class="rzblInput" value='<c:if test="${basic.workStatus == 0 }">目前已离职</c:if><c:if test="${basic.workStatus == 1 }">目前在职 不打算换工作 </c:if><c:if test="${basic.workStatus == 2 }">目前在职打算换工作</c:if>' readonly="readonly"/></span>
	简历来源：<input class="rzblInput" value="${basic.resumeFrom }" readonly="readonly"/>
</p>
<p>
	<span>收录时间：<input class="rzblInput" value='<fmt:formatDate value="${basic.createDate }" pattern="yyyy年MM月dd日" type="date"/>' readonly="readonly"/></span>
	交流次数：<input class="rzblInput" value="${basic.contactCnt==''?0:basic.contactCnt }次" readonly="readonly"/>
</p>
<p>
<span>最后交流人：<input class="rzblInput" value="${basic.lastUpdateUser }" readonly="readonly" style="width:138px;"/></span>
最后更新时间：<input class="rzblInput" value='<fmt:formatDate value="${basic.lastUpdateDate }" pattern="yyyy年MM月dd日" type="date"/>' readonly="readonly" style="width:128px;"/></p>
</div>

<div class="HR_RZXXRight"><img src="images/poto-a.gif" /></div>
</body>
</html>