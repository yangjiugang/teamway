<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易介宝注册</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/register.css" type="text/css" />
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#visitorName").val("");
	$("#visitorPassword").val("");
});
function setSubmit(){
	if(email==true && phone2==true && visitorName==true && pass==true && repass==true && firstName==true){
		return true;
	}else{
		//alert("email:"+email+" phone2:"+phone2+" visitorName:"+visitorName+" pass:"+pass+" repass:"+repass+" firstName:"+firstName);
		return false;
	}
}

function submitForm(){
	if(setSubmit()){
		document.insertForm.submit();
	}
}
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
		setSubmit();
	}
	/*else{
		pass=false;
		setSubmit();		
	}*/	
}

//确认密码判断
var repass = false;
function checkRePassword(str){
	if(str==null ||str ==""){
		$("#spanvisitorPassword2").html("确认密码不能为空");
		repass = false;
		return;
	}else{
		$("#spanvisitorPassword2").html("");
		repass = true;
		setSubmit();
	}
	if(str!=$("#visitorPassword").val()){
		$("#spanvisitorPassword2").html("密码与确认密码不一致");
		repass = false;
		return;
	}else{
		$("#spanvisitorPassword2").html("");
		repass = true;
		setSubmit();
	}
}

//姓名判断
var firstName = false;
function checkFirstName(str){
	if(str=="" || str==null){
		$("#spanFirstName").html("请输入姓氏");
		firstName = false;
		return;
	}else{
		$("#spanFirstName").html("");
		firstName = true;
		setSubmit();
	}
}
//邮箱判断	
var email=false;
function   checkEmail(str){   
	  var   sReg   =    /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; //验证Email   
	  if(str=="" || str==null){
		  $("#spanEmail").html("请输入有效的邮件地址");
		  email=false;
		  return;
	  }else{
		  $("#spanEmail").html("");
		  email=true;
		  setSubmit();
	  }
	  if   (   !   sReg.test(str)   )   
	  {  		  
		  $("#spanEmail").html("邮件格式不正确");
		  email=false;
		  return; 
	  }  else{ 
		  $("#spanEmail").html("");
		  email=true;
		  setSubmit();
	  }
	$.fc.ajaxSubmit({
		url:'yjbverifyEmail',
		dataType:"text",
		data:"email="+str,
		callBackFn:function(msg){
			if(msg == 1) {
				$("#spanEmail").html("此邮箱已被注册");
				email=false;
				return;
			} else {
				$("#spanEmail").html("");
				email=true;
				setSubmit();
			}
		}
	});
}
//手机号判断
var phone2=false;
function checkPhone(phone){
	
	var reg =/^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
	var objExp=new RegExp(reg); 
	if(phone==null || phone==""){
		$("#spanPhone").html("手机号码不能为空");
		phone2=false;
		return;
	}else{
		$("#spanPhone").html("");
		phone2 = true;
		setSubmit();
	}
	if(objExp.test(phone)==true){ 
		$("#spanPhone").html("");
		phone2=true;
		setSubmit();
	}else{ 
		$("#spanPhone").html("手机号码格式不正确");
		phone2=false;
		return;
	}
	$.fc.ajaxSubmit({
		url:'yjbverifyPhone',
		dataType:"text",
		data:"phone="+phone,
		callBackFn:function(msg){	
			if(msg == 1) {
				$("#spanPhone").html("此手机号码已被注册");
				phone2=false;
				return;
			} else {
				$("#spanPhone").html("");
				phone2=true;
				setSubmit();		
			}
		}
	});
	
}
//用户判断
var visitorName=false;
function judgeName(value){
	if(value=="" || value==null){
		$("#spanvisitorName").html("用户名不能为空 ");
		visitorName=false;
		return;
	}else{
		$("#spanvisitorName").html("");
		visitorName=true;
	}
	$.fc.ajaxSubmit({
		url:'yjbverify',
		dataType:"text",
		data:"visitorName="+value,
		callBackFn:function(msg){			
			if(msg == 1) {
				$("#spanvisitorName").html("用户名已存在");
				visitorName=false;
			} else {
				$("#spanvisitorName").html("");
				visitorName=true;
				setSubmit();
			}
		}
	});
}
</script>
</head>
<body>
<!--头部-->
<div class="FlhTopOut">
	<div class="FlhTop">
        <div class="FlhLogo"></div>
        <div class="TopRight">
            <span class="FLHMap"><div>房立方</div><img  src="images/mapImg.png"/><font>主题会所分布网点</font></span>
            <span class="FLHphone"><a href="../funlifun/index.html"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></a></span>
        </div>
	</div>
</div>
<div class="FLHEscOUT">
	<div>
    	<font>欢迎您进入易介宝! <a href="landing.html">[登录]</a><a href="register.html"> [注册]</a></font>
    </div>
</div>
<!--End头部-->
<div class="middle">
<!--左边-->
 	<%@ include file="ELoginLeft.jsp" %>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
		<div class="registerOut">
        	<div id="registerFont">注册：开通你的房友账号</div>
        	<span class="zhuce-zhao">
                <ul>
                  <li><img src="images/chuce-011.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li>输入基本信息</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                  
                 
                   <li><img src="images/chuce-02.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-001.png" width="13" height="7" /></li>
                  <li>邮箱发送</li>
                  
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                   <li><img src="images/chuce-03.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-001.png" width="13" height="7" /></li>
                  <li>完成</li>
                </ul> 
              </span>
        	<form method="post" action="yjbregisterAdd" name="insertForm">
 	            <div>
	            	<span><label>用户名：</label><font>*</font><input type="text" name="visitorName" id="visitorName" value="${fcSysVisitor.visitorName }" onblur="judgeName(this.value)"/>&nbsp;<p class="red" id="spanvisitorName">${verifyName }</p><img src="images/dui-bg.png" /></span>
	                <a href="" class="textTS">建议您使用E-mail或手机号注册！</a>
	                <span><label>设置密码：</label><font>*</font><input type="password" name="visitorPassword" id="visitorPassword" value="${fcSysVisitor.visitorPassword }" onblur="checkPassword(this.value)" maxlength="14"/>&nbsp;<p class="red" id="spanvisitorPassword">${verifyPassword }</p></span>
	                <span><label>再次输入密码：</label><font>*</font><input type="password" name="visitorPassword2" id="visitorPassword2" onblur='checkRePassword(this.value)' maxlength="14"/>&nbsp;<p class="red" id="spanvisitorPassword2"></p></span>      
	            </div>
            <div>
            	<span>
           	  <label>贵姓：</label><font>*</font><input type="text" name="firstName" value="${fcSysVisitor.firstName }" onblur="checkFirstName(this.value)" style=" width:60px;" maxlength="4"/>
           	    <input type="radio" name="sex"  id="sexn" value="0" checked="checked"/>先生<input type="radio" name="sex" id="sexnv" value="1"/>女士&nbsp;<p class="red" id="spanFirstName">${verifyFirstName }</p></span>
               
               <span>
               <label>E-mail：</label><font>*</font>
               <font></font><input type="text" name="email" value="${fcSysVisitor.email }" onblur= "checkEmail(this.value)"/>&nbsp;<p class="red" id="spanEmail">${verifyEmail }</p> </span>
               <span>
               <label>手机号码：</label><font>*</font>
               <input type="text" name="phone" value="${fcSysVisitor.phone }" onblur= "checkPhone(this.value)" maxlength="11" onkeydown="value=this.value.replace(/\D+/g,'')"/>&nbsp;<p class="red" id="spanPhone">${verifyPhone }</p></span>
                <span><label>服务条款：</label>
               <font>&nbsp;</font> <textarea cols="10" rows="10" style="width: 307px; height: 66px;">必须保密现在的资料信息
               </textarea>   
               
            </div>
             <div id="zctj"><a href="javascript:submitForm()"><img src="images/registerBut.jpg" style="margin:20px 0 0 40px;"/></div>
            </form>
            
        </div>
        
    </div>
<!--End右边-->    
</div>
</body>
</html>
