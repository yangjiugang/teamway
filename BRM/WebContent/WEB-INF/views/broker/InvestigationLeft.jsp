<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人首页</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
</head>

<body>
	<div class="left1">
    	<!--<ul class="left_top">
        	<li><a href="">+ 添加分类</a></li><li><a href="">重命名</a></li><li style="border:none;"><a href="">删除</a></li>
         </ul> --> 
      <form>
        <dl class="checkbox">
        	<dt><img src="images/tree1.jpg" /><a href="javascript:parent.window.changeRight('activityManagement?testStatus=9')">调查活动管理</a></dt>
            <dd><a href="javascript:parent.window.changeRight('activityManagement?testStatus=0')">未开始 (${StatusCount0})</a></dd>
            <dd><a href="javascript:parent.window.changeRight('activityManagement?testStatus=1')">进行中 (${StatusCount1})</a></dd>
          	<dd><a href="javascript:parent.window.changeRight('activityManagement?testStatus=2')">已完成 (${StatusCount2})</a></dd>
            <dd><a href="javascript:parent.window.changeRight('activityManagement?testStatus=3')">终止 (${StatusCount3})</a></dd>
          	<dd><a href="javascript:parent.window.changeRight('activityManagement?testStatus=4')">删除 (${StatusCount4})</a></dd>
            <dt><img src="images/tree1.jpg" /><a href="javascript:parent.window.changeRight('wjManageList?typeId=0')">问卷管理</a></dt>
            <c:forEach items="${paperTypes }" var="type">
          	<dd><a href="javascript:parent.window.changeRight('wjManageList?typeId=${type.typeId }')">${type.typeName } (${type.count })</a></dd>
          	</c:forEach>
          	<dt><img src="images/tree1.jpg" /><a href="javascript:parent.window.changeRight('QuestionLibraryList')">题库管理</a></dt>
          	<dt><img src="images/tree1.jpg" />类型管理</dt>
            <dd><a href="javascript:parent.window.changeRight('brokerPage?page=ActivityTypeManage')">调查活动管理</a></dd>
            <dd><a href="javascript:parent.window.changeRight('brokerPage?page=PaperyTypeManage')">问卷管理</a></dd>
          	<dd><a href="javascript:parent.window.changeRight('brokerPage?page=LibraryTypeManage')">题库管理</a></dd>
        </dl>
      </form>
    </div>
</body>
</html>