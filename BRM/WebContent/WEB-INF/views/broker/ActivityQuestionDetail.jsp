<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<a href="#"><img src="images/Tanchu04.gif" /></a> <a href="#"><img
							src="images/Tanchu05.gif" style="margin-left: 10px;" /></a>
					</div>
				</div>
				<div class="HR_huodongdiaocha3_Bottom myBox03">
					<ul class="HR_huodongdiaocha3TAB">
						<li><a href="broker_activityBasicSituation">活动基本情况</a></li>
						<li class="HR_hddcck10X">活动问卷详情</li>
						<li><a href="broker_participateObjectDetail">参与对象详情</a></li>
						<li><a href="broker_activityStatistics">活动统计</a></li>
					</ul>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="top">
								<!---左边--->
								<div class="HR_wenjuanxiangqing">

									<h4>问卷关联题目详情</h4>
									<ul class="HR_jibenType">
										<form>
											<li>题目难易程度：<input type="radio" name="radio" id="radio"
												value="radio" /> 难 <input type="radio" name="radio"
												id="radio" value="radio" /> 普通 <input type="radio"
												name="radio" id="radio" value="radio" /> 一般
											</li>
										</form>
										<form>
											<li>题目类型：<input type="radio" name="radio" id="radio"
												value="radio" /> 单选题 <input type="radio" name="radio"
												id="radio" value="radio" /> 多选题 <input type="radio"
												name="radio" id="radio" value="radio" /> 问答题
											</li>
										</form>
									</ul>
									<div class="HR_jiben">
										题目名称：<input style="width: 170px;" />题目类别：<input
											style="width: 153px;" class="HR_TianjiaSan" /> <input
											style="border: none; margin-left: 60px;" type="button"
											class="HR_wenjuanwentiSoso" />
									</div>
									<ul class="HR_hddcGL10">
										<li style="color: #056900; width: 5%;">全部</li>
										<li>编号</li>
										<li style="width: 17%;">题目</li>
										<li style="width: 13%;">题型</li>
										<li>题目类别</li>
										<li style="width: 9%;">分数</li>
										<li style="width: 9%;">难易程度</li>
										<li>创建日期</li>
										<li>状态</li>
									</ul>
									<ul class="HR_hddcGL10B">
										<li style="color: #056900; width: 5%;"><input
											type="checkbox" /></li>
										<li>sz123456</li>
										<li style="width: 17%;">程序员培训</li>
										<li style="width: 13%;">赵山河</li>
										<li>赵山河</li>
										<li style="width: 9%;">200</li>
										<li style="width: 9%;">2012.3.20</li>
										<li>10</li>
										<li style="width: 8%;">完成</li>
									</ul>
								</div> <!---End 左边--->
							</td>
							<td valign="top" style="border-left: 1px solid #60B9F9;">
								<!---右边--->
								<div class="HR_wenjuanxiangqingR">
									<h4>活动问卷详情</h4>
									<ul class="HR_wenjuanxiangqingI">
										<li>问卷名称：<input /></li>
										<li>问卷编号：<input /></li>
										<li>问卷分类：<input /></li>
										<li>问卷呈现方式：<input style="width: 146px;" /></li>
									</ul>
									<div class="HR_Tianjia_Casual">
										问卷说明：
										<textarea style="width: 230px;" name="" cols="" rows=""></textarea>
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
