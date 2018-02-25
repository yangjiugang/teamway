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
                  <li>身份验证</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                  
                   <li><img src="images/chuce-033.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li>重置密码</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                   <li><img src="images/chuce-044.png" width="16" height="16" /></li>
                  <li><img src="images/chuce-0011.png" width="13" height="7" /></li>
                  <li>完成</li>
                </ul> 
              </div>
              <div class="zhuce-yan">
                  <ul>
                    <li><img src="images/chenggong.gif" width="16" height="13" /></li>
                    <li>&nbsp;&nbsp;&nbsp;密码重置成功</li>
                  </ul>
               </div>
            </div>
           </div>

<script type="text/javascript">
		var error = '${errorMsg}';
		if(error != '' )alert(error);
</script>
</html>
