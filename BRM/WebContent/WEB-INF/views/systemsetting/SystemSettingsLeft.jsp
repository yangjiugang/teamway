<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人首页</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
function goToJsp(iframeName,sendPage){
	parent.window.changeRight(sendPage);
  }
</script>
</head>

<body>
	<div class="left1">
    	<!--<ul class="left_top">
        	<li style="width:100%; border-right:none;"><a href="">创建/发起新流程</a></li>
         </ul> -->
        <form>
        <dl class="checkbox">
        	<dt><a onclick="goToJsp('right','sz.html')">个人所得税设置</a></dt>
            <dt><a onclick="goToJsp('right','sblxsz.html')">社保缴纳类型设置</a></dt>
            <dt><a onclick="goToJsp('right','systemGradeSet')">职系设置</a></dt>
          	<dt><a onclick="goToJsp('right','SystemJobLevelSet')">职等职级设置</a></dt>
            <dt><a onclick="goToJsp('right','xcsz.html')">薪酬结构设置</a></dt>
            <dt><a onclick="goToJsp('right','xcsz1.html')">薪酬等级设置</a></dt>
            <dt><a onclick="goToJsp('right','gwjgsz.html')">组织/岗位架构设置</a></dt>
            <authz:authorize ifAnyGranted="FUNC_AUTH_SYS_08,FUNC_AUTH_SYS_09"><dt><a onclick="goToJsp('right','rightsSetting')">权限设置</a></dt></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_SYS_08"><dd><a onclick="goToJsp('right','rightsSetting')">角色管理</a></dd></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_SYS_09"><dd><a onclick="goToJsp('right','companyEmployeeRoleInfo')">人员管理</a></dd></authz:authorize>
            <dt><a onclick="goToJsp('right','gssz.html')">公司设置</a></dt>
        </dl>
      </form>  
    </div>
</body>
</html>