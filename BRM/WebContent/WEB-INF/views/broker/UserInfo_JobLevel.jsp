<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>职级</title>
</head>
<body>
	<div class="HR_ZZJL">
		<p>
			<span>
				职级名称：<input readonly="readonly" class="XXMCinput" value="${jobLevel.jobLevelName }"/>
			</span>
			职级排位：<input readonly="readonly" class="XXMCinput" value="${jobLevel.jobLevelOrder }" />
		</p>
		<p>
			所属职系：<input readonly="readonly" class="XXMCinput" value="${jobLevel.jobGradeId }" />
		</p>
		<p>
			<span>最低薪酬等级：<input readonly="readonly" class="XXMCinput" style="width:158px;" value="${jobLevel.lowestSalaryLevel }" /></span>
			最高薪酬等级：<input readonly="readonly" class="XXMCinput" style="width:158px;" value="${jobLevel.highestSalaryLevel }" />
		</p>
		<p>
			<span>创建时间：<input readonly="readonly" class="XXMCinput" value="${jobLevel.createTime }" /></span>
			创建人：<input readonly="readonly" class="XXMCinput" style="width:194px;" value="${jobLevel.createUser }"/>
		</p>
		<p>
			<span>最后修改时间：<input readonly="readonly" class="XXMCinput" style="width:158px;" value="${jobLevel.lastUpdateTime }" /></span>
			最后修改人：<input readonly="readonly" class="XXMCinput" style="width:170px;" value="${jobLevel.lastUpdateUser }" />
		</p>
	</div>
</body>
</html>