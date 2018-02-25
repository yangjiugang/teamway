<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>找回密码</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css"/>
<link rel="stylesheet" href="css/fparty/register.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
//密码判断
var pass = false;
function checkPassword(str){
	if(str==null ||str ==""){
			$("#spanvisitorPassword").html("密码不能为空");
			pass = false;
			return;
	}else{
		$("#spanvisitorPassword").html("");
		pass = true;
	}
	if(str.length<6){
		$("#spanvisitorPassword").html("密码最少6个字符，最长不得超过14个字符");
		return;
	}else{
		$("#spanvisitorPassword").html("");
		pass = true;
	}
}

var repass = false;
function checkRePassword(str){
	if(str==null ||str ==""){
		$("#spanvisitorPassword2").html("确认密码不能为空");
		repass = false;
		return;
	}else{
		$("#spanvisitorPassword2").html("");
		repass = true;
	}
	if(str!=$("#password").val()){
		$("#spanvisitorPassword2").html("密码与确认密码不一致");
		repass = false;
		return;
	}else{
		$("#spanvisitorPassword2").html("");
		repass = true;
	}
}

function checkSubmit(){
	if(pass == true && repass == true){
		document.f.submit();
	}else{
		return false;
	}
}
</script>
</head>

		<div class="Out1">
        	<div class="khzlTitle">找回密码：</div>
        	<div class="Content1">
           		<div class="zhuce-zhao">
                <ul>
                  <li><img src="images/chuce-011.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li>输入帐号</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                  
                 
                   <li><img src="images/chuce-022.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li><span>身份验证</span></li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                  
                   <li><img src="images/chuce-033.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li>重置密码</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                   <li><img src="images/chuce-04.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-001.png" width="13" height="7" /></li>
                  <li>完成</li>
                </ul> 
              </div>
              <form name="f" action="<c:url value='resetPassword'/>" method="POST">
                <div class="jbzlIpunt">
                <input type="hidden" name="email" value="${email}"/>
                <input type="hidden" name="visitor_type" value="${visitor_type}"/>
                	<span>
                	<label>请设置新密码：</label><input class="input08" type="password" id="password" name="password" onblur="checkPassword(this.value)" maxlength="14"/><font>*</font>&nbsp;<p class="red" id="spanvisitorPassword">${verifyPassword }</p></span>
                    
                  <span>
                  <label>请再次输入新密码：</label><input class="input08" type="password" id="confirmpwd" name="confirmpwd" onblur="checkRePassword(this.value)" maxlength="14"/><font>*</font>&nbsp;<p class="red" id="spanvisitorPassword2">${verifyPassword }</p></span>
                    <span class="as">
                    <input type="image" src="images/submit0.jpg" style="margin:20px 0 0 30px;" name="submit" type="submit" onclick='return checkSubmit();'/>                 
                    </span>
                 <div class="khzlTitle" style="width:550px; float:left; margin-top:1px">&nbsp;</div>
                </div>
                </form>
           </div>
           </div>
<script type="text/javascript">
		var error = '${errorMsg}';
		if(error != '' )alert(error);
</script>
</html>
