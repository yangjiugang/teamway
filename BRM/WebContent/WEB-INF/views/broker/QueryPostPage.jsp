<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.HR_YDLSCXList1{ width:680px;}
.HR_YDLSCXList1 dl{ width:680px; height:25px; line-height:25px; border-bottom:1px solid #D7E0F0;}
.HR_YDLSCXList1 dl dd{ float:left; width:80px;}
.HR_YDLSCXList1 dl dt{ float:left; width:180px; text-align:center;}

.HR_YDLSCXList{ width:680px; color:#000;}
.HR_YDLSCXList dl{ width:680px; height:25px; line-height:25px; border-bottom:1px solid #D7E0F0;}
.HR_YDLSCXList dl dd{ float:left; width:80px;}
.HR_YDLSCXList dl dt{ float:left; width:180px; text-align:center;}
</style>
<link rel="stylesheet" media="screen" href="css/layout.css" />
<link rel="stylesheet" media="screen" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//查看人员异动明细
	function seeDetail(name,id){
		$("#postChange_div").html("");
		$.ajax({
			url : "broker_detailPost",
			dataType : 'json',
			data : "id=" + id + "&name=" + name,
			success:function(data){
				$("#postChange_div").append(
						'<dl>'+
							'<dd>' + data.detailData.transactionDate + '</dd>' +
							'<dd>' + data.detailData.transactionType + '</dd>' +
							'<dd>' + data.detailData.beforOrganizationName + '</dd>' +
							'<dd>' + data.detailData.beforPostName + '</dd>' +
							'<dd>' + data.detailData.employeeInfo.organizationName + '</dd>' +
							'<dd>' + data.detailData.employeeInfo.postName + '</dd>' +
							'<dt>' + data.detailData.transactionDesc + '</dt>' +
						'</dl>'
				);
			}
		});
	}
	
	$(document).ready(function(){
		$("#defaultClick").click(function(){
			seeDetail();
		});
	});
	
</script>
</head>
<body>
	<!-- 查看/维护div   start -->
	<div class="myBox02">
		<div class="HR_yidongweihu_Bottom myBox03">
			<div class="HR_lishijixiaoContent jixiaoContent">
				<div class="H_left">
					<ul class="ul_tittle" id="nameList">
						<c:forEach var="lst" items="${lst }" varStatus="status">
							<li>
								<c:if test="${status.first }">
									<a id="defaultClick" onclick="seeDetail('${lst.employeeInfo.userName }','${lst.employeeId}');" style="cursor: pointer;"></a>
								</c:if>
								<c:if test="${!status.first }">
									<a onclick="seeDetail('${lst.employeeInfo.userName }','${lst.employeeId}');" style="cursor: pointer;"></a>
								</c:if>
								<span class="aa"></span>${lst.employeeInfo.userName }
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="H_right">
					<div class="HR_huodongdiaochaC">

						<div id="model_1">
							<div class="HR_YDLSCXList">
								<dl>
									<dd>异动日期</dd>
									<dd>异动类型</dd>
									<dd>异动前部门</dd>
									<dd>异动前岗位</dd>
									<dd>异动后部门</dd>
									<dd>异动后岗位</dd>
									<dt>异动原因</dt>
								</dl>
							</div>

							<div class="HR_YDLSCXList1" id="postChange_div">
								
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="HR_lishijixiaoContent"></div>
	</div>
	<!-- 查看/维护div   end -->
</body>
</html>