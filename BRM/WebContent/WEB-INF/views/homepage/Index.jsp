<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人首页</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
</head>
<body>
<%@include file="Head.jsp" %>
<div class="breadCrumb">
    	经纪人首页 >> 经纪人管理 >> 经纪人档案管理
</div>
<!--end中间选项卡，面包屑-->
<!--中间-->
<div class="middle">
	<div class="left3">
    	<ul class="M_pic">
            <li>
                <img  src="images/y_img1.jpg" />
                <ul class="M_font">
                    <li><a href="YG_Administration_ZPGL.html"><h2>招聘管理</h2></a></li>
                    <li><a href="YG_Administration_ZPGL.html"><p>招聘申请管理(招聘任务管理)招聘申请管理(招聘任务管理)招聘申请管理(招聘任务管理)招聘申请管理(招聘</p></a></li>
                </ul>
            </li>
            <li>
                <img  src="images/y_img2.jpg" />
                <ul class="M_font">
                    <li><a href="YG_Administration_YDGL.html"><h2>外部经纪人库管理</h2></a></li>
                    <li><a href="YG_Administration_YDGL.html"><p>管理(招聘任务管理)招聘申请管理(招聘任务管理)招聘申请管理(招聘</p></a></li>
                </ul>
            </li>
            <!--<li>
                <img  src="images/y_img3.jpg" />
                <ul class="M_font">
                    <li><a href="YG-Administration2-YGDA.html"><h2>员工档案管理</h2></a></li>
                    <li><a href=""><p>招聘申请管理(招聘任务管理)招聘申请管理(招聘</p></a></li>
                </ul>
            </li>-->
            <li>
                <img  src="images/y_img5.jpg" />
                <ul class="M_font">
                    <li><a href="YG_Administration_XCFLGL.html"><h2>薪酬福利管理</h2></a></li>
                    <li><a href="YG_Administration_XCFLGL.html"><p>招聘申请管理(招聘任务管理)招聘申请管理(招聘任务管理)招聘申请管理(招聘任</p></a></li>
                </ul>
            </li>
            <li>
                <img  src="images/y_img6.jpg" />
                <ul class="M_font">
                    <li><a href="YG_Administration_JXGL.html"><h2>经纪人才梯队管理</h2></a></li>
                    <li><a href="YG_Administration_JXGL.html"><p>请管理(招聘请管理(招聘请管理(招聘请管理(招聘请管理(招聘</p></a></li>
                </ul>
            </li>
            <!--<li>
                <img  src="images/y_img7.jpg" />
                <ul class="M_font">
                    <li><a href="YG-Administration2-PXRYGL.html"><h2>培训管理</h2></a></li>
                    <li><a href=""><p>招聘申管理)招聘申请管理(招聘任务管理)招聘申请管理(招聘任务管理)招聘申请管理(招聘</p></a></li>
                </ul>
            </li>-->
            <li>
                <img  src="images/y_img3.jpg" />
                <ul class="M_font">
                  <li><a href="YG_Administration_DCGL.html"><h2>调查活动管理</h2></a></li>
                    <li><a href="YG_Administration_DCGL.html"><p>招聘申请管理(招聘任务管理)招聘申请管理(招聘任聘任务管理)招聘申请管理(招聘</p></a></li>
                </ul>
            </li>
            <li>
                <img  src="images/y_img8.jpg" />
                <ul class="M_font">
                    <li><a href="YG_Administration_YGGX.html"><h2>经纪人关系管理</h2></a></li>
                    <li><a href="YG_Administration_YGGX.html"><p>招聘申请管招聘申请管理(招聘任务管理)</p></a></li>
                </ul>
            </li>
            <li>
                <img  src="images/y_img6.jpg" />
                <ul class="M_font">
                	<li><a href="YG-Administration2-GZJG.html"><h2>经纪人结构分析</h2></a></li>
                    
                    <li><a href="YG_Administration_KQGL.html"><p>招聘申请管理(招聘请管理(招聘请管理(招聘请管理(招聘</p></a></li>
                </ul>
            </li>
            <li>
                <img  src="images/y_img7.jpg" />
                <ul class="M_font">
                    <li><a href="LC_Administration_RW.html"><h2>工作流</h2></a></li>
                    <li><a href="LC_Administration_RW.html"><p>招聘申请管理(招聘任务管理)招招聘任务管理)</p></a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="right3">
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
        	<authz:authorize ifAllGranted="FUNC_AUTH_HOM_05"><li><a href="main?flag=todayInterview">今日面试（${todayInterviewCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_06"><li><a href="main?flag=todayJob">今日入职（${todayJobCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_07"><li><a href="main?flag=todayTraining">今日培训（${todayTrainingCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_08"><li><a href="main?flag=todaySurvey">今日调查（${todaySurveyCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_09"><li><a href="main?flag=todayAppointments">今日约谈（${todayAppointmentsCount }）</a></li></authz:authorize>
            <authz:authorize ifAllGranted="FUNC_AUTH_HOM_10"><li><a href="main?flag=todaySiuhong">今日受访（${todayAppointmentsCount }）</a></li></authz:authorize>
            <!--<li><a href="">今日生日（6）</a></li>-->
        </ul>       
        <ul class="right_dowm">
        	<li><a href="">经纪人资源管理动态分析</a></li>
            <li><a href="YG_Administration_BLRZ.html">添加简历</a></li>
            <li><a href="LC_Administration_RW.html">发起与经纪人有关的流程</a></li>
         </ul> 
    </div>
</div>
<!--end中间-->
</body>
</html>