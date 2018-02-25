<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style>
	.HR_RZBL{ width:680px; padding:25px 0 0 20px; clear:both;}
	.HR_RZBL li{ float:left; width:340px; height:30px; line-height:30px;}
	.HR_RZBL li span{ width:90px; float:left; text-align:right;}
	.rzblInput{ width:200px; height:20px; line-height:20px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff;}
	.HR_ZZJL{ width:680px; padding:25px 0 0 20px; clear:both;}
	.NYinput{ width:100px; margin:0 5px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff;}
	.HR_ZZJL p{ margin-left:20px; padding:5px 0; margin-bottom:5px;}
	.XXMCinput{ width:182px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff; margin-right:7px;}
	.selectXL{ width:120px; margin-right:5px;}
	.HR_RZBL_Casual textarea{ color:#025FA0; border:1px solid #C5E4F9;  box-shadow: 0 0 0 #FFFFFF inset;   line-height: 18px; overflow-x: hidden;  overflow-y: auto;text-indent:1em; margin-top:5px;}
	.xqah12{ width:680px; padding:25px 0 0 20px; clear:both;}
	.xqah12 li{ float:left; width:80px; margin-bottom:10px;}
	.xqah12 li input{ margin-right:5px;}
</style>
</head>
<body>

	<c:if test="${fn:length(works) == 0}">
	<div class="HR_ZZJL">
		<p>
			从<input class="NYinput" value="${work.startDate }" readonly="readonly" />
			到<input class="NYinput" value="${work.endDate }" readonly="readonly" />
			<span>
				月薪：<input class="NYinput"  value="${work.monthlyPay }" readonly="readonly" />
				年收入：<input class="NYinput"  value="${work.annualIncome }" readonly="readonly" />
			</span>
		</p>
		<p>
			行业类型：
			<select class="selectXL" name="">
			<option>博士</option>
			</select>
			公司名称：<input class="XXMCinput"  value="${work.companyName }" readonly="readonly" />
			公司人数规模：<input class="NYinput" style="width:95px;"  value="${work.companyPopulationScale }" readonly="readonly" />
		</p>
		
		<p>
			       部门：<input class="NYinput" style="width:113px;"  value="${work.department }" readonly="readonly" />
			工作性质：<input class="NYinput" style="width:134px;"  value="${work.workType }" readonly="readonly" />
			<span>
				最高职务：<input class="NYinput"  value="${work.highestPositions }" readonly="readonly" />
			</span>
		</p>
		<p class="HR_RZBL_Casual">
			主要职责描述：<br />
			<textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainResponsibilities }</textarea>
		</p>
		<p>
			       汇报对象：<input class="NYinput" style="width:88px;"  value="${work.reportTo }" readonly="readonly" />
			直接下属人数：<input class="NYinput" style="width:112px;"  value="${work.directSubordinates }" readonly="readonly" />
		</p>
		<p class="HR_RZBL_Casual">主要工作成果(1)：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainWork1 }</textarea></p>
		<p class="HR_RZBL_Casual">主要工作成果(2)：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainWork2 }</textarea></p>
		<p class="HR_RZBL_Casual">主要工作成果(3)：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainWork3 }</textarea></p>
		<p class="HR_RZBL_Casual">补充说明：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.additionalRemarks }</textarea></p>
		<p>
				      证明人：<input class="NYinput"  value="${work.certifier }" readonly="readonly" />
			证明人联系电话：<input class="NYinput"  value="${work.certifierTelephone }" readonly="readonly" />
		</p>
		<p class="HR_RZBL_Casual">
			离职原因：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.reasonsForLeaving }</textarea>
		</p>
	</div>
	</c:if>

	<c:forEach items="${works}" var="work" varStatus="status">
	<div class="HR_ZZJL">
		<p>
			从<input class="NYinput" value="${work.startDate }" readonly="readonly" />
			到<input class="NYinput" value="${work.endDate }" readonly="readonly" />
			<span>
				月薪：<input class="NYinput"  value="${work.monthlyPay }" readonly="readonly" />
				年收入：<input class="NYinput"  value="${work.annualIncome }" readonly="readonly" />
			</span>
		</p>
		<p>
			行业类型：
			<select class="selectXL" name="">
			<option>博士</option>
			</select>
			公司名称：<input class="XXMCinput"  value="${work.companyName }" readonly="readonly" />
			公司人数规模：<input class="NYinput" style="width:95px;"  value="${work.companyPopulationScale }" readonly="readonly" />
		</p>
		
		<p>
			       部门：<input class="NYinput" style="width:113px;"  value="${work.department }" readonly="readonly" />
			工作性质：<input class="NYinput" style="width:134px;"  value="${work.workType }" readonly="readonly" />
			<span>
				最高职务：<input class="NYinput"  value="${work.highestPositions }" readonly="readonly" />
			</span>
		</p>
		<p class="HR_RZBL_Casual">
			主要职责描述：<br />
			<textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainResponsibilities }</textarea>
		</p>
		<p>
			       汇报对象：<input class="NYinput" style="width:88px;"  value="${work.reportTo }" readonly="readonly" />
			直接下属人数：<input class="NYinput" style="width:112px;"  value="${work.directSubordinates }" readonly="readonly" />
		</p>
		<p class="HR_RZBL_Casual">主要工作成果(1)：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainWork1 }</textarea></p>
		<p class="HR_RZBL_Casual">主要工作成果(2)：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainWork2 }</textarea></p>
		<p class="HR_RZBL_Casual">主要工作成果(3)：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainWork3 }</textarea></p>
		<p class="HR_RZBL_Casual">补充说明：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.additionalRemarks }</textarea></p>
		<p>
				      证明人：<input class="NYinput"  value="${work.certifier }" readonly="readonly" />
			证明人联系电话：<input class="NYinput"  value="${work.certifierTelephone }" readonly="readonly" />
		</p>
		<p class="HR_RZBL_Casual">
			离职原因：<br /><textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.reasonsForLeaving }</textarea>
		</p>
	</div>
	
	</c:forEach>
</body>
</html>