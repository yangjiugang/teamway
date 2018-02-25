<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
  function gclick(){
	  location.href='activityManagement?testStatus=9';
  }

</script>
</head>
<body>
<div class="right1">
     <div class="dt_out">
        <span>您的问卷已经正确提交，总题数${qlCount }个，完成${qlCount2 }个</span>
        <div style=" padding-left:50px;"><input type="button" value="确 定" class="but1 dt2_but" onclick="gclick();"/></div>
     </div>   
</div>
</body>
</html>

