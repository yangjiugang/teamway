<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="css/portal/globle.css" rel="stylesheet" type="text/css" />
<link href="css/portal/houseInfo_index.css" rel="stylesheet" type="text/css"/>
<link href="css/portal/houseInfo_layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/popupBox.js"></script>

</head>
<body style="background-color: #ffffff;">
<c:forEach items="${housePicInfoList }" var="picInfo" varStatus="status" end="1">
	<div class="banner-a"><img src="${picInfo.picPath }" />
        <ul>
           <li>&nbsp;</li>
           <li>${picInfo.picDesc}　 <a href="showHouseInfoPhotoList?houseId=${picInfo.houseId }" target="_blank" class="grey">查看原图</a></li>
        </ul>
    </div>
</c:forEach>

</body>
</html>