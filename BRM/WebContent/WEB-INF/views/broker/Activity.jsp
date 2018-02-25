<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<html>
<style>
.table_add tr {height:30px;font-size:13px;}
.table_add .input_{height:18px;width:220px;}
</style>
<script type="text/javascript">
	function treeView(){
	//	window.showModalDialog('brokerPage?page=tree','','dialogWidth=700px;dialogHeight=600px');
		parent.showFrame('创建调查活动','brokerPage?page=tree',700,600);
	}
	function saveHD(){
		if(!check($("#actityform"))){return;};
		var saveValue = $('#actityform').serialize();
		$.ajax({
			 url: 'activitySave',
			 type: "POST",
			 dataType:"json",
			 data: saveValue,
			 success: function(){
				 window.returnValue='suc';
				 alert('保存成功!');
				 window.close();
			 },
			 error:function(msg){
			 }
		});
	}
</script>
<div id="activity_div">
<form name="actityform" id="actityform" method="post">
<table id="table_add" class="table_add"  style="margin-top:10px;">
	<tr>
		<td>调查活动名称：</td>
		<td>
			<input class="input_" id="testName" name="testName" value="${test.testName}" reg="^[^ ]+$" tip="活动名称不能为空" />
			<input type="hidden" value ="${test.testId}" name="testId"/>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>调查类型：</td>
		<td><select style="width:222px;height:23px;" name="typeId" id="typeId">
			<c:forEach items ="${testTypes }" var="type">
				<c:if test="${test.typeId==type.typeId}">
					<option value="${type.typeId}" selected="selected">${type.typeName}</option>
				</c:if>
				<c:if test="${test.typeId !=type.typeId }">
					<option value ="${type.typeId}">${type.typeName}</option>
				</c:if>
			</c:forEach>
			</select>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>调查方式：</td>
		<td><label><input type="radio" name="testMethod" id="nbnn" value="1" />内部匿名</label>
			    <label><input type="radio" name="testMethod" id="wbnn" value="2" />内部实名 </label>
			    <label><input type="radio" name="testMethod" id="wbdc" value="3" />外部调查</label>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>活动联络人：</td>
		<td><input class="input_" onclick="treeView()" name="contactUserName" id="contactUserName" value="${test.contactUserName}" readonly="readonly" /></td>
		<td></td>
	</tr>
	<tr>
		<td>活动开始时间：</td>
		<td><input class="Wdate"  style="width:220px;" name="testStartTime" value="${test.testStartTime}"  onClick="WdatePicker({readOnly:'true'})"/></td>
		<td></td>
	</tr>
	<tr>
		<td>活动截止时间：</td>
		<td><input class="Wdate"  style="width:220px;" name="testEndTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" /></td>
		<td></td>
	</tr>
	<tr>
		<td>答题有效数：</td>
		<td><input class="input_" name="testEnableCnt" reg="^\d+$" tip="请输入正确的有效数" /></td>
		<td></td>
	</tr>
	<tr>
		<td>活动说明：</td>
		<td><textarea style="width:220px" name="testDesc" rows="5" value="${test.testDesc}"></textarea></td>
		<td></td>
	</tr>
	<tr>
		<td>活动调查对象：</td>
		<td><input class="input_" name="testUserCnt" value="${test.testUserCnt}"readonly="readonly"  onclick="treeView()" style="cursor: pointer;" /></td>
		<td></td>
	</tr>
	<tr>
		<td>问卷呈现方式：</td>
		<td>
			<label><input type="radio" name="radio" id="radio" value="${test.testAnswer}" />一页一题 </label>
		    <label><input type="radio" name="radio" id="radio" value="radio" />一页十题</label>
		</td>
		</tr>
	<tr>
		<td>问卷选择：</td>
		<td><input class="input_" name="paperId" readonly="readonly" onclick="treeView()" style="cursor: pointer;"/></td>
		<td></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="right"><a href="javascript:saveHD();"><img src="images/HR_bc28.gif"/></a></td>
		<td></td>
	</tr>
</table>

</form>
</div>
</html>