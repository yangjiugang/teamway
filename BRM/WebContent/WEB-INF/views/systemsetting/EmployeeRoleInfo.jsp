<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common.jsp"%>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
$(document).ready(function(){
	 $("#erlist").jqGrid({
		url:"findAllCompanyEmployeeRoleInfo?organizationId=0&keyWord=",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','编号','姓名','部门', '岗位',  '角色'],
		colModel: [{name:'employeeId',hidden:true,key:true},
			   		{name:'employeeNum'},
			   		{name:'userName'},
			   		{name:'organizationName'},
			   		{name:'postName'},
			   		{name:'fcSysRoleNames'}],
		jsonReader:{
			root: 'empRoleInfoes',
			repeatitems: false
		},
		pager: '#erpageList',
		height:'auto'/*gridHeight()-$(".right1").height()*/,
		autowidth: true,
		hidegrid: true,
		multiselect: true,
		rowNum:pageSize[0],
		rowList:pageSize
	}); 
});

function singleEmpAssociateRole(){
	var rows=$("#erlist").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('请选择员工！');
	}else{
		parent.showFrame("关联角色","modifyEmpRoles?employeeIdes="+rows,450,600);
	}
}

function batchEmpAssociateRole(){
	var rows=$("#erlist").jqGrid('getGridParam','selarrrow');
	var empNames="";
	for(var i=0;i<rows.length;i++){
		if(i==(rows.length-1)){
			empNames=empNames+($("#erlist").getRowData(rows[i]))["userName"];
		}else{
			empNames=empNames+($("#erlist").getRowData(rows[i]))["userName"]+",&nbsp;";
		}
	}
	if(rows==''){
		alert('请选择员工！');
	}else{
		parent.showFrame("批量关联角色","batchEmpAssociateRole?employeeIdes="+rows+"&empNames="+empNames,450,600);
	}
}

function jobEmpAssociateRole(){
	parent.showFrame("批量关联角色","empAssociateRoleBySelect",450,600);
}
function reload(){
	$("#erlist").trigger("reloadGrid");
}

function clearText(){
	 var keyword=$("#keyWord").val();
	 if(keyword=="请输入关键字"){
		 $("#keyWord").val(""); 
	 }
}
function initText(){
	var keyword=$("#keyWord").val();
	if(keyword==""){
		$("#keyWord").val("请输入关键字");
	}
}

function seachEmpRoleInfo(){
	var organizationId=$('#organization').find('option:selected').val();
	var keyWord=$("#keyWord").val();
	 if(keyWord=="请输入关键字"){
		 keyWord="";
	 }
	 $('#erlist').setGridParam({url:"findAllCompanyEmployeeRoleInfo"});
	 $.extend($('#erlist').getGridParam('postData'),  {"keyWord":keyWord,"organizationId":organizationId} );
	 alert(organizationId);
	 $("#erlist").trigger("reloadGrid"); 
}
</script>

</head>

<body>
<div class="right1">
      <form>
        <div class="R_top">
        	<ul class="s_font zp_font">
            	<li><select id="organization">
            			<option value="0">部门</option>
            			<c:forEach items="${allOrges }" var="org">
            				<option value="${org.organizationId}">${org.organizationName }</option>
            			</c:forEach>
            		</select></li>
                <li><input id="keyWord" type="text" value="请输入关键字" onclick="clearText();" onblur="initText()"/></li>
                <li><input type="button" class="seach_but" style="cursor: pointer;"  onclick="seachEmpRoleInfo();"/></li>
               <!--  <li><a href="" style="text-decoration:underline;">精准搜索</a></li> -->
                
            </ul> 
        </div>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                     <!--<li><input type="button"class="addrctd_but"/></li>
              <li><input type="button" value="修改" class="but1" /></li>
                    <li><input type="button" value="删除" class="but1" /></li>
                    <li><input type="button" value="查看" class="but1" /></li>-->
                    
                    <authz:authorize ifAllGranted="FUNC_AUTH_SYS_09_01"><li><input type="button" value="修改" class="but1" onclick="singleEmpAssociateRole();" /></li></authz:authorize>
                    <!-- <li><input type="button" value="批量关联角色" class="but1" onclick="batchEmpAssociateRole();" /></li> -->
                    <authz:authorize ifAllGranted="FUNC_AUTH_SYS_09_02"><li><input type="button" value="添加" class="but1" onclick="jobEmpAssociateRole();" /></li></authz:authorize>
                    
                    <li style="margin-left:10px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but" onclick ="sendCommonEmail('erlist','公司员工角色列表')"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        </form> 
        <div>
        	<table id="erlist" style="font-size: 12px;"></table>
        	<div id="erpageList"></div>
        </div>
        <!-- <div class="font_ul">
        	<p class="Number">共：<font>10</font> 条</p>
        	<ul class="f_ul">
            	<li style="color:#056900;">全部</li>
                <li>编号</li>
                <li>姓名</li>
                <li>部门</li>
                <li>岗位</li>
                <li>角色</li>
                <li>创建日期</li>
            </ul>
        </div>
        <div class="n_ul">
        	<form>
            	<ul class="nul1">
                	<li>
                    	<ul class="f_ul">
                        	<li><input type="checkbox" /></li>
                            <li><a href="">sz123456</a></li>
                            <li><a href="">赵山河</a></li>
                            <li><a href="">技术部</a></li>
                            <li><a href="">数据库统计</a></li>
                           	<li><a href="">赵山河</a></li>
                            <li><a href="">赵山河</a></li>
                        </ul>
                    </li>
                    <li>
                    	<ul class="f_ul">
                        	<li><input type="checkbox" /></li>
                            <li><a href="">sz123456</a></li>
                            <li><a href="">赵山河</a></li>
                            <li><a href="">技术部</a></li>
                            <li><a href="">数据库统计</a></li>
                           	<li><a href="">赵山河</a></li>
                            <li><a href="">赵山河</a></li>
                        </ul>
                    </li>
                    <li>
                    	<ul class="f_ul">
                        	<li><input type="checkbox" /></li>
                            <li><a href="">sz123456</a></li>
                            <li><a href="">赵山河</a></li>
                            <li><a href="">技术部</a></li>
                            <li><a href="">数据库统计</a></li>
                           	<li><a href="">赵山河</a></li>
                            <li><a href="">赵山河</a></li>
                        </ul>
                    </li>
                </ul>
            </form>
        </div> -->
    </div>
</body>
</html>
