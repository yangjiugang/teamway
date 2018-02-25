<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>面试及交流记录窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript">
function settab_zzjs(name,num,n){
 for(var i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
 }
}

function initCss(count){
	for(var i=0;i<count;i++){
		$("#interview_"+i).hide();
	}
}
function showDataDiv(i,count){
	initCss(count);
	$("#interview_"+i).show();
}
</script>
<script>
	<c:if test="${isAdd==1}">
		alert('提交成功!');
		parent.ClosePop();
	</c:if>
	<c:if test="${isAdd==-2}">
		alert('您还未对该经纪人发起面试通知！');
		parent.ClosePop();
	</c:if>
	<c:if test="${isAdd>=0}">
		alert('系统繁忙,请重试!');
	</c:if>
	
	$(document).ready(function(){
		//获取当前时间
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth();
		var day = myDate.getDate();
	
		$("#startTime").val(year+"-"+month+"-"+day);
		$("#endTime").val(year+"-"+month+"-"+day);
	});
	
	function checkForm(){
		
		if(equalsDateTime("#startTime","#endTime")){
			alert("结束时间格式不正确！");
			return false;
		}
		return true;
	}
	
	function equalsDateTime(startDate,endDate){
		var startStr = $(startDate).val();
		var endStr = $(endDate).val();
		
		var dateArray1 = startStr.split("-");
		var dateArray2 = endStr.split("-");
		
		if(dateArray2[0]<dateArray1[0]){
			return false;
		}
		if(dateArray2[0]==dateArray1[0] &&dateArray2[1]< dateArray1[1]){
			return false;
		}
		if(dateArray2[1]==dateArray1[1] && dateArray2[2]<dateArray1[2]){
			return false;
		}
	}
	
	//验证日期
	function checkInput(id){
		var dateStr = $("#"+id).val();
		//获取当前时间
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth()+1;
		var day = myDate.getDate();
		
		var dateArray = dateStr.split("-");
		if(dateArray[0]<year){
			return false;
		}
		if(year==dateArray[0] &&dateArray[1]< month){
			return false;
		}
		if(month==dateArray[1] && dateArray[2]<day){
			return false;
		}
		return true;
	}
</script>
</head>

<body>



<div class="HR_lishichaxun_Bottom myBox03">
<div class="tabL">
<ul><li id="zzjs1" onClick ="settab_zzjs('zzjs',1,2)" class="on_zzjs">面试录入</li>
<li id="zzjs2" onClick ="settab_zzjs('zzjs',2,2)">面试历史查询</li>
</ul></div>

<div id="zzjs_zzjs1">
	<form action="updateInterview" method="post" onsubmit="return checkForm()">
	<input type="hidden" name="userId" id="userId" value="${userId}"/>
	<input type="hidden" name="rid" id="rid" value="1"/>
	<div class="HR_mianshijiaoliujilu">
	<div class="HR_lishichaxun_top29">
		任务号：<input style="width:120px;" name="talkNum" reg="^[A-Za-z0-9]+$" tip="请输入任务编号,以任意字母开头至少3个数字结尾,如:FL0513"/> 
		面试官：<input style="width:120px;" name="interviewersName" reg="^([A-Za-z]|[\u4E00-\u9FA5])+$" tip="请输入面试官姓名,格式为汉字或字母" /> 
		面谈类型：<select style="width:80px;" id="interviewType" name="interviewType">
                		<option value="0">电话</option>
                		<option value="1" selected="selected">面谈</option>
                		<option value="2">视频</option>
                		<option value="3">集体</option>
                	</select>
	</div>
	<div class="HR_lishichaxun_top29">
		面试开始时间：<input class="Wdate" style="width:84px;" name="startTime" id="startTime" onClick="WdatePicker({readOnly:'true'})" />
		面试结束时间：<input class="Wdate" style="width:84px;" name="endTime" id="endTime" onClick="WdatePicker({readOnly:'true'})" />
	</div>
	<div class="HR_lishichaxun_top29">
		面试地点：<input style="width:482px;" name="interviewAddress" reg="^[a-zA-Z|\d|\u0391-\uFFE5]*$" tip="请输入面试地点"/> 
	</div>
	<div class="HR_lishichaxun_top29">
		面试问题（1）：<input style="width:451px;" reg=".*[^ ].*" tip="请输入面试问题,面试问题不能为空" /> 
	</div>
	<P style="padding-top:15px;">
		回答：<textarea node-type="textEl" name="content" tabindex="1" class="HR_mianshijiaoliujilu_Casual" reg=".*[^ ].*" tip="请输入面试地点,面试地点不能为空 "></textarea>
	</P>
	<div class="HR_mianshijiaoliujilu_Submit">
		<input type="button" class="HR_mianshijiaoliujilu_tjmswt" /> 
	</div>

	<h3 style="font-size:12px; font-weight:normal;">对候选人综合评价：</h3>
	<textarea node-type="textEl" name="talkEstimate" tabindex="1" reg=".*[^ ].*" tip="请输入对候选人综合评价,评价不能为空 " class="HR_mianshijiaoliujilu_Casual">
	</textarea>

	<div class="HR_mianshijiaoliujilu13">
		面试结果: <input type="radio" name="interviewResult" id="interviewResult" value="0" /> 
		面试通过<span><input type="radio" name="interviewResult" id="interviewResult" value="1" /> 
		面试不通过</span><input type="radio" name="interviewResult" id="interviewResult" value="2" /> 可备选
	</div>
	<div class="HR_mianshijiaoliujilu_Submit"><input type="submit" value="  " class="HR_Submit_qdtj29" /></div>
</div>
</form>
</div>


<div id="zzjs_zzjs2" style="display: none">
<ul class="HR_jiarurencaitidui_tabs">
<c:forEach items="${interview}"  var="inter1" varStatus="status">
	<c:if test="${status.index==0 }">
		<li><a href="#" onclick="showDataDiv(${status.index},${fn:length(interview)} )" style="color:#0566AD;">初试</a></li>
	</c:if>
	<c:if test="${status.index!=0 }">
		<li><a href="#" onclick="showDataDiv(${status.index},${fn:length(interview)} )" style="color:#0566AD;">复试${status.count }</a></li>
	</c:if>
</c:forEach>

</ul>

<c:forEach items="${interview}" var="inter" varStatus="status">
<c:if test="${status.first }">
	<div class="HR_mianshijiaoliujilu" id="interview_${status.index }">
</c:if>
<c:if test="${!status.first }">
	<div class="HR_mianshijiaoliujilu" id="interview_${status.index }" style="display: none;">
</c:if>
<div class="HR_lishichaxun_top29">
	任务号：<input style="width:120px;" value="${inter.taskId }" readonly="readonly" /> 
	面试官：<input style="width:120px;" value="${inter.recruitInterviewProcess.interviewersName }" readonly="readonly"/> 
	候选人：<input style="width:120px;" value="${inter.userResume.userName }" readonly="readonly"/>
</div>
<div class="HR_lishichaxun_top29">
	面试开始时间：<input style="width:84px;" value="${inter.recruitInterviewProcess.userTrackRecord.startTime }" readonly="readonly"/> 
	面试结束时间：<input style="width:84px;" value="${inter.recruitInterviewProcess.userTrackRecord.endTime }" readonly="readonly"/>
</div>

<div class="HR_lishichaxun_top29">
	面试地点：<input style="width:482px;" value="${inter.recruitInterviewProcess.interviewAddress }" readonly="readonly"/>
</div>

<c:forEach items="${inter.recruitInterviewProcess.userTrackRecord.contents}" var="content" varStatus="ss">
<div class="HR_lishichaxun_top29">
	面试问题（${ss.count }）：	
	 <c:if test="${content.contentType == 1 }"><input readonly="readonly" style="width:451px;" value="技能方面" /></c:if>
	  <c:if test="${content.contentType == 2 }"><input readonly="readonly" style="width:451px;" value="绩效方面" /></c:if>
	   <c:if test="${content.contentType == 3 }"><input readonly="readonly" style="width:451px;" value="薪酬方面" /></c:if>
	    <c:if test="${content.contentType == 4 }"><input readonly="readonly" style="width:451px;" value="教育/培训方面" /></c:if>
	     <c:if test="${content.contentType == 5 }"><input readonly="readonly" style="width:451px;" value="家庭生活方面" /></c:if>
	      <c:if test="${content.contentType == 6 }"><input readonly="readonly" style="width:451px;" value="同事关系" /></c:if>
	       <c:if test="${content.contentType == 7 }"><input readonly="readonly" style="width:451px;" value="个人发展计划" /></c:if>
	        <c:if test="${content.contentType == 8 }"><input readonly="readonly" style="width:451px;" value="其他访谈内容" /></c:if>
	
</div>

<P style="padding:15px 0;">
回答：<textarea node-type="textEl" name="" title="请输入......." tabindex="1" class="HR_mianshijiaoliujilu_Casual">
${content.content }
</textarea>
</P>
</c:forEach>

<h3 style="font-size:12px; font-weight:normal;">对候选人综合评价：</h3>
<textarea node-type="textEl" name="" title="请输入......." tabindex="1" class="HR_mianshijiaoliujilu_Casual">
${inter.recruitInterviewProcess.interviewResult }
</textarea>
<form>
<div class="HR_mianshijiaoliujilu13">
面试结果: <input type="radio" name="interviewResult" id="interviewResult" value="0" 
<c:if test="${inter.recruitInterviewProcess.interviewResult ==0 }"> checked="checked"</c:if>  /> 
		面试通过<span><input type="radio" name="interviewResult" id="interviewResult" value="1" <c:if test="${inter.recruitInterviewProcess.interviewResult==1 }"> checked="checked"</c:if>  /> 
		面试不通过</span><input type="radio" name="interviewResult" id="interviewResult" value="2" <c:if test="${inter.recruitInterviewProcess.interviewResult==2 }"> checked="checked"</c:if> /> 可备选
</div></form>

</div>
</c:forEach>
</div>


</div>


</body>
</html>
