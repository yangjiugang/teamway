<%
/**********************************************************************
 * 得到页面的URL 地址
 * 2012-3-26 邓祥 新建
 **********************************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
        HttpServletRequest requests = (HttpServletRequest)pageContext.getRequest();
        StringBuffer sbAddress = new StringBuffer(256);
        sbAddress.append("<!--  \u5730\u5740\uFF1A");
        String strScheme = requests.getScheme();
        sbAddress.append(strScheme);
        sbAddress.append("://");
        sbAddress.append(requests.getServerName());
        int port = request.getServerPort();
        if("http".equals(strScheme) && port != 80 || "https".equals(strScheme) && port != 443)
        {
            sbAddress.append(':');
            sbAddress.append(requests.getServerPort());
        }
        sbAddress.append("  -->");
        //这里输出像 <!--  地址： http://localhost:8080  -->
        out.println(sbAddress.toString());
        StringBuffer sbInfo = new StringBuffer(256);
        sbInfo.append("<!--  \u6587\u4EF6\u8DEF\u5F84\uFF1A");
        sbInfo.append(requests.getRequestURI());
        sbInfo.append("  -->");
        //这里输出像 <!--  文件路径：/flf/WEB-INF/views/fparty/test1.jsp  -->
        out.println( sbInfo.toString());
	%>