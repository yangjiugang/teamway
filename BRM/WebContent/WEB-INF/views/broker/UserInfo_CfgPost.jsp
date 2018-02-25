<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>家庭成员</title>
</head>
<body>
	<div class="HR_ZZJL">
		<p>
		    <span>
		        岗位编号：<input readonly="readonly" class="XXMCinput" value="${cfgPost.postNo }"/>
		    </span>
			岗位名称：<input readonly="readonly" class="XXMCinput" value="${cfgPost.postName }"/>
		</p>
		<p>
			<span>
				隶属部门：<input readonly="readonly"  class="XXMCinput" value="${cfgPost.organizationId }"/>
			</span>
			直接上级岗位：<input readonly="readonly"  class="XXMCinput" style="width:158px;" value="${cfgPost.higherPostId }"/>
		</p>
		<p>
			<span>
				最低薪酬等级：<input readonly="readonly"  class="XXMCinput" style="width:158px;" value="${cfgPost.lowestSalaryLevel }"/>
			</span>
			最高薪酬等级：<input readonly="readonly"  class="XXMCinput" style="width:158px;" value="${cfgPost.highestSalaryLevel }"/>
		</p>
		<p>
			<span>
				编制日期：<input readonly="readonly"  class="XXMCinput" value="${cfgPost.createDate }"/>
			</span>
			编制人：<input readonly="readonly"  class="XXMCinput" style="width:194px;" value="${cfgPost.createUser }"/>
		</p>
		<p>
			<span>
				最后修改时间：<input readonly="readonly"  class="XXMCinput" style="width:158px;" value="${cfgPost.lastUpdateTime }"/>
			</span>
			最后修改人：<input readonly="readonly"  class="XXMCinput" style="width:170px;" value="${cfgPost.lastUpdateUser }"/>
		</p>
		<p>
			是否为需要储备人才：<input readonly="readonly" class="XXMCinput" style="width:122px;" value="${cfgPost.isFpsg }"/>
		</p>
	</div>
</body>
</html>