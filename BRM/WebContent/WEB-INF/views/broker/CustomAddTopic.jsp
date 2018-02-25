<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>自定义添加问卷问题</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/curvycorners.src.js"></script>
<script type="text/JavaScript" src="js/map.js"></script>
<style type="">
	#questionContent{width:233px}
	#areaanner{width:350px};
</style>
<script>
	var map = new Map();
	map.put(1, 'a');
	map.put(2, 'b');
	map.put(3, 'c');
	map.put(4, 'd');
	map.put(5, 'e');
	map.put(6, 'f');
	map.put(7, 'g');
	map.put(8, 'h');
	map.put(9, 'i');
	
	function change(type){
		if(type=='single'){
			$("#danxdiv").css("display","");
			$("#duoxdiv").css("display","none");
			$("#wddiv").css("display","none");
			$(".HR_Tianjia_Submit10").css("display","");
		}
		if(type=="multselect"){
			$("#duoxdiv").css("display","");
			$("#danxdiv").css("display","none");
			$("#wddiv").css("display","none");
			$(".HR_Tianjia_Submit10").css("display","");
		}
		if(type == "qaa"){
			$("#duoxdiv").css("display","none");
			$("#danxdiv").css("display","none");
			$("#wddiv").css("display","");
			$(".HR_Tianjia_Submit10").css("display","none");
		}
	}
	function customAdd(){
		if($("#single_radio").attr("checked")){
			var len = $("#danxdiv >p").length+1;
			if(len > 9){
				alert('不能再添加了');return;
			}
			$("#danxdiv").append('<p>'+map.get(len)+'.<input name="answer'+len+'" reg="^[^ ]+$" tip="选项不能为空" /> <label><span><input type="radio" name="isRight_" onclick="updateHiddenvalue(\'isRight'+len+'\')" />正确</span></label>'+
								 '<input type="hidden" value="0" name="isRight'+len+'" id="isRight'+len+'" /></p>');
			again();
		}
		if($("#multselect_radio").attr("checked")){
			var len = $("#duoxdiv >p").length+1;
			if(len > 9){
				alert('不能再添加了');return;
			}
			$("#duoxdiv").append('<p>'+map.get(len)+'.<input name="answer'+len+'" reg="^[^ ]+$" tip="选项不能为空" /> <label><span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue(\'isRight_dx'+len+'\',this)" />正确</span></label>'+
								 '<input type="hidden" value="0" name="isRight'+len+'" id="isRight_dx'+len+'" /></p>');
			again();
		}
	}
	function updateHiddenvalue(id,t){
		if($("#single_radio").attr("checked")){
			var objs = $("#danxdiv input:hidden");
			for(var i=0;i<objs.size();i++){
				objs[i].value = 0;
			}
			$("#"+id).val(1);
		}
		if($("#multselect_radio").attr("checked")){
			if(t.checked){
				$("#"+id).val(1);	
			}else{
				$("#"+id).val(0);
			}
		}
	}
	
	function save(v){
		if(!check($("#myForm"))){return;};
		var myForm = $("#myForm").serialize();
		var customForm = $("#customSingleForm").serialize();
		if($("#multselect_radio").attr("checked")){
			customForm = $("#customMultSelForm").serialize();
		}
		if($("#qaa_radio").attr("checked")){
			customForm = $("#customWdForm").serialize();
		}
		
		$.ajax({
			 url: 'saveQuestionLibrary',
			 type: "POST",
			 dataType:"json",
			 data: myForm+'&'+customForm,
			 success: function(){
				 alert('保存成功!');
				 if($("#paperId").val()==0){
					 parent.iframe.search();
				 }else{
				 	parent.getChildFrame().reload();
				 }
				 if(v==2){
					 parent.closeFrame();
				 }
				 if(v==1){
					 $("#myForm").resetForm();
				 }
			 }
		});
	}
	function update(){
		if(!check($("#myForm"))){return;};
		var myForm = $("#myForm").serialize();
		var customForm = $("#customSingleForm").serialize();
		if($("#multselect_radio").attr("checked")){
			customForm = $("#customMultSelForm").serialize();
		}
		if($("#qaa_radio").attr("checked")){
			customForm = $("#customWdForm").serialize();
		}
		$.ajax({
			 url: 'updateLibrary',
			 type: "POST",
			 dataType:"json",
			 data: myForm+'&'+customForm,
			 success: function(){
				 alert('保存成功!');
				 parent.iframe.search();
				 parent.closeFrame();
			 }
		});
	}
</script>
</head>
<body>

<div class="HR_Tianjiadiaochahuodong">
<form name="myForm" id="myForm">
<div class="HR_Tianjialishi">
<c:if test="${library.questionId!=null }">
编号：
<input style="width:233px;" name="questionNum" readonly="readonly" value="${library.questionNum}"/>
</c:if>
<input type="hidden" name="paperId" id="paperId" value="${paperId }"/>
<input type="hidden" name="questionId" value="${library.questionId }" />
</div>
<div class="HR_Tianjialishi">题目类别：
<select reg=".*[^ ].*" tip="题目类别不能为空" name="typeId" id="typeId" style="width:210px;">
	<c:forEach items="${types}" var="type">
		<c:if test="${library.typeId==type.typeId}">
			<option value="${type.typeId }" selected="selected">${type.typeName }</option>		
		</c:if>
		<c:if test="${library.typeId!=type.typeId}">
			<option value="${type.typeId }" >${type.typeName }</option>		
		</c:if>
	</c:forEach>
</select>
</div>
<!-- <input style="width:210px;" class="HR_TianjiaSan" /></div>	 -->
<div class="HR_TianjiaType">题目难易程度：
	<label><input type="radio" name="levelId" id="hard" value="1" ${library.levelId==1?'checked':'' } /> 难</label> 
	<label><input type="radio" name="levelId" id="general" value="2" ${library.levelId==null?'checked':(library.levelId==2?'checked':'')}/> 普通</label>
	<label><input type="radio" name="levelId" id="simple" value="3" ${library.levelId==3?'checked':''}/> 易</label>
</div>
<div class="HR_Tianjialishi">分数：<input reg="^\d+$" tip="分数只能为正整数" value="${library.questionPoints}" name="questionPoints" id="questionPoints" /></div>


<div class="HR_TianjiaType">题目类型：
	<label><input type="radio" name="questionType" id="single_radio" value="1" checked="checked" onclick="change('single')" /> 单选题</label>
	<label><input type="radio" name="questionType" id="multselect_radio" value="2" onclick="change('multselect')"/> 多选题</label>
	<label><input type="radio" name="questionType" id="qaa_radio" value="3" onclick="change('qaa')"/> 问答题</label>
</div>
<div class="HR_Tianjialishi">题干：<input reg=".*[^ ].*" tip="题干不能为空" value="${library.questionContent }" id="questionContent" name="questionContent" id="questionContent" /></div>
</form>
<div class="HR_Tanchu28_Select">
<div class="HR_Tanchu28_SelectL">选择题：</div>
<div class="HR_Tanchu28_SelectR">
<form id="customSingleForm">
<div id="danxdiv">
<!-- reg="^[^ ]+$" tip="选项不能为空" -->
<p>a.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer" id="answer" value="${library.questionType==1?library.answer:'' }" /><label><span>
	<input checked="checked" type="radio" name="isRight_" onclick="updateHiddenvalue('isRight')" ${library.questionType==1&&library.isRight==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight" id="isRight" value="${library.isRight==1?1:0}"/>
</p>
<c:if test="${library.answer2!=null && library.questionType==1 }">
<p>b.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer2" id="answer2" value="${library.answer2 }" /><label><span>
	<input  type="radio" name="isRight_" onclick="updateHiddenvalue('isRight2')" ${library.questionType==1&&library.isRight2==1?'checked':''}/>正确</span></label>
	<input type="hidden" name="isRight2" id="isRight2" value="${library.isRight2==1?1:0}"/>
</p>
</c:if>
<c:if test="${library.answer3!=null && library.questionType==1 }">
<p>c.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer3" id="answer3" value="${library.answer3 }" /><label><span>
	<input type="radio" name="isRight_" onclick="updateHiddenvalue('isRight3')" ${library.questionType==1&&library.isRight3==1?'checked':''}/>正确</span></label>
	<input type="hidden" name="isRight3" id="isRight3" value="${library.isRight3==1?1:0}"/>
</p>
</c:if>
<c:if test="${library.answer4!=null && library.questionType==1}">
<p>d.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer4" id="answer4" value="${library.answer4 }" /><label><span>
	<input type="radio" name="isRight_" onclick="updateHiddenvalue('isRight4')" ${library.questionType==1&&library.isRight4==1?'checked':''}/>正确</span></label>
	<input type="hidden" name="isRight4" id="isRight4" value="${library.isRight4==1?1:0}"/>
</p>
</c:if>
<c:if test="${library.answer5!=null&& library.questionType==1 }">
<p>e.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer5" id="answer5" value="${library.answer5 }" /><label><span>
	<input type="radio" name="isRight_" onclick="updateHiddenvalue('isRight5')" ${library.questionType==1&&library.isRight5==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight5" id="isRight5" value="${library.isRight5==1?1:0}"/>
</p>
</c:if>
<c:if test="${library.answer6!=null&& library.questionType==1 }">
<p>f.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer6" id="answer6" value="${library.answer6 }" /><label><span>
	<input type="radio" name="isRight_" onclick="updateHiddenvalue('isRight6')" ${library.questionType==1&&library.isRight6==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight6" id="isRight6" value="${library.isRight6==1?1:0}"/>
</p>
</c:if>
<c:if test="${library.answer6!=null&& library.questionType==1 }">
<p>g.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer7" id="answer7" value="${library.answer7 }" /><label><span>
	<input type="radio" name="isRight_" onclick="updateHiddenvalue('isRight7')" ${library.questionType==1&&library.isRight7==1?'checked':''}/>正确</span></label>
	<input type="hidden" name="isRight7" id="isRight7" value="${library.isRight7==1?1:0}"/>
</p>
</c:if>
<c:if test="${library.answer6!=null&& library.questionType==1 }">
<p>h.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer8" id="answer8" value="${library.answer8 }" /><label><span>
	<input type="radio" name="isRight_" onclick="updateHiddenvalue('isRight8')" ${library.questionType==1&&library.isRight8==1?'checked':''}/>正确</span></label>
	<input type="hidden" name="isRight8" id="isRight8" value="${library.isRight8==1?1:0}"/>
</p>
</c:if>
<c:if test="${library.answer9!=null&& library.questionType==1 }">
<p>i.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer9" id="answer9" value="${library.answer9 }" /><label><span>
	<input type="radio" name="isRight_" onclick="updateHiddenvalue('isRight9')" ${library.questionType==1&&library.isRight9==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight9" id="isRight9" value="${library.isRight9==1?1:0}"/>
</p>
</c:if>
</div>
</form>
<form id="customMultSelForm">
<div id="duoxdiv" style="display: none">
<p>a.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer" id="answer_duo" value="${library.questionType==2?library.answer:'' }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx',this)" ${library.questionType==2&&library.isRight==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight" id="isRight_dx" value="${library.isRight==1?1:0 }"/>
</p>
<c:if test="${library.answer2!=null&& library.questionType==2 }">
<p>b.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer2" id="answer_duo2" value="${library.answer2 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx2',this)" ${library.questionType==2&&library.isRight2==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight2" id="isRight_dx2" value="${library.isRight2==1?1:0 }" />
</p>
</c:if>
<c:if test="${library.answer3!=null&& library.questionType==2 }">
<p>c.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer3" id="answer_duo3" value="${library.answer3 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx3',this)" ${library.questionType==2&&library.isRight3==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight3" id="isRight_dx3" value="${library.isRight3==1?1:0 }"/>
</p>
</c:if>
<c:if test="${library.answer4!=null&& library.questionType==2 }">
<p>d.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer4" id="answer_duo4" value="${library.answer4 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx4',this)" ${library.questionType==2&&library.isRight4==1?'checked':''}/>正确</span></label>
	<input type="hidden" name="isRight4" id="isRight_dx4" value="${library.isRight4==1?1:0 }"/>
</p>
</c:if>
<c:if test="${library.answer5!=null&& library.questionType==2 }">
<p>e.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer5" id="answer_duo5" value="${library.answer5 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx5',this)" ${library.questionType==2&&library.isRight5==1?'checked':''}/>正确</span></label>
	<input type="hidden" name="isRight5" id="isRight_dx5" value="${library.isRight5==1?1:0 }"/>
</p>
</c:if>
<c:if test="${library.answer6!=null&& library.questionType==2 }">
<p>f.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer6" id="answer_duo6" value="${library.answer6 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx6',this)" ${library.questionType==2&&library.isRight6==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight6" id="isRight_dx6" value="${library.isRight6==1?1:0 }"/>
</p>
</c:if>
<c:if test="${library.answer7!=null&& library.questionType==2 }">
<p>g.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer7" id="answer_duo7" value="${library.answer8 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx7',this)" ${library.questionType==2&&library.isRight7==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight7" id="isRight_dx7" value="${library.isRight7==1?1:0 }"/>
</p>
</c:if>
<c:if test="${library.answer8!=null&& library.questionType==2 }">
<p>h.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer8" id="answer_duo8" value="${library.answer8 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx8',this)" ${library.questionType==2&&library.isRight8==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight8" id="isRight_dx8" value="${library.isRight8==1?1:0 }"/>
</p>
</c:if>
<c:if test="${library.answer9!=null&& library.questionType==2 }">
<p>i.<input reg="^[^ ]+$" tip="选项不能为空" type="text" name="answer9" id="answer_duo9" value="${library.answer9 }"/> <label>
	<span><input type="checkbox" name="isRight_" onclick="updateHiddenvalue('isRight_dx9',this)" ${library.questionType==2&&library.isRight9==1?'checked':''} />正确</span></label>
	<input type="hidden" name="isRight9" id="isRight_dx9" value="${library.isRight9==1?1:0 }"/>
</p>
</c:if>

</div>
</form>
<form id="customWdForm">
<div class="HR_Tianjia_Casual" id="wddiv" style="display: none;">
答案：<textarea reg="^[^ ]+$" tip="答案不能为空" id="areaanner" name="answer" cols="" rows="">${library.questionType==3?library.answer:''}</textarea>
</div>
</form>
<c:if test="${view =='undefined' || view==null}">
<input type="button" class="HR_Tianjia_Submit10" onclick="customAdd()" />
</c:if>
</div>
</div>

</div>
<div class="HR_Tianjia_Submit" style="margin-right:40px;" >
<c:if test="${library.questionId==null }">
<input type="button" class="HR_Tianjia_Submit09" onclick="save(1)"/>
<input type="button" class="HR_Tianjia_Submit08" onclick="save(2)"/>
<input type="button" class="HR_Tianjia_Submit07" onclick="parent.closeFrame()"/>
</c:if>
<c:if test="${library.questionId!=null && view =='undefined' }">
<input type="button" class="HR_Tianjia_Submit01" onclick="update()"/>
<input type="button" class="HR_Tianjia_Submit02" onclick="parent.closeFrame()"/>
</c:if>
</div>
<script>
if('${library.questionType}' == 1){
	$("#single_radio").click();
}
if('${library.questionType}' == 2){
	$("#multselect_radio").click();
}
if('${library.questionType}' == 3){
	$("#qaa_radio").click();
}
again();
</script>
</body>
</html>
