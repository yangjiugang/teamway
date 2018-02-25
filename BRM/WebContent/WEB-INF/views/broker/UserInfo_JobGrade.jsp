<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>职系</title>
</head>
<body>
	<div class="HR_ZZJL">
		<p>
			<span>
				职系编号：<input readonly="readonly"  class="XXMCinput" value="${jobGrade.jobGradeNo }"/>
			</span>
			职系名称：<input readonly="readonly"  class="XXMCinput" value="${jobGrade.jobGradeName }" />
		</p>
		<p class="HR_RZBL_Casual">
			职系说明：<br />
			<textarea style="width:620px; height:50px;" name="" cols="" rows="">
				${jobGrade.jobGradeDesc }
			</textarea>
		</p>
		<p>
			<span>
				创建时间：<input readonly="readonly"  class="XXMCinput" value="${jobGrade.createTime }" />
			</span>
			创建人：<input readonly="readonly"  class="XXMCinput" style="width:194px;" value="${jobGrade.createUser }"/>
		</p>
		<p>
			<span>
				最后修改时间：<input readonly="readonly"  class="XXMCinput" style="width:158px;" value="${jobGrade.lastUpdateTime }" />
			</span>
			最后修改人：<input readonly="readonly"  class="XXMCinput" style="width:170px;" value="${jobGrade.lastUpdateUser }" />
		</p>
	</div>
</body>
</html>