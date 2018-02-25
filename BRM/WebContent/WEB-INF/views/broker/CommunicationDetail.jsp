<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<script type="text/javascript">
	$(document).ready(function(){
		
	});
	
	function seeDetail(name,id){
		$("#dataDiv").html("");
		$.ajax({
			url : "broker_commHistory",
			dataType : 'json',
			data : "name=" + name+
			       "&id=" + id,
			success:function(data){
				var d = data.detailData;
				for(var i = 0; i < d.length; i++){
					$("#dataDiv").append(
							'<dl>'+
								'<dd>'+
									'<a onclick="queryCommDetail('+d[i].talkId+');" style="width: 50px;cursor: pointer;">'+d[i].startTime+'</a>'+
								'</dd>'+
								'<dd><a onclick="queryCommDetail('+d[i].talkId+');" style="cursor: pointer;"">'+d[i].mainTalkEmployeeName+'</a></dd>'+
								'<dd><a onclick="queryCommDetail('+d[i].talkId+');" style="cursor: pointer;">'+d[i].talkToEmployeeName+'</a></dd>'+
							'</dl>');
				}
			}
		});
	}
	
	// 查看历史明细
	function queryCommDetail(talkId){
		parent.showFrame('约谈记录历史查询','broker_commHistoryDetail?talkId='+talkId,800,700);
	}
</script>
</head>
<body>
		<div class="H_left">
			<ul class="ul_tittle">
				<c:forEach items="${lst }" var="lst">
					<li>
						<a onclick="seeDetail('${lst.userName }','${lst.employeeId}');" style="cursor: pointer;">
							<span class="aa"></span>${lst.userName }
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="H_right">
			<div id="zzjs_zzjs2">
				<div class="HR_YDLSCXList" style="cursor: pointer;">
					<dl>
						<dd>约谈日期</dd>
						<dd>主谈人</dd>
						<dd>约谈人</dd>
					</dl>
				</div>
				<div class="HR_jiaoliujiluList" style="padding: 0 20px;" id="dataDiv">
					
				</div>
			</div>
		</div>
</body>
</html>