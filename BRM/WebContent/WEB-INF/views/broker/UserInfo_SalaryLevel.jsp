<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>薪酬</title>
</head>
<body>
	<div class="HR_ZZJL">
		<p>
			<span>
				薪酬等级排位：<input class="XXMCinput" style="width:206px;" value="${salaryLevel.salaryLevelOrder }"/>
			</span>
			薪酬金额：<input class="XXMCinput" value="${salaryLevel.salary }" />
		</p>
		<p>
			与下低一级的级差：<input class="XXMCinput" value="${salaryLevel.salaryLevelDiff }" />
		</p>
		<p>
			<span>
				创建时间：<input class="XXMCinput" style="width:230px;" value="${salaryLevel.createTime }" />
			</span>
			创建人：<input class="XXMCinput" style="width:194px;" value="${salaryLevel.createUser }"/>
		</p>
		<p>
			<span>
				最后修改时间：<input class="XXMCinput" style="width:206px;" value="${salaryLevel.lastUpdateTime }" />
			</span>
			最后修改人：<input class="XXMCinput" style="width:170px;" value="${salaryLevel.lastUpdateUser }" />
		</p>
	</div>
</body>
</html>