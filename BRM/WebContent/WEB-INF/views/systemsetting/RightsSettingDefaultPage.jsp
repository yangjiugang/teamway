<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	 $("#qxlist").jqGrid({
		url:'getCompanySysRoleByPage',
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','角色名称','角色描述','创建人', '创建时间'],
		colModel: [{name:'roleId',hidden:true,key:true},
			   		{name:'roleName'},
			   		{name:'roleDesc'},
			   		{name:'employeeInfo.userName'},
			   		{name:'createTime',formatter:'date', formatoptions:{newformat:'Y-m-d'}}],
		jsonReader:{
			root: 'roles',
			repeatitems: false
		},
		pager: '#qxpageList',
		height:'auto'/*gridHeight()-$(".right1").height()*/,
		autowidth: true,
		hidegrid: true,
		multiselect: true,
		rowNum:pageSize[0],
		rowList:pageSize
	}); 
});

function associateRole(){
	var rows=$("#qxlist").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('请选择角色！');
	}else{
		parent.showFrame("关联角色功能","rolesList?roleIds="+rows,900,500);
	}
}

function addRole(){
	parent.showFrame("添加角色","addSysRole",450,180);
}
function updateRole(){
	var rows=$("#qxlist").jqGrid('getGridParam','selarrrow');
	var data=$("#qxlist").getRowData(rows);
	if(rows==''){
		alert('您还没有选择要修改的角色！');
	}else{
		if (rows.length>1) {
			alert('一次只能修改一个角色哦！');
		} else {
			parent.showFrame("修改角色","modifySysRole?roleId="+rows+"&roleName="+data['roleName']+"&roleDesc="+data['roleDesc'],450,180);
		}
	} 
}
function deleteRole(){
	var rows=$("#qxlist").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('请选择要删除的角色！');
	}else{
		if (rows.length>10) {
			alert('一次最多只能删除10个角色！！！请重新选择！！！');
		} else {
			var flag=confirm("确定要角色吗？");
			if(flag){
				$.fc.ajaxSubmit({
					url:'${pageContext.request.contextPath}/deleteCompanySysRole',
					dataType:'json',
					data:"roleIds="+rows,
					callBackFn:function(msg){
						if(msg=='SUCCESS'){
							alert("已删除");
							$("#qxlist").trigger("reloadGrid"); 
						}else{
							alert("操作失败");
						}
					}
				});
			/* 	$.ajax({
					url:'deleteCompanySysRole',
					type:"post",
					dataType:"json",
					data: "roleIds="+rows,
					success: function(msg){
						alert("已删除");
						$("#qxlist").trigger("reloadGrid"); 
					 },
					 error:function(msg){
						alert("操作失败");
					 }
				}); */
				
			}else{
				
			}
		}
	}
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

function seachRole(){
	 var keyWord=$("#keyWord").val();
	 if(keyWord=="请输入关键字"){
		 keyWord="";
	 }
	/*  $('#list').setGridParam({url:"getDimissionUserResumeInfoWithFactorByPage"}); */
	 $.extend($('#qxlist').getGridParam('postData'),  {"keyWord":keyWord} ); 
	 $("#qxlist").trigger("reloadGrid"); 
}
function reload(){
	$("#qxlist").trigger("reloadGrid");
}
</script>
</head>

<body>
<div class="right1">
      <form>
        <div class="R_top">
        	<ul class="s_font zp_font">
            	<!-- <li><select><option>名称</option></select></li> -->
                <li><input id="keyWord" type="text" value="请输入关键字" onclick="clearText();" onblur="initText()"/></li>
                <li><input type="button" class="seach_but" onclick="seachRole();"/></li>
                <!-- <li><a href="" style="text-decoration:underline;">精准搜索</a></li> -->
                
            </ul> 
        </div>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                    <authz:authorize ifAllGranted="FUNC_AUTH_SYS_08_01"><li><input type="button"class="addrctd_but" onclick="addRole();"/></li></authz:authorize>
              		<authz:authorize ifAllGranted="FUNC_AUTH_SYS_08_02"><li><input type="button" value="修改" class="but1" onclick="updateRole();"/></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_SYS_08_03"><li><input type="button" value="删除" class="but1" onclick="deleteRole();"/></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_SYS_08_04"><li><input type="button" value="关联功能码" class="but1" onclick="associateRole();" /></li></authz:authorize>
                    
                    <li style="margin-left:10px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but" onclick ="sendCommonEmail('qxlist','公司角色列表')"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        </form> 
        <div>
        	<table id="qxlist" style="font-size: 12px;"></table>
        	<div id="qxpageList"></div>
        </div>
      <!--   <div class="font_ul">
        	<p class="Number">共：<font>10</font> 条</p>
        	<ul class="f_ul">
            	<li style="color:#056900;">全部</li>
                <li>编号</li>
                <li>角色名称</li>
                <li>创建人</li>
                <li>创建时间</li>
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
                        </ul>
                    </li>
                    <li>
                    	<ul class="f_ul">
                        	<li><input type="checkbox" /></li>
                            <li><a href="">sz123456</a></li>
                            <li><a href="">赵山河</a></li>
                            <li><a href="">技术部</a></li>
                            <li><a href="">数据库统计</a></li>
                        </ul>
                    </li>
                    <li>
                    	<ul class="f_ul">
                        	<li><input type="checkbox" /></li>
                            <li><a href="">sz123456</a></li>
                            <li><a href="">赵山河</a></li>
                            <li><a href="">技术部</a></li>
                            <li><a href="">数据库统计</a></li>
                        </ul>
                    </li>
                </ul>
            </form>
        </div> --> 
    </div>
</body>
</html>
