<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
</head>
<body>
  <div class="left16">
		<div class="touxiang">
        	<div class="kuang"></div>
        </div>
        <!--<font class="tongxun">通讯录</font>-->
        <ul class="grjj">
        	<li><font>姓名：</font>赵山河</li>
            <li><font>生日：</font>1989.01.12</li>
            <li><font>部门：</font>综合部</li>
            <li><font>岗位：</font>公关</li>
            <li><font>入职：</font>2010.12.01</li>
            <li><font>座机：</font>0755-24578278-330</li>
            <li><font>手机：</font>13425478951</li>
            <li><font>兴趣爱好：</font>运动、音乐</li>
        </ul>
        <ul class="index_li">
        	<authz:authorize ifAllGranted="FUNC_AUTH_HOM_05"><li><a href="javascript:parent.window.changeRight('homepage_todayInterview')">今日面试（${todayInterviewCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_06"><li><a href="javascript:parent.window.changeRight('homepage_todayJob')">今日入职（${todayJobCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_07"><li><a href="javascript:parent.window.changeRight('homepage_todayTraining')">今日培训（${todayTrainingCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_08"><li><a href="javascript:parent.window.changeRight('homepage_todaySurvey')">今日调查（${todaySurveyCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_09"><li><a href="javascript:parent.window.changeRight('homepage_todayAppointments')">今日约谈（${todayAppointmentsCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_10"><li><a href="javascript:parent.window.changeRight('homepage_todaySiuhong')">今日受访（${todayAppointmentsCount }）</a></li></authz:authorize>
            <!--<li><a href="">今日生日（6）</a></li>-->
        </ul>         
        <ul class="right_dowm">
        	<li><a href="">经纪人资源管理动态分析</a></li>
            <li><a href="YG_Administration_BLRZ.html">添加简历</a></li>
            <li><a href="LC_Administration_RW.html">发起与经纪人有关的流程</a></li>
         </ul> 
    </div>
</body>
</html>