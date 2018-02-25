<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<div class="HR_Tianjia_Bottom myBox03" style="width: 546px;">

		<div style="padding: 0 20px;">
			<div class="HR_lishichaxun_top29">
				约谈编号：<input style="width: 124px;" value="${lstEmployeeTalkRecord.talkNum }" readonly onfocus="this.blur()" />
			</div>
			<form>
				<div class="HR_yidongweihu_topType">
					调查方式：
					<c:if test="${lstEmployeeTalkRecord.surveyType == 1 }">
						离职类
					</c:if>
					<c:if test="${lstEmployeeTalkRecord.surveyType == 2 }">
						关爱类
					</c:if>
					<c:if test="${lstEmployeeTalkRecord.surveyType == 3 }">
						考察类
					</c:if>
					<c:if test="${lstEmployeeTalkRecord.surveyType == 4 }">
						调查类
					</c:if>
				</div>
			</form>
			<div class="HR_lishichaxun_top29">
				约谈对象： &nbsp;&nbsp;
				姓名 <input style="width: 88px;" value="${lstEmployeeTalkRecord.talkToEmployeeName}" readonly onfocus="this.blur()" />
				与调研对象关系 
				<c:if test="${lstEmployeeTalkRecord.relationships == 0}">
					<input style="width: 88px;" value="夫妻" readonly onfocus="this.blur()"/>
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.relationships == 1}">
					<input style="width: 88px;" value="父子" readonly onfocus="this.blur()"/>
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.relationships == 2}">
					<input style="width: 88px;" value="亲戚" readonly onfocus="this.blur()"/>
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.relationships == 3}">
					<input style="width: 88px;" value="朋友" readonly onfocus="this.blur()"/>
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.relationships == 4}">
					<input style="width: 88px;" value="同事" readonly onfocus="this.blur()"/>
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.relationships == 5}">
					<input style="width: 88px;" value="下级" readonly onfocus="this.blur()"/>
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.relationships == 6}">
					<input style="width: 88px;" value="上级" readonly onfocus="this.blur()"/>
				</c:if>
			</div>
			<div class="HR_lishichaxun_top29">
				调研对象： &nbsp;&nbsp;
				部门 <input style="width: 91px;" value="${lstEmployeeTalkRecord.surveyOrganizationName}" readonly onfocus="this.blur()" />
				岗位 <input style="width: 91px;" value="${lstEmployeeTalkRecord.surveyPostName}" readonly onfocus="this.blur()" />
				姓名 <input style="width: 91px;" value="${lstEmployeeTalkRecord.surveyEmployeeName}" readonly onfocus="this.blur()" />
			</div>
			<div class="HR_lishichaxun_top29">
				主谈人： &nbsp;&nbsp;
				部门 <input style="width: 95px;" value="${lstEmployeeTalkRecord.mainTalkOrganizationName}" readonly onfocus="this.blur()" />
				岗位 <input style="width: 95px;" value="${lstEmployeeTalkRecord.mainTalkPostName}" readonly onfocus="this.blur()" />
				姓名 <input style="width: 95px;" value="${lstEmployeeTalkRecord.mainTalkEmployeeName}" readonly onfocus="this.blur()" />
			</div>
			<div class="HR_lishichaxun_top29">
				计划约谈时间： <input style="width: 105px;" value="<fmt:formatDate value='${lstEmployeeTalkRecord.planTalkTime }' type='both' dateStyle='medium' timeStyle='medium' pattern='yyyy-MM-dd HH:mm'/>" readonly onfocus="this.blur()"/>
			</div>
			<div class="HR_lishichaxun_top29">
				约谈时间： &nbsp;&nbsp;
				开始时间 	<input style="width: 105px;" value="<fmt:formatDate value='${lstEmployeeTalkRecord.startTime }' type='both' dateStyle='medium' timeStyle='medium' pattern='yyyy-MM-dd HH:mm'/>" readonly onfocus="this.blur()" />
				结束时间 	<input style="width: 105px;" value="<fmt:formatDate value='${lstEmployeeTalkRecord.endTime }' type='both' dateStyle='medium' timeStyle='medium' pattern='yyyy-MM-dd HH:mm'/>" readonly onfocus="this.blur()" />
				时长 <input style="width: 75px;" readonly onfocus="this.blur()" value="${dateDiff }"/>
			</div>
			<div class="HR_jiaoliujilu_Ytfs">
				约谈方式：
				<c:if test="${lstEmployeeTalkRecord.talkType == 0}">
					<input style="width: 99px;" class="HR_jiaoliujilu_input" value="电话" readonly onfocus="this.blur()" />
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.talkType == 1}">
					<input style="width: 99px;" class="HR_jiaoliujilu_input" value="面谈" readonly onfocus="this.blur()" />
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.talkType == 2}">
					<input style="width: 99px;" class="HR_jiaoliujilu_input" value="视频" readonly onfocus="this.blur()" />
				</c:if>
				<c:if test="${lstEmployeeTalkRecord.talkType == 3}">
					<input style="width: 99px;" class="HR_jiaoliujilu_input" value="文字交流（qq\msn\email\信函等）" readonly onfocus="this.blur()" />
				</c:if>
				约谈地点：<input style="width: 99px;" class="HR_jiaoliujilu_input" value="${lstEmployeeTalkRecord.talkPlace }" readonly onfocus="this.blur()" />
			</div>
			<div class="HR_jiaoliujilu_Ytfs" id="checkBox_div">交流内容类型：
				<c:forEach var="lstRecord" items="${lstRecord}">
					<c:if test="${lstRecord.employeeTalkContent.contentType == 1 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">技能方面
					</c:if>
					<c:if test="${lstRecord.employeeTalkContent.contentType == 2 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">绩效方面
					</c:if>
					<c:if test="${lstRecord.employeeTalkContent.contentType == 3 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">薪酬方面
					</c:if>
					<c:if test="${lstRecord.employeeTalkContent.contentType == 4 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">教育/培训方面
					</c:if>
					<c:if test="${lstRecord.employeeTalkContent.contentType == 5 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">家庭生活方面
					</c:if>
					<c:if test="${lstRecord.employeeTalkContent.contentType == 6 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">同事关系
					</c:if>
					<c:if test="${lstRecord.employeeTalkContent.contentType == 7 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">个人发展计划
					</c:if>
					<c:if test="${lstRecord.employeeTalkContent.contentType == 8 }">
						<input type="checkbox" name="contactType" checked value="${lstRecord.employeeTalkContent.contentType}">其他访谈内容
					</c:if>
			</c:forEach>
			</div>
			<div>
				交流内容：
				<textarea node-type="textEl" name="" title="请输入......." readonly onfocus="this.blur()"
					tabindex="1" class="HR_yidongweihu_Casual">${content }</textarea>
			</div>
			<div>
				评价：
				<textarea node-type="textEl" name="" title="请输入......." readonly onfocus="this.blur()"
					tabindex="1" class="HR_yidongweihu_Casual">${lstEmployeeTalkRecord.talkEstimate }</textarea>
			</div>
			<p class="HR_jiaoliujilu_Degree">
				约谈对象稳定程度判断：
				<img src="images/star2.png" style="width: 16px; height: 15px;" />
				<img src="images/star2.png" style="width: 16px; height: 15px;" />
				<img src="images/star2.png" style="width: 16px; height: 15px;" />
				<img src="images/starB.jpg" style="width: 16px; height: 15px;" />
				<img src="images/starB.jpg" style="width: 16px; height: 15px;" />
			</p>
		</div>
	</div>
</body>
</html>