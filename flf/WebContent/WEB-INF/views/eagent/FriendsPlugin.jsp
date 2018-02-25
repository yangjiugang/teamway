<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="Out" id="Out">
          <div class="rightTittle">
          	<font>我的好友</font><span><img src="images/zhankai(black).jpg" class="updown"/></span>
          </div> 
          <div class="Content">
           	<div class="right-l-c-l">
			  <c:forEach items="${userFriends}" var="friend">
			  	 <div class="fangmis">
		             <dl>
		                <img src="${friend.userInfo.photoPath }" border="0" />
		                <dd>${friend.userInfo.name }</dd>
		                <dd><span>常住地：${friend.userInfoDetail.registeredAddress}</span><span>关注人数：${friend.userInfo.bhri }</span></dd>
		                <dd>擅长楼盘：${friend.userInfo.userSkills}</dd>
		             </dl>
            	 </div>
			  </c:forEach>
              
			</div>
			</div>
         </div> 
</body>
</html>