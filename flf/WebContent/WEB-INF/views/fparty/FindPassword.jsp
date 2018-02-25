<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>找回密码</title>
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css"/>
<link rel="stylesheet" href="css/fparty/register.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script language="JavaScript" type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".Out1").each(function(){
		var obj = $(this);
		obj.find(".updown1").toggle(function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content1").slideUp('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content1").slideDown('slow');
		});
	});
	
	$(".Out").each(function(){
		var obj = $(this);
		obj.find(".updown").toggle(function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content").slideDown('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content").slideUp('slow');
		});
	});
	$(".jbzlIpunt").each(function(){
		var obj = $(this);
		obj.find(".updown2").toggle(function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content2").slideDown('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content2").slideUp('slow');
		});
	});
});


function checkEmail(){
	var email = document.getElementById("email").value;
	if(checkIsEmail(email) == false){
		alert("email格式有误！请重新输入！");
		  $("#email").val("");  
		  $("#email").focus();     
		  return false;
	}else{
		window.form1.submit();
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
                  
                 
                   <li><img src="images/chuce-02.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-001.png" width="13" height="7" /></li>
                  <li>身份验证</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                  
                   <li><img src="images/chuce-03.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-001.png" width="13" height="7" /></li>
                  <li>重置密码</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                   <li><img src="images/chuce-04.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-001.png" width="13" height="7" /></li>
                  <li>完成</li>
                </ul> 
              </div>
            	<form name="form" action="<c:url value='sendResetPWDEmail'/>" method="POST">
                <div class="jbzlIpunt">
                	<span>
                	<label>电子邮箱：</label><input class="input08" type="text" id="email" name="email"/><font>*</font></span>
       
                 <div class="textTSc">请输入你与账户绑定的Email，系统将发送邮件到此地址帮你找回密码！</div>
                    <span class="as">
                    <input type="image" src="images/Next0.jpg" style="margin:20px 0 0 40px;" name="submit" type="submit" onclick='return checkEmail();'/>
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
