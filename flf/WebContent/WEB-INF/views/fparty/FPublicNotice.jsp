<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript"></script>
  			<span id="ActivitiesOut" class="Out">
            	<!--标题-->
            	<span class="ActivitiesTittle">
                	<font>活动公告</font>
                    <span class="ActivitiesSpan1"></span>
                    <font>新楼盘签约公告</font>
                    <span class="ActivitiesSpan2">
                    	<img src="images/zhankai(black).jpg" class="updown"/>
                    </span>
                </span>
                <!--内容-->
                <div id="ActivitiesContent" class="Content">
                	<!--活动公告的内容-->
             		<div class="BorderRight">
             			<c:forEach items="${eventInfoes}" var="event" varStatus="index1">
	                    	<span>
	                            <img src="images/kk.jpg" />
	                            <ul>
	                                <li><h3>${event.eventTitle}</h3></li>
	                                <li><fmt:formatDate value="${event.eventStartTime}" pattern="yyyy-MM-dd hh:mmaa" /></li>
	                                <li>${event.eventAddress}</li>
	                            </ul>
	                    	</span>
	                    	<c:if test="${!index1.last}">
	                    		<div class="dian" style="margin:5px;"></div>
	                    	</c:if>
                    	</c:forEach>
                    </div>
                    <!--新楼盘签约公告的内容-->
                    <div class="ContentRight">
                    	<c:forEach items="${recentSigns}" var="recSign" varStatus="index2">
                    	<span>
                            <a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" /></a>
                            <ul>
                                <li><a href="../funlifun/lifang/index-gonggao.html"><h3>${recSign.houseName}</h3></a></li>
                                <li>${recSign.housePrice}元/m&sup2;</li>
                                <li>${recSign.fcSysArea.areaName}&nbsp;&ndash;&nbsp;${recSign.businessRegion}</li>
                            </ul>
                    	</span>
                    	<c:if test="${!index2.last}">
                    		<div class="dian" style="margin:5px;"></div>
                    	</c:if>
                    	</c:forEach>
                    </div>
                </div>
            </span>
            <span id="hebdomad" class="Out">
                <span class="hebdomadTittle">
                	<font>本周出团公告</font>
                    <span id="hebdomaddown"><img src="images/zhankai(black).jpg" class="updown" /></span>
                </span>
 
                	<div class="hebdomadContent Content">
                <c:forEach items="${houseGroupInfoes}" var="hginfo" varStatus="index3">
                  <ul>
                       <li><span class="sb"><a href="../funlifun/line.html">${hginfo.groupName }</a></span><span class="sd"><a href="../funlifun/line.html">${hginfo.groupLineDesc }</a></span></li>
                       <li><span class="sb">出团时间：<fmt:formatDate value="${hginfo.groupStartDate}" pattern="yyyy.MM.dd" />-
                       <fmt:formatDate value="${hginfo.groupDeadlineDate}" pattern="yyyy.MM.dd" /></span>
                       	   <span class="sd">特价：<b>${hginfo.groupPrice}</b>元</span></li>
                   </ul>
                	
      				<c:if test="${!index3.last }">
                	<div class="dian" style="margin:5px;"></div>
                	</c:if>
                </c:forEach>
                </div>
             
            </span>
