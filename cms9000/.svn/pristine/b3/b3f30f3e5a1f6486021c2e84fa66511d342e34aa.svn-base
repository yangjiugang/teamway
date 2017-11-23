<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="exp/header.jsp"%>
<div class="easyui-layout"  data-options="fit:true">
<div data-options="region:'west',split:true,title:'轮巡预案列表'" style="width:200px">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false">
			<table id="tour_tb"></table>
			<div id="tour_toolbar" style="display:none;">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add-t" plain="true" onclick="openDlg('add')">添加</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit-t" plain="true" onclick="editTour()">编辑</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove-t" plain="true" onclick="delTour()">删除</a>
			</div>
		</div>
	</div>
</div>
	
	<div data-options="region:'center',title:'摄像机列表'">
		   <div class="easyui-layout"  data-options="fit:true">
		   			<table id="camera_tb"></table>
					<div id="camera_toolbar" style="display:none;">
						<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add-t" plain="true" onclick="addCamera()">添加</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove-t" plain="true" onclick="delCamera()">删除</a>
					</div>
		   </div>
	</div>	
</div>	

<div id="dlg" class="easyui-dialog" title="摄像机资源目录" style="display:none;width:360px;height:480px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:[{
				text:'保存',
				handler:function(){
					saveCameraList();
				}
			},{
				text:'取消',
				handler:function(){$('#dlg').dialog('close')}
			}]">
	<div style="margin:5px;">
		<ul id="camera_tree" class="ztree"></ul>
	</div>
</div>


<div id="dlg_tour" class="easyui-dialog" title="轮巡预案" style="display:none;width:240px;height:360px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:[{
				text:'保存',
				handler:function(){
					saveTour();
				}
			},{
				text:'取消',
				handler:function(){$('#dlg_tour').dialog('close')}
			}]">
	<div style="margin:10px;">
		<form id="tour_form" class="easyui-form"  method="post" >
		<div style="margin-bottom:5px">
			<input type="hidden" id="id" name="id" />
			<input class="easyui-textbox" label="预案名称：" id="name" name="name" labelPosition="top" data-options="prompt:'请输入轮巡预案名称...',required:true" style="width:200px;height:45px" />
		</div>
		<div style="margin-bottom:5px">
			<select id="interval" class="easyui-combobox" labelPosition="top" label="轮巡间隔：" name="interval" style="width:200px; height:45px"">
    			<option value="5">5 秒</option>
    			<option value="10">10 秒</option>
    			<option value="15">15 秒</option>
    			<option value="20">20 秒</option>
    			<option value="30">30 秒</option>
    			<option value="60">60 秒</option>
    			<option value="120">120 秒</option>
    			<option value="240">240 秒</option>
			</select>
		</div>
		<div style="margin-bottom:5px">
			<input class="easyui-textbox" label="备注信息：" id="remark" name="remark" labelPosition="top" data-options="prompt:'请输入备注信息...',multiline:true" style="width:200px;height:60px" />
		</div>
		</form>
	</div>
</div>

<div id="dlg_preset" class="easyui-dialog" title="预置位" style="display:none;width:300px;height:400px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:[{
				text:'保存',
				handler:function(){
					save_preset_cfg(); 
				}
			},{
				text:'取消',
				handler:function(){$('#dlg_preset').dialog('close')}
			}]">
	
		
	   <div class="easyui-layout"  data-options="fit:true">
		   	<table id="preset_tb"></table>
       </div>
	
</div>


<script>

var _sync_url='';
var _tour_id= -1;
var _camera_code ='';
var _tour_cfg_id = '';
$(document).ready(function() {
	init_tour_grid();
	init_camrea_grid();
	init_camera_tree();
	init_preset_grid();
});


function addCamera()
{
	var rows= $('#tour_tb').datagrid('getSelections');
	if(rows.length == 0){
		top.$.messager.alert('提示', '请在右侧选择一个轮巡预案!');
		return;
	}
	_tour_id = rows[0].id;
	$('#dlg').dialog('open');
}

function delCamera()
{
	var rows= $('#camera_tb').datagrid('getSelections');
	if(rows.length == 0){
		top.$.messager.alert('提示', '请选择一条记录!');
		return;
	}
	var ids_str = '';
	for(var i=0;i<rows.length;i++){
		if(i==0){
			ids_str += rows[i].id;
		}else{
			ids_str += ','+rows[i].id;
		}
	}
	top.$.messager.confirm('删除摄像机', '请确认 是否要删除摄像机信息    ?', function(flag) {
		if(flag) {
			$.ajax({
				type: 'POST',
				url: 'delTourCfg',
				dataType: 'json',
				data: { ids: ids_str },
				success: function(data, textStatus) {
					top.$.messager.alert('提示信息', '摄像机信息删除成功!');
					$('#camera_tb').datagrid('reload');
				},
				error: function() {
					top.$.messager.alert('提示', '服务器错误!');
				}
			});
		}
	});
}


var setting = {
		view: {
			selectedMulti: false
		},
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "pid",
				rootPId: 0
			}
		}
};

function fn_ztree_expand_collapse(id,type){
	var treeObj = $.fn.zTree.getZTreeObj(id);
	treeObj.expandAll(type);
}

function init_camera_tree()
{
	var tour_id = 0;
	$.ajax({
		url: 'camera_tree',
		type: 'post',
		data: {id: tour_id},
		dataType: "json", 
		success: function(data,textStatus){ data;
			$.fn.zTree.init($("#camera_tree"), setting, data);
			fn_ztree_expand_collapse("camera_tree",true);
		}
	});	
}


function saveCameraList()
{
	var treeObj = $.fn.zTree.getZTreeObj("camera_tree");
	var nodes = treeObj.getCheckedNodes(true);
	if(nodes.length < 1){
		return ;
	}
	var res_codes='';
	var  num = 0;
	for (index in nodes){
		if(nodes[index].check_Child_State== -1 && nodes[index].resCode !==''){
			if(num==0){
			   res_codes += nodes[index].resCode;
			}else{
				res_codes += ','+nodes[index].resCode;	
			}
			num++;
		}
	}
	if(_tour_id == -1){
		$.messager.alert('提示', '请在右侧选择一个轮巡预案!');
		return;
	}
	
	$.ajax({
		url: 'saveCameraList',
		type: 'post',
		data: {resCodes: res_codes,tour_id:_tour_id},
		dataType: "json", 
		success: function(data,textStatus){ 
			top.$.messager.alert('提示信息', data.msg);
			$('#camera_tb').datagrid('reload');
			$('#dlg').dialog('close');
		}
	});	
}

function save_preset_cfg()
{
	var rows= $('#preset_tb').datagrid('getSelections');
	if(rows.length == 0){
		top.$.messager.alert('提示', '请选择一条记录!');
		return;
	}
    var row_id = rows[0].id;
    var index = rows[0].index;
	$.ajax({
		type: "POST",
		url: 'updateIndexById',
		dataType: 'json',
		data: {tour_cfg_id:row_id,index:index},
		success: function(data, textStatus) {
			top.$.messager.alert('提示', data.msg);
			$('#camera_tb').datagrid('reload');
			$('#dlg_preset').dialog('close');
		},
		error: function() {
			top.$.messager.alert('错误', '服务器错误!');
		}
	});
}



function timeStampFormat(timestamp) {
	if(typeof(timestamp) == 'undefined') {
		return '';
	}
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var hour = d.getHours();
	var minute = d.getMinutes();
	var second = d.getSeconds();
	return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
}

function editPresetIndex(code,index,id)
{
	_camera_code = code;
	_tour_cfg_id = id;
	$('#preset_tb').datagrid('reload');
	$('#dlg_preset').dialog('open');
}

function init_preset_grid() {
	$('#preset_tb').datagrid({
		url: 'getPresetIndexByCode',
		fit: true,
		columns: [
			[
				{ field:'ck',checkbox:true, width: 20 }, 
				{ field:'index', title: '索引', width:50},
				{ field:'indexName', title: '名称', width:200}
			]
		],
		onBeforeLoad:function(param){
	 		param.queryMap = {
	 			code :_camera_code,
	 			tour_cfg_id: _tour_cfg_id
		    };
		},
		pagination: false,
		rownumbers: false,
		border:false,
		singleSelect:true
	});	
}



function init_camrea_grid() {
	$('#camera_tb').datagrid({
		url: 'getAllTourCdfById',
		fit: true,
		columns: [
			[
				{ field:'ck',checkbox:true, width: 20 }, 
				{ field:'name', title: '摄像机名称', width:150},
				{ field:'region', title: '区域名称', width:100},
				{ field:'index', title: '预置位索引', width:100},
				{ field:'indexName', title: '预置位名称', width:100},
				{ field:'gmt_modifield', title: '修改时间', width:120,formatter: function(value, row, index) { return timeStampFormat(value) } },
				{ field:'id', title: '配置预置位', width:100,formatter: function(value,row,index){
					return  '<a href="#" class="easyui-linkbutton" data-options="iconCls:\'icon-add\'" onClick="editPresetIndex(\''+row.code+'\',\''+row.index+'\',\''+row.id+'\')" >修改预置位</a>';
				}}
			]
		],
		onBeforeLoad:function(param){
	 		param.queryMap = {
	 			tour_id :_tour_id
		    };
		},
		toolbar: '#camera_toolbar',
		pagination: false,
		rownumbers: false,
		border:false,
		singleSelect:true
	});	
}

function init_tour_grid() {
	$('#tour_tb').datagrid({
		url: 'getAllTour',
		fit: true,
		columns: [
			[
				{ field:'ck',checkbox:true, width: 20 },
				{ field:'name', title: '轮巡预案名称', width:100},
				{ field:'interval', title: '轮巡间隔'}
			]
		],
		onBeforeLoad:function(param){
	 		param.queryMap = {
	 			
		    };
		},
		onClickRow:function(index,row){
			_tour_id = row.id;
			$('#camera_tb').datagrid('reload');
		},
		toolbar: '#tour_toolbar',
		pagination: false,
		rownumbers: false,
		border:false,
		singleSelect:true
	});	
}

function openDlg(flag)
{
	if(flag=='add'){
		_sync_url = 'addTour';
		$('#tour_form').form('clear');
	}else{
		_sync_url = 'updateTour';
	}
	$('#dlg_tour').dialog('open');
}

function saveTour()
{
	var isvalid = $('#tour_form').form('enableValidation').form('validate');
    if(!isvalid){
    	top.$.messager.alert('提示信息', '请按照正确的数据格式填写!');
    	return;
    }
	var dev_data = $('#tour_form').serializeArray();    
	$.ajax({
		type: 'POST',
		url: _sync_url,
		dataType: 'json',
		data: dev_data,
		success: function(data, textStatus) {
			top.$.messager.alert('提示信息', '用户信息保存成功!');
			$('#tour_tb').datagrid('reload');
			$('#dlg_tour').dialog('close');
		},
		error: function() {
			top.$.messager.alert('错误', '服务器错误!');
		}
	});
}


function editTour(){
	var rows= $('#tour_tb').datagrid('getSelections');
	if(rows.length == 0){
		top.$.messager.alert('提示', '请选择一条记录!');
		return;
	}
    var row_id = rows[0].id;
	$.ajax({
		type: "POST",
		url: 'getTourById',
		dataType: 'json',
		data: {id:row_id},
		success: function(data, textStatus) {
			var _arr=['name','remark'];
			for (i in _arr){
				var item = _arr[i];
				$('#'+item).textbox('setValue',data[item])
			}
			$('#id').val(data.id);
			$('#interval').combobox('setValue',data.interval);
			openDlg('edit');
		},
		error: function() {
			top.$.messager.alert('错误', '服务器错误!');
		}
	});
}

function delTour() {
	var rows= $('#tour_tb').datagrid('getSelections');
	if(rows.length == 0){
		top.$.messager.alert('提示', '请选择一条记录!');
		return;
	}
	var ids_str = '';
	for(var i=0;i<rows.length;i++){
		if(i==0){
			ids_str += rows[i].id;
		}else{
			ids_str += ','+rows[i].id;
		}
	}
	top.$.messager.confirm('删除轮巡预案', '请确认 是否要删除轮巡预案信息    ?', function(flag) {
		if(flag) {
			$.ajax({
				type: 'POST',
				url: 'delTour',
				dataType: 'json',
				data: { ids: ids_str },
				success: function(data, textStatus) {
					top.$.messager.alert('提示信息', '轮巡预案信息删除成功!');
					$('#tour_tb').datagrid('reload');
				},
				error: function() {
					top.$.messager.alert('提示', '服务器错误!');
				}
			});
		}
	});
}


</script>	
<%@ include file="exp/footer.jsp"%>
