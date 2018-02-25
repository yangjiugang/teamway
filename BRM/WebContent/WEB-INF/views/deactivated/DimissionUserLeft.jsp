<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人首页</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
function showBlack(){
	window.parent.frames["right"].parentFactor="black:2";
	window.parent.frames["right"].showBlackDimissionUser();
}
</script>
</head>

<body>
	<div class="left1">
    	<ul class="left_top">
        	<li><a href="">+ 添加分类</a></li><li><a href="">重命名</a></li><li style="border:none;"><a href="">删除</a></li>
         </ul>  
        <form>
        <dl>
        	<dt> <img src="images/tree1.jpg" />全部 （5）</dt>
            <dd><input type="checkbox" /> <img src="images/tree2.jpg" />一级部门 （5）</dd>
            <dd><input type="checkbox" /> <img src="images/tree2.jpg" />二级部门 （5）</dd>
            <dd><input type="checkbox" /> <img src="images/tree2.jpg" />三级部门 （5）</dd>
            <dt> <img src="images/tree1.jpg" />技术系 （12）</dt>
            <dd><input type="checkbox" /> <img src="images/tree2.jpg" />CTO （1）</dd>
            <dt> <img src="images/tree2.jpg" />经营管理系 （6）</dt>
			<dt onclick="showBlack();" style="cursor: pointer;"> <img src="images/tree2.jpg"  />黑名单</dt>
        </dl>
        </form> 
    </div>
</body>
</html>