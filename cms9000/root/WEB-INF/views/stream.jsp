<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="exp/header.jsp"%>

		<table id="dg"></table>

		<div id="toolbar" style="display:none;">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add-t" plain="true" onclick="_dlg_open('add')">新增</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit-t" plain="true" onclick="_dlg_open('update')">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove-t" plain="true" onclick="deleteStreamInfo()">删除</a>
				
		</div>




		<div id="dlg" class="easyui-dialog" title="流媒体服务器信息" style="display:none;width:280px;height:450px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:[{
				text:'保存', handler:function(){ addStreamInfo();}
			},{
				text:'取消', handler:function(){  $('#dlg').dialog('close'); }
			}]">
			<div style="margin:20px;">
			<form id="_form" class="easyui-form"  method="post" >
				<div style="margin-bottom:5px">
				    <input type="hidden" id="id" name="id" />
					<input class="easyui-textbox" label="名称：" id="name" name="name" labelPosition="top" data-options="prompt:'请输入服务器名称...',required:true" style="width:200px;height:45px">
				</div>
				<div style="margin-bottom:5px">
					<input class="easyui-textbox" label="IP：" id="ip" name="ip" labelPosition="top" data-options="prompt:'请输入IP地址...',required:true,validType:'checkIp'" style="width:200px;height:45px">
				</div>

				<div style="margin-bottom:5px" >
					<input class="easyui-textbox" label="port：" id="port" name="port" labelPosition="top" data-options="prompt:'请输入端口...',required:true" style="width:200px;height:45px">
				</div>

				<div style="margin-bottom:5px">
					<input class="easyui-textbox" label="用户名：" id="username" name="username" labelPosition="top" data-options="prompt:'请输入用户名...',required:true" style="width:200px;height:45px">
				</div>

				<div style="margin-bottom:5px">
					<input class="easyui-textbox" label="密码：" id="password" name="password" labelPosition="top" data-options="prompt:'请输入密码...',required:true" style="width:200px;height:45px">
				</div>

				<div style="margin-bottom:5px">
					<input class="easyui-textbox" label="备注信息：" id="remark" name="remark" labelPosition="top" data-options="prompt:'请输入备注信息...',multiline:true" style="width:200px;height:80px;">
				</div>
			</form>
			</div>
		</div>

		<script type="text/javascript">

			var _sync_url ='';
			$(document).ready(function() {				
				init_grid();
			});
			
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
		
			function  _dlg_open(flag){
				if(flag=='add'){
					_sync_url = 'addStreamInfo';
					$('#_form').form('clear');
				}else{
					_sync_url = 'updateStreamInfo';
					editStreamInfo();
				}
				$('#dlg').dialog('open');
			}
			
			
			function editStreamInfo()
			{
				var rows= $('#dg').datagrid('getSelections');
				if(rows.length == 0){
					top.$.messager.alert('提示', '请选择一条记录!');
					return;
				}
		        var row_id = rows[0].id;
				$.ajax({
					type: "POST",
					url: 'getStreamById',
					dataType: 'json',
					data: {id:row_id},
					success: function(data, textStatus) {
						var _arr=['name','ip','port','username','password','remark'];
						for (i in _arr){
							var item = _arr[i];
							$('#'+item).textbox('setValue',data[item])
						}
						$('#id').val(data.id);
					},
					error: function() {
						top.$.messager.alert('错误', '服务器错误!');
					}
				});
			}
			
			
			function addStreamInfo() {
				var isvalid = $('#user_form').form('enableValidation').form('validate');
			    if(!isvalid){
			    	top.$.messager.alert('提示信息', '请按照正确的数据格式填写!');
			    	return;
			    }
			    	
				var _data = $('#_form').serializeArray();    
				$.ajax({
					type: 'POST',
					url: _sync_url,
					dataType: 'json',
					data: _data,
					success: function(data, textStatus) {
						$('#dg').datagrid('reload');
						$('#dlg').dialog('close');
					},
					error: function() {
						top.$.messager.alert('错误', '服务器错误!');
					}
				});
			}
			
			
			
			function deleteStreamInfo() {
				
				var rows= $('#dg').datagrid('getSelections');
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

				top.$.messager.confirm('删除流媒体服务器', '请确认 是否要删除流媒体服务器信息    ?', function(flag) {
					if(flag) {
						$.ajax({
							type: 'POST',
							url: 'deleteStreamById',
							dataType: 'json',
							data: { ids: ids_str },
							success: function(data, textStatus) {
								top.$.messager.alert('提示信息', '用流媒体服务器信息删除成功!');
								$('#dg').datagrid('reload');
							},
							error: function() {
								top.$.messager.alert('提示', '服务器错误!');
							}
						});
					}
				});

			}
			
			
			
			function init_grid() {
				$('#dg').datagrid({
					url: 'getAllStream',
					fit: true,
					columns: [
						[
							{ field: 'ck',checkbox:true, width: 30 },
							{ field: 'name', title: '服务器名称', width: 150 },
							{ field: 'ip', title: '地址', width: 150 },
							{ field: 'port', title: '端口', width: 150 },
							{ field: 'username', title: '用户名', width: 150 },
							{ field: 'password', title: '密码', width: 150 },
							{ field: 'gmt_create', title: '创建时间', align: 'center', width: 120, formatter: function(value, row, index) { return timeStampFormat(value) } },
							{ field: 'gmt_modified', title: '修改时间', align: 'center', width: 120, formatter: function(value, row, index) { return timeStampFormat(value) } },
							{ field: 'remark', title: '备注', width: 300 }
						]
					],
					onBeforeLoad:function(param){
				 		param.queryMap = {
				 			region_id: ''
	    			    };
					},
					onSelect:function(index, row){

					},
					toolbar: '#toolbar',
					pagination: false,
					rownumbers: true,
					singleSelect:true
				});
			}	

		</script>





<%@ include file="exp/footer.jsp"%>
