<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<div class="right1">
        <div class="R_top">
        	<ul class="s_font zp_font">
            	<li><select><option>部门</option></select></li>
                <li><select><option>岗位</option></select></li>
                <li><select><option>职系</option></select></li>
                <li><select><option>职等</option></select></li>
                <li><input type="text" value="请输入关键字"/></li>
                <li><input type="button" class="seach_but"/></li>
            </ul> 
        </div>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                    <li><input type="button" value="薪酬结构饼形图" class="but1" /></li>
                    <li><input type="button" value="当月薪酬福利调整" class="but1" onclick="javascript:location.href='Fulitiaozheng.html';return false;"  /></li>
                    <li><input type="button" value="历史薪酬福利报表查询" class="but1" onclick="javascript:location.href='xinchoufulibaobiao.html';return false;" /></li>
                    <li><input type="button" value="当月工资条生成与发布" class="but1" onclick="javascript:location.href='YG_Administration_DYXCFLSC2.html';return false;" /></li>
                    
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div>        
        <div id="gridContainer">
        	<table id="list"></table>
			<div id="pageList"></div>
        </div>
    </div>
</body>
</html>