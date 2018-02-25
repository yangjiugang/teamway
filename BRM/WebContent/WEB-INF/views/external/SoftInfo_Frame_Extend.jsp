<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
	var hobbArray = "${skills.hobbies}".split(",");
	for ( var i = 0; i < hobbArray.length; i++) {
		$("#hobbUL").append("<li><input name='hobbies' type='checkbox' checked='checked'/>"+hobbArray[i]+"</li>");
	}
});
	
</script>
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
	<ul class="xqah12" id="hobbUL">
     </ul>
</body>
</html>