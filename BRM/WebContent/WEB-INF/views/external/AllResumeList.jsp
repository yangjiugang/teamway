<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title>在线简历</title>
	<style type="text/css">  
		<!--  
		body {  
		    padding:0;  
		    font:12px "宋体";  
		}  
		  
		#lib_Tab {  
		   
		    margin:0px;  
		    padding:0px;  
		    margin-bottom:15px;  
		}  
		.lib_tabborder {  
		    border:1px solid #95C9E1;  
		}  
		.lib_Menubox {  
		    height:28px;  
		    line-height:28px;  
		    position:relative;  
		}  
		.lib_Menubox ul {  
		    margin:0px;  
		    padding:0px;  
		    list-style:none;  
		    position:absolute;  
		    top:3px;  
		    left:0;  
		    margin-left:10px;  
		    height:25px;  
		    text-align:center;  
		}  
		.lib_Menubox li {  
		    float:left;  
		    display:block;  
		    cursor:pointer;  
		    width:114px;  
		    color:#949694;  
		    font-weight:bold;  
		    margin-right:2px;  
		    height:25px;  
		    line-height:25px;  
		    background-color:#E4F2FD  
		}  
		/*  www.codefans.net */  
		.lib_Menubox li.hover {  
		    padding:0px;  
		    background:#fff;  
		    width:116px;  
		    border-left:1px solid #95C9E1;  
		    border-top:1px solid #95C9E1;  
		    border-right:1px solid #95C9E1;  
		    color:#739242;  
		    height:25px;  
		    line-height:25px;  
		}  
		.lib_Contentbox {  
		    clear:both;  
		    margin-top:0px;  
		    border-top:none;  
		    height: 700px;
		    padding-top:8px;  
		}  
		-->  
	</style>  
	<script>  
		
		
		function setTab(name,cursel,n){  
		 for(i=1;i<=n;i++){  
		  var menu=document.getElementById(name+i);  
		  var con=document.getElementById("con_"+name+"_"+i);  
		  menu.className=i==cursel?"hover":"";  
		  con.style.display=i==cursel?"block":"none";  
		 }  
		}  
		
	</script>  
</head>
<body>
  <div id="lib_Tab">  
	  <div class="lib_Menubox lib_tabborder">  
	    <ul>  
	      <li id="two1" onclick="setTab('two',1,4)"class="hover"  >人才热线</li>  
	      <li id="two2" onclick="setTab('two',2,4)">前程无忧</li>  
	      <li id="two3" onclick="setTab('two',3,4)">58同城</li>  
	      <li id="two4" onclick="setTab('two',4,4)">中华英才网</li>
		  
	    </ul>  
	  </div>  
	  <div class="lib_Contentbox lib_tabborder">  
	    <div id="con_two_1" >
	         <iframe src="<%=path %>/searchCjol?key=${parameter.key}&updateTime=${parameter.updateTime}&location=${parameter.location}" name="right" id="right" height="100%" width="100%" frameborder="0"></iframe>
	    </div>  
	    <div id="con_two_2" style="display:none">
	    	<!-- <iframe src="<%=path %>/search58?key=${parameter.key}" name="right" id="right" height="100%" width="100%" frameborder="0"></iframe> -->
	    </div>  
	    <div id="con_two_3" style="display:none">
	    	<iframe src="<%=path %>/search58?key=${parameter.key}" name="right" id="right" height="100%" width="100%" frameborder="0"></iframe>
	    </div>  
	    <div id="con_two_4" style="display:none">
	    	<!-- <iframe src="<%=path %>/search58?key=${parameter.key}" name="right" id="right" height="100%" width="100%" frameborder="0"></iframe> -->
	    </div>  
		
	  </div>  
	</div>  
</body>
</html>