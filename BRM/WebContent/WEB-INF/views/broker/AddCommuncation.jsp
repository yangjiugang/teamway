<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>约谈信息记录</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<script type="text/javascript">
	function addComm(){
		var chkStr;      // 约谈内容类型
		var radio = $("input[name=surveyType]:checked").val();   // 调查方式
		var surveyRelationship = $("#surveyRelationship").val(); // 关系
		var userName = $("#userName").val(); // 姓名 
		var surveyEmployeeName = $("#surveyEmployeeName").val();
		var surveyOrganizationName = $("#surveyOrganizationName").val();
		var surveyPostName = $("#surveyPostName").val();
		var mainTalkEmployeeName = $("#mainTalkEmployeeName").val();
		var mainTalkOrganizationName = $("#mainTalkOrganizationName").val();
		var mainTalkPostName = $("#mainTalkPostName").val();
		var planTalkTime = $("#planTalkTime").val();
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		var talkType = $("#talkType").val();
		var talkPlace = $("#talkPlace").val();
		var evaluate = $("#evaluate").val();                // 评价
		var exchangeContent = $("#exchangeContent").val();  // 交流内容
		$("input[name=contactType]").each(function(){
			if($(this).attr("checked")){
				chkStr += $(this).val() + ",";
			}
		});
		if(typeof chkStr == 'undefined'){
			alert("请选择约谈内容类型！");
			return false;
		}else{
			chkStr = chkStr.substring(9,chkStr.length-1);
		}
		$.ajax({
			url : "broker_addCommRecord",
			dataType : 'json',
			data : "contentType=" + chkStr+
			       "&relationships=" + surveyRelationship + "&surveyType=" + radio +
			       "&talkToEmployeeName=" + userName + "&surveyEmployeeName=" + surveyEmployeeName + "&surveyOrganizationName=" + surveyOrganizationName +
				   "&surveyPostName=" + surveyPostName + "&mainTalkEmployeeName=" + mainTalkEmployeeName + "&mainTalkOrganizationName=" + mainTalkOrganizationName +
				   "&mainTalkPostName=" + mainTalkPostName + "&planTalkTime=" + planTalkTime + "&startTime=" + startTime + "&endTime=" + endTime +
				   "&talkPlace=" + talkPlace + "&talkEstimate=" + evaluate + "&msgContent=" + exchangeContent + "&talkType=" + talkType,
			success:function(data){
					alert("添加成功！");
					parent.right.search();
					parent.closeFrame();
			}
		});
	}
</script>
</head>
<body>
	<div class="HR_lishichaxun_Bottom myBox03" style="width: 826px;">
		<div style="margin: auto; width: 700px;">
			<div id="zzjs_zzjs1">
				<div id="tabs">
					<div id="tab1" style="padding: 0 20px;">
						<form name="addCommuncationForm">
							<div class="HR_yidongweihu_topType">
								调查方式：
								<input type="radio" name="surveyType" value="0" checked/> 面试类
								<input type="radio" name="surveyType" value="1" /> 离职类
								<input type="radio" name="surveyType" value="2" /> 关爱类
								<input type="radio" name="surveyType" value="3" /> 考察类
								<input type="radio" name="surveyType" value="4" /> 调查类
							</div>
							<div class="HR_lishichaxun_top29">
								约谈对象： &nbsp;&nbsp;
								姓名<input style="width: 88px;" id="userName" />
								与调研对象关系
								<select id="surveyRelationship">
									<option value="0">夫妻</option>
									<option value="1">父子</option>
									<option value="2">亲戚</option>
									<option value="3">朋友</option>
									<option value="4">同事</option>
									<option value="5" selected="selected">下级</option>
									<option value="6">上级</option>
								</select>
							</div>
							<div class="HR_lishichaxun_top29">
								调研对象： &nbsp;&nbsp;
								姓名 <input style="width: 91px;" id="surveyEmployeeName"/>
								部门 <input style="width: 91px;" id="surveyOrganizationName"/>
								岗位 <input style="width: 91px;" id="surveyPostName"/> 
							</div>
							<div class="HR_lishichaxun_top29">
								主谈人： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								姓名 <input style="width: 91px;" id="mainTalkEmployeeName"/>
								部门 <input style="width: 91px;" id="mainTalkOrganizationName"/>
								岗位 <input style="width: 91px;" id="mainTalkPostName"/>
							</div>
							<div class="HR_lishichaxun_top29">
								计划约谈时间： <input class="Wdate" id="planTalkTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
							</div>
							<div class="HR_lishichaxun_top29">
								约谈时间： &nbsp;&nbsp;
								开始时间 <input class="Wdate" id="startTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
								结束时间<input class="Wdate" id="endTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
								时长<input style="width: 88px;" />
							</div>
							<div class="HR_jiaoliujilu_Ytfs">
								约谈方式：
								<select id="talkType">
									<option value="0">电话</option>
									<option value="1">面谈</option>
									<option value="2">视频</option>
									<option value="3">文字交流（qq\msn\email\信函等）</option>
								</select>
								约谈地点：<input style="width: 99px;" id="talkPlace" class="HR_jiaoliujilu_input" />
							</div>
							<div class="HR_jiaoliujilu_Ytfs">
								约谈内容类型：<br/>
									<input type="checkbox" name="contactType" value="1"> 技能方面
									<input type="checkbox" name="contactType" value="2">绩效方面
									<input type="checkbox" name="contactType" value="3">薪酬方面
									<input type="checkbox" name="contactType" value="4">教育/培训方面
									<input type="checkbox" name="contactType" value="5">家庭生活方面
									<input type="checkbox" name="contactType" value="6">同事关系
									<input type="checkbox" name="contactType" value="7">个人发展计划
									<input type="checkbox" name="contactType" value="8">其他访谈内容
							</div>
							<div>
								交流内容：
								<textarea id="exchangeContent" tabindex="1" class="HR_yidongweihu_Casual"></textarea>
							</div>
							<div>
								评&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：
								<textarea id="evaluate" tabindex="1" class="HR_yidongweihu_Casual"></textarea>
							</div>
							<p class="HR_jiaoliujilu_Degree">
								约谈对象稳定程度判断：
								<img src="images/star2.png" style="width: 16px; height: 15px;" /> 
								<img src="images/star2.png" style="width: 16px; height: 15px;" />
								<img src="images/star2.png" style="width: 16px; height: 15px;" />
								<img src="images/starB.jpg" style="width: 16px; height: 15px;" />
								<img src="images/starB.jpg" style="width: 16px; height: 15px;" />
							</p>
	
							<div class="HR_lishichaxun_Submit">
								<input type="button" class="HR_diaochahuodong_Submit01" onclick="addComm();" />
								<input type="button" class="HR_jiaoliujilu_Submit01" onclick="addComm();" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>