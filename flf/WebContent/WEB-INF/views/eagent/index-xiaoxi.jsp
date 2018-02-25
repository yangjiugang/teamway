<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>消息</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="js/tabs/tabs.js"></script>
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var tab='${tabTag}';
	if(tab==null || tab==''){
		tab="#tab1";
	}else{
		tab="#tab"+tab;
	}
	$("#tabs").tabs({
		width:"850px",
		defCheck:tab,
		functions:{
			"#tab1":doTab1,
			"#tab2":doTab2,
			"#tab3":doTab3,
			"#tab4":doTab4,
			"#tab5":doTab5,
			"#tab6":doTab6,
			"#tab7":doTab7,
			"#tab8":doTab8, 
		} 
	});
	var curPage1=${cusMetionPage.curPage};
	var pageSize1=${cusMetionPage.pageSize};
	var pageCount1=${cusMetionPage.pageCount};
	$("#page1").pager({curPage:curPage1, pageSize:pageSize1, pageCount:pageCount1, goPageCall:goPage1});
	
	var curPage2=${houseDisPage.curPage};
	var pageSize2=${houseDisPage.pageSize};
	var pageCount2=${houseDisPage.pageCount};
	$("#page2").pager({curPage:curPage2, pageSize:pageSize2, pageCount:pageCount2, goPageCall:goPage2});
	
	var curPage3=${userRecomPage.curPage};
	var pageSize3=${userRecomPage.pageSize};
	var pageCount3=${userRecomPage.pageCount};
	$("#page3").pager({curPage:curPage3, pageSize:pageSize3, pageCount:pageCount3, goPageCall:goPage3});
	
	var curPage4=${userMsgPage.curPage};
	var pageSize4=${userMsgPage.pageSize};
	var pageCount4=${userMsgPage.pageCount};
	$("#page4").pager({curPage:curPage4, pageSize:pageSize4, pageCount:pageCount4, goPageCall:goPage4});
	
	var curPage6=${sysMsgPage.curPage};
	var pageSize6=${sysMsgPage.pageSize};
	var pageCount6=${sysMsgPage.pageCount};
	$("#page6").pager({curPage:curPage6, pageSize:pageSize6, pageCount:pageCount6, goPageCall:goPage6});
	
	var curPage7=${housePricePage.curPage};
	var pageSize7=${housePricePage.pageSize};
	var pageCount7=${housePricePage.pageCount};
	$("#page7").pager({curPage:curPage7, pageSize:pageSize7, pageCount:pageCount7, goPageCall:goPage7});
	
	var curPage8=${frihousePricePage.curPage};
	var pageSize8=${frihousePricePage.pageSize};
	var pageCount8=${frihousePricePage.pageCount};
	$("#page8").pager({curPage:curPage8, pageSize:pageSize8, pageCount:pageCount8, goPageCall:goPage8});
});

 function doTab1(){
}
function doTab2(){
}
function doTab3(){
}
function doTab4(){
}
function doTab5(){
}
function doTab6(){
}
function doTab7(){
}
function doTab8(){
}  

function goPage1(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/cusMetionForPage?userId=${userInfo.userId}',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
       		$("#cusMention").empty();
			for(var i=0;i<msg.datas.length;i++){
				if(msg.datas[i].msgType==10){
					$("#cusMention").append(
							 "<div class='xiaoxi-c'><dl>"
						    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
							+"<dt><span>"+msg.datas[i].sendUserName+"</span>"+date2str(new Date(msg.datas[i].sendTime),"yyyy-MM-dd")+"<span>选择你做他的房秘书！</span></dt>"
						    +"</dl><span class='pu'><ul>"
							+"<li><a href='javascript:show1("+msg.datas[i].id+",10)'>详情</a></li>"
						    +"<li><a href='javascript:dele1("+msg.datas[i].id+","+curPage+","+ pageSize+")'>删除</a></li>"
							+"</ul></span></div>" 
					); 
				}
				if(msg.datas[i].msgType==4){
					$("#cusMention").append(
							 "<div class='xiaoxi-c'><dl>"
						    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
							+"<dt><span>"+msg.datas[i].sendUserName+"</span>"+date2str(new Date(msg.datas[i].sendTime),"yyyy-MM-dd")
							+"<span>投诉您：<a herf='#'>"+msg.datas[i].msgContent+"</a></span></dt>"
						    +"</dl><span class='pu'><ul>"
							+"<li><a href='javascript:show1("+msg.datas[i].id+",4)'>详情</a></li>"
						    +"<li><a href='javascript:dele1("+msg.datas[i].id+","+curPage+","+ pageSize+")'>删除</a></li>"
							+"</ul></span></div>" 
					); 
				}
				if(msg.datas[i].msgType==3){
					$("#cusMention").append(
							 "<div class='xiaoxi-c'><dl>"
						    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
							+"<dt><span>"+msg.datas[i].sendUserName+"</span>"+date2str(new Date(msg.datas[i].sendTime),"yyyy-MM-dd")
							+"<span>取消您为他的房秘书：<a herf='#'>"+msg.datas[i].msgContent+"</a></span></dt>"
						    +"</dl><span class='pu'><ul>"
							+"<li><a href='javascript:show1("+msg.datas[i].id+",3)'>详情</a></li>"
						    +"<li><a href='javascript:dele1("+msg.datas[i].id+","+curPage+","+ pageSize+")'>删除</a></li>"
							+"</ul></span></div>" 
					); 
				}
				if(msg.datas[i].msgType==1){
					$("#cusMention").append(
							 "<div class='xiaoxi-c'><dl>"
						    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
							+"<dt><span>"+msg.datas[i].sendUserName+"</span>"+date2str(new Date(msg.datas[i].sendTime),"yyyy-MM-dd")
							+"<span>给您发送了一条消息<a herf='#'>"+msg.datas[i].msgContent+"</a></span></dt>"
						    +"</dl><span class='pu'><ul>"
							+"<li><a href='javascript:show1("+msg.datas[i].id+",1)'>详情</a></li>"
						    +"<li><a href='javascript:dele1("+msg.datas[i].id+","+curPage+","+ pageSize+")'>删除</a></li>"
							+"</ul></span></div>" 
					); 
				}
			}; 
		
		
		
		}
	});
}

function goPage2(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/HouseDisForPage?userId=${userInfo.userId}',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
       		$("#houseDis").empty();
			for(var i=0;i<msg.datas.length;i++){
				$("#houseDis").append(
						 "<div class='xiaoxi-c'><dl>"
					    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
						+"<dt><span>"+msg.datas[i].visitorName+"</span>"+date2str(new Date(msg.datas[i].createDate),"yyyy-MM-dd")+"<span>对楼盘<a href='#'>"
						+msg.datas[i].housInfo.houseName+"</a>做了点评！</span></dt>"
					    +"</dl><span class='pu'><ul>"
						+"<li><a href='javascript:show2("+msg.datas[i].discussId+")'>详情</a></li>"
					    +"<li><a href='javascript:dele2("+msg.datas[i].discussId+","+curPage+","+ pageSize+")'>删除</a></li>"
						+"</ul></span></div>" 
				); 
			};
			$("#houseDisVisitorName").html(msg.datas[0].visitorName);
			$("#houseDisHouseName").html(msg.datas[0].housInfo.houseName);
			$("#disContent").html(msg.datas[0].content);
			$("#houseDisCreateDate").html(date2str(new Date(msg.datas[0].createDate),"yyyy-MM-dd hh:mm:ss"));
		}
	});
}

function goPage3(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/userRecomForPage?userId=${userInfo.userId}',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
       		$("#userRecoms").empty();
			for(var i=0;i<msg.datas.length;i++){
				var recommendType="null";
				if(msg.datas[i].recommendType==1){
					recommendType="活动";
				}
				if(msg.datas[i].recommendType==2){
					recommendType="楼盘";
				}
				if(msg.datas[i].recommendType==3){
					recommendType="旅游路线";
				}
				$("#userRecoms").append(
						 "<div class='xiaoxi-c'><dl>"
					    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
						+"<dt><span>"+msg.datas[i].userInfo.name+"</span>"+date2str(new Date(msg.datas[i].recommendTime),"yyyy-MM-dd")+"<span>"
						+"给您推荐了"+recommendType+"<a href='#'>"
						+msg.datas[i].recommendContent+"</a></span></dt>"
					    +"</dl><span class='pu'><ul>"
						+"<li><a href='javascript:show3("+msg.datas[i].recommendId+")'>详情</a></li>"
					    +"<li><a href='javascript:dele3("+msg.datas[i].recommendId+","+curPage+","+ pageSize+")'>删除</a></li>"
						+"</ul></span></div>" 
				); 
			};
			var recommendType;
			if(msg.datas[0].recommendType==1){
				recommendType="活动";
			}
			if(msg.datas[0].recommendType==2){
				recommendType="楼盘";
			}
			if(msg.datas[0].recommendType==3){
				recommendType="旅游路线";
			}
			$("#userRecomVisitorName").html(msg.datas[0].userInfo.name);
			$("#userRcomType").html(recommendType);
			$("#userRecomName").html(msg.datas[0].recommendContent);
			$("#recomdContent").html(msg.datas[0].recommendContent);
			$("#recomdCreateDate").html(date2str(new Date(msg.datas[0].recommendTime),"yyyy-MM-dd hh:mm:ss"));
		}
	});
}

function goPage4(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/userMsgForPage?userId=${userInfo.userId}',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
       		$("#userMsgs").empty();
			for(var i=0;i<msg.datas.length;i++){
				$("#userMsgs").append(
						 "<div class='xiaoxi-c'><dl>"
					    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
						+"<dt><span>"+msg.datas[i].sendUserName+"</span>"+date2str(new Date(msg.datas[i].sendTime),"yyyy-MM-dd")+"<span>"
						+"给您发来一条消息<a href='#'>"
						+msg.datas[i].msgContent+"</a></span></dt>"
					    +"</dl><span class='pu'><ul>"
						+"<li><a href='javascript:show4("+msg.datas[i].id+")'>详情</a></li>"
					    +"<li><a href='javascript:dele4("+msg.datas[i].id+","+curPage+","+ pageSize+")'>删除</a></li>"
						+"</ul></span></div>" 
				); 
			};
			$("#userMsgSendVisitorName").html(msg.datas[0].sendUserName);
			$("#msgContentDetail").html(msg.datas[0].msgContent);
			$("#msgCreateDate").html(date2str(new Date(msg.datas[0].sendTime),"yyyy-MM-dd hh:mm:ss"));
		}
	});
}

function goPage6(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fIndexSysMsg?msgSendType=0',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
       		$("#sysMsgs").empty();
			for(var i=0;i<msg.datas.length;i++){
				$("#sysMsgs").append(
						 "<div class='xiaoxi-c'><dl>"
					    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
						+"<dt><span>系统</span>"+(msg.datas[i].msgSendTime).substr(0,10)+"<span>"
						+"给您发来一条消息<a href='#'>"
						+msg.datas[i].msgContent+"</a></span></dt>"
					    +"</dl><span class='pu'><ul>"
						+"<li><a href='javascript:show6("+msg.datas[i].msgId+")'>详情</a></li>"
					    +"<li><a href='javascript:dele6("+msg.datas[i].msgId+","+curPage+","+ pageSize+")'>删除</a></li>"
						+"</ul></span></div>" 
				); 
			};
			$("#sysMsgContentDetail").html(msg.datas[0].msgContent);
			$("#sysMsgCreateDate").html(msg.datas[0].msgSendTime);
		}
	});
}

function goPage7(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/cusHousePriceForPage?userId=${userInfo.userId}',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
       		$("#cusHousePrices").empty();
			for(var i=0;i<msg.datas.length;i++){
				$("#cusHousePrices").append(
						 "<div class='xiaoxi-c'><dl>"
					    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
						+"<dt><span>"+msg.datas[i].visitorName+"</span>"+date2str(new Date(msg.datas[i].saleDate),"yyyy-MM-dd")+"<span>"
						+"对楼盘<a href='#'>"
						+msg.datas[i].houseInfo.houseName+"作出喊价</a></span></dt>"
					    +"</dl><span class='pu'><ul>"
						+"<li><a href='javascript:show7("+msg.datas[i].priceId+")'>详情</a></li>"
					    +"<li><a href='javascript:dele7("+msg.datas[i].priceId+","+curPage+","+ pageSize+")'>删除</a></li>"
						+"</ul></span></div>" 
				); 
			};
			$("#cusHousePriceCusName").html(msg.datas[0].visitorName);
			$("#cusPriceVisitorName").html(msg.datas[0].visitorName);
			$("#cusPriceHouseName").html(msg.datas[0].houseInfo.houseName);
			$("#cusHousePriceHosueName").html(msg.datas[0].houseInfo.houseName);
			$("#cusHousePriceHosuePrice").html(msg.datas[0].housePrice);
			$("#HousePriceCreateDate").html(date2str(new Date(msg.datas[0].saleDate),"yyyy-MM-dd hh:mm:ss"));
		}
	});
}

function goPage8(curPage, pageSize) {
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/friHousePriceForPage?userId=${userInfo.userId}',
		dataType:'json',
		data:"curPage="+curPage+"&pageSize="+pageSize,
		callBackFn:function(msg){
       		$("#friHousePrices").empty();
			for(var i=0;i<msg.datas.length;i++){
				$("#friHousePrices").append(
						 "<div class='xiaoxi-c'><dl>"
					    +"<img src='images/fanglifang.jpg' width='51' height='26' />"
						+"<dt><span>"+msg.datas[i].visitorName+"</span>"+date2str(new Date(msg.datas[i].saleDate),"yyyy-MM-dd")+"<span>"
						+"对楼盘<a href='#'>"
						+msg.datas[i].houseInfo.houseName+"作出喊价</a></span></dt>"
					    +"</dl><span class='pu'><ul>"
						+"<li><a href='javascript:show8("+msg.datas[i].priceId+")'>详情</a></li>"
					    +"<li><a href='javascript:dele7("+msg.datas[i].priceId+","+curPage+","+ pageSize+")'>删除</a></li>"
						+"</ul></span></div>" 
				); 
			};
			$("#friHousePriceCusName").html(msg.datas[0].visitorName);
			$("#friPriceVisitorName").html(msg.datas[0].visitorName);
			$("#friPriceHouseName").html(msg.datas[0].houseInfo.houseName);
			$("#friHousePriceHosueName").html(msg.datas[0].houseInfo.houseName);
			$("#friHousePriceHosuePrice").html(msg.datas[0].housePrice);
			$("#friHousePriceCreateDate").html(date2str(new Date(msg.datas[0].saleDate),"yyyy-MM-dd hh:mm:ss"));
		}
	});
}

function show1(userMsgId,msgType){
	if(msgType!=10){
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/findUserMsgByID?userMsgId='+userMsgId,
			dataType:'json',
			callBackFn:function(msg){
				$("#tab1SendName").html(msg.sendUserName);
				$("#tab1Msg").html(msg.msgContent);
				$("#tab1SendTime").html(date2str(new Date(msg.sendTime),"yyyy-MM-dd hh:mm:ss"));
				if(msgType==1){
					$("#tab1MsgType").html("给你发送了一条消息");
				}
				if(msgType==4){
					$("#tab1MsgType").html("投诉你");
				}
				if(msgType==3){
					$("#tab1MsgType").html("取消您为他的房秘书");
				}
			}
		});
	}
	if(msgType==10){
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/findMetionByID?mentionId='+userMsgId,
			dataType:'json',
			callBackFn:function(msg){
				$("#tab1SendName").html(msg.customerInfo.name);
				$("#tab1MsgType").html("选择你做他的房秘书");
				$("#tab1Msg").html("赶快和Ta联系吧");
				$("#tab1SendTime").html(date2str(new Date(msg.mentionTime),"yyyy-MM-dd hh:mm:ss"));
			}
		});
	}
	$("#msgSendPart1").css("display","block");
}

function show2(houseDisId){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/findhouseDisByID?discussId='+houseDisId,
		dataType:'json',
		callBackFn:function(msg){
			alert(msg.visitorName);
			$("#houseDisVisitorName").html(msg.visitorName);
			$("#houseDisHouseName").html(msg.housInfo.houseName);
			$("#disContent").html(msg.content);
			$("#houseDisCreateDate").html(date2str(new Date(msg.createDate),"yyyy-MM-dd hh:mm:ss"));
		}
	});
	$("#msgSendPart2").css("display","block");
}

function show3(recommendId){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/findRecommendByID?recommendId='+recommendId,
		dataType:'json',
		callBackFn:function(msg){
			var recommendType;
			if(msg.recommendType==1){
				recommendType="活动";
			}
			if(msg.recommendType==2){
				recommendType="楼盘";
			}
			if(msg.recommendType==3){
				recommendType="旅游路线";
			}
			$("#userRecomVisitorName").html(msg.userInfo.name);
			$("#userRcomType").html(recommendType);
			$("#userRecomName").html(msg.recommendContent);
			$("#recomdContent").html(msg.recommendContent);
			$("#recomdCreateDate").html(date2str(new Date(msg.recommendTime),"yyyy-MM-dd hh:mm:ss"));
		}
	});
	$("#msgSendPart3").css("display","block");
}

function show4(userMsgId){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/findUserMsgByID?userMsgId='+userMsgId,
		dataType:'json',
		callBackFn:function(msg){
			$("#userMsgSendVisitorName").html(msg.sendUserName);
			$("#msgContentDetail").html(msg.msgContent);
			$("#msgCreateDate").html(date2str(new Date(msg.sendTime),"yyyy-MM-dd hh:mm:ss"));
		}
	});
	$("#msgSendPart4").css("display","block");
}

function show6(sysMsgId){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/findSysMsgByID?sysMsgId='+sysMsgId,
		dataType:'json',
		callBackFn:function(msg){
		    $("#sysMsgContentDetail").html(msg.msgContent);
			$("#sysMsgCreateDate").html(msg.msgSendTime);
		}
	});
}
function show7(cusHousePriceId){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/findCusHPriceByID?cusHousePriceId='+cusHousePriceId,
		dataType:'json',
		callBackFn:function(msg){
			$("#cusHousePriceCusName").html(msg.visitorName);
			$("#cusPriceVisitorName").html(msg.visitorName);
			$("#cusPriceHouseName").html(msg.houseInfo.houseName);
			$("#cusHousePriceHosueName").html(msg.houseInfo.houseName);
			$("#cusHousePriceHosuePrice").html(msg.housePrice);
			$("#HousePriceCreateDate").html(date2str(new Date(msg.saleDate),"yyyy-MM-dd hh:mm:ss"));
		}
	});
	$("#msgSendPart7").css("display","block");
}

function show8(cusHousePriceId){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/findCusHPriceByID?cusHousePriceId='+cusHousePriceId,
		dataType:'json',
		callBackFn:function(msg){
			$("#friHousePriceCusName").html(msg.visitorName);
			$("#friPriceVisitorName").html(msg.visitorName);
			$("#friPriceHouseName").html(msg.houseInfo.houseName);
			$("#friHousePriceHosueName").html(msg.houseInfo.houseName);
			$("#friHousePriceHosuePrice").html(msg.housePrice);
			$("#friHousePriceCreateDate").html(date2str(new Date(msg.saleDate),"yyyy-MM-dd hh:mm:ss"));
		}
	});
	$("#msgSendPart8").css("display","block");
}

function dele1(mentionId,msgType,curPage,pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fXiaoxiDel?mentionId='+mentionId+"&userId=${userInfo.userId}",
		data:"curPage="+curPage+"&pageSize="+pageSize,
		dataType:'json',
		callBackFn:function(msg){
			alert(msg.pageCount+":"+curPage);
			if(msg.pageCount<curPage){
				curPage--;
			}
			if(msg.rowCount==0){
				$("#cusMetionContent").empty();
				$("#cusMetionContent").append(
						"<div class='xiaoxiqg03'>"
						+"<div class='xiaoxi-l'>"
					  	+"<div class='xiaoxi-c'>目前没有任何信息</div>"
					 	+"</div>" 
					    +"<div class='xiaoxi-r'>"
						+"<div class='xiaoxi-r-c'></div>"
						+"<div class='xiaoxi-rs' style=' margin-top:45px; height:70px;'></div>"
						+"</div></div>"	
				);
				$("#cusMentionCount1").html(msg.rowCount);
				$("#cusMentionCount2").html(msg.rowCount);
				return;
			} 
			$("#msgSendPart1").css("display","block");
			$("#cusMentionCount1").html(msg.rowCount);
			$("#cusMentionCount2").html(msg.rowCount);
			$("#page1").pager({curPage:curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:goPage1});
			goPage1(curPage, pageSize);
		}
	});
}

function dele2(discussId,curPage,pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fHouseDisDel?discussId='+discussId+"&userId=${userInfo.userId}",
		data:"curPage="+curPage+"&pageSize="+pageSize,
		dataType:'json',
		callBackFn:function(msg){
			if(msg.pageCount<curPage){
				curPage--;
			}
			if(msg.rowCount==0){
				$("#houseDisContent").empty();
				$("#houseDisContent").append(
						"<div class='xiaoxiqg03'>"
						+"<div class='xiaoxi-l'>"
					  	+"<div class='xiaoxi-c'>目前没有任何信息</div>"
					 	+"</div>" 
					    +"<div class='xiaoxi-r'>"
						+"<div class='xiaoxi-r-c'></div>"
						+"<div class='xiaoxi-rs' style=' margin-top:45px; height:70px;'></div>"
						+"</div></div>"	
				);
				$("#houseDisContent1").html(msg.rowCount);
				$("#houseDisContent2").html(msg.rowCount);
				return;
			} 
			$("#msgSendPart2").css("display","block");
			$("#houseDisContent1").html(msg.rowCount);
			$("#houseDisContent2").html(msg.rowCount);
			$("#page2").pager({curPage:curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:goPage2});
			goPage2(curPage, pageSize);
		}
	});
}

function dele3(recommendId,curPage,pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fUserRecomDel?recommendId='+recommendId+"&userId=${userInfo.userId}",
		data:"curPage="+curPage+"&pageSize="+pageSize,
		dataType:'json',
		callBackFn:function(msg){
			if(msg.pageCount<curPage){
				curPage--;
			}
			if(msg.rowCount==0){
				$("#houseDisContent").empty();
				$("#houseDisContent").append(
						"<div class='xiaoxiqg03'>"
						+"<div class='xiaoxi-l'>"
					  	+"<div class='xiaoxi-c'>目前没有任何信息</div>"
					 	+"</div>" 
					    +"<div class='xiaoxi-r'>"
						+"<div class='xiaoxi-r-c'></div>"
						+"<div class='xiaoxi-rs' style=' margin-top:45px; height:70px;'></div>"
						+"</div></div>"	
				);
				$("#userRecomContent1").html(msg.rowCount);
				$("#userRecomContent2").html(msg.rowCount);
				return;
			} 
			$("#msgSendPart3").css("display","block");
			$("#userRecomContent1").html(msg.rowCount);
			$("#userRecomContent2").html(msg.rowCount);
			$("#page3").pager({curPage:curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:goPage3});
			goPage3(curPage, pageSize);
		}
	});
}

function dele4(id,curPage,pageSize){
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fUserMsgDel?id='+id+"&userId=${userInfo.userId}&MsgType=2",
		data:"curPage="+curPage+"&pageSize="+pageSize,
		dataType:'json',
		callBackFn:function(msg){
			if(msg.pageCount<curPage){
				curPage--;
			}
			if(msg.rowCount==0){
				$("#userMsgContent").empty();
				$("#userMsgContent").append(
						"<div class='xiaoxiqg03'>"
						+"<div class='xiaoxi-l'>"
					  	+"<div class='xiaoxi-c'>目前没有任何信息</div>"
					 	+"</div>" 
					    +"<div class='xiaoxi-r'>"
						+"<div class='xiaoxi-r-c'></div>"
						+"<div class='xiaoxi-rs' style=' margin-top:45px; height:70px;'></div>"
						+"</div></div>"	
				);
				$("#userMsgContent1").html(msg.rowCount);
				$("#userMsgContent2").html(msg.rowCount);
				return;
			} 
			$("#msgSendPart4").css("display","block");
			$("#userMsgContent1").html(msg.rowCount);
			$("#userMsgContent2").html(msg.rowCount);
			$("#page4").pager({curPage:curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:goPage4});
			goPage4(curPage, pageSize);
		}
	});
}

function dele6(id,curPage,pageSize){
	alert("暂不提供系统消息删除功能");
	/* $.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/fUserMsgDel?id='+id+"&userId=${userInfo.userId}&MsgType=2",
		data:"curPage="+curPage+"&pageSize="+pageSize,
		dataType:'json',
		callBackFn:function(msg){
			if(msg.pageCount<curPage){
				curPage--;
			}
			if(msg.rowCount==0){
				$("#sysMsgContent").empty();
				$("#sysMsgContent").append(
						"<div class='xiaoxiqg03'>"
						+"<div class='xiaoxi-l'>"
					  	+"<div class='xiaoxi-c'>目前没有任何信息</div>"
					 	+"</div>" 
					    +"<div class='xiaoxi-r'>"
						+"<div class='xiaoxi-r-c'></div>"
						+"<div class='xiaoxi-rs' style=' margin-top:45px; height:70px;'></div>"
						+"</div></div>"	
				);
				$("#sysMsgContent1").html(msg.rowCount);
				$("#sysMsgContent2").html(msg.rowCount);
				return;
			} 
			$("#sysMsgContent1").html(msg.rowCount);
			$("#sysMsgContent2").html(msg.rowCount);
			$("#page6").pager({curPage:curPage, pageSize:pageSize, pageCount:msg.pageCount, goPageCall:goPage6});
			goPage6(curPage, pageSize);
		}
	}); */
}
function dele7(id,curPage,pageSize){
	alert("是否有删除功能？");
}
function sendMsg(contentId,receiveId,msgSendPart){
	var msgContent=$("#"+contentId).val();
	var sendUserId=${userInfo.userId};
	var sendUserName='${userInfo.name}';
	alert(msgContent+":"+sendUserId+":"+sendUserName);
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/esendMsg',
		data:"msgContent="+msgContent+"&receiveUserId="+receiveId+"&sendUserId="+sendUserId+"&sendUserName="+sendUserName,
		dataType:'json',
		callBackFn:function(msg){
			if(msg=="success"){
				$("#"+msgSendPart).css("display","none");
				$("#"+contentId).text('');
			}else{
				$("#"+msgSendPart).css("display","block");
			}
			alert(msg);
		}
	}); 
}
function date2str(x,y) {
	 var z = {M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
	 y = y.replace(/(M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-2)});
	 return y.replace(/(y+)/g,function(v) {return x.getFullYear().toString().slice(-v.length)});
}
</script>


</head>

<body>
<!--头部-->
<%@include file="EHeader.jsp" %>
<!--End头部-->

<div class="xiaoxi">
	<!--内容区块-->  
		<div id="tabs" class="xiaoxi-t">
			<ul>
		    	<li id="#tab1">客户消息(<b id="cusMentionCount1">${cusMetionPage.rowCount}</b>)</li>
			    <li id="#tab2">客户评论(<b id="houseDisContent1">${houseDisPage.rowCount}</b>)</li>
				<li id="#tab3">好友推荐(<b id="userRecomContent1">${userRecomPage.rowCount}</b>)</li>
				<li id="#tab4">好友消息(<b id="userMsgContent1">${userMsgPage.rowCount}</b>)</li>
				<li id="#tab5">互动请求</li>
				<li id="#tab6">系统消息(<b id="sysMsgContent1">${sysMsgPage.rowCount}</b>)</li>
				<li id="#tab7">客户喊价(<b id="cusPriceContent1">${housePricePage.rowCount}</b>)</li>
			    <li id="#tab8">好友喊价(<b id="friPriceContent1">${frihousePricePage.rowCount}</b>)</li>
		    </ul>	
		</div>
		
		 <!-- 客户消息 Start -->
		<div id="cusMetionContent">
		
			<div class="xiaoxiqg03" id="tab1">
			<c:if test="${!empty cusMetions}">
				<div  class="xiaoxi-l">
					<div id="cusMention">
						<c:forEach items="${cusMetions}" var="metion">
							<c:if test="${metion.msgType==10 }">
				 				<div class="xiaoxi-c">
		           					<dl>
			          					<img src="images/fanglifang.jpg" width="51" height="26" />
				      					<dt><span id="">${metion.sendUserName}</span><fmt:formatDate value="${metion.sendTime}" pattern="yyyy-MM-dd" />
				      						<span>选择你做他的房秘书！</span>
				      					</dt>
			      					</dl>
							        <span class="pu">
								        <ul>
										  <li><a href="javascript:show1(${metion.id},10)">详情</a></li>
								          <li><a href="javascript:dele1(${metion.id},${cusMetionPage.curPage},${cusMetionPage.pageSize})">删除</a></li>
									    </ul>
							        </span>
		      					</div>
		      				</c:if>
		      				<c:if test="${metion.msgType==1 }">
				 				<div class="xiaoxi-c">
		           					<dl>
			          					<img src="images/fanglifang.jpg" width="51" height="26" />
				      					<dt><span id="">${metion.sendUserName}</span><fmt:formatDate value="${metion.sendTime}" pattern="yyyy-MM-dd" />
				      						<span>给您发送了一条消息<a href="#">${metion.msgContent}</a></span>
				      					</dt>
			      					</dl>
							        <span class="pu">
								        <ul>
										  <li><a href="javascript:show1(${metion.id},1)">详情</a></li>
								          <li><a href="javascript:dele1_1(${metion.id},${cusMetionPage.curPage},${cusMetionPage.pageSize})">删除</a></li>
									    </ul>
							        </span>
		      					</div>
		      				</c:if>
		      				<c:if test="${metion.msgType==3 }">
				 				<div class="xiaoxi-c">
		           					<dl>
			          					<img src="images/fanglifang.jpg" width="51" height="26" />
				      					<dt><span id="">${metion.sendUserName}</span><fmt:formatDate value="${metion.sendTime}" pattern="yyyy-MM-dd" />
				      						<span>取消您为他的房秘书：<a href="#">${metion.msgContent}</a></span>
				      					</dt>
			      					</dl>
							        <span class="pu">
								        <ul>
										  <li><a href="javascript:show1(${metion.id},3)">详情</a></li>
								          <li><a href="javascript:dele1_1(${metion.id},${cusMetionPage.curPage},${cusMetionPage.pageSize})">删除</a></li>
									    </ul>
							        </span>
		      					</div>
		      				</c:if>
		      				<c:if test="${metion.msgType==4 }">
				 				<div class="xiaoxi-c">
		           					<dl>
			          					<img src="images/fanglifang.jpg" width="51" height="26" />
				      					<dt><span id="">${metion.sendUserName}</span><fmt:formatDate value="${metion.sendTime}" pattern="yyyy-MM-dd" />
				      						<span>投诉您：<a href="#">${metion.msgContent}</a></span>
				      					</dt>
			      					</dl>
							        <span class="pu">
								        <ul>
										  <li><a href="javascript:show1(${metion.id},4)">详情</a></li>
								          <li><a href="javascript:dele1_1(${metion.id},${cusMetionPage.curPage},${cusMetionPage.pageSize})">删除</a></li>
									    </ul>
							        </span>
		      					</div>
		      				</c:if>
	      				</c:forEach>
	      			</div>
	      			<p class="xiaoxired03">统计：<span id="cusMentionCount2">${cusMetionPage.rowCount}</span>条信息</p>
	      			<div id='page1'></div>
         		</div>
         
         		<div class="xiaoxi-r">
		  			<div class="xiaoxi-r-c">
						<div class="cont">
						  <ul>
						    <li><span id="tab1SendName">${cusMetions[0].sendUserName}</span>
						    	<c:if test="${cusMetions[0].msgType==1}"><span id="tab1MsgType" style="color: #626262;">给你发送了一条消息：</span></c:if>
						    	<c:if test="${cusMetions[0].msgType==3}"><span id="tab1MsgType" style="color: #626262;">取消您为他的房秘书：</span></c:if>
						    	<c:if test="${cusMetions[0].msgType==4}"><span id="tab1MsgType" style="color: #626262;">投诉你：</span></c:if>
						    	<c:if test="${cusMetions[0].msgType==10}"><span id="tab1MsgType" style="color: #626262;">选择你做他的房秘书：</span></c:if>
						    </li>
						  </ul>
						</div>
					</div>
					
					<div class="xiaoxi-rs" id="">
						<div class="cont" id="tab1ContentDatil">
						  <ul>
						     <li>
						     	<c:if test="${cusMetions[0].msgType==10}"><span id="tab1Msg">赶快和Ta联系吧</span></c:if>
						     	<c:if test="${cusMetions[0].msgType!=10}"><span id="tab1Msg">${cusMetions[0].msgContent}</span></c:if>
						     </li>
				             <li>快去<span>她的空间</span>看看吧！</li>
							 <li><span id="tab1SendTime"><fmt:formatDate value="${cusMetions[0].sendTime}" pattern="yyyy-MM-dd hh:mm:ss" /></span></li>
						  </ul>
						</div>
					 <div id="msgSendPart1" class="xiaoxil" style="display: block;">
				     	<form action="" method="get"  >
				     	<textarea id="msgContent1" class="xiaoxil-tec" reg="" tip="不能为空" cols="39" rows="8" style="width:347px; height:117px;"></textarea>
				    		<input name="提交" type="button" class="xiaoxil-tetl" value="回复" onclick="sendMsg('msgContent1',${cusMetions[0].sendUserId},'msgSendPart1');"/></form> 
				  	</div> 
					</div>
				</div>
				</c:if>
		        <c:if test="${empty cusMetions}">
		         	<div class="xiaoxiqg03">
						<div class="xiaoxi-l">
					  		<div class="xiaoxi-c">目前没有任何信息</div>
					 	</div> 
					    <div class="xiaoxi-r">
						    <div class="xiaoxi-r-c"></div>
						    <div class="xiaoxi-rs" style=" margin-top:45px; height:70px;"></div>
						</div>
					</div>
		        </c:if>
            </div>
        
        </div>
        <!-- 客户消息 End --> 
        
      	<!-- 客户评论 Start -->
        <div id="houseDisContent">
			<div class="xiaoxiqg03" id="tab2">
			<c:if test="${!empty houseDiss}">
				<div  class="xiaoxi-l">
					<div id="houseDis">
						<c:forEach items="${houseDiss}" var="houseDis">
			 				<div class="xiaoxi-c">
	           					<dl>
		          					<img src="images/fanglifang.jpg" width="51" height="26" />
			      					<dt><span >${houseDis.visitorName}</span><fmt:formatDate value="${houseDis.createDate}" pattern="yyyy-MM-dd" />
			      						<span>对楼盘<a href="#">${houseDis.housInfo.houseName }</a>做了点评！</span>
			      					</dt>
		      					</dl>
						        <span class="pu">
							        <ul>
									  <li><a href="javascript:show2(${houseDis.discussId})">详情</a></li>
							          <li><a href="javascript:dele2(${houseDis.discussId},${houseDisPage.curPage},${houseDisPage.pageSize})">删除</a></li>
								    </ul>
						        </span>
	      					</div>
	      				</c:forEach>
	      			</div>
	      			<p class="xiaoxired03">统计：<span id="houseDisContent2">${houseDisPage.rowCount}</span>条信息</p>
	      			<div id='page2'></div>
         		</div>
         
         		<div class="xiaoxi-r">
		  			<div class="xiaoxi-r-c">
						<div class="cont">
						  <ul id="loupandisTitle">
						    <li><span id="houseDisVisitorName">${houseDiss[0].visitorName}</span>对楼盘<a href="#" id="houseDisHouseName">${houseDiss[0].housInfo.houseName }</a>做了点评:</li>
						  </ul>
						</div>
					</div>
					
					<div class="xiaoxi-rs" id="">
						<div class="cont">
						  <ul>
						     <li><span id="disContent">${houseDiss[0].content}</span></li>
				                <li>快去<span>她的空间</span>看看吧！</li>
								<li><span id="houseDisCreateDate"><fmt:formatDate value="${houseDiss[0].createDate}" pattern="yyyy-MM-dd hh:mm:ss" /></span></li>
						  </ul>
						</div>
					 <div id="msgSendPart2" class="xiaoxil" style="display: block;">
				     	<form action="" method="get"  >
				     	<textarea id="msgContent2" class="xiaoxil-tec" reg="" tip="不能为空" cols="39" rows="8" style="width:347px; height:117px;"></textarea>
				    		<input name="提交" type="button" class="xiaoxil-tetl" value="回复" onclick="sendMsg('msgContent2',${houseDiss[0].visitorId},'msgSendPart2');"/></form> 
				  	</div> 
					</div>
				</div>
				</c:if>
			    <c:if test="${empty houseDiss}">
			         <div class="xiaoxiqg03">
						<div class="xiaoxi-l">
						  	<div class="xiaoxi-c">目前没有任何信息</div>
						 </div> 
						 <div class="xiaoxi-r">
							<div class="xiaoxi-r-c"></div>
							<div class="xiaoxi-rs" style=" margin-top:45px; height:70px;"></div>
						</div>
					</div>
			    </c:if>
            </div>
        
        </div>
        <!-- 客户评论 End -->
        
        <!-- 好友推荐Start -->
        <div id="userCommendContent">
			<div class="xiaoxiqg03" id="tab3">
			<c:if test="${!empty userRecoms}">
				<div  class="xiaoxi-l">
					<div id="userRecoms">
						<c:forEach items="${userRecoms}" var="userRecom">
			 				<div class="xiaoxi-c">
	           					<dl>
		          					<img src="images/fanglifang.jpg" width="51" height="26" />
			      					<dt><span >${userRecom.userInfo.name}</span><fmt:formatDate value="${userRecom.recommendTime}" pattern="yyyy-MM-dd" />
			      						<span>给您推荐了
			      							<c:if test="${userRecom.recommendType==1}">活动</c:if>
			      							<c:if test="${userRecom.recommendType==2}">楼盘</c:if>
			      							<c:if test="${userRecom.recommendType==3}">旅游路线</c:if>
			      							<a href="#">${userRecom.recommendContent}</a></span>
			      					</dt>
		      					</dl>
						        <span class="pu">
							        <ul>
									  <li><a href="javascript:show3(${userRecom.recommendId})">详情</a></li>
							          <li><a href="javascript:dele3(${userRecom.recommendId},${userRecomPage.curPage},${userRecomPage.pageSize})">删除</a></li>
								    </ul>
						        </span>
	      					</div>
	      				</c:forEach>
	      			</div>
	      			<p class="xiaoxired03">统计：<span id="userRecomContent2">${userRecomPage.rowCount}</span>条信息</p>
	      			<div id='page3'></div>
         		</div>
         
         		<div class="xiaoxi-r">
		  			<div class="xiaoxi-r-c">
						<div class="cont">
						  <ul id="loupandisTitle">
						    <li><span id="userRecomVisitorName">${userRecoms[0].userInfo.name}</span>给您推荐了<span id="userRcomType">
						    		<c:if test="${userRecoms[0].recommendType==1}">活动</c:if>
			      					<c:if test="${userRecoms[0].recommendType==2}">楼盘</c:if>
			      					<c:if test="${userRecoms[0].recommendType==3}">旅游路线</c:if></span>
						    		<a href="#" id="userRecomName">${userRecoms[0].recommendContent}</a></li>
						  </ul>
						</div>
					</div>
					
					<div class="xiaoxi-rs" id="">
						<div class="cont">
						  <ul>
						     <li><span id="recomdContent">${userRecoms[0].recommendContent}</span></li>
				                <li>快去<span>她的空间</span>看看吧！</li>
								<li><span id="recomdCreateDate"><fmt:formatDate value="${userRecoms[0].recommendTime}" pattern="yyyy-MM-dd hh:mm:ss" /></span></li>
						  </ul>
						</div>
					 <div id="msgSendPart3" class="xiaoxil" style="display: block;">
				     	<form action="" method="get"  >
				     	<textarea id="msgContent3" class="xiaoxil-tec" reg="" tip="不能为空" cols="39" rows="8" style="width:347px; height:117px;"></textarea>
				    		<input name="提交" type="button" class="xiaoxil-tetl" value="回复" onclick="sendMsg('msgContent3',${userRecoms[0].userId},'msgSendPart3');"/></form> 
				  	</div> 
					</div>
				</div>
				</c:if>
		        <c:if test="${empty userRecoms}">
		         	<div class="xiaoxiqg03">
						<div class="xiaoxi-l">
					  		<div class="xiaoxi-c">目前没有任何信息</div>
					 	</div> 
					    <div class="xiaoxi-r">
						    <div class="xiaoxi-r-c"></div>
						    <div class="xiaoxi-rs" style=" margin-top:45px; height:70px;"></div>
						</div>
					</div>
		        </c:if>
            </div>
        
        </div>
        <!-- 好友推荐End -->
        
        <!-- 好友消息Start -->
        <div id="userMsgContent">
		
			<div class="xiaoxiqg03" id="tab4">
			<c:if test="${!empty userMsgs}">
				<div  class="xiaoxi-l">
					<div id="userMsgs">
						<c:forEach items="${userMsgs}" var="userMsg">
			 				<div class="xiaoxi-c">
	           					<dl>
		          					<img src="images/fanglifang.jpg" width="51" height="26" />
			      					<dt><span >${userMsg.sendUserName}</span><fmt:formatDate value="${userMsg.sendTime}" pattern="yyyy-MM-dd" />
			      						<span>给您发送了一条消息<a href="#">${userMsg.msgContent}</a></span>
			      					</dt>
		      					</dl>
						        <span class="pu">
							        <ul>
									  <li><a href="javascript:show4(${userMsg.id})">详情</a></li>
							          <li><a href="javascript:dele4(${userMsg.id},${userMsgPage.curPage},${userMsgPage.pageSize})">删除</a></li>
								    </ul>
						        </span>
	      					</div>
	      				</c:forEach>
	      			</div>
	      			<p class="xiaoxired03">统计：<span id="userMsgContent2">${userMsgPage.rowCount}</span>条信息</p>
	      			<div id='page4'></div>
         		</div>
         
         		<div class="xiaoxi-r">
		  			<div class="xiaoxi-r-c">
						<div class="cont">
						  <ul id="loupandisTitle">
						    <li><span id="userMsgSendVisitorName">${userMsgs[0].sendUserName}</span>给您发送了一条消息
						    		</li>
						  </ul>
						</div>
					</div>
					
					<div class="xiaoxi-rs" id="">
						<div class="cont">
						  <ul>
						     <li><span id="msgContentDetail">${userMsgs[0].msgContent}</span></li>
				                <li>快去<span>她的空间</span>看看吧！</li>
								<li><span id="msgCreateDate"><fmt:formatDate value="${userMsgs[0].sendTime}" pattern="yyyy-MM-dd hh:mm:ss" /></span></li>
						  </ul>
						</div>
					 <div id="msgSendPart4" class="xiaoxil" style="display: block;">
				     	<form action="" method="get"  >
				     	<textarea id="msgContent4" class="xiaoxil-tec" reg="" tip="不能为空" cols="39" rows="8" style="width:347px; height:117px;"></textarea>
				    		<input name="提交" type="button" class="xiaoxil-tetl" value="回复" onclick="sendMsg('msgContent4',${userMsgs[0].sendUserId},'msgSendPart4');"/></form> 
				  	</div> 
					</div>
				</div>
				</c:if>
			    <c:if test="${empty userMsgs}">
			        <div class="xiaoxiqg03">
						<div class="xiaoxi-l">
						  	<div class="xiaoxi-c">目前没有任何信息</div>
						 </div> 
						 <div class="xiaoxi-r">
						    <div class="xiaoxi-r-c"></div>
							<div class="xiaoxi-rs" style=" margin-top:45px; height:70px;"></div>
						</div>
					</div>
			    </c:if>
            </div>
        </div>
        <!-- 好友消息End -->
        
        <!-- 系统消息Start -->
        <div id="sysMsgContent">
			<div class="xiaoxiqg03" id="tab6">
			<c:if test="${!empty sysMsgs}">
				<div  class="xiaoxi-l">
					<div id="sysMsgs">
						<c:forEach items="${sysMsgs}" var="sysMsg">
			 				<div class="xiaoxi-c">
	           					<dl>
		          					<img src="images/fanglifang.jpg" width="51" height="26" />
			      					<dt><span >系统</span><fmt:formatDate value="${sysMsg.msgSendTime}" pattern="yyyy-MM-dd" />
			      						<span>给您发送了一条消息<a href="#">${sysMsg.msgContent}</a></span>
			      					</dt>
		      					</dl>
						        <span class="pu">
							        <ul>
									  <li><a href="javascript:show6(${sysMsg.msgId})">详情</a></li>
							          <li><a href="javascript:dele6(${sysMsg.msgId},${sysMsgPage.curPage},${sysMsgPage.pageSize})">删除</a></li>
								    </ul>
						        </span>
	      					</div>
	      				</c:forEach>
	      			</div>
	      			<p class="xiaoxired03">统计：<span id="sysMsgContent2">${sysMsgPage.rowCount}</span>条信息</p>
	      			<div id='page6'></div>
         		</div>
         
         		<div class="xiaoxi-r">
		  			<div class="xiaoxi-r-c">
						<div class="cont">
						  <ul id="loupandisTitle">
						    <li><span>系统</span>给您发送了一条消息
						    		</li>
						  </ul>
						</div>
					</div>
					
					<div class="xiaoxi-rs" id="">
						<div class="cont">
						  <ul>
						     <li><span id="sysMsgContentDetail">${sysMsgs[0].msgContent}</span></li>
								<li><span id="sysMsgCreateDate"><fmt:formatDate value="${sysMsgs[0].msgSendTime}" pattern="yyyy-MM-dd hh:mm:ss" /></span></li>
						  </ul>
						</div>
					</div>
				</div>
				</c:if>
		        <c:if test="${empty sysMsgs}">
		         	<div class="xiaoxiqg03">
						<div class="xiaoxi-l">
					  		<div class="xiaoxi-c">目前没有任何信息</div>
					 	</div> 
					    <div class="xiaoxi-r">
						    <div class="xiaoxi-r-c"></div>
						    <div class="xiaoxi-rs" style=" margin-top:45px; height:70px;"></div>
						</div>
					</div>
		        </c:if>
            </div>
       
        </div>
        <!-- 系统消息End -->
        
        <!-- 客户喊价Start -->
        <div id="cusHousePriceContent">
		
			<div class="xiaoxiqg03" id="tab7">
			<c:if test="${!empty cusHousePrices}">
				<div  class="xiaoxi-l">
					<div id="cusHousePrices">
						<c:forEach items="${cusHousePrices}" var="cusHousePrice">
			 				<div class="xiaoxi-c">
	           					<dl>
		          					<img src="images/fanglifang.jpg" width="51" height="26" />
			      					<dt><span >${cusHousePrice.visitorName}</span><fmt:formatDate value="${cusHousePrice.saleDate}" pattern="yyyy-MM-dd" />
			      						<span>对楼盘<a href="#">${cusHousePrice.houseInfo.houseName}</a>作出喊价</span>
			      					</dt>
		      					</dl>
						        <span class="pu">
							        <ul>
									  <li><a href="javascript:show7(${cusHousePrice.priceId})">详情</a></li>
							          <li><a href="javascript:dele7(${cusHousePrice.priceId},${housePricePage.curPage},${housePricePage.pageSize})">删除</a></li>
								    </ul>
						        </span>
	      					</div>
	      				</c:forEach>
	      			</div>
	      			<p class="xiaoxired03">统计：<span id="cusPriceContent2">${housePricePage.rowCount}</span>条信息</p>
	      			<div id='page7'></div>
         		</div>
         
         		<div class="xiaoxi-r">
		  			<div class="xiaoxi-r-c">
						<div class="cont">
						  <ul id="loupandisTitle">
						    <li><span id="cusPriceVisitorName">${cusHousePrices[0].visitorName}</span>对楼盘<span id="cusPriceHouseName">${cusHousePrices[0].houseInfo.houseName}</span>作出喊价
						    		</li>
						  </ul>
						</div>
					</div>
					
					<div class="xiaoxi-rs" id="">
						<div class="cont">
						  <ul>
						     <li><span id="cusHousePriceCusName">${cusHousePrices[0].visitorName}</span>对楼盘<span id="cusHousePriceHosueName">${cusHousePrices[0].houseInfo.houseName}</span>作出喊价为
						     	<span id="cusHousePriceHosuePrice" style="color: red;">${cusHousePrices[0].housePrice}</span>
						     	<span style="color: blue;">&nbsp;元/平米</span></li>
				             <li>快去<span>她的空间</span>看看吧！</li>
							 <li><span id="HousePriceCreateDate"><fmt:formatDate value="${cusHousePrices[0].saleDate}" pattern="yyyy-MM-dd hh:mm:ss" /></span></li>
						  </ul>
						</div>
						<div id="msgSendPart7" class="xiaoxil" style="display: block;">
					     	<form action="" method="get"  >
					     	<textarea id="msgContent7" class="xiaoxil-tec" reg="" tip="不能为空" cols="39" rows="8" style="width:347px; height:117px;"></textarea>
					    		<input name="提交" type="button" class="xiaoxil-tetl" value="回复" onclick="sendMsg('msgContent7',${cusHousePrices[0].visitorId},'msgSendPart7');"/></form> 
					  	</div> 
					</div>
				</div>
				</c:if>
        		<c:if test="${empty cusHousePrices}">
		         	<div class="xiaoxiqg03">
						<div class="xiaoxi-l">
					  		<div class="xiaoxi-c">目前没有任何信息</div>
					 	</div> 
					    <div class="xiaoxi-r">
						    <div class="xiaoxi-r-c"></div>
						    <div class="xiaoxi-rs" style=" margin-top:45px; height:70px;"></div>
						</div>
					</div>
        		</c:if>
				
            </div>
        
        </div>
        <!-- 客户喊价End -->
        
        <!-- 好友喊价Start -->
         <div id="friHousePriceContent">
		
			<div class="xiaoxiqg03" id="tab8">
			<c:if test="${!empty friHousePrices}">
				<div  class="xiaoxi-l">
					<div id="friHousePrices">
						<c:forEach items="${friHousePrices}" var="friHousePrice">
			 				<div class="xiaoxi-c">
	           					<dl>
		          					<img src="images/fanglifang.jpg" width="51" height="26" />
			      					<dt><span >${friHousePrice.visitorName}</span><fmt:formatDate value="${friHousePrice.saleDate}" pattern="yyyy-MM-dd" />
			      						<span>对楼盘<a href="#">${friHousePrice.houseInfo.houseName}</a>作出喊价</span>
			      					</dt>
		      					</dl>
						        <span class="pu">
							        <ul>
									  <li><a href="javascript:show8(${friHousePrice.priceId})">详情</a></li>
							          <li><a href="javascript:dele7(${friHousePrice.priceId},${frihousePricePage.curPage},${frihousePricePage.pageSize})">删除</a></li>
								    </ul>
						        </span>
	      					</div>
	      				</c:forEach>
	      			</div>
	      			<p class="xiaoxired03">统计：<span id="friPriceContent2">${frihousePricePage.rowCount}</span>条信息</p>
	      			<div id='page8'></div>
         		</div>
         
         		<div class="xiaoxi-r">
		  			<div class="xiaoxi-r-c">
						<div class="cont">
						  <ul id="loupandisTitle">
						    <li><span id="friPriceVisitorName">${friHousePrices[0].visitorName}</span>对楼盘<span id="friPriceHouseName">${friHousePrices[0].houseInfo.houseName}</span>作出喊价
						    		</li>
						  </ul>
						</div>
					</div>
					
					<div class="xiaoxi-rs" id="">
						<div class="cont">
						  <ul>
						     <li><span id="friHousePriceCusName">${friHousePrices[0].visitorName}</span>对楼盘<span id="friHousePriceHosueName">${friHousePrices[0].houseInfo.houseName}</span>作出喊价为
						     	<span id="friHousePriceHosuePrice" style="color: red;">${friHousePrices[0].housePrice}</span>
						     	<span style="color: blue;">&nbsp;元/平米</span></li>
				             <li>快去<span>她的空间</span>看看吧！</li>
							 <li><span id="friHousePriceCreateDate"><fmt:formatDate value="${friHousePrices[0].saleDate}" pattern="yyyy-MM-dd hh:mm:ss" /></span></li>
						  </ul>
						</div>
						<div id="msgSendPart8" class="xiaoxil" style="display: block;">
					     	<form action="" method="get"  >
					     	<textarea id="msgContent8" class="xiaoxil-tec" reg="" tip="不能为空" cols="39" rows="8" style="width:347px; height:117px;"></textarea>
					    		<input name="提交" type="button" class="xiaoxil-tetl" value="回复" onclick="sendMsg('msgContent8',${friHousePrices[0].visitorId},'msgSendPart8');"/></form> 
					  	</div> 
					</div>
				</div>
				</c:if>
		        <c:if test="${empty friHousePrices}">
		         	<div class="xiaoxiqg03">
						<div class="xiaoxi-l">
					  		<div class="xiaoxi-c">目前没有任何信息</div>
					 	</div> 
					    <div class="xiaoxi-r">
						    <div class="xiaoxi-r-c"></div>
						    <div class="xiaoxi-rs" style=" margin-top:45px; height:70px;"></div>
						</div>
					</div>
		        </c:if>
				
            </div>
        
        </div>
        <!-- 好友喊价End -->
        
</div>

</body>
</html>
