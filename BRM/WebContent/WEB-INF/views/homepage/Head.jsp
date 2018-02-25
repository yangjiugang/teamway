<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<div class="head">
	<ul class="manu">
    	<li><a href="index.html" class="manu1"></a></li>
        <li><a href="main?flag=broker" class="manu02"></a></li>
        <li><a href="main?flag=echelon" class="manu3"></a></li>
        <li><a href="main?flag=external" class="manu4"></a></li>
        <authz:authorize ifAllGranted="FUNC_AUTH_DEA"><li><a href="main?flag=deactivated" class="manu5"></a></li></authz:authorize>
        <li><a href="YG_Administration_GWGL.html" class="manu6"></a></li>
        <li><a href="YG_Administration_GWGL.html" class="manu7"></a></li>
    </ul>
    <div class="top_right" style="width:450px;_width:450px;">
    	<font>Hi,${sessionScope.VISITOR_NAME}</font>
    	<ul>
        	<li><a href=""><span><img src="images/top_zt.jpg" /></span> 职谈大厅</a></li>
            <li><a href=""><span><img src="images/top_yg.jpg" /></span> 云过程平台</a></li>
            <authz:authorize ifAllGranted="FUNC_AUTH_SYS"><li><a href="main?flag=homepage" ><span><img src="images/top_sz.jpg" /></span> 系统设置</a></li></authz:authorize>
            <li><c:url value="/j_spring_security_logout" var="logoutUrl"/><a href="${logoutUrl}">[退出]</a></li>
        </ul>
        <h1>房立方地产经纪人管理系统</h1>
    </div>
</div>