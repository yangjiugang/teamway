<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
//校验，提交表单，验证码是否正确 
function checkForm(){
	var username = $("#j_username").attr("value");
	if(username ==null || username == ""){
		$("#visitorUserName").html("登录邮箱不能为空");
		$("#j_username").focus();     
		return false;
	}
	var password = $("#j_password").attr("value");
	if(password = null || password == ""){
		$("#visitorPassword").html("密码不能为空");
		$("#j_password").focus();     
		return false;
	}
}

</script>
<html>
  <head>
    <title>登录</title>
  </head>

  <body onload="document.f.j_username.focus();">
    <div class="head">
    <div class="top_right" style=" width:450px; _width:480px;">
        <h1>房立方地产经纪人管理系统</h1>
     </div>
    </div>
    <div class="loginmiddle">
    
    <c:if test="${not empty param.login_error}">
      <font color="red">用户名或密码错误</font>
    </c:if>
    
    <form name="f" action="<c:url value='j_spring_security_check'/>" method="POST">
     
        <span><label>登录邮箱：</label><input type='text' id='j_username' name='j_username' value='<c:if test="${not empty param.login_error}"><c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>'/><font color="red"><p class="red" id="visitorUserName"></p></font></span>
        <span><label>   密码：&nbsp;&nbsp;&nbsp;&nbsp;</label><input type='password' id='j_password' name='j_password' onpaste="return false"/><font color="red"><p class="red" id="visitorPassword"></p></font></span>
        <span><input type="checkbox" name="_spring_security_remember_me"></span><label>记住登陆状态</label>

        <span><input name="submit" type="submit" value="登录" onclick='return checkForm();'></td></span>

    </form>
    </div>
	
  </body>
</html>
