<%@page import="java.io.PrintWriter"%>
<%@page import="com.fc.brms.common.util.ChartUtil"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>

<%
DefaultPieDataset piedataset=(DefaultPieDataset)request.getAttribute("date");
String p = ChartUtil.generatePieChart(piedataset,"调查人统计",400,225,null, new PrintWriter(out));
String p1 = request.getContextPath() + "/servlet/DisplayChart?filename=" + p;
%>
<img src="<%= p1 %>" width=500 height=300 border=0 usemap="#<%= p %>">

</body>
</html>