<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />

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
	<div class="HR_ZZJL">
	<c:if test="${fn:length(edus) == 0}">
		<p>从<input class="NYinput" value="${edu.eduStartDate }" readonly="readonly"/>
		到<input class="NYinput"  value="${edu.eduEndDate }" readonly="readonly"/>
			<span>学历：
				<select class="selectXL" name="">
					<option>大专</option>
				</select>
			</span>
		</p>
		<p>学校名称：<input class="XXMCinput" value="${edu.schoolName }" readonly="readonly"/>
		专业：<input class="XXMCinput" value="${edu.profession }" readonly="readonly"/>
		学位：<select class="selectXL" name="">
				<option>博士</option>
			</select>
		</p>
		<p class="HR_RZBL_Casual">其他辅修专业：<br/>
			<textarea style="width:620px; height:50px;" name="" cols="" rows="">${edu.otherProfession }</textarea>
		</p>
	</c:if>
	<c:forEach items="${edus}" var="edu" varStatus="status">
	
		<p>从<input class="NYinput" value="${edu.eduStartDate }" readonly="readonly"/>
		到<input class="NYinput"  value="${edu.eduEndDate }" readonly="readonly"/>
			<span>学历：
				<select class="selectXL" name="">
					<option>大专</option>
				</select>
			</span>
		</p>
		<p>学校名称：<input class="XXMCinput" value="${edu.schoolName }" readonly="readonly"/>
		专业：<input class="XXMCinput" value="${edu.profession }" readonly="readonly"/>
		学位：<select class="selectXL" name="">
				<option>博士</option>
			</select>
		</p>
		<p class="HR_RZBL_Casual">其他辅修专业：<br/>
			<textarea style="width:620px; height:50px;" name="" cols="" rows="">${edu.otherProfession }</textarea>
		</p>
	</c:forEach>	
		
	</div>
</body>
</html>