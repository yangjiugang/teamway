<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>记录约会 - 首页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<!--<link rel="stylesheet" href="css/index.css" type="text/css" />-->
<link rel="stylesheet" href="js/page/page.css" type="text/css" />
<!---总体分类样式--->
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<!-- table页样式 -->
<link rel="stylesheet" type="text/css" href="js/tabs/tabs.css" />
<!-- 分页 -->
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />
<!---End 总体分类样式--->
</head>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<!-- 下拉框 -->
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
<!-- table页JS -->
<script type="text/javascript" src="js/tabs/tabs.js"></script>
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

	function settab_zzjs(name, num, n) {
		for ( var i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "zzjs" + i);
			menu.className = i == num ? "on_zzjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
	}

	// 分页方法
	$(document).ready(function() {
		var curPage=${curPage };
		var pageCount=${pageCount };
		$("#fenye").pager({
			curPage : curPage,
			pageSize : 10,
			pageCount : pageCount,
			goPageCall : goPage
		});
		
		$("#fenyeyi").pager({
			curPage : curPage,
			pageSize : 10,
			pageCount : pageCount,
			goPageCall : goPageyi
		});
	});

	// 分页回调方法
	function goPage(curPage, pageSize) {
		$.ajax({
			"url" : "queryPageCustomerContact",
			"type" : "POST",
			"contentType" : "application/x-www-form-urlencoded; charset=utf-8",
			"data" : "startDate=" + $("#contactStartDate").val() +
					 "&endDate=" + $("#contactEndDate").val() +
					 "&keyWord=" + $("#keyWord").val() +
					 "&pageSize=" + pageSize +
					 "&curPage=" + curPage +
					 "&newDate=" + new Date,
			"success" : function(data) {
				$("#contact_record").html("<div class='Y03JLYHlbS'></div>");
				var communiaction = "";
				for(var i = 0; i<data.length; i++){
					if(data[i].communicationMethod == 1){
						communiaction = '<div class="Y03JLYHlb7" align="center">面谈</div>';
					}else if(data[i].communicationMethod == 2){
						communiaction = '<div class="Y03JLYHlb7" align="center">电话</div>';
					}else if(data[i].communicationMethod == 3){
						communiaction = '<div class="Y03JLYHlb7" align="center">邮件</div>';
					}else if(data[i].communicationMethod == 4){
						communiaction = '<div class="Y03JLYHlb7" align="center">短信</div>';
					}
					$("#contact_record").prepend(
						'<div class="Y03JLYHlbS" >'+
						'<div class="Y03JLYHlb1" align="center">'+data[i].customerName+'</div>'+
						'<div class="Y03JLYHlb2" align="center">'+data[i].talkUser+'</div>'+
						'<div class="Y03JLYHlb3">'+data[i].recordCreateDate+'</div>'+
						'<div class="Y03JLYHlb4">'+data[i].recordStartDate+'</div>'+
						'<div class="Y03JLYHlb5">'+data[i].recordEndDate+'</div>'+
						'<div class="Y03JLYHlb6" align="center">'+data[i].address+'</div>'+
						communiaction+
						'<div class="Y03JLYHlb8" align="center">'+data[i].buyIntention+'</div>'+
						'<div class="Y03JLYHlb9" align="center">'+data[i].takeinGroupIntention+'</div>'+
						'<div class="Y03JLYHlb10" align="center">'+data[i].takeinClubIntention+'</div>'+
						'</div>'
					);
					$("#iSumMsg").text(data.length);
					$("#totalMsg").text(data.length);
				}
			}
		});
	}
	
	
	// 分页回调方法
	function goPageyi(curPage, pageSize) {
		$.ajax({
			"url" : "queryPageCustomerContact",
			"type" : "POST",
			"contentType" : "application/x-www-form-urlencoded; charset=utf-8",
			"data" : "startDate=" + $("#contactStartDate").val() +
					 "&endDate=" + $("#contactEndDate").val() +
					 "&keyWord=" + $("#keyWord").val() +
					 "&pageSize=" + pageSize +
					 "&curPage=" + curPage +
					 "&newDate=" + new Date,
			"success" : function(data) {
				$("#contactRecordList").html("<div class='Y03JLYHlbS'></div>");
				var communiaction = "";
				for(var i = 0; i<data.length; i++){
					if(data[i].communicationMethod == 1){
						communiaction = '<div class="Y03JLYHlb7" align="center">面谈</div>';
					}else if(data[i].communicationMethod == 2){
						communiaction = '<div class="Y03JLYHlb7" align="center">电话</div>';
					}else if(data[i].communicationMethod == 3){
						communiaction = '<div class="Y03JLYHlb7" align="center">邮件</div>';
					}else if(data[i].communicationMethod == 4){
						communiaction = '<div class="Y03JLYHlb7" align="center">短信</div>';
					}
					$("#contactRecordList").append(
						'<div class="Y03JLYHlbS" >'+
						'<div class="Y03JLYHlb1" align="center">'+data[i].customerName+'</div>'+
						'<div class="Y03JLYHlb2" align="center">'+data[i].talkUser+'</div>'+
						'<div class="Y03JLYHlb3">'+data[i].recordCreateDate+'</div>'+
						'<div class="Y03JLYHlb4">'+data[i].recordStartDate+'</div>'+
						'<div class="Y03JLYHlb5">'+data[i].recordEndDate+'</div>'+
						'<div class="Y03JLYHlb6" align="center">'+data[i].address+'</div>'+
						communiaction+
						'<div class="Y03JLYHlb8" align="center">'+data[i].buyIntention+'</div>'+
						'<div class="Y03JLYHlb9" align="center">'+data[i].takeinGroupIntention+'</div>'+
						'<div class="Y03JLYHlb10" align="center">'+data[i].takeinClubIntention+'</div>'+
						'<div class="Y03JLYHlb13"><input id="'+ data[i].recordId  +'" name="button" type="image" onclick="deleteOrder(this);" src="images/Y4qxdd.gif"></div>'+
						'</div>'
					);
					$("#contactRecordMsg").text(data.length);
				}
			}
		});
	}
	
	function addDataList(){
		
	}
	
	function deleteOrder(obj){
		document.forms["deleteOrderForm"].action="deleteOrder?recordId=" + obj.id;
		document.forms["deleteOrderForm"].submit();
	}
	
	
	
	
	// 保存提交
	function saveSubmit(){
		document.forms["addContactForm"].action="insertContact";
		document.forms["addContactForm"].submit();
	}
	
	// 继续录入
	function continuAdd(){
		document.forms["addContactForm"].action="insertContact";
		document.forms["addContactForm"].submit();
	}
	
	// 动态同步数据
	function synVal(fristObj,lastObj){
		var objVal=$("#"+fristObj).val();
		//$("#"+laseObj).val('');
		$("#"+lastObj).text(objVal);
	}
	
	function insertContact(flag){
		if($("#customerName").val() == ""){
			alert("客户姓名不能为空！");
			return false;
		}
		if($("#cusId").val() == ""){
			alert("客户ID不能为空！");
			return false;
		}
		if($("#talkUser").val() == ""){
			alert("约谈人不能为空！");
			return false;
		}
		if($("#recordCreateDate").val() == ""){
			alert("约谈日期不能为空！");
			return false;
		}
		if($("#recordStartDate").val() == ""){
			alert("开始不能为空！");
			return false;
		}
		if($("#recordEndDate").val() == ""){
			alert("结束不能为空！");
			return false;
		}
		if($("#address").val() == ""){
			alert("地址不能为空！");
			return false;
		}
		if(flag == 1){
			// 保存提交
			saveSubmit();
		}else{
			// 继续录入
			continuAdd();
		}
	}
	
	// 约会条件查询
	function queryCondition(){
		if($("#contactStartDate").val() == ""){
			alert("请输入开始时间！");
		}else if($("#contactEndDate").val() == ""){
			alert("请输入结束时间！");
		}else{
			$.ajax({
				"url" : "queryCondition",
				"type" : "POST",
				"contentType" : "application/x-www-form-urlencoded; charset=utf-8",
				"data" : "startDate=" + $("#contactStartDate").val() + 
						 "&endDate=" + $("#contactEndDate").val() + 
						 "&keyWord=" + $("#keyWord").val() + 
						 "&newDate=" + new Date,
				"success" : function(data) {
						$("#contact_record").html("<div class='Y03JLYHlbS'></div>");
						var communiaction = "";
						for(var i = 0; i<data.length; i++){
							if(data[i].communicationMethod == 1){
								communiaction = '<div class="Y03JLYHlb7" align="center">面谈</div>';
							}else if(data[i].communicationMethod == 2){
								communiaction = '<div class="Y03JLYHlb7" align="center">电话</div>';
							}else if(data[i].communicationMethod == 3){
								communiaction = '<div class="Y03JLYHlb7" align="center">邮件</div>';
							}else if(data[i].communicationMethod == 4){
								communiaction = '<div class="Y03JLYHlb7" align="center">短信</div>';
							}
							$("#contact_record").prepend(
								'<div class="Y03JLYHlbS" >'+
								'<div class="Y03JLYHlb1" align="center">'+data[i].customerName+'</div>'+
								'<div class="Y03JLYHlb2" align="center">'+data[i].talkUser+'</div>'+
								'<div class="Y03JLYHlb3">'+data[i].recordCreateDate+'</div>'+
								'<div class="Y03JLYHlb4">'+data[i].recordStartDate+'</div>'+
								'<div class="Y03JLYHlb5">'+data[i].recordEndDate+'</div>'+
								'<div class="Y03JLYHlb6" align="center">'+data[i].address+'</div>'+
								communiaction+
								'<div class="Y03JLYHlb8" align="center">'+data[i].buyIntention+'</div>'+
								'<div class="Y03JLYHlb9" align="center">'+data[i].takeinGroupIntention+'</div>'+
								'<div class="Y03JLYHlb10" align="center">'+data[i].takeinClubIntention+'</div>'+
								'</div>'
							);
							$("#iSumMsg").text(data.length);
							$("#totalMsg").text(data.length);
						}
				}
			});
		}
	}
	
	$(document).ready(function(){
		// 文本框
		$("#communicationMethod").htmlSelect({defVal:"请输入",data:Constant.contactManner} );
		$("#content").htmlSelect({defVal:"请输入",data:Constant.content} );
		$("#takeinGroupIntention").htmlSelect({defVal:"请输入",data:Constant.groupIntention} );
		$("#takeinClubIntention").htmlSelect({defVal:"请输入",data:Constant.ActivityIntention} );
		$("#buyHouseInt").htmlSelect({defVal:"请输入",data:Constant.buyHouseIntention} );
	});
	
	function addCusData(){
		window.laction.href="IndexKehuXiangqing";
	}

</script>

<body>
	<!--头部-->
	<div class="FlhTopOut">
		<div class="FlhTop">
			<div class="FlhLogo"></div>
			<div class="TopRight">
				<span class="FLHphone"><div>服务热线：</div>
					<img src="images/phone2.jpg" /><font>400 61355288</font>
				</span>
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
					<li>昵称：魅力一抖</li>
					<li>姓名：赵美丽</li>
					<li>生日：8.26</li>
					<li><img src="images/80.jpg" /></li>
				</ul>
				<span class="linkage"> <span style="margin: 0;"><a
						href="">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a
						href="">[修改密码]</a></span>
				</span>
			</div>
			<div class="jieshao">
				<ul>
					<li>已有<span class="red">3</span>同行加你为好友
					</li>
					<li>已有<span class="red">3</span>客户点名你为房秘书
					</li>
				</ul>
			</div>
			<ul class="treeNav">

				<li>
					<div class="treefont">
						<img src="images/1.jpg" /><font><a
							href="index-renshou.html">认售楼盘</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/2.jpg" /><font><a
							href="index-a-tianjia.html">添加客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/3.jpg" /><font><a
							href="queryCustomerContact?curPage=1&pageSize=10">记录约会</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/4.jpg" /><font><a
							href="rizhiY04Home.html">写日志</a></font>
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
						<img src="images/7.jpg" /><font><a
							href="queryCustomerApply">报名（下订单）</a></font>
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
						<img src="images/10.jpg" /><font><a
							href="../funlifun/monopolyofsale.html">搜索房源</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><font><a
							href="../funlifun/monopolyofsale(L).html">搜索购房团</a></font>
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
						<img src="images/12.jpg" /><font><a
							href="../funlifun/monopolyofsaleM2.html">搜索蜂蜜</a></font>
					</div>
					<div class="xian"></div>
				</li>
			</ul>
		</div>
		<!--End左边-->
		<!--右边-->
		<div class="FLHRight">
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
				<!---约会录入--->
				<div class="Y04rizhi">
					<div class="Y04rizhi_tab">
						<ul>
							<li id="zzjs1" onclick="settab_zzjs('zzjs',1,2)" class="on_zzjs">约会录入</li>
							<li id="zzjs2" onclick="settab_zzjs('zzjs',2,2)">约会查询</li>
						</ul>
					</div>
					<div class="Y04rizhilist">
						<div id="zzjs_zzjs1">
							<form name="addContactForm" method="post">
								<input type="hidden" name="recordCreateDate" value="" />
								<input type="hidden" name="recordStartDate" value="" />
								<input type="hidden" name="recordEndDate" value="" />
								<ul class="Y03juluyuehui">
									<li>客户姓名： &nbsp; <input class="Y03juluyuehuiinput" 
										type="text" id="customerName" name="customerName" onkeyup="synVal('customerName','synCusName')" ></li>
									<li>客户编号： &nbsp; <input class="Y03yuehuijuluinput"
										type="text" id="cusId" name="cusId"></li>
									<li>约谈人： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="Y03juluyuehuiinput" type="text" id="talkUser" name="talkUser" 
									  onkeyup="synVal('talkUser','synName')"></li>
									<li>约谈日期： &nbsp; 
										<input class="Y01N" name="recordCreateDate" id="recordCreateDate" style="width: 72px;"
											maxlength="10" readonly onfocus="this.blur()"
											onkeydown="if(event.keyCode==8)event.returnValue=false;"
											onkeyup="synVal('recordCreateDate','synRecordDate')" />
										<img height="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('recordCreateDate'));"/>
									</li>
									<li>开始时间： &nbsp; 
										<input class="Y01N" name="recordStartDate" id="recordStartDate" style="width: 72px;"
											maxlength="10" readonly onfocus="this.blur()"
											onkeydown="if(event.keyCode==8)event.returnValue=false;"
											onkeyup="synVal('recordStartDate','synStartDate')" />
										<img height="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('recordStartDate'));">
											 &nbsp;&nbsp; 结束时间： 
										<input class="Y01N" name="recordEndDate" id="recordEndDate" style="width: 72px;"
											maxlength="10" readonly onfocus="this.blur()"
											onkeydown="if(event.keyCode==8)event.returnValue=false;"
											onkeyup="synVal('recordEndDate','synEndDate')"/>
										<img height="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('recordEndDate'));">
									</li>
									<li>约会地点： &nbsp; 
										<input class="Y03yuehuijuluinput"
											type="text" id="address" name="address" onkeyup="synVal('address','synAdress')">
									</li>
									<li>约会方式： &nbsp;
										<input id="communicationMethod" readonly onfocus="this.blur()" type="text" class="Y4jiaoyiinput">
									</li>
									<li>洽谈内容： &nbsp;
											<input id="content" name="content" readonly onfocus="this.blur()" type="text" class="Y4jiaoyiinput">
									</li>
									<li>购房意向：
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input id="buyHouseInt" name="buyHouseInt" readonly onfocus="this.blur()" type="text" class="Y4jiaoyiinput">
									</li>
									<li>客户参团意向：
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input id="takeinGroupIntention" name="takeinGroupIntention" readonly onfocus="this.blur()" type="text" class="Y4jiaoyiinput">
									</li>
									<li>客户参加活动意向： &nbsp;
										<input id="takeinClubIntention" name="takeinClubIntention" readonly onfocus="this.blur()" type="text" class="Y4jiaoyiinput">
									</li>
								</ul>
								<p class="Y4qdxd">
									<img alt="保存提交" src="images/bctj.gif" style="cursor: pointer;" onclick="insertContact(1);">
									<img alt="继续录入" src="images/jxlr.gif" style="cursor: pointer;" onclick="insertContact(2);">
									<img alt="补充客户资料" src="images/bckfxx.gif" style="cursor: pointer;" onclick="addCusData();">
									&nbsp;
								</p>
							</form>
							<div style="height: 30px;"></div>
								<!---订单列表--->
								<form name="deleteOrderForm" method="post">
								<div class="Y4jiaoyiBJDD">
									<div class="Y4jiaoyiBJDD">
										<div class="Y03JLYHlbs">
											<div class="Y03JLYHlbs1">客户姓名</div>
											<div class="Y03JLYHlbs2">约谈人</div>
											<div class="Y03JLYHlbs3">约谈日期</div>
											<div class="Y03JLYHlbs4">开始时间</div>
											<div class="Y03JLYHlbs5">结束时间</div>
											<div class="Y03JLYHlbs6">约会地点</div>
											<div class="Y03JLYHlbs7">约会方式</div>
											<div class="Y03JLYHlbs8">购房意向</div>
											<div class="Y03JLYHlbs9">客户参团意向</div>
											<div class="Y03JLYHlbs10">客户参加活动意向</div>
										</div>
									</div>
									<div class="Y03JLYHlbS red12">
										<div class="Y03JLYHlba1" id="synCusName"></div>
										<div class="Y03JLYHlba2" id="synName"></div>
										<div class="Y03JLYHlba3" id="synRecordDate"></div>
										<div class="Y03JLYHlba4" id="synStartDate"></div>
										<div class="Y03JLYHlba5" id="synEndDate"></div>
										<div class="Y03JLYHlba6" id="synAdress"></div>
										<div class="Y03JLYHlba7" id="synCommMehtod"></div>
										<div class="Y03JLYHlba8" id="synBuyIntention"></div>
										<div class="Y03JLYHlba11" id="synGroupIntention"></div>
										<div class="Y03JLYHlba12" id="synClubIntention"></div>
									</div>
									<div id="contactRecordList">
									<c:forEach items="${customerContact }" var="cusLst">
										<div class="Y03JLYHlbS" >
											<div class="Y03JLYHlb1">${cusLst.customerName }</div>
											<div class="Y03JLYHlb2">${cusLst.userName }</div>
											<div class="Y03JLYHlb3">
												<fmt:formatDate value="${cusLst.recordCreateDate }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											<div class="Y03JLYHlb4">
												<fmt:formatDate value="${cusLst.recordStartDate }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											<div class="Y03JLYHlb5">
												<fmt:formatDate value="${cusLst.recordEndDate }" pattern="yyyy-MM-dd"/>
											</div>
											<div class="Y03JLYHlb6">${cusLst.address }</div>
											<c:if test="${cusLst.communicationMethod == 1 }">
												<div class="Y03JLYHlb7">面谈</div>
											</c:if>
											<c:if test="${cusLst.communicationMethod == 2 }">
												<div class="Y03JLYHlb7">电话</div>
											</c:if>
											<c:if test="${cusLst.communicationMethod == 3 }">
												<div class="Y03JLYHlb7">邮件</div>
											</c:if>
											<c:if test="${cusLst.communicationMethod == 4 }">
												<div class="Y03JLYHlb7">短信</div>
											</c:if>
											<div class="Y03JLYHlb8">
												<c:if test="${cusLst.buyIntention == 1}">
													没有意向
												</c:if>
												<c:if test="${cusLst.buyIntention == 2}">
													一般
												</c:if>
												<c:if test="${cusLst.buyIntention == 3}">
													较有意向
												</c:if>
												<c:if test="${cusLst.buyIntention == 4}">
													非常愿意
												</c:if>
												<c:if test="${cusLst.buyIntention == 0}">
													不明
												</c:if>
											</div>
											
											<div class="Y03JLYHlb11">
												<c:if test="${cusLst.takeinGroupIntention == 1}">
													没有意向
												</c:if>
												<c:if test="${cusLst.takeinGroupIntention == 2}">
													一般
												</c:if>
												<c:if test="${cusLst.takeinGroupIntention == 3}">
													较有意向
												</c:if>
												<c:if test="${cusLst.takeinGroupIntention  == 4}">
													非常愿意
												</c:if>
												<c:if test="${cusLst.takeinGroupIntention == 0}">
													不明
												</c:if>
											</div>
											<div class="Y03JLYHlb12">
												<c:if test="${cusLst.takeinClubIntention == 1}">
													没有意向
												</c:if>
												<c:if test="${cusLst.takeinClubIntention == 2}">
													一般
												</c:if>
												<c:if test="${cusLst.takeinClubIntention == 3}">
													较有意向
												</c:if>
												<c:if test="${cusLst.takeinClubIntention == 4}">
													非常愿意
												</c:if>
												<c:if test="${cusLst.takeinClubIntention == 0}">
													不明
												</c:if>
											</div>
											<div class="Y03JLYHlb13">
												<input onclick="deleteOrder(this)" id="${cusLst.recordId }" name="button" type="image" src="images/Y4qxdd.gif">
											</div>
										</div>
									</c:forEach>
									</div>
								</div>
							</form>
							<!---End 订单列表--->
							<!---统计--->
							<p class="Y04tong">统计：<span id="contactRecordMsg">${iCount }</span>条记录约会</p>
							<!---End 统计--->
							<!---页面切换--->
							<div id="fenyeyi">
								
							</div>
							<!---End 页面切换--->
						</div>

						<div id="zzjs_zzjs2" style="display: none;">

							<div class="Y03JLYHMy">
								<form name="queryConditionFrom" method="post">
									<p>
										约会
										<input class="Y01N" name="startDate" id="contactStartDate" style="width: 72px;"
											maxlength="10" readonly onfocus="this.blur()"
											onkeydown="if(event.keyCode==8)event.returnValue=false;"  />
										<img height="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('contactStartDate'));">
											&nbsp;至&nbsp; 
										<input class="Y01N" name="endDate" id="contactEndDate" style="width: 72px;"
											maxlength="10" readonly onfocus="this.blur()" onkeydown="if(event.keyCode==8)event.returnValue=false;"/>
										<img height="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('contactEndDate'));"> &nbsp;&nbsp;
										<input class="Y01input" name="keyWord" id="keyWord" type="text" value="请输入关键词" onFocus="if(this.value=='请输入关键词'){this.value=''}" onblur="if(this.value==''){this.value='请输入关键词'}">
										<img name="button" src="images/Y01SOSO.gif" onclick="queryCondition();" style="margin-bottom:-6px; cursor: pointer;">
									</p>
								</form>
								<p>
									共有 <span id="iSumMsg">${iCount }</span>条信息
								</p>
								<div class="Y03JLYHlb">
									<div class="Y03JLYHlb1">客户姓名</div>
									<div class="Y03JLYHlb2">约谈人</div>
									<div class="Y03JLYHlb3">约谈日期</div>
									<div class="Y03JLYHlb4">开始时间</div>
									<div class="Y03JLYHlb5">结束时间</div>
									<div class="Y03JLYHlb6">约会地点</div>
									<div class="Y03JLYHlb7">约会方式</div>
									<div class="Y03JLYHlb8">客户意向楼盘</div>
									<div class="Y03JLYHlb9">客户参团意向</div>
									<div class="Y03JLYHlb10">客户参加活动意向</div>
								</div>
								<div id="contact_record">
								<c:forEach items="${customerContact }" var="cusContact">
									<div class="Y03JLYHlbS" >
										<div class="Y03JLYHlb1">${cusContact.customerName }</div>
										<div class="Y03JLYHlb2">${cusContact.userName }</div>
										<div class="Y03JLYHlb3">
											<fmt:formatDate value="${cusContact.recordCreateDate }" pattern="yyyy-MM-dd"/>
										</div>
										<div class="Y03JLYHlb4">
											<fmt:formatDate value="${cusContact.recordCreateDate }" pattern="yyyy-MM-dd"/>
										</div>
										<div class="Y03JLYHlb5">
											<fmt:formatDate value="${cusContact.recordEndDate }" pattern="yyyy-MM-dd"/>
										</div>
										<div class="Y03JLYHlb6">${cusContact.address }</div>
										<c:if test="${cusContact.communicationMethod == 1 }">
											<div class="Y03JLYHlb7">面谈</div>
										</c:if>
										<c:if test="${cusContact.communicationMethod == 2 }">
											<div class="Y03JLYHlb7">电话</div>
										</c:if>
										<c:if test="${cusContact.communicationMethod == 3 }">
											<div class="Y03JLYHlb7">邮件</div>
										</c:if>
										<c:if test="${cusContact.communicationMethod == 4 }">
											<div class="Y03JLYHlb7">短信</div>
										</c:if>
										<div class="Y03JLYHlb8">
											<c:if test="${cusContact.buyIntention == 1}">
												没有意向
											</c:if>
											<c:if test="${cusContact.buyIntention == 2}">
												一般
											</c:if>
											<c:if test="${cusContact.buyIntention == 3}">
												较有意向
											</c:if>
											<c:if test="${cusContact.buyIntention == 4}">
												非常愿意
											</c:if>
											<c:if test="${cusContact.buyIntention == 0}">
												不明
											</c:if>
										</div>
										<div class="Y03JLYHlb8">
											<c:if test="${cusContact.takeinGroupIntention == 1}">
												没有意向
											</c:if>
											<c:if test="${cusContact.takeinGroupIntention == 2}">
												一般
											</c:if>
											<c:if test="${cusContact.takeinGroupIntention == 3}">
												较有意向
											</c:if>
											<c:if test="${cusContact.takeinGroupIntention == 4}">
												非常愿意
											</c:if>
											<c:if test="${cusContact.takeinGroupIntention == 0}">
												不明
											</c:if>
										</div>
										<div class="Y03JLYHlb8">
											<c:if test="${cusContact.takeinClubIntention == 1}">
												没有意向
											</c:if>
											<c:if test="${cusContact.takeinClubIntention == 2}">
												一般
											</c:if>
											<c:if test="${cusContact.takeinClubIntention == 3}">
												较有意向
											</c:if>
											<c:if test="${cusContact.takeinClubIntention == 4}">
												非常愿意
											</c:if>
											<c:if test="${cusContact.takeinClubIntention == 0}">
												不明
											</c:if>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<!---统计--->
							<p class="Y04tong">统计：<span id="totalMsg">${iCount }</span>条信息</p>
							<!---End 统计--->
							<!---页面切换--->
							<div id="fenye">
								
							</div>
							<!---End 页面切换--->
						</div>


					</div>
				</div>
				<!---End 约会录入--->
			</div>
		</div>
		<!--End右边-->
	</div>
	</div>
</body>
</html>
