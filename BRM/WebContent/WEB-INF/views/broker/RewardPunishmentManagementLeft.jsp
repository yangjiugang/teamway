<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="left1">
    	<ul class="left_top zp_ltop">
        	<li style="border:none; width:170px;"><a href="javascript:parent.window.changeRight('RewardPunishmentManagement?type=1')">上月奖励 （${lastMonthReward }）</a></li>
         </ul>
        <ul class="left_top zp_ltop">
        	<li style="border:none; width:170px;"><a href="javascript:parent.window.changeRight('RewardPunishmentManagement?type=2')">上月处罚 （${lastMonthPunish }）</a></li>
         </ul>  
    </div>
</body>
</html>