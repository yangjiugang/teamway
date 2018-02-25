<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
function changeImg(){      
    var imgSrc = $("#imgObj");      
    imgSrc.attr("src",chgUrl("<c:url value='/servlet/ImageServlet'/>"));    
    $("#checkCode").focus();     
}      
//时间戳      
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳      
function chgUrl(url){      
    var timestamp = (new Date()).valueOf();      
    if((url.indexOf("&")>=0)){      
        url = url + "&tamp=" + timestamp;      
    }else{      
        url = url + "?timestamp=" + timestamp;      
    }      
    return url;      
}   

//校验，提交表单，验证码是否正确  
function checkForm(){
	var username = $("#j_username").attr("value");
	if(username == ""){
		alert("请输入账号！");
		$("#j_username").focus();     
		return false;
	}
	var password = $("#j_password").attr("value");
	if(password == ""){
		alert("请输入密码！");
		$("#j_password").focus();     
		return false;
	}
	
    var code = $("#checkCode").attr("value");      
    if(code == ""){
		alert("请输入验证码！");
		$("#checkCode").focus();     
		return false;
	}
    var res = false;  
    //code = "data="+new Date()+"&code=" + code;    
    $.ajax({   
        type:"POST",      
        url:"<c:url value='/servlet/ResultServlet'/>",      
        data:"code="+code,      
        //同步   
        async:false,  
        success:function(data){
        	if(data == "false"){
        		alert("验证码有误，请重新输入！");
        		changeImg();
        		$("#checkCode").val("");
        		$("#checkCode").focus(); 
        	}else if(data == "true"){
        		res = true;
        	}
        }   
    });
	return res;
}

</script>
<div class="FLHLeft">
    	<div class="LandingOut">
    	<c:if test="${not empty param.login_error}">
      <font color="red">用户名或密码错误</font>
    </c:if>
        	<h1>登陆房乐会</h1>
            <form name="f" action="<c:url value='j_spring_security_check'/>" method="POST">
            	<span class="inputText1"><label>账号：&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id='j_username' name='j_username' value='<c:if test="${not empty param.login_error}"><c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>'/></span>
                <span class="inputText2"><label>密码：&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="password" id='j_password' name='j_password'/></span>
                <span class="inputText3"><label>验证码：</label><input type="text" id="checkCode" name="checkCode"/>
                <img id="imgObj" onclick="changeImg();" src="<c:url value='/servlet/ImageServlet'/>" style="vertical-align:top;margin-top:1px;margin-left:5px;"/>  
                </span>   
				<span class="CheckCoxD"><input type="checkbox" name="_spring_security_remember_me"/>&nbsp;<label>记住登陆状态</label></span>
                <span class="ButtonD"><input type="image" src="images/landingBut.jpg" name="submit" type="submit" onclick='return checkForm();'/><font><a href="forgetPassword?lt=1">忘记密码？</a></font></span>
                <input type="hidden" name="login_type" value="ROLE_1"></input>
            </form>
        </div>
        <div class="registerFont">
        	还没有开通你的友房账号？<br />
            <a href="register">立即注册</a>
        </div>
    </div>