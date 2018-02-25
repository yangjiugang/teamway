<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/fparty/layout.css" />
<link rel="stylesheet" href="css/fparty/register.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setTimeout(sikpUrl,5000);
});
function sikpUrl(){
	window.location.href = "http://127.0.0.1:8080/flf/toflogin";
}
</script>
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
    	<font>欢迎您进入房乐会! <a href="landing.html">[登录]</a><a href="register.html"> [注册]</a></font>
    </div>
</div>
<!--End头部-->
<div class="middle">
<!--左边-->
 		<%@ include file="FLoginLeft.jsp" %>
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
                  
                 
                   <li><img src="images/chuce-022.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li>邮箱发送</li>
                  
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                   <li><img src="images/chuce-033.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li>完成</li>
                </ul> 
              </span>
            
        	<span class="zhuce-yan">
                  <ul>
                    <li><img src="images/chenggong.gif" width="16" height="13" /></li>
                    <li>&nbsp;&nbsp;&nbsp;您已注册成功</li>
                  </ul>
               </span>
               <span class="zhuce-yan-t">本页面将在5秒后自动跳转，如果没有跳转，请<span class="blue"><a href="http://127.0.0.1:8080/flf/toflogin" class="red">点击此处</a></span></span>
            
        </div>
        
    </div>
<!--End右边-->    
</div>
</body>
</html>

