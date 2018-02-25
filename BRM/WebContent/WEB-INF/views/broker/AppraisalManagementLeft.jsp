<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<title>Insert title here</title>
<script type="text/javascript">
	function histroyCount(month){
		var year =document.getElementById("year").value;
		parent.window.changeRight('AppraisalManagement?month='+month+'&year='+year);		
	}
	function url(){
		parent.window.changeRight('AppraisalManagementPage?page=AppraisalHistoryRecordAnalyse');
	}
</script>
</head>
<body>
	<div class="left">
    	<ul class="left_top zp_ltop">
        	<!--<li style="border:none;"><a href="">当月绩效导入</a></li>-->
        	<li style="border:none; width:170px;"><a onclick="url()">历史绩效结构分析</a></li>
         </ul>  
        <dl class="year">
        	<dt style="color:#3662b4; font-size:14px;">历史绩效查询/统计</dt>
            <dd style="margin-left:10px;">
            <select id="year" onchange="histroyCount('0')">
	            <option value="2012">2012年</option>
	            <option value="2011">2011年</option>
	            <option value="2010">2010年</option>
	            <option value="2009">2009年</option>
	            <option value="2008">2008年</option>
	            <option value="2007">2007年</option>
	            <option value="2006">2006年</option>
	            <option value="2005">2005年</option>
	            <option value="2004">2004年</option>
	            <option value="2003">2003年</option>
	            <option value="2002">2002年</option>
            </select><a onclick="histroyCount('0')">全年</a></dd>
            <dd><a onclick="histroyCount('12')">12月</a></dd>
            <dd><a onclick="histroyCount('11')">11月</a></dd>
            <dd><a onclick="histroyCount('10')">10月</a></dd>
            <dd><a onclick="histroyCount('09')">09月</a></dd>
            <dd><a onclick="histroyCount('08')">08月</a></dd>
            <dd><a onclick="histroyCount('07')">07月</a></dd>
            <dd><a onclick="histroyCount('06')">06月</a></dd>
            <dd><a onclick="histroyCount('05')">05月</a></dd>
            <dd><a onclick="histroyCount('04')">04月</a></dd>
            <dd><a onclick="histroyCount('03')">03月</a></dd>
            <dd><a onclick="histroyCount('02')">02月</a></dd>
            <dd><a onclick="histroyCount('01')">01月</a></dd>
        </dl> 
    </div>
</body>
</html>