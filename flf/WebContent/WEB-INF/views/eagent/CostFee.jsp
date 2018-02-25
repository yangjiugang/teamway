<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>记录开销 - 首页</title>
<link rel="stylesheet" href="js/page/page.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<!-- 下拉框 -->
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<!-- 下拉框 -->
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

	});
	
	// 添加开销
	function addCost() {
		if($("#costItem").val() == ' 请输入'){
			alert("请您选择具体的项目！");
			return false;
		}else{
			document.forms["costForm"].action="addCostFee";
			document.forms["costForm"].submit();
		}
	}
</script>
<!---Y06开销记录--->
<script type="text/javascript">

	function settab_zzjs(name, num, n) {
		for (var i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "zzjs" + i);
			menu.className = i == num ? "on_zzjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
		if(num == 2){
			if(typeof $("#startDate").val()=="undefined" || $("#startDate").val()==""){
				return false;
			}
		}
	}
	
	// 分页方法
	$(document).ready(function(){
		var curPage=${curPage};
		var pageCount=${pageCount};
		$("#fenyeyi").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPageyi});
	});
	
	// 分页回调方法
	function goPageyi(curPage, pageSize) {
		document.location.href="costFee?curPage="+curPage+"&pageSize="+pageSize;
	}
	
	// 分页回调方法
	function goPage(curPage, pageSize) {
		$.fc.ajaxSubmit({
			url : "historyCostFee",
			dataType:"json",
			data : "startDate=" + $("#startDate").val() + 
					 "&endDate=" + $("#endDate").val() + 
					 "&costItem=" + $("#costItem_his").val() + 
					 "&startCostFee=" + $("#startCostFee").val() +
					 "&endCostFee=" + $("#endCostFee").val() +
					 "&costRemark=" + $("#costRemark_his").val() +
					 "&curPage=" + curPage+
					 "&pageSize=" + pageSize +
					 "&date=" + new Date,
				callBackFn : function(data) {
					$("#total").html("");
					var iSumFee = 0;
					for(var i = 0; i<data.lstCost.length; i++){
						var lst = data.lstCost[i];
						var time = lst.costTime;
						$("#total").prepend(
							"<p class='Y06KXJLhj'>"+
							"<span style='color: #B30004;' name='detailData'>"+time +"</span>符合条件花销计<span style='color: #B30004;'>"+lst.iCountFee+"</span>项，合计金额<span style='color: #B30004;'>"+lst.costFee+"</span>元" +
							"&nbsp;<img src='images/zhankai(black)1.jpg' style='cursor: pointer;' onclick='queryHisDetail("+ i +",\""+time+"\" )' /></p>" +
							"<div class='Y06KXJLlb' name='detail_Date' id=div_"+i+">" +
							"</div>"
						);
						iSumFee += lst.costFee;
					}
					$("div[name='detail_Date']").fadeOut();
					// 必须先清空数据
					$("#pageDefaultDay").empty();
					$("#iSumFee").empty();
					$("#totalicont").empty();
					// 插入数据
					$("#pageDefaultDay").append(data.lstCost.length);
					$("#iSumFee").append(iSumFee);
					$("#totalicont").append(data.rowCount);
				}
		});
	}
	
	
	// 查询历史开销
	function queryHisCost(){
		if($("#startDate").val() > $("#endDate").val()){
			alert("结束时间不能小于开始时间！");
			return false;
		}else if($("#startDate").val()==""||$("#endDate").val()==""){
			alert("请输入日期！");
			return false;
		}else{
			$.fc.ajaxSubmit({
				url : "historyCostFee",
				dataType:"json",
				data : "startDate=" + $("#startDate").val() + 
						 "&endDate=" + $("#endDate").val() + 
						 "&costItem=" + $("input[name=costItem_his]").val() + 
						 "&startCostFee=" + $("#startCostFee").val() +
						 "&endCostFee=" + $("#endCostFee").val() +
						 "&costRemark=" + $("#costRemark_his").val() +
						 "&date=" + new Date,
					callBackFn : function(data) {
						$("#total").html("");
						var iSumFee = 0;
						if(data != null){
							for(var i = 0; i<data.lstCost.length; i++){
								var lst = data.lstCost[i];
								var time = lst.costTime;
								$("#total").prepend(
									"<p class='Y06KXJLhj'>"+
									"<span style='color: #B30004;' name='detailData'>"+time +"</span>符合条件花销计<span style='color: #B30004;'>"+lst.iCountFee+"</span>项，合计金额<span style='color: #B30004;'>"+lst.costFee+"</span>元" +
									"&nbsp;<img src='images/zhankai(black)1.jpg' style='cursor: pointer;' onclick='queryHisDetail("+ i +",\""+time+"\" )' /></p>" +
									"<div class='Y06KXJLlb' name='detail_Date' id=div_"+i+">" +
									"</div>"
								);
								iSumFee += lst.costFee;
							}
						}else{
							$("#total").prepend("<p class='Y06KXJLhj'>暂无记录！</div>");
						}
						var curPage=data.curPage;
						var pageCount=data.pageCount;
						$("#fenye").pager({curPage:curPage, pageSize:10, pageCount:pageCount, goPageCall:goPage});
						$("div[name='detail_Date']").fadeOut();
						// 必须先清空数据
						$("#pageDefaultDay").empty();
						$("#iSumFee").empty();
						$("#totalicont").empty();
						// 插入数据
						$("#pageDefaultDay").append(data.lstCost.length);
						$("#iSumFee").append(iSumFee);
						$("#totalicont").append(data.rowCount);
					}
			});
		}
	}
	
	var flag = 0;
	// 查询历史开销明细
	function queryHisDetail(iFlag,objData){
		if(flag==0){
			$("#div_"+iFlag).fadeIn();
			flag+=1;
		}else{
			$("#div_"+iFlag).fadeOut();
			flag=0;
		}
		$.fc.ajaxSubmit({
			url:"queryHisDetail",
			dataType:"json",
			data:"costItem=" + $("input[name=costItem_his]").val() +
	             "&startCostFee="+ $("#startCostFee").val() +
	             "&endCostFee=" + $("#endCostFee").val() +
	             "&costRemark=" + $("#costRemark_his").val() +
	             "&costTime=" + objData +
	             "&date=" + new Date,
	        callBackFn:function(json){
	        	$("#div_"+iFlag).html("");
				for(var i = 0; i < json.length; i++){
					$("#div_"+iFlag).prepend("<div class='Y06KXJLlb1' id='1_Div_" +i+ "'>"+ json[i].costTime +"</div>" +
							    "<div class='Y06KXJLlb2' id='2_Div_" +i+ "' align='center'>"+ json[i].costItem +"</div>" +
								"<div class='Y06KXJLlb3' id='3_Div_" +i+ "' align='center'>"+ json[i].costRemark +"</div>" +
								"<div class='Y06KXJLlb4' id='4_Div_" +i+ "'>"+ json[i].costFee +"元</div>"+
								"<div class='Y06KXJLlb5'>"+
								//"<a onclick='updateCostDetail(\""+json[i].costId+"\","+"\""+json[i].costTime+"\","+"\""+json[i].costItem+"\","+"\""+json[i].costRemark+"\","+"\""+json[i].costFee+"\")' target='_blank'>修改内容</a>"+
								"</div>");
				}
			}
		});
	}
	
	function updateCostDetail(costId,costTime,costItem,costRemark,costFee){
		//$("#startDate").val(costTime);
		//$("#endDate").val("");
		//$("#costItem_his").val(costItem);
		//$("#costRemark_his").val(costRemark);
		//$("#startCostFee").val(costFee);
		//$("#endCostFee").val("");
		//$("#updateHis_Btn").css({display:"block"});
		
		//$("#confirm_Btn").css({display:"block"});
		//$("#add_btn").css({display:"none"});
	}
	
	function updateCost(costId,costTime,costItem,costRemark,costFee){
		$("#cost_date").val(costTime);
		$("#inp_txt").val(costItem);
		$("#remark").val(costRemark);
		$("#fee").val(costFee);
		$("#costId_inp").val(costId);
		$("#confirm_Btn").css({display:"block"});
		$("#add_btn").css({display:"none"});
	}
	
	function confirmUpdate(){
		document.forms["costForm"].action="updateCost";
		document.forms["costForm"].submit();
	}
	
	$(document).ready(function(){
		$("#costItem").htmlSelect({defVal:"请输入",data:Constant.costPeject,absolute:false} );
		$("#costItem_his").htmlSelect({defVal:"请输入",data:Constant.costPeject,absolute:false} );
	});
</script>

<!---End Y06开销记录--->
<!---总体分类样式--->
<link href="css/eagent/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>
<body>
	<!--头部-->
	<div class="FlhTopOut">
		<div class="FlhTop">
			<div class="FlhLogo"></div>
			<div class="TopRight">
				<span class="FLHphone"><div>服务热线：</div>
					<img src="images/phone2.jpg" /><font>400 61355288</font></span>
			</div>
			<div id="menu">
				<ul>
					<li><a href="index-a.html" id="cur">首页</a></li>
					<li><a href="GRZYkxjlY06.html">个人主页</a></li>
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
						<img src="images/1.jpg" style="color: red;" /><font><a
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
							href="queryCustomerContact">记录约会</a></font>
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
						<img src="images/6.jpg" /><font>
						<a href="costFee?CurPage=1&PageSize=10">记录开销</a></font>
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
							<span>共有 <b>121</b>条信息
							</span>
							<li id="zzjs1" onclick="settab_zzjs('zzjs',1,2)" class="on_zzjs">今日开销录入</li>
							<li id="zzjs2" onclick="settab_zzjs('zzjs',2,2)">历史开销查询</li>
						</ul>
					</div>
					<div class="Y06KXJLlist">
						<div id="zzjs_zzjs1">
							<div class="Y06KXJLrq">
								<div class="Y06KXJLrq1">日期</div>
								<div class="Y06KXJLrq2">项目</div>
								<div class="Y06KXJLrq3">项目备注</div>
								<div class="Y06KXJLrq4">金额</div>
							</div>
							<div class="Y06KXJLtb">
								<form method="get" name="costForm">
									<input type="hidden" name="costId" id="costId_inp" value="" />
									<div class="Y06KXJLtb1">
										<input class="Y01N" name="costTime" id="cost_date" style="width: 72px;" readonly onfocus="this.blur()"
											maxlength="10" onkeydown="if(event.keyCode==8)event.returnValue=false;" />
									    <img eight="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('cost_date'));">
									</div>
									<div class="Y06KXJLtb2">
										<input class="Y4jiaoyiinput" readonly onfocus="this.blur()" type="text" id="costItem" name="costItem">
									</div>
									<div class="Y06KXJLtb3">
										<textarea name="costRemark" cols="" rows="" id="remark"></textarea>
									</div>
									<div class="Y06KXJLtb4">
										<input name="costFee" type="text" id="fee" maxlength="7" style="width: 37px;"
										       onkeyup="value=value.replace(/[^0-9\.]/g,'')" 
										       onblur="value=value.replace(/[^0-9\.]/g,'')"/>
									</div>
									<div class="Y06KXJLtb5">
										<img alt="确认" id="confirm_Btn" src="images/jtcy1.gif" onclick="confirmUpdate();" style="display: none;cursor: pointer;" />
										<img alt="继续添加" id="add_btn" src="images/Y06jxtj.gif" onclick="addCost();" style="cursor: pointer;" />
									</div>
								</form>
							</div>
							<c:if test="${empty lstCostFee}">
								<div class="Y06KXJLlb" id="div_Cost">
									暂无记录！
								</div>
							</c:if>
							<c:if test="${!empty lstCostFee}">
								<c:forEach items="${lstCostFee }" var="lstCostFee">
									<div class="Y06KXJLlb" id="div_Cost">
										<div class="Y06KXJLlb1" id="costTime">
											<fmt:formatDate value="${lstCostFee.costTime}" pattern="yyyy-MM-dd" />
										</div>
										<div class="Y06KXJLlb2" id="costItem" align="center">
											<c:if test="${lstCostFee.costItem == 1}">
												餐费
											</c:if>
											<c:if test="${lstCostFee.costItem == 2}">
												车费
											</c:if>
											<c:if test="${lstCostFee.costItem == 3}">
												购物
											</c:if>
											<c:if test="${lstCostFee.costItem == 4}">
												娱乐
											</c:if>
											<c:if test="${lstCostFee.costItem == 5}">
												买生活日用
											</c:if>
											<c:if test="${lstCostFee.costItem == 6}">
												电话费
											</c:if>
											<c:if test="${lstCostFee.costItem == 7}">
												送礼
											</c:if>
											<c:if test="${lstCostFee.costItem == 8}">
												购买奢侈品
											</c:if>
											<c:if test="${lstCostFee.costItem == 0}">
												无
											</c:if>
										</div>
										<div class="Y06KXJLlb3" id="costRemark" align="center">${lstCostFee.costRemark}</div>
										<div class="Y06KXJLlb4" id="costFee">${lstCostFee.costFee}</div>
										<div class="Y06KXJLlb5" id="updateItem">
											<a onclick="updateCost('${lstCostFee.costId}','<fmt:formatDate value="${lstCostFee.costTime}" pattern="yyyy-MM-dd"/>','${lstCostFee.costItem}','${lstCostFee.costRemark}','${lstCostFee.costFee}');" target="_blank" style="cursor: pointer;">修改内容</a>
										</div>
									</div>
								</c:forEach>
							</c:if>


							<!---统计--->
							<p class="Y04tong">统计：${iCount }条开销录入</p>
							<!---End 统计--->
							<!---页面切换--->
							<div id="fenyeyi">
								
							</div>
							<!---End 页面切换--->
						</div>

						<div id="zzjs_zzjs2" style="display: none;">
							<form name="historyCostFee">
								<div class="Y06KXJLrqs">
									日期：<input class="Y01N" name="startDate" id="startDate" style="width: 72px;"
											maxlength="10" readonly onfocus="this.blur()"
											onkeydown="if(event.keyCode==8)event.returnValue=false;" />
										 <img height="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('startDate'));"> 到 
										 <input class="Y01N" name="endDate" id="endDate" style="width: 72px;"
										    readonly onfocus="this.blur()" maxlength="10" 
										    onkeydown="if(event.keyCode==8)event.returnValue=false;" />
										 <img height="20" src="images/rili.gif" width="20" align="middle" style="margin-bottom: 5px;"
											onclick="new Calendar(1900,2050).show(document.getElementById('endDate'));"> &nbsp;
									项目 
									<input class="Y4jiaoyiinput" readonly onfocus="this.blur()" type="text" id="costItem_his" name="costItem"> &nbsp;
									金额：从 <input class="Y06KXJLSOSOinput" type="text" id="startCostFee" name="startCostFee" maxlength="7"
										       onkeyup="value=value.replace(/[^0-9\.]/g,'')" 
										       onblur="value=value.replace(/[^0-9\.]/g,'')"> &nbsp;
									到 <input class="Y06KXJLSOSOinput" type="text" id="endCostFee" name="endCostFee" maxlength="7"
										       onkeyup="value=value.replace(/[^0-9\.]/g,'')" 
										       onblur="value=value.replace(/[^0-9\.]/g,'')">
									<img alt="确认" id="updateHis_Btn" src="images/jtcy1.gif" onclick="updateHisCost();" style="display: none;cursor: pointer;" />
								</div>
							
							
								<div class="Y06KXJLjg" >
									<div class="Y06KXJLjg_left">
										符合条件的项目<b id="pageDefaultDay" ></b> 天  <b id="iSumFee"></b> 元
									</div>
									<div class="Y06KXJLjg_right">
										<input class="Y06KXJL_input" name="costRemark_his" id="costRemark_his" type="text" />
										<img alt="查询" src="images/Y01SOSO.gif" onclick="queryHisCost();" style="margin-bottom: -6px;cursor: pointer;" >
									</div>
								</div>
								<div class="Y06KXJLrq">
									<div class="Y06KXJLrq1">日期</div>
									<div class="Y06KXJLrq2">项目</div>
									<div class="Y06KXJLrq3">项目备注</div>
									<div class="Y06KXJLrq4">金额</div>
								</div>
								<div id="total" class="Y06KXJLcx" >
										
								</div>
							</form>
							<!---统计--->
							<p class="Y04tong" >统计：<span id="totalicont"></span>条开销录入</p>
							<!---End 统计--->
							<!---页面切换--->
							
							<div id="fenye"></div>
						</div>
								<!---End 页面切换--->
							</div>
						</div>

					</div>
				</div>
			</div>
			<!---End Y06开销记录--->
</body>
</html>