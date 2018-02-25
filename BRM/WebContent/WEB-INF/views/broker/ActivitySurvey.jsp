<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xx活动调查统计窗口</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
</head>

<body>
	<div class="HR_Tanchu28 myBox">
		<div class="myBox01">
			<div class="myBox02">
				<div class="HR_Tanchu28_Top">
					<div class="HR_Tanchu28_TopL">xx活动调查统计窗口</div>
					<div class="HR_Tanchu28_TopR">
						<a href="#"><img src="images/Tanchu04.gif" /></a> <a onclick="parent.closeFrame()" style="cursor: pointer;"><img
							src="images/Tanchu05.gif" style="margin-left: 10px;" /></a>
					</div>
				</div>
				<div class="HR_huodongdiaocha3_Bottom myBox03">
					<ul class="HR_huodongdiaocha3TAB">
						<li class="HR_hddcck10X">活动基本情况</li>
						<li><a href="broker_activityQuestionDetail">活动问卷详情</a></li>
						<li><a href="broker_participateObjectDetail">参与对象详情</a></li>
						<li><a href="broker_activityStatistics">活动统计</a></li>
					</ul>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="top">
								<!---左边--->
								<div class="HR_wenjuanxiangqing">
									<h4>问卷关联其它活动详情</h4>
									<ul class="HR_hddcGL10">
										<li style="color: #056900; width: 5%;">全部</li>
										<li>编号</li>
										<li>活动名称</li>
										<li style="width: 7%;">联络人</li>
										<li>发起负责人</li>
										<li style="width: 9%;">发出时间</li>
										<li style="width: 9%;">截止日期</li>
										<li>发出样本数</li>
										<li>回收样本数</li>
										<li>调查类型</li>
										<li style="width: 8%;">活动状态</li>
									</ul>
									<ul class="HR_hddcGL10B">
										<li style="color: #056900; width: 5%;"><input
											type="checkbox" /></li>
										<li>sz123456</li>
										<li>程序员培训</li>
										<li style="width: 7%;">赵山河</li>
										<li>赵山河</li>
										<li style="width: 9%;">2012.03.10</li>
										<li style="width: 9%;">2012.3.20</li>
										<li>10</li>
										<li>20</li>
										<li>调查类型</li>
										<li style="width: 8%;">完成</li>
									</ul>
								</div> <!---End 左边--->
							</td>
							<td valign="top" style="border-left: 1px solid #60B9F9;">
								<!---右边--->
								<div class="HR_wenjuanxiangqingR">
									<h4>活动基本情况</h4>
									<ul class="HR_wenjuanxiangqingI">
										<li>活动名称：<input /></li>
										<li>活动编号：<input /></li>
										<li>活动类型：<input /></li>
										<li>活动状态：<input /></li>
										<li>活动发起部门：<input style="width: 146px;" /></li>
										<li>活动发起人：<input style="width: 158px;" /></li>
										<li>活动联络人：<input style="width: 158px;" /></li>
										<li>活动参与人数：<input style="width: 146px;" /></li>
										<li>答题有效数：<input style="width: 158px;" /></li>
										<li>答题时长：<input /></li>
										<li>活动开始时间：<input style="width: 146px;" /></li>
										<li>活动截止时间：<input style="width: 146px;" /></li>
									</ul>
									<div class="HR_Tianjia_Casual">
										活动说明：
										<textarea style="width: 230px;" name="" cols="" rows=""></textarea>
									</div>
									<div class="HR_wenjuanxiangqingDC">
										调查方式：<input style="width: 170px;" />
									</div>
								</div> <!---End 右边--->
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
