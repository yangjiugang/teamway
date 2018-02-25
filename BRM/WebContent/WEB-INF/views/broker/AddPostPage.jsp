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
	
	// 查询员工信息
	function queryEmployeeInfo(){
		var employeeId = $("#userId").val();
		
		if(employeeId != ''){
			$.ajax({
				url : "broker_queryEmployeeAllInfo",
				dataType : 'json',
				data : "employeeId=" + employeeId +
				       "&date=" + new Date(),
				success:function(data){
					$("#beforAreaId").val(data.employeeAllInfo.beforAreaId);
					$("#beforCompanyId").val(data.employeeAllInfo.beforCompanyId);
					$("#beforOrganizationName").val(data.employeeAllInfo.organizationName);
					$("#beforPostName").val(data.employeeAllInfo.postName);
					$("#beforJobGradeName").val(data.employeeAllInfo.jobGradeName);
					$("#beforJobLevelName").val(data.employeeAllInfo.jobLevelName);
					$("#beforSalaryLevelOrder").val(data.employeeAllInfo.employeeInfo.salaryLevelOrder);
					$("#beforSalaryTotal").val(data.employeeAllInfo.employeeInfo.salaryTotal);
					$("#beforStructureType").val(data.employeeAllInfo.employeeInfo.structureType);
					$("#beforCompanyName").val(data.employeeAllInfo.salarySocialSecuritySusbmit.companyName);
					$("#beforSubmitPlace").val(data.employeeAllInfo.salarySocialSecuritySusbmit.submitPlace);
					$("#beforSocialSecurityBase").val(data.employeeAllInfo.salarySocialSecuritySusbmit.socialSecurityBase);
					$("#beforSsName").val(data.employeeAllInfo.salarySocialSecurity.ssName);
					
					$("#beforOrganizationId").val(data.employeeAllInfo.organizationId);
					$("#beforPostId").val(data.employeeAllInfo.postId);
					$("#beforJobGradeId").val(data.employeeAllInfo.jobGradeId);
					$("#beforJobLevelId").val(data.employeeAllInfo.jobLevelId);
					$("#submitId").val(data.employeeAllInfo.salarySocialSecuritySusbmit.submitId);
					$("#submitName").val(data.employeeAllInfo.salarySocialSecuritySusbmit.submitName);
				}
			});
		}
	}
	
	// 确认及发送
	function determineAndSend() {
		var postDate = $("#postDate").val();
		var employeeId = $("#userId").val();
		if(postDate == ''){
			alert("日期不能为空！");
			return false;
		}else if(employeeId == ''){
			alert("请选择异动人员！");
			return false;
		}
		document.forms["addPostChangeForm"].action = "broker_addPostChange";
		document.forms["addPostChangeForm"].submit();
	}
	
	// 选择社保缴纳类型标识
	function selectWelfare(){
		$("#socialSecurityBase").val($("#security_sel").find("option:selected").attr("base"));
		$("#submitPlace").val($("#security_sel").find("option:selected").attr("address"));
		$("#securityFlag").val($("#security_sel").val());
	}
	
	// 职系下拉框选择职级
	function selectCfgJobGrade(){
		$("#jobGradeName").val($("#cfgJobGrade_sel").find("option:selected").attr("selectedJobGrade"));
		// 给职系赋值
		$("#jobGradeId").val($("#cfgJobGrade_sel").val());
		$.ajax({
			url : "broker_queryJobLevelForGrade",
			dataType : 'json',
			data : "jobGradeId=" + $("#cfgJobGrade_sel").find("option:selected").attr("value"),
			success:function(data){
				$("#jobLevelName").val(data.lstCfgJobLevel[0].jobLevelName);
				$("#jobLevelId").val(data.lstCfgJobLevel[0].jobLevelId);
			}
		});
	}
	
	// 薪酬等级下拉框选择金额
	function selectSaleary(){
		$("#salaryLevelOrder").val($("#salaryLevel_sel").find("option:selected").attr("salaryId"));
		$("#salaryTotal").val($("#salaryLevel_sel").val());
	}
	
	// 社保缴纳类型
	function selectSecurityType(){
		$("#securityType").val($("#securityType_sel").val());
	}
	
	
	$(document).ready(function(){
		$.ajax({
			url : "broker_queryWelfareInfo",
			dataType : 'json',
			data : "",
			success:function(data){
				$("#companyId").val(data.companyId);
				$("#companyName").val(data.companyName);
				var dataList = data.lstEmployeeTransactionInfo;
				// 社保类型标识
				for(var i = 0; i < dataList.length; i++){
					$("#security_sel").append("<option value='"+dataList[i].salarySocialSecuritySusbmit.submitId+"' base='"+dataList[i].salarySocialSecuritySusbmit.socialSecurityBase+"' address="+dataList[i].salarySocialSecuritySusbmit.submitPlace+" >"+
							dataList[i].salarySocialSecuritySusbmit.submitName+"</option>");
				}
				// 社保类型
				for(var i = 0; i < data.lstSecurityType.length; i++){
					$("#securityType_sel").append("<option value='"+data.lstSecurityType[i].salarySocialSecurity.socialSecurityId+"'>"+data.lstSecurityType[i].salarySocialSecurity.ssName+"</option>");
				}
				// 职系
				for(var i = 0; i < data.lstCfgJobGrade.length; i++){
					$("#cfgJobGrade_sel").append("<option value='"+data.lstCfgJobGrade[i].jobGradeId+"' selectedJobGrade='"+data.lstCfgJobGrade[i].jobGradeName+"'>"+data.lstCfgJobGrade[i].jobGradeName+"</option>");
				}
				// 薪酬等级
				for(var i = 0; i < data.lstCfgSalaryLevel.length; i++){
					$("#salaryLevel_sel").append("<option value='"+data.lstCfgSalaryLevel[i].salary+"' salaryId='"+data.lstCfgSalaryLevel[i].salaryLevelId+"'>"+data.lstCfgSalaryLevel[i].salaryLevelOrder+"</option>");
				}
				
			}
		});
	});
	// 人员选择器回调方法
	function setPersonSelectorVal(ids,names,nums){
		$("#employeeId").val(nums);
		$("#userName").val(names);
		$("#userId").val(ids);
		queryEmployeeInfo();
	}
	
	// 部门回调方法
	function setOrgSelectorVal(ids, names, nums){
		$("#organizationName").val(names);
	}
	//岗位回调方法
	function setPostSelectorVal(ids, names, nums){
		$("#postName").val(names);
	}
</script>
</head>
<body>
	<!-- 添加异动div  start -->
	<div class="myBox02">
		<div class="HR_yidongweihu_Bottom myBox03">
			<form name="addPostChangeForm">
				<div class="HR_yidongweihu_top29">
					姓名：
					<input style="width: 100px;" id="userName" name="userName" reg=".*[^ ].*" tip="姓名不能为空" onclick="parent.popupPersonSelector({single:1})" />
					<input type="hidden" id="userId">
					员工编号：
					<input style="width: 100px;" id="employeeId" name="employeeId" readonly onfocus="this.blur()"/>
				</div>
				<div class="HR_yidongweihu_top29">
					异动日期：
					<input class="Wdate" name="postDate" id="postDate" type="text" style="width: 155px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
				</div>
				<div class="HR_yidongweihu_topType">
					异动类型：
					<input type="radio" name="transactionType" id="radio" value="0" checked />转正
					<input type="radio" name="transactionType" id="radio" value="1" />岗位调整
					<input type="radio" name="transactionType" id="radio" value="2" />职系调整
					<input type="radio" name="transactionType" id="radio" value="3" />职等调整
					<input type="radio" name="transactionType" id="radio" value="4" />薪酬福利调整
					<input type="radio" name="transactionType" id="radio" value="5" />离职
				</div>
				异动原因：
				<textarea node-type="textEl" name="transactionDesc" title="请输入......." tabindex="1" class="HR_yidongweihu_Casual"></textarea>
				
				<input type="hidden" id="beforOrganizationId" name="beforOrganizationId" value="" />
				<input type="hidden" id="beforPostId" name="beforPostId" value="" />
				<input type="hidden" id="beforJobGradeId" name="beforJobGradeId" value="" />
				<input type="hidden" id="beforJobLevelId" name="beforJobLevelId" value="" />
				<input type="hidden" id="beforAreaId" name="beforAreaId" value="" />
				<input type="hidden" id="beforCompanyId" name="beforCompanyId" value="" />
				<div class="HR_yidongweihu">
					<!---左边--->
					<div class="HR_yidongweihuL">
						<h4>异动前:</h4>
						<dl class="HR_yidongweihuL_Post">
							<dt>岗位信息录入：</dt>
							<dd>
								部门：<input readonly onfocus="this.blur()" id="beforOrganizationName" name="beforOrganizationName" />
							</dd>
							<dd>
								岗位：<input readonly onfocus="this.blur()" id="beforPostName" name="beforPostName" />
							</dd>
							<dd>
								职系：<input readonly onfocus="this.blur()" id="beforJobGradeName" name="beforJobGradeName" />
							</dd>
							<dd>
								职级：<input readonly onfocus="this.blur()" id="beforJobLevelName" name="beforJobLevelName" />
							</dd>
						</dl>

						<dl class="HR_yidongweihu_Welfare">
							<dt>薪酬福利信息录入：
							</dt>
							<dd>
								薪酬等级：
								<input readonly onfocus="this.blur()" style="width: 201px;" id="beforSalaryLevelOrder" name="beforSalaryLevelOrder" />
							</dd>
							<dd>
								金额：
								<input readonly onfocus="this.blur()" style="width: 60px;" id="beforSalaryTotal" name="beforSalaryTotal" />
							</dd>
							<dd>
								社保缴纳公司：
								<input readonly onfocus="this.blur()" style="width: 201px;" id="beforCompanyName" name="beforCompanyName"/>
							</dd>
							<dd>
								社保缴纳类型标识：
								<input readonly onfocus="this.blur()" id="submitName" name="beforSocialSecurity" />
								<input type="hidden" id="submitId" />
							</dd>
							<dd>
								社保缴纳基数：
								<input readonly onfocus="this.blur()" style="width: 201px;" id="beforSocialSecurityBase" name="beforSocialSecurityBase" />
							</dd>
							<dd>
								社保缴纳地点：
								<input readonly onfocus="this.blur()" style="width: 201px;" id="beforSubmitPlace" name="beforSubmitPlace" />
							</dd>
							<dd>
								社保缴纳类型：
								<input readonly onfocus="this.blur()" style="width: 201px;" id="beforSsName" name="beforSsName" />
							</dd>
						</dl>
					</div>
					<!---End 左边--->

					<!---边--->
					<div class="HR_yidongweihuR">
						<h4>异动后:</h4>
						<dl class="HR_yidongweihuR_Post">
							<dt>岗位信息录入：</dt>
							<dd>
								部门： <input id="organizationName" name="organizationName" onclick="parent.popupOrgSelector({single:1})"/>
							</dd>
							<dd>
								岗位： <input id="postName" name="postName" onclick="parent.popupPostSelector({single:1})" />
							</dd>
							<dd>
								职系： 
								<input type="hidden" id="jobGradeId" name="jobGradeId" />
								<input type="hidden" id="jobGradeName" name="jobGradeName" />
								<select id="cfgJobGrade_sel" onchange="selectCfgJobGrade()">
									<option selected>----请选择----</option>
								</select>
							</dd>
							<dd>
								职级： <input id="jobLevelName" name="jobLevelName" readonly onfocus="this.blur()" />
								<input type="hidden" id="jobLevelId" name="jobLevelId" />
							</dd>
						</dl>

						<dl class="HR_yidongweihuR_Welfare">
							<dt>薪酬福利信息录入：</dt>
							<dd>
								薪酬等级：
								<input type="hidden"  id="salaryLevelOrder" name="employeeInfo.salaryLevelOrder" />
								<select id="salaryLevel_sel" onchange="selectSaleary()">
									<option selected>----请选择----</option>
								</select>
							</dd>
							<dd>
								 金额：
								<input style="width: 60px; background-image: none;" id="salaryTotal" name="employeeInfo.salaryTotal" />
							</dd>
							<dd>
								社保缴纳公司：
								<input style="width: 201px;" id="companyName" name="salarySocialSecuritySusbmit.companyName" readonly onfocus="this.blur()"/>
								<input type="hidden" name="salarySocialSecuritySusbmit.companyId" id="companyId">
							</dd>
							<dd>
								社保缴纳类型标识：
								<select id="security_sel" onchange="selectWelfare()">
									<option selected>----请选择----</option>
								</select>
								<input type="hidden" id="securityFlag" name="salarySocialSecuritySusbmit.submitId">
							</dd>
							<dd>
								社保缴纳基数：
								<input style="width: 201px; background-image: none;" readonly onfocus="this.blur()" id="socialSecurityBase" name="salarySocialSecuritySusbmit.socialSecurityBase" />
							</dd>
							<dd>
								社保缴纳地点：
								<input style="width: 201px;" id="submitPlace" readonly onfocus="this.blur()" name="salarySocialSecuritySusbmit.submitPlace" />
							</dd>
							<dd>
								社保缴纳类型：
<!-- 								<input style="width: 201px;" id="ssName" name="salarySocialSecurity.ssName" /> -->
								<select id="securityType_sel" onchange="selectSecurityType()">
									<option selected>----请选择----</option>
								</select>
								<input id="securityType" type="hidden" name="salarySocialSecurity.socialSecurityId">
							</dd>
						</dl>
					</div>
					<!---End 右边--->
				</div>
				
				<div class="HR_yidongweihu_Submit">
					<input type="button" class="HR_yidongweihu_Submit01" onclick="determineAndSend();" />
				</div>
			</form>
		</div>
	</div>
	<!-- 添加异动div  end -->
</body>
</html>