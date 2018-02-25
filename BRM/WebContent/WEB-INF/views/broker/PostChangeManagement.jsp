<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异动管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
	//function changeURL(url){
		//document.getElementById("iframe").src=url;
	//}
	
	// 根据选中的checkBox过滤数据
	function checkSelect(){
		var queryVal;
		$("input[name=postChangeType]:checked").each(function(){
			queryVal += $(this).attr("queryVal") + ",";
		});
		$("#right",parent.document.body).attr("src","broker_postChangeIFrame?postChangeType="+queryVal);
	}
	$(document).ready(function(){
		$("input[name=postChangeType]").bind("click",checkSelect);
	});
	
</script>
</head>

<body>
	<!--中间 start-->
	<div class="left1" style="overflow: hidden;height: 400px;">
		<ul class="left_top zp_ltop">
			<li style="border: none; width: 170px;">
				<a onclick="goToJsp('right','Recruitment_yd.html')">异动情况统计</a>
			</li>
		</ul>
		<form>
			<dl class="checkbox">
				<dt>
					<img src="images/tree1.jpg" />全部异动类型 (N)
				</dt>
				<dd>
					<input type="checkbox" name="postChangeType" queryVal="0" /> 转正 (N)
				</dd>
				<dd>
					<input type="checkbox" name="postChangeType" queryVal="1" /> 岗位调整 (N)
				</dd>
				<dd>
					<input type="checkbox" name="postChangeType" queryVal="2" /> 职系调整 (N)
				</dd>
				<dd>
					<input type="checkbox" name="postChangeType" queryVal="3" /> 职等调整 (N)
				</dd>
				<dd>
					<input type="checkbox" name="postChangeType" queryVal="4" /> 薪酬福利调整 (N)
				</dd>
				<dd>
					<input type="checkbox" name="postChangeType" queryVal="5" /> 离职 (N)
				</dd>
			</dl>
		</form>
	</div>
	<!--中间 end-->
</body>
</html>