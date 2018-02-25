<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>职系设置</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>

<script type="text/javascript">
$(document).ready(function(){
	 $("#qxlist").jqGrid({
		url:'selectJobGrade',
		datatype: 'json',
		mtype: 'POST',
		colNames: ['id','职系名称','职系描述','职系对应岗位', '创建时间'],
		colModel: [{name:'cfgJobGrade.jobGradeId',hidden:true,key:true},
			   		{name:'cfgJobGrade.jobGradeName'},
			   		{name:'cfgJobGrade.jobGradeDesc'},
			   		{name:'postName'},
			   		{name:'cfgJobGrade.createTime',formatter:'date', formatoptions:{newformat:'Y-m-d'}}],
		jsonReader:{
			root: 'rows',
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

function addGrade(){
	parent.showFrame("添加职系","addSysGrade",450,180);
}
function updataGrade(){
	var rows=$("#qxlist").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('您还没有选择要修改的职系！');
	}else{
		if (rows.length>1) {
			alert('一次只能修改一个职系哦！');
		} else {
			parent.showFrame("修改职系","updataGrade?gradeId="+rows,450,180);
		}
	} 
}
function deleteGrade(){
	var rows=$("#qxlist").jqGrid('getGridParam','selarrrow');
	if(rows==''){
		alert('请选择要删除的职系！');
	}else{
		if (rows.length>10) {
			alert('一次最多只能删除10个职系！！！请重新选择！！！');
		} else {
			var flag=confirm("确定要删除？");
			if(flag){
				$.fc.ajaxSubmit({
					url:'deleteJobGrade',
					dataType:'json',
					data:"gradeId="+rows,
					callBackFn:function(msg){
						if(msg=='SUCCESS'){
							alert("删除成功");
							$("#qxlist").trigger("reloadGrid"); 
						}else{
							alert("删除失败");
						}
					}
				});
			}else{
				
			}
		}
	}
}
function reload(){
	$("#qxlist").trigger("reloadGrid");
}
</script>

</head>

<body>
<div class="right1">
      <form>
        <div class="r_but r_but2" >
            	<ul class="t_but12">
                   <li><input type="button" class="addrctd_but" onclick="addGrade();" /></li>
                    <!-- <li><input type="button" value="查看" class="but1"/></li> -->
                    <li><input type="button" value="修改" class="but1" onclick="updataGrade();"/></li>
                <li><input type="button" value="删除" class="but1" onclick="deleteGrade();" /></li>     

                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        </form> 
        <div>
        	<table id="qxlist" style="font-size: 12px;"></table>
        	<div id="qxpageList"></div>
        </div>
        <!-- <div class="font_ul">
        <p class="Number">共：<font>10</font> 条</p>
        	<ul class="f_ul f_ul2">
            	<li style="color:#056900;width:4%;">全部</li>
                <li>职系名称</li>
                <li>职系描述</li>
                <li>职系对应岗位</li>
            </ul>
        </div> -->
        <!-- <div class="n_ul">
        	<form>
            	<ul class="nul1">
                	<li>
                    	<ul class="f_ul f_ul2">
                        	<li style="width:4%;"><input type="checkbox" /></li>
                            <li><a href="">sz123456</a></li>
                            <li><a href="">51job</a></li>
                            <li><a href="">掌上后</a></li>
                        </ul>
                    </li>
                </ul>
            </form>
        </div> -->
    </div>
</body>
</html>
