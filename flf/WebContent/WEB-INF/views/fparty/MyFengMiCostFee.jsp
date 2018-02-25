<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>记录开销 - 我的蜂蜜</title>
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
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/fparty/kehu.css" />
<link rel="stylesheet" type="text/css" href="css/fparty/yijiebao.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />
<script type="text/javascript" src="js/dataValidate.js"></script>
<script type="text/javascript" src="js/idNumValidate.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$(".Out").each(function() {
			var obj = $(this);
			obj.find(".updown").toggle(function() {
				$(this).attr("src", "images/zhankai(black).jpg");
				obj.find(".Content").slideUp('slow');
			}, function() {
				$(this).attr("src", "images/zhankai(black)1.jpg");
				obj.find(".Content").slideDown('slow');
			});
		});
		$("#hideDiv").hide();
		
		$("#costItem").htmlSelect({defVal:'请选择',data:Constant.costPeject} );
		
		var curPage=${curPage};
		var pageCount=${pageCount};
		$("#fenye").pager({curPage : curPage,pageSize:6,pageCount : pageCount,goPageCall : goPage});
		
		function goPage(curPage, pageSize){
			document.forms["myFengMiCostForm"].action="queryMyFengMiCostFee?CurPage="+curPage+"&PageSize="+pageSize;
			document.forms["myFengMiCostForm"].submit();
		}
		
	});

	function settab_zzjs(name, num, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "zzjs" + i);
			menu.className = i == num ? "on_zzjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
	}
	
	function queryCostFee(){
		document.forms["myFengMiCostForm"].action="queryMyFengMiCostFee?CurPage=1&PageSize=5";
		document.forms["myFengMiCostForm"].submit();
	}
	
	
	var flag = 0;
	function queryDetail(costTime,costId){
		if(flag==0){
			$("#hideDiv_"+costId).fadeIn();
			flag+=1;
		}else{
			$("#hideDiv_"+costId).fadeOut();
			flag=0;
		}
		$.fc.ajaxSubmit({
			url:"queryDetailCostFee",
			dataType:"json",
			data:"costItem=" + $("#costItem").val() +
	             "&startCostFee="+ $("#startCostFee").val() +
	             "&endCostFee=" + $("#endCostFee").val() +
	             "&costRemark=" + $("#costRemark").val() +
	             "&costTime=" + costTime +
	             "&date=" + new Date,
	        callBackFn:function(json){
	        	$("#hideDiv_"+costId).html("");
				for(var i = 0; i < json.length; i++){
					$("#hideDiv_"+costId).prepend("<div class='Y06KXJLlb1' id='1_Div_" +i+ "'>"+ json[i].costTime +"</div>" +
							    "<div class='Y06KXJLlb2' id='2_Div_" +i+ "' align='center'>"+ json[i].costItem +"</div>" +
								"<div class='Y06KXJLlb3' id='3_Div_" +i+ "' align='center'>"+ json[i].costRemark +"</div>" +
								"<div class='Y06KXJLlb4' id='4_Div_" +i+ "'>"+ json[i].costFee +"元</div>"
								//"<div class='Y06KXJLlb5'><a onclick='updateCostFee()' style='cursor: pointer;' target='_blank'>修改内容</a></div>"
								);
				}
				$("#hideDiv").fadeIn();
			}
		});
	}
	
	// 分页方法
	$(document).ready(function() {
		
	});
	
	
	
	function updateCostFee(){
		//alert(1);
	}
</script>
<!---总体分类样式--->
<link href="css/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>

<body>
	<!--头部-->
	<%@include file="MyFengMiTop.jsp" %>
	<!--End头部-->
	<div class="middle">
		<!--左边-->
		<%@include file="MyFengMiLeft.jsp" %>
		<!--End左边-->
		<!--右边-->
		<div class="FLHRight">
			<!---Y06开销记录--->
			<div class="Y06kaixiaojilu">
				<div class="Y06KXJLtop">
					<div class="Y06KXJLtop_AD">
						<img src="images/Y06AD.jpg" />
					</div>
					<!---今日大事--->
					<div class="Yhome">
						<p>
							积分：<span>1866</span><br /> 佣金：<span>186.6元</span><br />
							预备客户数量：16位
						</p>
						<ul>
							<li>普通客户数量：16位</li>
							<li>会员客户数量：11</li>
							<li>看房客户数量：28</li>
							<li>成交客户数量：3</li>
							<li>成交金额：78.6万元</li>
							<li>成交套数：3套</li>
						</ul>
					</div>
					<!---End 今日大事--->
				</div>


				<div class="Y06KXJL">
					<div class="Y06KXJL_tab">
						<ul>
							
							</span>
							<li id="zzjs1" onclick="settab_zzjs('zzjs',1,1)" class="on_zzjs">历史开销查询</li>
						</ul>
					</div>
					<div class="Y06KXJLlist">
						<div id="zzjs_zzjs1">
							<form name="myFengMiCostForm" method="post">
								<div class="Y06KXJLrqs">
									日期：从
									     <input class="Y01N" name="startDate" id="startDate" size="12"
												maxlength="10"
												onkeydown="if(event.keyCode==8)event.returnValue=false;" value="${startDate }" />
										 <img height="20" src="images/rili.gif" width="20" align="middle"
												onclick="new Calendar(1900,2050).show(document.getElementById('startDate'));"> 到
										 <input class="Y01N" name="endDate" id="endDate" size="12"
												maxlength="10" onkeydown="if(event.keyCode==8)event.returnValue=false;" value="${endDate }" />
										 <img height="20" src="images/rili.gif" width="20" align="middle"
												onclick="new Calendar(1900,2050).show(document.getElementById('endDate'));">
										&nbsp;项目 
										<input class="Y4jiaoyiinput" readonly onfocus="this.blur()" type="text" id="costItem" name="costItem" value="${costItem }">
										&nbsp;金额：从 <input class="Y06KXJLSOSOinput" type="text" id="startCostFee" name="startCostFee" value="${startCostFee }"> 
										&nbsp;到 <input class="Y06KXJLSOSOinput" type="text" id="endCostFee" name="endCostFee" value="${endCostFee }">
								</div>
								<div class="Y06KXJLjg">
									<div class="Y06KXJLjg_left">
										符合条件的项目<b>${sumSize }</b> 天 <b>${sumFee }</b> 元
									</div>
									<div class="Y06KXJLjg_right">
										<input class="Y06KXJL_input" id="costRemark" name="costRemark" type="text" value="${costRemark }"/>
										<input name="button" type="image" onclick="queryCostFee()" src="images/Y01SOSO.gif">
									</div>
								</div>
							</form>
							<div class="Y06KXJLrq">
								<div class="Y06KXJLrq1">日期</div>
								<div class="Y06KXJLrq2">项目</div>
								<div class="Y06KXJLrq3">项目备注</div>
								<div class="Y06KXJLrq4">金额</div>
							</div>
							<div class="Y06KXJLcx">
								<c:forEach items="${lstCost }" var="lstCost">
									<p class="Y06KXJLhj">
										<span>${lstCost.costTime }</span>符合条件花销计<span>${lstCost.iCountFee }</span>项，合计金额<span>${lstCost.costFee }</span>元
										<img src='images/1.jpg' onclick="queryDetail('${lstCost.costTime }','${lstCost.costId }')" style="cursor: pointer;" />
									</p>
								
									<div id="hideDiv_${lstCost.costId }" class="Y06KXJLlb">
										
									</div>
								</c:forEach>
							</div>

							<div class="Y06KXJLcx">

								<!---统计--->
								<p class="Y04tong">统计：${sumSize }条开销录入</p>
								<!---End 统计--->
								<!---页面切换--->
								<div id="fenye">
								
								</div>
								<!---End 页面切换--->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!---End Y06开销记录--->
		</div>
		<!--End右边-->
	</div>
</body>
</html>
