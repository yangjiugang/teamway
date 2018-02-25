<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>房乐会首页</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/tabs/tabs.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript"> 
 $(document).ready(function(){
	 refresh();
}); 
 
 function refresh(){
	 $(".Out").each(function(){
			var obj = $(this);
			obj.find(".updown").toggle(function(){
				$(this).attr("src", "images/zhankai.jpg");
				obj.find(".ycLi").slideUp('slow');
			},function(){
				$(this).attr("src", "images/zhankai1.jpg");
				obj.find(".ycLi").slideDown('slow');
			});
		});
		$(".Out").each(function(){
			var obj = $(this);
			obj.find(".updown").toggle(function(){
				$(this).attr("src", "images/zhankai(black).jpg");
				obj.find(".Content").slideUp('slow');
			},function(){
				$(this).attr("src", "images/zhankai(black)1.jpg");
				obj.find(".Content").slideDown('slow');
			});
		});
 }
</script>

<script type="text/javascript"> 
$(document).ready(function(){
	var tab='${tabTag}';
	if(tab==null || tab==''){
		tab="#tab1";
	}else{
		tab="#tab"+tab;
	}
	$("#tabs").tabs({
		width:"495px",
		defCheck:tab,
		functions:{
			"#tab1":doTab1,
			"#tab2":doTab2,
			"#tab3":doTab3,
			"#tab4":doTab4
		} 
	});
	var curPage = 1;
	var pageSize = 5;
	sysSendMsg(curPage, pageSize);
	FengSendMsg(curPage, pageSize); 
	userSendMsg(curPage, pageSize);
});
function doTab1(){
	
}
function doTab2(){
	
}
function doTab3(){
	
}
function doTab4(){
	
} 

function sysSendMsg(curPage, pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fIndexSysMsg?msgSendType=1',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
			$("#xitong").html(msg.rowCount);
       		$("#tab1").empty();
			for(var i=0;i<msg.datas.length;i++){
				$("#tab1").append(
						
						"<div class='Out flhxx312'>"
	            		+"<div>"
		                	+"<span class='tittle'><img src='images/fanglifang.jpg' />"
		                	+"<h3>系统<font>"+msg.datas[i].msgSendTime+"</font>你选择蜂蜜赵山河做房秘书！</h3>"
		                	+"<div><img  src='images/zhankai(black)1.jpg' class='updown'/></div></span>"
		                    +"<span  class='ycLi center'>"
		                    	+"<p>"+msg.datas[i].msgContent+"</p>"
		                        +"<div> <font style='float:right;'>"
		                        +"<a href='javascript:delSysMsg("+msg.datas[i].msgId+",sysSendMsg,"+curPage+","+ pageSize+")'>删除</a></font></div>"
		                    +"</span>"
		                    +"<div class='dian'></div></div></div>"
				); 
			}; 
			$("#tab1").append("<div id='page1'></div>");
			$("#page1").pager({curPage:msg.curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:sysSendMsg});
		}
	});
	refresh();
}

function FengSendMsg(curPage, pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fIndexFengMsg?customerId=${customerId}',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
			$("#fengmi").html(msg.rowCount);
       		$("#tab3").empty();
       		if(msg.datas!=""){
				for(var i=0;i<msg.datas.length;i++){
					$("#tab3").append(
							"<div  class='Out flhxx312'>"
		            		+"<div>"
	                		+"<span class='tittle'><img src='images/fanglifang.jpg' /><h3>"+msg.datas[i].sendUserName+"<font>"
	                		+msg.datas[i].sendTime
	                		+"</font>你选择蜂蜜'赵山河'做房秘书！</h3><div><img  src='images/zhankai(black)1.jpg' class='updown'/></div></span>"
	                		+"<span  class='ycLi center'>"
	                    	+"<p>"+msg.datas[i].msgContent+"</p>"
	                        +"<div> <font style='float:right;'><a href='javascript:delMsg("+msg.datas[i].id+",FengSendMsg,"+curPage+","+ pageSize+")'>删除</a></font></div></span>"
	                		+"<div class='dian'></div></div></div>"		
					); 
				}; 
				$("#tab3").append("<div id='page3'></div>");
				$("#page3").pager({curPage:msg.curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:FengSendMsg});
       		}else{
				$("#tab3").append("<div><span>暂时没有消息</span></div>");
			}
			
		}
	});
	refresh();
}
function userSendMsg(curPage, pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fIndexUserMsg?customerId=${customerId}&msgType=1',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
			$("#yonghu").html(msg.rowCount);
       		$("#tab4").empty();
			for(var i=0;i<msg.datas.length;i++){
				$("#tab4").append(
						"<div  class='Out flhxx312'>"
	            		+"<div>"
                		+"<span class='tittle'><img src='images/fanglifang.jpg' /><h3>"+msg.datas[i].sendUserName+"<font>"
                		+msg.datas[i].sendTime
                		+"</font>你选择蜂蜜'赵山河'做房秘书！</h3><div><img  src='images/zhankai(black)1.jpg' class='updown'/></div></span>"
                		+"<span id='center' class='ycLi'>"
                    	+"<p>"+msg.datas[i].msgContent+"</p>"
                        +"<div> <font style='float:right;'><a href='javascript:delMsg("+msg.datas[i].id+",userSendMsg,"+curPage+","+ pageSize+")'>删除</a></font></div></span>"
                		+"<div class='dian'></div></div></div>"		
				); 
			}; 
			$("#tab4").append("<div id='page4'></div>");
			$("#page4").pager({curPage:msg.curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:userSendMsg});
		}
	});
	refresh();
}

function delMsg(id,fun,curPage, pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fIndexDelUserMsg?msgId='+id,
		dataType:'json',
		callBackFn:function(msg){
		}
	});
	
	fun(curPage, pageSize);
}
function delSysMsg(id,fun,curPage, pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fIndexDelSysMsg?msgId='+id,
		dataType:'json',
		callBackFn:function(msg){
			alert("暂不提供系统消息删除功能！");
		}
	});
	
	fun(curPage, pageSize);
}
</script>


<script type="text/javascript"> 
var customerId=${customerId };
$(document).ready(function(){	
	var curSkimPage= ${skimPage.curPage};
	var pageSkimCount = ${skimPage.pageCount};
    $("#miniSkimPage").miniPager({curPage:curSkimPage, pageSize:5, pageCount:pageSkimCount, goPageCall:goPage});
    
    var curRecommendPage= ${userRecommendPage.curPage};
	var pageRecommendCount = ${userRecommendPage.pageCount};
    $("#miniRecommendPage").miniPager({curPage:curRecommendPage, pageSize:5, pageCount:pageRecommendCount, goPageCall:goRecommendPage});
    
});

function goPage(curPage, pageSize) {
	 $.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/FSkimHouses',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,			
		callBackFn:function(msg){	
		    $("#skimHouse").empty();
			for(var i=0;i<msg.length;i++){	
				$("#skimHouse").append( "<li><img src='"+msg[i].housePic+"' width='77' height='49'/>"
			             +"<ul><li><h3>"+msg[i].houseName +"</h3></li><li>"+msg[i].housePrice+"元/m&sup2;</li>"
			             +"<li>"+msg[i].fcSysArea.areaName+"&nbsp;&ndash;&nbsp;"+msg[i].businessRegion+"</li></ul>"
			             +"<div class='dian' style='margin:5px;'></div></li>"
				); 
			} 
		}
	}); 
}

function goRecommendPage(curPage, pageSize) {
	 $.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/FRecommendHouses',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize+"&customerId="+customerId,			
		callBackFn:function(msg){	
		    $("#recommendHouse").empty();
			for(var i=0;i<msg.length;i++){	
				$("#recommendHouse").append( "<li><img src='"+msg[i].housePic+"' width='77' height='49'/>"
			             +"<ul><li><h3>"+msg[i].houseName +"</h3></li><li>"+msg[i].housePrice+"元/m&sup2;</li>"
			             +"<li>"+msg[i].fcSysArea.areaName+"&nbsp;&ndash;&nbsp;"+msg[i].businessRegion+"</li></ul>"
			             +"<div class='dian' style='margin:5px;'></div></li>"
				); 
			} 
		}
	}); 
}
</script>

</head>

<body>
<%@ include file="FHeader.jsp" %>
<div class="middle">
<!--左边-->
 	<%@ include file="FLeft.jsp" %>
<!--End左边--> 
<!--右边-->
    <div class="FLHRight">
    
		<div class="Rightleft">
     	 <%@ include file="FPublicNotice.jsp" %> 
             <div id="tabs" style="padding-top: -20px;">
             <a name="A10" id="A10"></a> 
				<ul class="indexflhxx31">
				<li id="#tab1">系统消息(<span id="xitong"></span>)</li>
				<li id="#tab2">楼盘消息</li>
				<li id="#tab3">蜂蜜消息(<span id="fengmi"></span>)</li>
				<li id="#tab4">我的消息(<span id="yonghu"></span>)</li></ul>
				<div id="tab1">
				<div class='Out flhxx312'>
            		<div>
	                	<span class='tittle'><img src='images/fanglifang.jpg' />
	                	<h3>马超<font>2011-12-15 11:25</font>你选择蜂蜜"赵山河"做房秘书！</h3>
	                	<div><img  src='images/zhankai(black)1.jpg' class='updown'/></div></span>
	                    <span  class='ycLi center'>
	                    	<p>fasssssssssssssssssssssssssddddddddddddddddf
	                    	safddddddddddddddddddddddddddddddddddddd
	                    	asdffffffffffffffffffffffffffff
	                    	asfddddddddddddddd</p>
	                        <div> <font style='float:right;'><a href=''>删除</a></font></div>
	                    </span>
	                    <div class='dian'></div>
                	</div>	
	            </div>
	            <div id="page1"></div>
				</div>
				<div id="tab2"></div>
				<div id="tab3"></div>
				<div id="tab4"></div>
			</div>
        </div>
        
        <div class="Rightright">
			<%@ include file="Rnickname.jsp" %>
			<img src="images/wybm.jpg" border="0" usemap="#Map" />
          <map name="Map" id="Map">
            <area shape="rect" coords="43,42,244,66" href="participateSeeHouse?curPage=1&pageCount=2" />
            <area shape="rect" coords="61,68,249,95" href="houseGroup?curPage=1&pageCount=2" />
            <area shape="rect" coords="16,98,227,123" href="#" />
          </map>
 
           <div class="rightTittle">
          	<font>蜂蜜推荐的楼盘</font><span class="aa"><img src="images/zhankai(black).jpg" /></span>
         </div> 
         
           <ul class="corridorConter" id="recommendHouse">
             <c:if test="${fn:length(listRecommendHouseInfo) == 0 }">
              <li>
        		没有找到符合要求的楼盘!
        	  </li>	
        	</c:if>
               <c:forEach items="${listRecommendHouseInfo }" var="houseInfo">
           
           		<li>
                	<img src="${houseInfo.housePic }" width='77' height='49'/>
                    <ul>   
                        	<li><h3>${houseInfo.houseName }</h3></li>
                            <li>${houseInfo.housePrice}元/m&sup2;</li>
                            <li>${houseInfo.fcSysArea.areaName}&nbsp;&ndash;&nbsp;${houseInfo.businessRegion}</li>
                     </ul>
                    
                       <div class="dian" style="margin:5px;"></div>
                    
                </li>
                </c:forEach>
                
           </ul>
           <div id="miniRecommendPage" style="margin: 0 0 0 160px;"></div>
           
           <div class="rightTittle">
          	<font>您可能感兴趣的楼盘</font><span class="aa" style="width:110px;"><img src="images/zhankai(black).jpg" /></span>
          </div> 
           <ul class="corridorConter" id="skimHouse">           
            <c:if test="${fn:length(listSkimHouseInfo) == 0 }">
        	  <li>
        		没有找到符合要求的楼盘!
        	   </li>	
        	</c:if>
        	
           		 <c:forEach items="${listSkimHouseInfo }" var="houseInfo">
           
           		<li>
                	<img src='${houseInfo.housePic }' width='77' height='49'/>
                    <ul>   
                        	<li><h3>${houseInfo.houseName }</h3></li>
                            <li>${houseInfo.housePrice}元/m&sup2;</li>
                            <li>${houseInfo.fcSysArea.areaName}&nbsp;&ndash;&nbsp;${houseInfo.businessRegion}</li>
                     </ul>
                    
                       <div class='dian' style='margin:5px;'></div>
                    
                </li>
                </c:forEach>
           </ul>
            <div id="miniSkimPage" style="margin: 0 0 0 160px;"></div>
        </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>

