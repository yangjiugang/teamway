<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新房专卖</title>
<link rel="stylesheet" type="text/css" href="css/portal/layout.css"/>
<link rel="stylesheet" type="text/css" href="css/portal/line.css"/>
<link rel="stylesheet" type="text/css" href="css/portal/monopolyofsale.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/transportMove.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript">
$(function(){
	$("#expand").click(function(){
		/*var a=$(this).hide();*/
		$("#isExpand").val("none");
		$("#yingcang").slideDown("slow");
		$("#expand").css({display:"none"});
		$("#retracting").css({display:"block"});
		/*alert(a);*/
		});
	$("#retracting").click(function(){
		$("#isExpand").val("block");
		$("#yingcang").slideUp("slow");
		$("#retracting").css({display:"none"});
		$("#expand").css({display:"block"});	
		});
	
	// 判断收缩
	if("${isExpand}" == 'block' || "${isExpand}" == ''){
		$("#yingcang").hide();
		$("#expand").css({display:"block"});
		$("#retracting").css({display:"none"});
	}else{
		$("#yingcang").show();
		$("#expand").css({display:"none"});
		$("#retracting").css({display:"block"});
	}
	
	//目标城市
	var city = eval(Constant.city);
	for(var i=0;i<city.length;i++){
		if("${houseGroupInfoCon.groupLineDesc }"==city[i].text){
			$("#ulcity ul").append("<li><a class = 'selected' style='color:#FFF' href='javascript:selectValue(\"city\",\""+city[i].text+"\"," + city[i].id + ")'>" + city[i].text + "</a></li>");				
		}else{
			$("#ulcity ul").append("<li><a href='javascript:selectValue(\"city\",\"" + city[i].text + "\"," + city[i].id + ")'>" + city[i].text + "</a></li>");
		}
		if(i == city.length - 1){
			$("#ulcity span").append("<a href='javascript:selectValue(\"city\",\"不限\")'>不限</a>");
		}
	}
	// 行程时间
	var journey = eval(Constant.journey);
	for(var i =0;i<journey.length;i++){
		if("${houseGroupInfoCon.groupDuration }"==journey[i]){
			$("#uljourney ul").append("<li><a class = 'selected' style='color:#FFF' href='javascript:selectValue(\"journey\",\""+journey[i]+"\"," + 0 + ")'>" + journey[i] + "</a></li>");				
		}else{
			$("#uljourney ul").append("<li><a href='javascript:selectValue(\"journey\",\"" + journey[i] + "\"," + 0 + ")'>" + journey[i] + "</a></li>");
		}
		if(i == journey.length - 1){
			$("#uljourney span").append("<a href='javascript:selectValue(\"journey\",\"不限\")'>不限</a>");
		}
	}		
	//发团日期
	var grouptime = eval(Constant.grouptime);
	for(var i =1;i<journey.length;i++){
		if("${houseGroupInfoCon.grouptime }"==grouptime[i].id){
			$("#ulgrouptime ul").append("<li><a class = 'selected' style='color:#FFF' href='javascript:selectValue(\"grouptime\",\""+grouptime[i].text+"\"," + grouptime[i].id + ")'>" + grouptime[i].text + "</a></li>");				
		}else{
			$("#ulgrouptime ul").append("<li><a href='javascript:selectValue(\"grouptime\",\"" + grouptime[i].text + "\"," + grouptime[i].id + ")'>" + grouptime[i].text + "</a></li>");
		}
		if(i == grouptime.length - 1){
			$("#ulgrouptime span").append("<a href='javascript:selectValue(\"grouptime\",\"不限\")'>不限</a>");
		}
	}
	//购房目的
	var buytoletpurpose = eval(Constant.buytoletpurpose);
	for(var i =0;i<buytoletpurpose.length;i++){
		if("${houseGroupInfoCon.housePurpose }"==buytoletpurpose[i].id){
			$("#ulbuytoletpurpose ul").append("<li><a class = 'selected' style='color:#FFF' href='javascript:selectValue(\"buytoletpurpose\",\""+buytoletpurpose[i].text+"\"," + buytoletpurpose[i].id + ")'>" + buytoletpurpose[i].text + "</a></li>");				
		}else{
			$("#ulbuytoletpurpose ul").append("<li><a href='javascript:selectValue(\"buytoletpurpose\",\"" + buytoletpurpose[i].text + "\"," + buytoletpurpose[i].id + ")'>" + buytoletpurpose[i].text + "</a></li>");
		}
		if(i == buytoletpurpose.length - 1){
			$("#ulbuytoletpurpose span").append("<a href='javascript:selectValue(\"buytoletpurpose\",\"不限\")'>不限</a>");
		}
	}
	//房产性质
	var houseproperty = eval(Constant.houseproperty);
	for(var i =0;i<houseproperty.length;i++){
		if("${houseGroupInfoCon.houseProperties }"==houseproperty[i].id){
			$("#ulhouseproperty ul").append("<li><a class = 'selected' style='color:#FFF' href='javascript:selectValue(\"houseproperty\",\""+houseproperty[i].text+"\"," + houseproperty[i].id + ")'>" + houseproperty[i].text + "</a></li>");				
		}else{
			$("#ulhouseproperty ul").append("<li><a href='javascript:selectValue(\"houseproperty\",\"" + houseproperty[i].text + "\"," + houseproperty[i].id + ")'>" + houseproperty[i].text + "</a></li>");
		}
		if(i == houseproperty.length - 1){
			$("#ulhouseproperty span").append("<a href='javascript:selectValue(\"houseproperty\",\"不限\")'>不限</a>");
		}
	}
	//线路性质
	var lineproperty = eval(Constant.lineproperty);
	for(var i =0;i<lineproperty.length;i++){
		if("${houseGroupInfoCon.lineProperties }"==lineproperty[i].id){
			$("#ullineproperty ul").append("<li><a class = 'selected' style='color:#FFF' href='javascript:selectValue(\"lineproperty\",\""+lineproperty[i].text+"\"," + lineproperty[i].id + ")'>" + lineproperty[i].text + "</a></li>");				
		}else{
			$("#ullineproperty ul").append("<li><a href='javascript:selectValue(\"lineproperty\",\"" + lineproperty[i].text + "\"," + lineproperty[i].id + ")'>" + lineproperty[i].text + "</a></li>");
		}
		if(i == lineproperty.length - 1){
			$("#ullineproperty span").append("<a href='javascript:selectValue(\"lineproperty\",\"不限\")'>不限</a>");
		}
	}
}
);
function selectValue(type,value,id){

	//document.searchForm.reset();		
	//$("#groupDuration").val(""); //行程时间
	//$("#grouptime").val(""); //发团时间
	//$("#groupLineDesc").val(""); //目标城市
	//$("#housePurpose").val(0); //购房目的
	//$("#houseProperties").val(0);//房产性质
	//$("#lineProperties").val(0); //线路性质
if(type=="city"){
	if(value=="不限"){
		$("#groupLineDesc").val("");
	}else{
		$("#groupLineDesc").val(value); //目标城市			
	}
}else if(type=="journey"){
	if(value=="不限"){
		$("#groupDuration").val("");
	}else{
		$("#groupDuration").val(value);			
	}
}else if(type=="grouptime"){
	if(value=="不限"){
		$("#grouptime").val(1);
	}else{
		$("#grouptime").val(id);			
	}
}else if(type=="buytoletpurpose"){
	if(value=="不限"){
		$("#housePurpose").val(0);
	}else{
		$("#housePurpose").val(id);			
	}
}else if(type=="houseproperty"){
	if(value=="不限"){
		$("#houseProperties").val(0);
	}else{
		$("#houseProperties").val(id);			
	}
}else if(type=="lineproperty"){
	if(value=="不限"){
		$("#lineProperties").val(0);
	}else{
		$("#lineProperties").val(id);			
	}
}
	document.searchForm.submit();
}
</script>
</head>

<body>
<!--头部-->
<%@ include file="Header.jsp" %>
<!--End头部-->
<div class="middle">
	<div class="lineSearch">
    	 <div style="margin-top:5px;"><img src="images/searchTop.png" /></div>
  		  <div class="Outboder">
    	<span>目标城市:</span>
        <div id="ulcity">
        	<ul></ul>
            <span></span>
        </div>	
    </div>
     	 <div id="yingcang">
    	<div class="out1">
            <span>行程时间:</span>
            <div id="uljourney">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
        	<span>发团日期:</span>
            <div id="ulgrouptime">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>购房目的:</span>
            <div id="ulbuytoletpurpose">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>房产性质:</span>
            <div id="ulhouseproperty">
                <ul></ul>
                <span></span>
            </div>
        </div>
        <div class="out1">
            <span>线路性质:</span>
            <div id="ullineproperty">
                <ul></ul>
                <span></span>
            </div>
        </div> 
    </div>
    	 <div class="seachFoot">
    	<span><form>
        	<input type="text" value="请输入关键词" onclick="this.select();" class="MFtext"/>
            <input type="image" src="images/seachBut1.jpg" class="MFbut"/>
        </form></span>
    	<div id="expand"></div>
    	<div id="retracting"></div>
    </div>
    </div>
    
    
    <div class="lineSearch" style="margin-top:20px;">
    	<div style="margin:10px 0;"><span class="zai">您的位置： 旅游购房 >> ${HouseGroupInfo.groupName }</span>
    		<div class="top-a-c">
		     <ul>
		       <li><span class="red">32</span>人收藏</li>
		       <li><a href="#">收藏线路</a></li>
				 <li class="ig">(8)</li>
                 <li><a href="#">推荐线路</a></li>
			 </ul>
		  </div>
    	</div>
    	 <div class="wyct">
        	<div class="pic"><img src="images/aa1.jpg" /></div>
            <div class="wyctFont">
            	<div style="overflow:hidden;">
                	<span class="wyctLeft">
                	<h3>${HouseGroupInfo.groupName }</h3>
                    <ul>
                    	<li><font>参团价格：</font><font color="ad050a">${HouseGroupInfo.groupPrice }元</font></li>
                        <li><font>淘房历程：</font>${HouseGroupInfo.groupDuration }</li>
                        <li><font>发团时间：</font><fmt:formatDate value="${HouseGroupInfo.groupStartDate }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
                        <li><font>报名截止时间：</font><fmt:formatDate value="${HouseGroupInfo.groupDeadlineDate}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
                        <li><font>全国电话报名热线：</font>${HouseGroupInfo.groupHotline}</li>
                    </ul>
                </span>
                	<span class="wyctRright"><img src="images/wyct.jpg" /><br /><font>${HouseGroupInfo.attentionCnt}</font>人关注/<font>${HouseGroupInfo.joinCnt}</font>人加入</span>
                </div>
                <span class="imgfont"><img src="images/line.jpg" /><font>&nbsp;${HouseGroupInfo.groupLineDesc}</font></span>
                <p><font>旅游购房:</font>${HouseGroupInfo.groupDesc}</p>
            </div>
        </div>
        
    </div>
    
    <c:forEach items="${travelInfoList }" var="HouseGroupInfo">
    	<c:forEach items="${HouseGroupInfo.houseGroupScheduleList }" var="houseGroupSchedule" varStatus="id">
    		<div class="lineOut">
    		  <c:if  test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)>3 }">
    				<div style="overflow:hidden;">
       		 </c:if>
    		
       			<div class="lineLeft">
        			<span class="Day"></span>
           		 <span class="leftText">
            			<p>${houseGroupSchedule.scheduleDesc } </p><!-- 图片上的 线路描述 -->
            		</span>
       		 </div> 
       		 
       		 <c:if  test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)<=3 }">
        		<div class="lineRight">       		 
       		 </c:if>
       		 <c:if  test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)>3 }">
        		<div class="lineRight" id="line2Right">     		 
       		 </c:if>       		 
        		
        		<!-- 线路楼盘大于3个的时候 -->
        	<c:if test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)>3 }">	
        			<ul>
        		<c:forEach items="${houseGroupSchedule.houseGroupScheduleHouseList }" var="HouseGroupScheduleHouse" varStatus="temp"step="1" begin="0" end="2">
            	<li>            	
            	<a href="getHouseInfoById?houseId=${HouseGroupScheduleHouse.houseId }">
                        <img src="${HouseGroupScheduleHouse.picPath }" /> <!--楼盘的图片  -->
                        	${HouseGroupScheduleHouse.houseName }<!--楼盘的名称  -->
                    </a>
                </li>                
                </c:forEach>  
            </ul>
            <div class="dian"></div>
            <ul id="RUl2">
            	<c:forEach items="${houseGroupSchedule.houseGroupScheduleHouseList }" var="HouseGroupScheduleHouse" varStatus="temp"step="1" begin="3" end="5">
            	<li>            	
            	<a href="getHouseInfoById?houseId=${HouseGroupScheduleHouse.houseId }">
                        <img src="${HouseGroupScheduleHouse.picPath }" /> <!--楼盘的图片  -->
                        	${HouseGroupScheduleHouse.houseName }<!--楼盘的名称  -->
                    </a>
                </li>                
                </c:forEach>
            </ul>
           </c:if> 
           <!-- END -->
           
           <!-- 线路楼盘小于3个的时候 -->
             <c:if test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)<=3 }">
                     			<ul>
        		<c:forEach items="${houseGroupSchedule.houseGroupScheduleHouseList }" var="HouseGroupScheduleHouse">
            	<li>            	
            	<a href="getHouseInfoById?houseId=${HouseGroupScheduleHouse.houseId }">
                        <img src="${HouseGroupScheduleHouse.picPath }" /> <!--楼盘的图片  -->
                        	${HouseGroupScheduleHouse.houseName }<!--楼盘的名称  -->
                    </a>
                </li>                
                </c:forEach>  
            </ul>
             
             </c:if>           
            <!-- END -->
            
         	<div class="dian"></div>
         	<c:if  test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)>3 }">
    				</div>
    			</div>
       		 </c:if>
         	<!-- <c:forEach items="${houseGroupSchedule.houseGroupScheduleEventList }" var="HouseGroupScheduleEvent" varStatus="num">
         	</c:forEach>-->
         	
				<script type="text/javascript">
					$(document).ready(function(){
						$("#line${id.index+1}").transportMove( {transports:[<c:forEach items="${houseGroupSchedule.houseGroupScheduleEventList }" var="HouseGroupScheduleEvent" varStatus="num">
		         		'tools${HouseGroupScheduleEvent.trafficTools }'<c:if test="${!num.last }">,</c:if>
		             	</c:forEach>],content:[<c:forEach items="${houseGroupSchedule.houseGroupScheduleEventList }" var="HouseGroupScheduleEvent" varStatus="num">
		         		'${HouseGroupScheduleEvent.eventContent }'<c:if test="${!num.last }">,</c:if>
		             	</c:forEach>]} );
					});
				</script>
		<c:if test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)<=3 }">
		</c:if>	
		
                    	<c:if test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)<=3 }">
				            <div class="notes">							
						</c:if>
						<c:if test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)>3 }">
				            <div class="notes" id="notes2">							
						</c:if>

		
                 	<div id="textSpan${id.index+1 }" style=" position:absolute;left:0px;"><p>1.26日早九点深圳火车站集合，乘坐K1680深圳-成都列车，4小时后我们将到达成都。</p></div>
                    <div class="slipping" id="line${id.index+1}">
                    	
                    	<c:if test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)<=3 }">
							<span class="SlBg"></span>
						</c:if>
						<c:if  test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)>3 }">
        					<span class="SlBg1"></span>		 
       					 </c:if>						
				<c:if  test="${fn:length(houseGroupSchedule.houseGroupScheduleHouseList)<=3 }">
                   </div>
       		 	</c:if>
            </div>
        </div>
        
    </div>  
   	 </c:forEach>  
    </c:forEach>

    <form action="search" id="searchForm" style="display: none" name="searchForm" method="post">
    	<div id="pagediv">
		<input type="hidden" name="groupDuration" id="groupDuration" value="">
        <input type="hidden" name="grouptime" id="grouptime" value="">
        <input type="hidden" name="groupLineDesc" id="groupLineDesc" value="">
        <input type="hidden" name="housePurpose" id="housePurpose" value="">
        <input type="hidden" name="houseProperties" id="houseProperties" value="">
        <input type="hidden" name="lineProperties" id="lineProperties" value="">
        <input type="hidden" name="isExpand" id="isExpand" value=""/>
        	</div>
    
    </form>
</div>

<!--尾部-->
<div class="footBorder">
	<div class="foot" >
    <div class="dian"></div>
	<div class="footCenter" >
    	<h3><span></span>选择楼盘</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>注册登陆</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>选房秘书</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>线下服务</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>报名置房</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>现场看房</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>签约下定</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>按揭办理</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>购买成功</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    </div>
	<div class="FootInformation">
	<div>
    	<ul>
        	<li><a href="">房立方介绍</a></li>
            <li><a href="">关于我们</a></li>
            <li><a href="">广告服务</a></li>
            <li><a href="">合作伙伴</a></li>
            <li><a href="">联系我们</a></li>
            <li><a href="">诚聘英才</a></li>
            <li><a href="">会员注册</a></li>
            <li><a href="">产品答疑</a></li>
            <li style="border:none;"><a href="">客户投诉</a></li>
        </ul>
    	<span>
        	Copyright © 2011 www.funlifun.com Corporation, All Rights Reserved<br />
            房立方用户服务、信息咨询、技术支持、客服服务热线：0755-61355288
        </span>
    </div>
</div>
</div>
<!--End尾部-->
</body>
</html>
