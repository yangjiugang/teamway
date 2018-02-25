<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
	var n=1;
	$(document).ready(function(){
		var dayName = "${dayName}";
		if(dayName==""){
			checkBirthday('todayBirthday');
		}else{
			checkBirthday('todayBirthday?dayName='+dayName);
		}
	});
	
	function showHtml(title,src,w,h){
		parent.showFrame(title,src,w,h);
	};	
    

	//查询今天生日
	function checkBirthday(url){
		$("#listBirthday").jqGrid({
			url:url,
			datatype: 'json',
			mtype: 'POST',
			colNames: ['','ID','员工编号','员工姓名', '员工性别','隶属部门','员工岗位','入职日期','与员工关系','寿星出生日期'],
			colModel: [{name:'id_',hidden:true,key:true,formatter:function(cellvalue, options, rowObject){return n++}},
					   {name:'employeeInfo.employeeId',hidden:true},
			           {name:'employeeInfo.employeeNum'},
				   	   {name:'employeeInfo.userName',width:125},
				   	   {name:'employeeInfo.userSex',edittype:'select',formatter:'select',editoptions:{value:"1:女;0:男"}},
				   	   {name:'employeeInfo.organizationName'},
				   	   {name:'employeeInfo.postName'},
				   	   {name:'employeeInfo.applyDate',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m-d'}},
				   	   {name:'relationship',edittype:'select',formatter:'select',editoptions:{value:"1000:员工;1:父亲;2:母亲;3:妻子;4:丈夫;5:儿子;6:女儿;7:兄弟;8:姊妹"}},
				   	   {name:'birthday',formatter:'date',formatoptions:{srcformat:'Y-m-d',newformat:'Y-m-d'}}],
			jsonReader:{
				root: 'rows',
				repeatitems: false
			},
			pager: '#pageList',
			height:'auto',
			autowidth: true,
			hidegrid: true,
			multiselect: true,
			viewrecords: true,
			rowNum:pageSize[0],
			height:'auto',
			rowList:pageSize
		});
	}
	
	//按条件查询
	function checkBirthdayTerm(){
		var start = $("#start").val();
		var end = $("#end").val();
		var term = $("#term").val();
		if(term=="请输入关键字"){term="";}
		if(start==""||end==""){return;}
		$("#butsendBe").css("display","none");
		$("#nutRemind").css("display","none");
		$('#listBirthday').setGridParam({url:"FindBirthdayTerm"});
		$.extend($('#listBirthday').getGridParam('postData'),  {"start":start,"end":end,"term":term} ); 
	    $("#listBirthday").trigger("reloadGrid");
	};
	
	function birthdayRemind(){
		var dayName = "${dayName}";
		var row=$("#listBirthday").jqGrid('getGridParam','selarrrow');
		
		if(row == ''){
			alert("请选择你要提醒（慰问）的员工！");
		}else{
			if(row.length > 1){
				alert("只能选择一个员工！");
			}else{
				var emId = $("#listBirthday").getCell(row[0],'employeeInfo.employeeId');
				var relationship = $("#listBirthday").getCell(row[0],'relationship');
				if(relationship==1000){
					showHtml('生日慰问窗口','BirthBlessin?row='+emId,670,300);					
				}else{
					showHtml('生日提醒窗口','BirthdayRemindTwo?dayName='+dayName+"&row="+emId,400,250);
				}
			}
		}
	}
	
    function clearText(){		 
			 var keyword=$("#term").val();
			 if(keyword=="请输入关键字"){
				 $("#term").val(""); 
			 }
	}
    function initText(){
			var keyword=$("#term").val();
			if(keyword==""){
				$("#term").val("请输入关键字");
			}
	}

</script>
</head>

<body>
<div class="right1">
      <form>
      <div class="R_top">
        	<ul class="s_font zp_font">
            	<li class="z_font">
            		日期  从 <input type="text" id="start" class="Wdate" type="text" style="width:100px" name="start" onclick="WdatePicker({readOnly:'true',maxDate:'#F{$dp.$D(\'end\')||\'%y-%M-%d\'}'})" /> 
            	                      到 <input type="text" id="end" class="Wdate" type="text" style="width:100px" name="end" onclick="WdatePicker({readOnly:'true',minDate:'#F{$dp.$D(\'start\')}',maxDate:'%y-%M-%d'})"/></li>
                <li><input type="text" id="term" value="请输入关键字" onmouseup="clearText();" onblur="initText();"/></li>
                <li><input type="button" class="seach_but" onclick="checkBirthdayTerm();"/></li>
                
            </ul> 
      
        </div>
        <div class="r_but" style="margin-top:10px;">
            	<ul class="t_but12">
                  <authz:authorize ifAllGranted="FUNC_AUTH_BRO_11_01"><li><input type="button" value="查看" class="but1" onclick=""/></li></authz:authorize>
                  <authz:authorize ifAllGranted="FUNC_AUTH_BRO_11_02"><li><input type="button" value="生日提醒" class="but1" id="nutRemind" onclick="birthdayRemind();" /></li></authz:authorize>
                  <authz:authorize ifAllGranted="FUNC_AUTH_BRO_11_03"><li><input type="button" value="生日慰问" class="but1" id="butsendBe" onclick="birthdayRemind();" /></li></authz:authorize>

<!--                    <li><input type="button" value="慰问活动" class="but1" onclick="javascript:location.href='tianjiayuetananpai.html';return false;" /></li>
-->                    
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but" onclick="sendCommonEmail('listBirthday','生日提醒列表','employeeInfo.userSex:0:男:1:女|relationship:1000:员工:1:父亲:2:母亲:3:妻子:4:丈夫:5:儿子:6:女儿:7:兄弟:8:姊妹');"/></li>
                    <li><input type="button" class="fx_but"/></li>
            	 </ul> 
        	</div> 
        </form> 
        <div class="font_ul">
        	<div id="gridContainer">
				<table id="listBirthday"></table>
				<div id="pageList"></div>
			</div>        	
        </div>
  
        </div>
</body>
</html>
