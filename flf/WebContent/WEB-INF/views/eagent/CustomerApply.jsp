<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>报名(下订单) - 首页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="js/page/page.css" type="text/css" />
<!---总体分类样式--->
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/keku.css" type="text/css" />
<link rel="stylesheet" href="js/htmlSelect/htmlSelect.css" type="text/css" />
<!---End 总体分类样式--->
</head>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/iframeSetHeight.js"></script>
<style>
.Y4jiaoyi{ width:760px; float:right;}
.Y4jiaoyiBJDD{ width:760px; margin:30px 0;}
.Y4jiaoyiBJDD_top{ width:760px; clear:both; overflow:hidden;}
.Y4jiaoyiBJDD_top_left{ float:left; font-size:14px; width:70px; height:15px; color:#bb0e13; padding-left:4px;}
.Y4jiaoyiBJDD_top_right{ float:right; width:670px; height:15px; border-bottom:1px solid #DDDDDF; text-align:right; padding-right:16px;}
.Y4jiaoyiBJDD_bottom{ width:758px; clear:both; overflow:hidden; border-left:1px solid #DDDDDF; border-right:1px solid #DDDDDF; border-bottom:1px solid #DDDDDF; color:#015EAB;}
.Y4jiaoyiBJDD_bottom_left{ float:left; width:234px; padding:39px 0 7px 24px;}
.Y4jiaoyiBJDD_bottom_left li{ height:30px; line-height:30px; padding-bottom:20px;}
.Y4jiaoyiinput{ width:164px; height:21px; line-height:21px; border:1px solid #015EAB; background:url(images/jiaoyiBg.gif) left top no-repeat;}
.Y4jiaoyiinput2{width:164px; height:21px; line-height:21px; border:1px solid #015EAB; background:#EAEAEB;}
.Y4jiaoyiBJDD_bottom_right{ float:right; width:490px; height:286px; margin:2px 2px 0 0; background:url(images/Y4jiaoyileft.gif) left top no-repeat; border-top:1px solid #DDDDDF; border-right:1px solid #DDDDDF; border-bottom:1px solid #DDDDDF; padding-left:1px; padding:13px 0;}
.Y4qdxd{ float:right; padding:3px 3px 7px 0;}
.Y4DDLB{ width:760px; clear:both; overflow:hidden; color:#307eb8; background:#D2D2D3; height:25px; line-height:25px; margin-bottom:10px;}
.Y4DDLB li{ float:left; width:120px; padding-left:6px;}
.Y4DDLBXk{ width:760px; clear:both; overflow:hidden;}
.Y4DDLBXk1{ float:left; margin-left:95px !important; >margin-left:48px !important; margin-left:30px; margin-right:7px !important; >margin-right:3px !important; margin-right:3px; }
.Y4DDLBXk1 input{ width:89px; height:31px; border:1px solid #DDDDDF; background:#EAEAEC; line-height:31px; text-align:center; color:#BC0D12;}
.Y4DDLBXk2{ float:left; width:122px;}
.Y4DDLBXk2 input{ width:120px; height:31px; border:1px solid #DDDDDF; background:#EAEAEC; line-height:31px; text-align:center; color:#BC0D12;}
.Y4DDLBXk3{ float:left; width:173px; margin:0 8px 0 3px; _margin-right:2px;}
.Y4DDLBXk3 input{ width:171px; height:31px; border:1px solid #DDDDDF; background:#EAEAEC; line-height:31px; text-align:center; color:#BC0D12;}
.Y4DDLBXk4{ float:left; width:142px;}
.Y4DDLBXk4 input{ width:140px; height:31px; border:1px solid #DDDDDF; background:#EAEAEC; line-height:31px; text-align:center; color:#BC0D12;}
.Y4DDLBXk5{ float:left; width:51px; margin:0 8px 0 3px;}
.Y4DDLBXk5 input{ width:49px; height:31px; border:1px solid #DDDDDF; background:#EAEAEC; line-height:31px; text-align:center; color:#BC0D12;}
.Y4DDLBXk6{ float:left; width:53px; padding-top:5px;}
.Y4DDLBLB{ width:760px; height:21px; line-height:21px; clear:both; overflow:hidden; border-bottom:1px solid #DDDDDF; padding:20px 0 10px 0; text-align:center; color:#A8A8AA;}
.Y4DDLBLB1{ float:left; width:90px;}
.Y4DDLBLB2{ float:left; width:98px;}
.Y4DDLBLB3{ float:left; width:125px;}
.Y4DDLBLB4{ float:left; width:181px;}
.Y4DDLBLB5{ float:left; width:145px;}
.Y4DDLBLB6{ float:left; width:65px;}
.Y4DDLBLB7{ float:left; width:53px; color:#000;}
.Y04tong{ width:760px;line-height:24px;border-bottom:1px solid #ccc; padding-left:5px; color:#C0091D;}
</style>

<script type="text/javascript">
	$(document).ready(function(){
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
	});
	
	// 动态同步数据
	function synUuserInfo(fristObj,lastObj){
		var objVal=$("#"+fristObj).val();
		$("#"+lastObj).val(objVal);
	}
	
	
	// 分页方法
	$(document).ready(function() {
		var strCurPage=${curPage};
		var strPageCount=${pageCount};
		$("#orderFenye").pager({curPage : strCurPage,pageSize:10,pageCount : strPageCount,goPageCall : goPage});
		
		function goPage(curPage, pageSize){
			document.location.href="queryCustomerApply?curPage="+curPage+"&pageSize="+pageSize;
		}
	});
	
	// 客户列表
	function ajaxQueryUserName(obj){
		$("#nameObjLst").fadeIn();
		$("#seeHouseOrderLst").hide();
		$("#buyHouseOrderLst").hide();
		$("#touSeeHouseOrderLst").hide();
		$("#clubOrderLst").hide();
		var cusTomerName = obj.value;
		if(typeof obj.value == 'undefined'){
			cusTomerName = "";
		}
		document.getElementById("nameObjLstIframe").src = "getCusTomerList?cusTomerName="+cusTomerName;
	}
	
	var orderTypeId;
	// 订单类型
	function ajaxOrderType(typeId){
		if(typeof typeId == 'undefined'){
			return false;
		}
		orderTypeId = typeId;
		// 隐藏客户姓名列表
		$("#nameObjLst").hide();
		switch (typeId){
			case '1':{
				$("#buyHouseOrderLst").fadeIn();
				$("#seeHouseOrderLst").hide();
				$("#touSeeHouseOrderLst").hide();
				$("#clubOrderLst").hide();
				$("#nameObjLst").hide();
				// 给隐藏表单赋值，标识出是购房还是看房
				document.getElementById("orderTypeFlag").value=1;
				document.getElementById("buyHouseOrderLstIframe").src = "getHouseInfoList";
				break;
			}
			case '2':{
				$("#buyHouseOrderLst").hide();
				$("#seeHouseOrderLst").fadeIn();
				$("#touSeeHouseOrderLst").hide();
				$("#clubOrderLst").hide();
				$("#nameObjLst").hide();
				// 给隐藏表单赋值，标识出是购房还是看房
				document.getElementById("orderTypeFlag").value=2;
				document.getElementById("seeHouseOrderLstIframe").src = "getSeeHouseInfoList";
				break;
			}
			case '3':{
				$("#buyHouseOrderLst").hide();
				$("#seeHouseOrderLst").hide();
				$("#touSeeHouseOrderLst").fadeIn();
				$("#clubOrderLst").hide();
				$("#nameObjLst").hide();
				//3就是旅游购房团
				document.getElementById("orderTypeFlag").value=3;
				document.getElementById("seeTourismLineIframe").src = "getTourismLine";
				break;
			}
			case '4':{
				$("#buyHouseOrderLst").hide();
				$("#seeHouseOrderLst").hide();
				$("#touSeeHouseOrderLst").hide();
				$("#clubOrderLst").fadeIn();
				$("#nameObjLst").hide();
				//4就是会所活动
				document.getElementById("orderTypeFlag").value=4;
				document.getElementById("clubOrderLstIframe").src = "queryEventInfoList";
				break;
			}
		}
	}
	
	// 过滤楼盘信息
	function ajaxOrderObj(obj){
		switch (orderTypeId){
		case '1':{
			$("#buyHouseOrderLst").fadeIn();
			$("#seeHouseOrderLst").hide();
			$("#touSeeHouseOrderLst").hide();
			$("#clubOrderLst").hide();
			$("#nameObjLst").hide();
			document.getElementById("buyHouseOrderLstIframe").src = "getHouseInfoList?objName="+obj.value;
			break;
		}
		case '2':{
			$("#buyHouseOrderLst").hide();
			$("#seeHouseOrderLst").fadeIn();
			$("#touSeeHouseOrderLst").hide();
			$("#clubOrderLst").hide();
			$("#nameObjLst").hide();
			document.getElementById("buyHouseOrderLstIframe").src = "getHouseInfoList?objName="+obj.value;
			break;
		}
		case '3':{
			$("#buyHouseOrderLst").hide();
			$("#seeHouseOrderLst").hide();
			$("#touSeeHouseOrderLst").fadeIn();
			$("#clubOrderLst").hide();
			$("#nameObjLst").hide();
			document.getElementById("seeTourismLineIframe").src = "getTourismLine?lineName="+obj.value;
			break;
		}
		case '4':{
			$("#buyHouseOrderLst").hide();
			$("#seeHouseOrderLst").hide();
			$("#touSeeHouseOrderLst").hide();
			$("#clubOrderLst").fadeIn();
			$("#nameObjLst").hide();
			document.getElementById("clubOrderLstIframe").src = "queryEventInfoList?eventName="+obj.value;
			break;
		}
	}
	}
	
	$(document).ready(function(){
		// 文本框
		$("#orderType").htmlSelect({defVal:"请输入",data:Constant.ordertype,clickFn:ajaxOrderType} );
		$("#seeHouseOrderLst").hide();
		$("#buyHouseOrderLst").hide();
		$("#touSeeHouseOrderLst").hide();
		$("#clubOrderLst").hide();
		//ajaxQueryUserName("");
	});
	
	function insertOrder(){
		//alert(orderTypeId);
		document.forms["orderForm"].action="insertOrder";
		document.forms["orderForm"].submit();
	}
	
	// 取消订单
	function deleteOrder(orderId,orderType){
		document.location.href="canceledOrder?orderId="+orderId+"&orderType="+orderType;
	}
</script>
</head>
<body>
	<!--头部-->
	<div class="FlhTopOut">
		<div class="FlhTop">
	        <div class="FlhLogo"></div>
			<div class="TopRight">
	            <span class="FLHphone"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></span>
	        </div>
			<div id="menu">
				<ul>
	              <li><a href="index-a.html" id="cur">首页</a></li>
	              <li><a href="index-geren.html">个人主页</a></li>
	              <li><a href="index-b-a.html">客户</a></li>
	              <li><a href="index-fang.html">房源</a></li>
	              <li><a href="jiaoyiY4.html">订单</a></li>
	              <li><a href="Y52xuexi.html">学习</a></li>
	              <li><a href="index-haoyou.html">好友</a></li>
	              <li><a href="Y7chihewanle.html">吃喝玩乐</a></li>
	               <li><a href="index-xiaoxi.html">消息</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="FLHEscOUT">
		<div>
	    	<font>欢迎您进入房乐会! <a href="denglu.html">[安全退出]</a></font>
	    </div>
	</div>
	<!--End头部-->
	
	<div class="middle">
	<!--左边-->
	 	<div class="FLHLeft">
	    	<div class="FLHzl">
	        	<span class="photo"><img src="images/touxiang.jpg" /></span>
	            <ul class="nickname">
	            	
	                <li>姓名：赵美丽</li>
	                <li>生日：8.26</li>
	                <li><img src="images/80.jpg" /></li>
	            </ul>
	            <span class="linkage">
	            	<span style="margin:0;"><a href="">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a href="">[修改密码]</a></span>           
	            </span>
	        </div>
			<div class="jieshao">
			   <ul>
			   <li> 已有<span class="red">3</span>同行加你为好友</li> 
	           <li> 已有<span class="red">3</span>客户点名你为房秘书</li>
			   </ul>
			 </div>
	        <ul class="treeNav">
			   
	        	<li>
	            	<div class="treefont">
	                	<img src="images/1.jpg" /><font><a href="index-renshou.html">认售楼盘</a></font>
	                </div>
	                <div class="xian"></div>
	            </li> 
	            <li>
	            	<div class="treefont">
	                	<img src="images/2.jpg" /><font><a href="index-a-tianjia.html">添加客户</a></font>
	                </div>
	                <div class="xian"></div>	
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/3.jpg" /><font><a href="queryCustomerContact?curPage=1&pageSize=10">记录约会</a></font>
	                </div>
	                <div class="xian"></div> 	
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/4.jpg" /><font><a href="rizhiY04Home.html">写日志</a></font>
	                </div>
	                <div class="xian"></div>	
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/5.jpg" /><font><a href="Y13xiangce.html">传靓照</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/6.jpg" /><font><a href="costFee">记录开销</a></font>
	             	</div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/7.jpg" /><font><a href="HomejiaoyiY4.html">报名（下订单）</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/8.jpg" /><font><a href="HomeTJFXY4.html">推荐分享</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/9.jpg" /><font><a href="#">社交hub</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	            <li>&nbsp;</li>
	            <li>&nbsp;</li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/10.jpg" /><font><a href="#">我的财富</a></font>
	               </div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/11.jpg" /><font><a href="#">积分商场</a></font>
	               </div>
	                <div class="xian"></div>
	            </li>
				<li>
	            	<div class="treefont">
	                	<img src="images/9.jpg" /><font><a href="#">积分兑换</a></font>
	               </div>
	                <div class="xian"></div>
	            </li>
	            <li>&nbsp;</li>
	            <li>&nbsp;</li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/10.jpg" /><font><a href="../funlifun/monopolyofsale.html">搜索房源</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/11.jpg" /><font><a href="../funlifun/monopolyofsale(L).html">搜索购房团</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/12.jpg" /><font><a href="#">搜索活动</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	            <li>
	            	<div class="treefont">
	                	<img src="images/12.jpg" /><font><a href="../funlifun/monopolyofsaleM2.html">搜索蜂蜜</a></font>
	                </div>
	                <div class="xian"></div>
	            </li>
	        </ul>
	    </div>
		<!--End左边-->
		
		<!--右边-->
		<div class="FLHRight">
			<!---Y4交易--->
			<div class="Y4jiaoyi">
				<!---编辑订单--->
				<div class="Y4jiaoyiBJDD">
					<div class="Y4jiaoyiBJDD_top">
						<div class="Y4jiaoyiBJDD_top_left">编辑订单</div>
						<div class="Y4jiaoyiBJDD_top_right">对于你的订单，我们的工作人员将在24小时内与你联系。<img src="images/zhankai(black)1.jpg" />
						</div>
					</div>
					<div class="Y4jiaoyiBJDD_bottom">
						<form name="orderForm" method="post">
						<input type="hidden" name="orderTypeFlag" id="orderTypeFlag" value="" >
						<input type="hidden" name="togetherCustomers" id="joinCnt" value="" ><!-- 参团人数 -->
						<input type="hidden" name="customerPhone" id="customerPhone" value="" ><!-- 客户电话 -->
						<input type="hidden" name="customerId" id="customerId" value="" ><!-- 客户ID -->
						<input type="hidden" name="houseGroupId" id="houseGroupId" value="" ><!-- 看房团ID -->
						<input type="hidden" name="cusId" id="cusId" value="" ><!-- cusId -->
						<input type="hidden" name="eventId" id="eventId" value="" ><!-- 活动Id -->
						<input type="hidden" name="customerType" id="customerType" value="" ><!-- 客户类型 -->
						<input type="hidden" name="homePrice" id="homePrice" value="" ><!-- 房子价格 -->
						<input type="hidden" name="houseId" id="houseId" value="" ><!-- 房子价格 -->
							<ul class="Y4jiaoyiBJDD_bottom_left" style="margin-bottom:30px;">
								<li>客户姓名：
									<input id="userName" name="customerName" type="text" value="${customerName }" onkeydown="synUuserInfo('userName','synUserName');" onkeyup="synUuserInfo('userName','synUserName');ajaxQueryUserName(this);" class="Y4jiaoyiinput">
								</li>
								<li>订单类型：
									<input id="orderType" readonly onfocus="this.blur()" value="${orderType }" name="orderType" type="text" class="Y4jiaoyiinput">
								</li>
								<li>订单对象：
									<input id="orderObj" name="orderObj" type="text" value="${orderObj }" onkeydown="synUuserInfo('orderObj','synOrderObj');" onkeyup="synUuserInfo('orderObj','synOrderObj');ajaxOrderObj(this);" class="Y4jiaoyiinput">
								</li>
								<li>执行时间：
									<input class="Y01N" name="joinTime" id="execuTime" readonly onfocus="this.blur()" value="${joinTime }"/>
									<img height="20" src="images/rili.gif" width="20" align="middle"
											onclick="new Calendar(1900,2050).show(document.getElementById('execuTime'));">
								</li>
								<li>支付金额：
									<input id="payAmount" readonly onfocus="this.blur()" value="${payAmount }" name="payAmount" type="text" onkeydown="synUuserInfo('payAmount','synPayAmount');" onkeyup="synUuserInfo('payAmount','synPayAmount');" class="Y4jiaoyiinput2">
								</li>
							</ul>
							<div class="Y4jiaoyiBJDD_bottom_right" id="nameObjLst">
								<iframe scrolling="auto" onload="Javascript:SetWinHeight(this)" style="height: 300px;" frameborder="0" width="100%" id="nameObjLstIframe" name="nameObjLstIframe" src="getCusTomerList?cusTomerName=">
									
								</iframe>
							</div>
							<!-- 四种订单类型 -->
							<div class="Y4jiaoyiBJDD_bottom_right" id="buyHouseOrderLst">
								<iframe scrolling="no" onload="Javascript:SetWinHeight(this)" style="height: 300px;" frameborder="0" width="100%" id="buyHouseOrderLstIframe" name="buyHouseOrderLstIframe" src="">
									
								</iframe>
							</div>
							<div class="Y4jiaoyiBJDD_bottom_right" id="seeHouseOrderLst">
								<iframe scrolling="no" onload="Javascript:SetWinHeight(this)" style="height: 300px;" frameborder="0" width="100%" id="seeHouseOrderLstIframe" name="seeHouseOrderLstIframe" src="">
									
								</iframe>
							</div>
							<div class="Y4jiaoyiBJDD_bottom_right" id="touSeeHouseOrderLst">
								<iframe scrolling="no" onload="Javascript:SetWinHeight(this)" style="height: 300px;" frameborder="0" height="25px;" width="100%" id="seeTourismLineIframe" name="seeTourismLineIframe" src="">
									
								</iframe>
							</div>
							<div class="Y4jiaoyiBJDD_bottom_right" id="clubOrderLst">
								<iframe scrolling="no" onload="Javascript:SetWinHeight(this)" style="height: 300px;" frameborder="0" height="25px;" width="100%" id="clubOrderLstIframe" name="clubOrderLstIframe" src="">
									
								</iframe>
							</div>
							
							<p class="Y4qdxd">
								<img alt="确定下单" style="cursor: pointer;" name="button" src="images/Y4qdxd.gif" onclick="insertOrder()">
							</p>
						</form>
					</div>
				</div>
				<!---End 编辑订单--->
				<!---订单列表--->
				<div class="Y4jiaoyiBJDD">
					<ul class="Y4DDLB">
						<li>订单号</li>
						<li>姓名</li>
						<li>订单类型</li>
						<li>订单对象</li>
						<li>时间</li>
						<li>金额</li>
					</ul>
					<div class="Y4DDLBXk">
						<div class="Y4DDLBXk1"><input id="synUserName" onfocus="this.blur()" readonly></div>
						<div class="Y4DDLBXk2"><input id="synOrderType" onfocus="this.blur()" readonly></div>
						<div class="Y4DDLBXk3"><input id="synOrderObj" onfocus="this.blur()" readonly></div>
						<div class="Y4DDLBXk4"><input id="synExceuTime" onfocus="this.blur()" readonly></div>
						<div class="Y4DDLBXk5"><input id="synPayAmount" onfocus="this.blur()" readonly></div>
						<!--<div class="Y4DDLBXk6"><input name="button" type="image" src="images/Y4qxdd.gif"></div>-->
					</div>
					<c:if test="${empty lstEventInfo}">
						<div class="Y4DDLBLB">
							暂无记录！
						</div>
					</c:if>
					<c:if test="${!empty lstEventInfo}">
						<c:forEach items="${lstEventInfo }" var="lstEventInfo">
							<div class="Y4DDLBLB">
								<div class="Y4DDLBLB1">BJ320001</div>
								<div class="Y4DDLBLB2">${lstEventInfo.name }</div>
								<c:if test="${lstEventInfo.eventType == 1}">
									<div class="Y4DDLBLB3">看房订单</div>
								</c:if>
								<c:if test="${lstEventInfo.eventType == 2}">
									<div class="Y4DDLBLB3">活动订单</div>
								</c:if>
								<c:if test="${lstEventInfo.eventType == 3}">
									<div class="Y4DDLBLB3">旅游购房团订单</div>
								</c:if>
								<c:if test="${lstEventInfo.eventType == 4}">
									<div class="Y4DDLBLB3">购房订单</div>
								</c:if>
								<div class="Y4DDLBLB4">${lstEventInfo.eventTitle }</div>
								<div class="Y4DDLBLB5">
									<fmt:formatDate value="${lstEventInfo.eventInfoCustomer.createAt }" pattern="yyyy-MM-dd"/>
								</div>
								<div class="Y4DDLBLB6">${lstEventInfo.amount }</div>
								<div class="Y4DDLBLB7">
									<img alt="取消订单" onclick="deleteOrder('${lstEventInfo.id}','${lstEventInfo.eventType}');" src="images/Y4qxdd.gif">
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<!---End 订单列表--->
				<!---统计--->
				<p class="Y04tong">统计：${iCount }个订单</p>
				<!---End 统计--->
				<!---页面切换--->
				<div id="orderFenye">
		        	
			    </div>
				<!---End 页面切换--->
			</div>
			<!---End Y4交易--->   
		</div>
		<!--End右边-->    
	</div>
</body>
</html>