<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="exp/header.jsp"%>

<div class="easyui-layout" data-options="fit:true">
	

	<div data-options="region:'center'">
		<table id="dg"> </table>
		<div id="toolbar" style="display:none;">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add-t" plain="true" onclick="_open_dlg('add')">新增</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit-t" plain="true" onclick="editDevice()">编辑</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove-t" plain="true" onclick="delDevice()">删除</a>

			<select class="easyui-combobox" name="search_type_id" id="search_type_id"  style="width:200px;"  >
					<option value="0">所有</option>
                	<option value="1">南网通讯控制器</option>
                	<option value="2">通用NVR</option>
                	<option value="3">动环主机</option>
            </select>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog" title="设备信息" style="display:none;width:280px;height:530px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:[
			{
				text:'保存', handler:function(){ newDevice(); }
			},{
				text:'取消', handler:function(){$('#dlg').dialog('close')}
			}]">
			<div style="margin-top:10px;margin-left:30px;">
			<form id="device_form" class="easyui-form"  method="post" >
					   <div style="margin-bottom:5px">
                			<select class="easyui-combobox" name="type_id" id="type_id" label="设备类型" labelPosition="top"  style="width:200px;height:45px" data-options="prompt:'请选择设备类型...',required:true" >
                				<option value="1">南网通讯控制器</option>
                				<option value="2">通用NVR</option>
                				<option value="3">动环主机</option>
                			</select>
						</div>
						<div style="margin-bottom:5px">
						    <input type="hidden" id="id" name="id" />
							<input class="easyui-textbox" label="设备名称：" id="name" name="name" labelPosition="top" data-options="prompt:'请输入账号...',required:true" style="width:200px;height:45px">
						</div>
						<div style="margin-bottom:5px">
							<input class="easyui-textbox" label="用户名：" id="username" name="username" labelPosition="top" data-options="prompt:'请输入设备用户名...',required:true" style="width:200px;height:45px">
						</div>
						<div style="margin-bottom:5px" id="password_div">
							<input class="easyui-textbox" label="密码：" id="password" name="password" labelPosition="top" data-options="prompt:'请输入设备密码...',required:true" style="width:200px;height:45px">
						</div>
						<div style="margin-bottom:5px">
							<input class="easyui-textbox" label="IP地址：" id="ip" name="ip" labelPosition="top" data-options="prompt:'请输入设备IP地址...',required:true,validType:'checkIp'" style="width:200px;height:45px">
						</div>
						<div style="margin-bottom:5px">
							<input class="easyui-textbox" label="端口号：" id="port" name="port" labelPosition="top" data-options="prompt:'请输入设备端口号...',required:true" style="width:200px;height:45px">
						</div>
						
						<div style="margin-bottom:5px">
							<input class="easyui-combobox" name="stream_id" id="stream_id" style="width:200px;" data-options="
                    			url:'../stream/getAllStream',
                    			method:'get',
                    			valueField:'id',
                    			textField:'name',
                    			panelHeight:'auto',
                    			label: '流媒体服务器：',
                    			labelPosition: 'top',
                    			prompt:'请选择流媒体服务器...',
                    			required:true,
                    			loadFilter:function(data){
                    			    return data.rows;
                    			}
                    		">
						</div>
						<div style="margin-bottom:5px">
							<input class="easyui-textbox" label="备注信息：" id="remark" name="remark" labelPosition="top" data-options="prompt:'请输入备注信息...',multiline:true" style="width:200px;height:80px;">
						</div>
			</form>	
			</div>			
		</div>
		
</div>

<script type="text/javascript">
			var _sync_url = 'add';
			$(document).ready(function() {
				init_grid(null);
				
				$('#search_type_id').combobox({
					onChange: function(new_val,old_val){
						init_grid(new_val);
					}
				});
			});

			function _open_dlg(flag)
			{
				if(flag=='add'){
					_sync_url = 'newServer';
					$('#device_form').form('clear');
				}else{
					_sync_url = 'editServer';
				}
				$('#dlg').dialog('open');
			}

			function newDevice()
			{
				var isvalid = $('#device_form').form('enableValidation').form('validate');
			    if(!isvalid){
			    	top.$.messager.alert('提示信息', '请按照正确的数据格式填写!');
			    	return;
			    }
				var dev_data = $('#device_form').serializeArray();    
				$.ajax({
					type: 'POST',
					url: _sync_url,
					dataType: 'json',
					data: dev_data,
					success: function(data, textStatus) {
						top.$.messager.alert('提示信息', '设备信息保存成功!');
						$('#dg').datagrid('reload');
						$('#dlg').dialog('close');
					},
					error: function() {
						top.$.messager.alert('错误', '服务器错误!');
					}
				});
			}
			
			function editDevice()
			{
				var rows= $('#dg').datagrid('getSelections');
				if(rows.length == 0){
					top.$.messager.alert('提示', '请选择一条记录!');
					return;
				}
		        var row_id = rows[0].id;
				$.ajax({
					type: "POST",
					url: 'getServerById',
					dataType: 'json',
					data: {id:row_id},
					success: function(data, textStatus) {
						var _arr=['name','username','password','ip','port','remark'];
						for (i in _arr){
							var item = _arr[i];
							$('#'+item).textbox('setValue',data[item])
						}
						$('#id').val(data.id);
						$('#type_id').combobox('setValue',data.type_id);
						$('#stream_id').combobox('setValue',data.stream_id);
						_open_dlg('edit');
					},
					error: function() {
						top.$.messager.alert('错误', '服务器错误!');
					}
				});
			}
			
			
			function delDevice() {
				
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

				top.$.messager.confirm('删除设备', '请确认 是否要删除设备信息    ?', function(flag) {
					if(flag) {
						$.ajax({
							type: 'POST',
							url: 'delServerById',
							dataType: 'json',
							data: { ids: ids_str },
							success: function(data, textStatus) {
								top.$.messager.alert('提示信息', '设备信息删除成功!');
								$('#dg').datagrid('reload');
							},
							error: function() {
								top.$.messager.alert('提示', '服务器错误!');
							}
						});
					}
				});

			}
			
			
			function getLocalTime(nS) {
				var now = new Date(parseInt(nS));
				var year = now.getYear() + 1900;
				var month = now.getMonth() + 1;
				var date = now.getDate();
				var hour = now.getHours();
				var minute = now.getMinutes();
				var second = now.getSeconds();
				return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
			}

			function init_grid(type_id) {
				$('#dg').datagrid({
					url: 'getAllServer',
					fit: true,
					columns: [
						[
							{ field: 'ck', checkbox: true },
							{ field: 'name', title: '名称', width: 150 },
							{ field: 'type_id', title: '设备类型', width: 150 ,
								formatter: function(value, row, index) {
									if(value==1){
									   return '南网通讯控制器';	
									}else if(value==2){
									   return '通用NVR';
									}else if(value==2){
									   return '动环主机';
									}
								}
							},
							{ field: 'ip', title: 'IP地址', width: 100 },
							{ field: 'port', title: '端口号', width: 100 },
							{ field: 'username', title: '用户名', width: 100 },
							{ field: 'password', title: '密码', width: 100 },
							{ field: 'stream_id', title: '流媒体服务器', width: 100,
								formatter: function(value, row, index) {
									var text = '';	
									var data=	$('#dg').datagrid('getData');
									for(var i=0;i < data.expA.length;i++){
										if(value== data.expA[i].id){
											text = data.expA[i].name;
											break;
										}
									}
									return text;
								}
							},
							{ field: 'state', title: '设备状态', width: 100 ,
								formatter: function(value, row, index) {
									if(value==1){
										return '<span style="color:#48ff59;">连接正常</span>';
									}else{
										return '<span style="color:#fcff27;">连接异常</span>';
									}
								}
							},
							{
								field: 'gmt_create',
								title: '创建时间',
								width: 120,
								formatter: function(value, row, index) {
									return getLocalTime(value);
								}
							},
							{
								field: 'gmt_modified',
								title: '修改时间',
								width: 120,
								formatter: function(value, row, index) {
									return getLocalTime(value);
								}
							},
							{ field: 'remark', title: '备注', width: 150 }
						]
					],
					onBeforeLoad:function(param){
				 		param.queryMap = {
							type_id: type_id
	    			    };
					},
					toolbar: '#toolbar',
					pagination: true,
					border:false,
					rownumbers: true
				});

				var p = $('#dg').datagrid('getPager');
				$(p).pagination({
					pageSize: 20,
					pageList: [10, 20, 30, 40, 50],
					beforePageText: '第',
					afterPageText: '页    共 {pages} 页',
					displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
				});

			}
		</script>


<%@ include file="exp/footer.jsp"%>
