<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>部门选择器</title>
<link href="css/diaochahuodong.css" rel="stylesheet" type="text/css" />
<link href="js/tree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" media="screen" href="js/jqgrid/jquery-ui-1.8.18.custom.css"/>
<link rel="stylesheet" media="screen" href="js/jqgrid/ui.jqgrid.css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/tree/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="js/tree/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="js/jqgrid/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="js/jqgrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="js/jqgrid/jquery.jqGrid.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>
var zTreeObj;
var serchFlag = false; // 是否是搜索数据
var arr = []; // 选择的岗位

var single = ${single};

var setting = {
	check: {
		enable: true
	},
	async: {
		enable: true,
		url: "orgStructure",
		autoParam: ["id"],
		otherParam:{"type":"org"}
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		onAsyncSuccess: onAsyncSuccess,
		onCheck: onCheck
	}
};

$(document).ready(function(){
	if(single == 1) {
		setting.check.chkStyle = "radio";
		setting.check.radioType = "all";
		setting.async.otherParam["single"] = 1;
	}
	zTreeObj = $.fn.zTree.init($("#orgStructureTree"), setting);
	
	$("#list").jqGrid({
		datatype : 'local',
		colNames: ['id','部门编号','部门名称'],
		colModel: [{name:'organizationId',hidden:true,key:true},
			   		{name:'organizationNum',width:125,sortable:false},
			   		{name:'organizationName',sortable:false}],
		jsonReader:{
			root: 'rows',
			repeatitems: false
		},
		loadonce: true,
		pager: '#page',
		height:'auto',
		autowidth: true,
		hidegrid: true,
		multiselect: true,
		viewrecords: false,
		rowNum:10
	});
});

function setGridData(rows){
	$("#list").jqGrid('setGridParam', {
        data : rows
    }).trigger("reloadGrid");
}

function isExist(rows, v) { // 判断值是否存在
	var has = false;
	$.each(rows, function(i, o){
		if(o.organizationId == v.organizationId) {
			has = true;
			return false;
		}
	});
	return has;
}

function addArrayData(rows) {
	$.each(rows, function(i, o){
		if(!isExist(arr, o))
			arr.push(o);
	});
}

function onAsyncSuccess(e, treeId, treeNode, msg) { // 如果父节点选中，那么异步的子节点自动选中
	if(treeNode && treeNode.checked) {
		$.each(treeNode.children, function(i, o){
			zTreeObj.checkNode(o, true);
		});
	}
}

function onCheck(e, treeId, treeNode){ // 选中执行函数
	$("#list").clearGridData(true);
	$("#list").jqGrid('hideCol',"cb");
	serchFlag = false;
	if(single == 1) { // 单选时先清空数组
		arr = [];
	}
	if(treeNode.checked) {
		$.fc.ajaxSubmit({
			url:"searchOrg",
			data:"id="+treeNode.id+"&level="+treeNode.level,
			callBackFn:function(data){
				addArrayData(data.rows);
				setGridData(arr);
			}
		});
	} else {
		$.fc.ajaxSubmit({
			url:"searchOrg",
			data:"id="+treeNode.id+"&level="+treeNode.level,
			callBackFn:function(data){
				$.each(data.rows, function(i, o){
					delPerson(o);
				});
				setGridData(arr);
			}
		});
	}
}

function delPerson(obj){
	$.each(arr, function(i, o){
		if(o.organizationId == obj.organizationId) {
			arr.splice(i, 1);
			return false;
		}
	});
}

function ok(){
	if(serchFlag) { // 处理搜索的结果
		arr = [];
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		$.each(rows, function(i, o){
			arr.push($("#list").jqGrid('getRowData', o));
		});
	}
	if(arr == ''){
		alert('请选中您的岗位！');
		return;
	}
	if(single == 1 && arr.length > 1) { // 单选时只能选一条记录
		alert('只能选择一个岗位！');
		return;
	}
	var ids = "",names = "",nums = "";
	$.each(arr, function(i, o){
		if(i == 0) {
			ids = o.organizationId;
			names = o.organizationName;
			nums = o.organizationNum;
		} else {
			ids += "," + o.organizationId;
			names += "," + o.organizationName;
			nums += "," + o.organizationNum;
		}
	});
	var idx = "${idx}";
	if(idx == "")
		parent.getParentWin().setOrgSelectorVal(ids, names, nums);
	else
		parent.getParentWin().setOrgSelectorVal(idx, ids, names, nums);
	parent.closeFrame();
}
</script>
</head>

<body>
	<div class="left">
		<ul id="orgStructureTree" class="ztree"></ul>
	</div>
	<div class="right">
		<table id="list"></table>
		<div id="page"></div>
		<input type="button" value="确定" onclick="ok()"/>
	</div>
</body>
</html>
