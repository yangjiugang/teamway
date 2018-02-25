<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>邮件发送</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/validate/validate.js"></script>
</head>

<body>
<div class="HR_Tianjia_Bottom myBox03">
<form id="sendEmailFrom" name="sendEmailFrom" method="post" >
<div class="HR_Tianjiadiaochahuodong"></div>
<div class="HR_Tianjialishi">&nbsp;&nbsp;收件人email：<input style="width:300px;" id="emaillist" name="emaillist" value="${emaillist}"/></div>
<!-- <div class="HR_Tianjia_Casual">&nbsp;&nbsp;邮件正文：<textarea style="width:328px; height:210px" name="emailtext"></textarea></div><br/>
 -->
 <br></br>
<div align="right"><input type="button" class="HR_fsyxlb" onclick="sendEmail();" /></div>
<input type="hidden" id="rowIds" name="rowIds" value="${rowIds}"/>
<input type="hidden" id="listId" name="listId" value="${listId}"/>
<input type="hidden" id="emailTitle" name="emailTitle" value="${emailTitle}"/>
<input type="hidden" id="tablevalues" name="tablevalues"/>
<input type="hidden" id="flag" name="flag" value="${flag}"/>
<input type="hidden" id="types" name="types" value="${types}"/>
</form>
</div>
<script type="text/JavaScript">
	var flag =  document.getElementById("flag").value;
	var listId =  document.getElementById("listId").value;
	judgeSuccess();
	
	var types = document.getElementById("types").value.split("|");
	var typearr = new Array();
	for(var i=0; i<types.length; ++i){
		typearr[i] = types[i].split(":");
	}
	var rows = document.getElementById("rowIds").value.split(",");
	var colNames = parent.right.$("#"+listId+"").jqGrid('getGridParam','colNames');
	var names = colNames.concat();
	names.shift();names.shift(); 
	var content = "<table border="+"1"+"><tr>";
	for( var i=0; i<names.length; ++i){
		content = content+"<td>"+names[i]+"</td>";
	}
	content += "</tr>";
	var colIds = parent.right.$("#"+listId+"").jqGrid('getGridParam','colModel');
	var ids = colIds.concat();
	ids.shift();ids.shift();
	var idNames = new Array();
	for ( var i=0 ; i < ids.length ; ++i ){
		idNames[i] = ids[i].name;
	}
	for ( var i=0 ; i < rows.length ; ++i ){
		content += "<tr>";
		for(var j=0; j < ids.length; ++j){
			for(var k=0; k<typearr.length; ++k){
				if(idNames[j] == typearr[k][0]){
					for(var l=0; l<typearr[k].length; ++l){
						var value = parent.right.$("#"+listId+"").jqGrid('getRowData', rows[i])[idNames[j]];
						if(value == typearr[k][l]){
							content = content+"<td>"+typearr[k][l+1]+"</td>";
						}
					}
					break;
				}else{	
					if(k<typearr.length-1) continue;
					content = content+ "<td>"+parent.right.$("#"+listId+"").jqGrid('getRowData', rows[i])[idNames[j]]+"</td>";
					break;
				}			
			}
			
		}
		content += "</tr>";
	}
	content += "</table>";
	document.getElementById("tablevalues").value = content;
	
	function sendEmail(){
		var emailList = document.getElementById("emaillist").value;
		if(emailList == null || emailList == ""){
			alert("请输入邮箱地址，若同时发送多人，请用 ; 号分隔！");
			return;
		}
		var l1 = emailList.split(";");
		var l2 = emailList.split("@");
		if(l2.length != l1.length+1){
			alert("输入的邮件格式有误，若同时发送多人，请用 ; 号分隔！");
			return;
		}
		for(var i=0; i<l1.length; ++i){
			if(!checkIsEmail(l1[i])){
				alert("输入的邮件格式有误，请重新输入！");
				return;
			}
		}
		document.forms["sendEmailFrom"].action = "sendCommonMail";
		document.forms["sendEmailFrom"].submit();
	}
	
	function judgeSuccess(){
		if(flag == "true"){
			alert("发送成功！");
			parent.closeFrame();
		}
		if(flag == "false"){
			alert("发送失败 ！");
			return;
		}
	}
</script>	
</body>
</html>

