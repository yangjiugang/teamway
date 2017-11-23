<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="exp/header.jsp"%>

<div class="easyui-layout"  data-options="fit:true">
	<div data-options="region:'west',split:true,title:'区域'" style="width:200px">
			<div class="easyui-layout" data-options="fit:true">
			
					<div data-options="region:'north',border:false" style="height:31px;">
					<div class="datagrid-toolbar" style="border-width: 0 0 1px 0; display:none;" id="tool_pannel">
							<table cellspacing="0" cellpadding="0" style="width:100%;text-align: center; " >
							<tbody>
							<tr>
							<td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add-t'" plain="true" onclick="dlg_open()">添加</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit-t'" plain="true" onclick="edit()">修改</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove-t'" plain="true" onclick="del()">删除</a></td>
							</tr>
							</tbody>
							</table>
					</div>

					</div>
			
					<div data-options="region:'south',border:false" style="height:31px;">
						<div class="datagrid-toolbar" style="border-width: 1px 0 0 0;display:none;" id="pannel_expand">
							<table cellspacing="0" cellpadding="0">
							<tbody>
							<tr>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ico i-down'" id="id_a_control_expand">展开</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ico i-up'" id="id_a_control_collapse">收起</a></td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
					<div data-options="region:'center',border:false">
							<ul id="regionTreeId" class="ztree" ></ul>
					</div>
	</div>
			
			
			
			
			
			
			
		
		
	
	</div>
	<div data-options="region:'center',title:'设备'">
			<table id="dg"> </table>
			<div id="toolbar" style="display:none;">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add-t" plain="true" onclick="regCamera()">注册</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove-t" plain="true" onclick="unregCamera()">取消注册</a>
			</div>
	</div>
	
	<div id="dlg" class="easyui-dialog"  title="监控区域信息" style="display:none;width:240px;height:360px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:[{
				text:'保存',
				handler:function(){
				   add();
				}
			},{
				text:'取消',
				handler:function(){$('#dlg').dialog('close')}
			}]">
			<div style="margin:10px;">
			<div style="margin-bottom:5px">
				 <input type="hidden" id="id" name="id" />
				 <input class="easyui-textbox" label="区域名称：" id="name" name="name" labelPosition="top" data-options="prompt:'请输入账号...',required:true" style="width:200px;height:45px"/>
            </div>
			<div style="margin-bottom:5px">
				<input class="easyui-textbox" label="备注信息：" id="remark" name="remark" labelPosition="top" data-options="prompt:'请输入备注信息...',multiline:true" style="width:200px;height:60px"/>
            </div>
            
            <div style="margin-bottom:5px;">
            	 <input class="easyui-combobox" id="region_icon" style="width:200px;" data-options="
                    showItemIcon: true,
                    data: [
                        {value:'region_1.png',text:'图标1',iconCls:'region_1'},
                        {value:'region_2.png',text:'图标2',iconCls:'region_2'},
                        {value:'region_3.png',text:'图标3',iconCls:'region_3'},
                        {value:'region_4.png',text:'图标4',iconCls:'region_4'}
                    ],
                    editable: false,
                    panelHeight: 'auto',
                    label: '区域图标:',
                    labelPosition: 'top'
                    ">
            
            </div>
            
            
			</div>
	</div>
	
	
	
		<div id="dlg_reg" class="easyui-dialog"  title="注册设备" style="display:none;width:300px;height:400px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:
			[{
				text:'保存', handler:function(){ reg_camera(); }
			},{
				text:'取消', handler:function(){$('#dlg_reg').dialog('close')}
			}]">
			
		   <ul id="camera_tree" class="ztree"></ul>
			
	
	   </div>
		
</div>



		<script type="text/javascript">
		
			var _sync_url = 'add';
			var _region_id = 0;
			function fn_ztree_expand_collapse(id,type){
				var treeObj = $.fn.zTree.getZTreeObj(id);
				treeObj.expandAll(type);
			}
			
			$(document).ready(function() {
				$.messager.defaults = { ok: "是", cancel: "否" };  
				$.fn.zTree.init($("#regionTreeId"), setting);
				$.fn.zTree.init($("#camera_tree"), reg_setting);
				// 绑定菜单展开函数事件
				$('#id_a_control_expand').click(function(){
					fn_ztree_expand_collapse("regionTreeId",true);
				});
				// 绑定菜单收起函数事件
				$('#id_a_control_collapse').click(function(){
					fn_ztree_expand_collapse("regionTreeId",false);
				});
				
				init_grid();
			});

			
			
			function regCamera()
			{
				var zTree = $.fn.zTree.getZTreeObj("regionTreeId");
				var nodes = zTree.getSelectedNodes();
				if(nodes.length == 0){
					$.messager.alert('提示','请选择一个区域节点!');
					return;
				}
				
				var camTree = $.fn.zTree.getZTreeObj("camera_tree");
				camTree.reAsyncChildNodes(null, "refresh");
				var node = nodes[0];
				_region_id = node.id;
				
				$('#dlg_reg').dialog('open');
			}
			
			function reg_camera()
			{
				var zTree = $.fn.zTree.getZTreeObj("camera_tree");
				var nodes = zTree.getCheckedNodes(true);
				var  res_codes = '';
				for(var i =0; i< nodes.length;i++){
					if(nodes[i].pid !==0 && nodes[i].pid !==1)
					{
						res_codes += nodes[i].resCode+',';
					}
				}
				res_codes = res_codes.substring(0,res_codes.length-1);

					$.ajax({
						type: "POST",
						url: 'reg_camera',
						dataType:'json',
						data: { region_id: _region_id ,codes:res_codes},
						success: function(data, textStatus) {
							$('#dg').datagrid('reload');
							$('#dlg_reg').dialog('close');
							$.messager.alert('提示','注册摄像机到区域成功!');
						},
						error: function() {
							$.messager.alert('提示','服务器错误!');
						}
					});	
			}
			
			function unregCamera()
			{
				var rows= $('#dg').datagrid('getSelections');
				if(rows.length == 0){
					top.$.messager.alert('提示', '请选择一条记录!');
					return;
				}
				var code_str = '';
				for(var i=0;i<rows.length;i++){
					if(i==0){
						code_str += rows[i].code;
					}else{
						code_str += ','+rows[i].code;
					}
				}

				top.$.messager.confirm('取消注册', '请确认 是否要取消注册设备到区域    ?', function(flag) {
					if(flag) {
						$.ajax({
							type: 'POST',
							url: 'unRegCamera',
							dataType: 'json',
							data: { codes: code_str },
							success: function(data, textStatus) {
								$('#dg').datagrid('reload');
								top.$.messager.alert('提示信息', '取消注册区域成功!');
							},
							error: function() {
								top.$.messager.alert('提示', '服务器错误!');
							}
						});
					}
				});

				
				
			}
			
			//Ztree 配置
			 function zTreeOnAsyncSuccess(event, treeId, treeNode, data) {
   				 
				for(var i=0; i < data.length ; i++ ){
					data[i].open = data[i].expand;
				}
			};
			
			var reg_setting = {
					data: {
						simpleData: {
							enable: true,
							idKey: "id",
							pIdKey: "pid",
							rootPId: 1
						}
					},
					async: {
						enable: true,
						dataType: "json",
						url: "reg_dev_tree"
					},
					check: {
						enable: true,
						nocheckInherit: true
					}
				};
			
			
			function zTreeOnDblClick(event, treeId, treeNode) {
				_region_id = treeNode.id;
				$('#dg').datagrid('reload');
			};
			
			var setting = {
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "pid",
						rootPId: 1
					}
				},
				async: {
					enable: true,
					dataType: "json",
					url: "region_tree"
				},
				callback: {
					onAsyncSuccess: zTreeOnAsyncSuccess,
					onClick: zTreeOnDblClick
				}
			};

			
			function dlg_open(){
				var zTree = $.fn.zTree.getZTreeObj("regionTreeId");
				var nodes = zTree.getSelectedNodes();
				var node = nodes[0];
				if(node) {
					$('#name').textbox('setValue','');
					$('#remark').textbox('setValue','');
					$('#dlg').dialog('open');
				}else {
					 $.messager.alert('提示','请选择一个区域!');
				}
				_sync_url = 'region_add';
			}
			
			function add() {
				var zTree = $.fn.zTree.getZTreeObj("regionTreeId");
				var nodes = zTree.getSelectedNodes();
				var node = nodes[0];
				if(node) {
					$.ajax({
						type: "POST",
						url: _sync_url,
						dataType:'json',
						data: { id: node.id, name: $('#name').val(), remark: $('#remark').val(),icon:$('#region_icon').combobox('getValue') },
						success: function(data, textStatus) {
							$('#dlg').dialog('close');
							zTree.reAsyncChildNodes(null, "refresh");
						},
						error: function() {
							$.messager.alert('提示','服务器错误!');
						}
					});
				}else{
					$.messager.alert('提示','请选择一个区域!');
				}
			};
			
			function del()
			{
				var zTree = $.fn.zTree.getZTreeObj("regionTreeId");
				var nodes = zTree.getSelectedNodes();
				var node = nodes[0];
				if(!node){
					$.messager.alert('提示','请选择一个区域!');
					return;
				}
				var root_node = zTree.getNodesByFilter(function (node) { return node.level == 0 }, true);
				if(root_node.id == node.id)
				{
					$.messager.alert('提示','根区域不能删除!');
					return;
				}
				$.messager.confirm('删除区域', '是否要删除区域 ['+node.name+'] ?', function(flag){
	                if (flag){
	                	$.ajax({
							type: 'POST',
							url: 'region_del_by_id',
							dataType:'json',
							data: { id: node.id },
							success: function(data, textStatus) {
								zTree.reAsyncChildNodes(null, "refresh");
							},
							error: function() {
								$.messager.alert('提示','服务器错误!');
							}
						});
	                }
	            });
			}
			
			function edit() {
				var zTree = $.fn.zTree.getZTreeObj("regionTreeId");
				var nodes = zTree.getSelectedNodes();
				var node = nodes[0];
				if(node) {
					$.ajax({
						type: "POST",
						url: "region_find_by_id",
						data: { id: node.id },
						dataType:'json',
						success: function(data, textStatus) {
							dlg_open();
							_sync_url = 'region_update';
							$('#name').textbox('setValue',data.name);
							$('#remark').textbox('setValue',data.remark);
							$('#region_icon').combobox('setValue',data.icon);
						},
						error: function() {
							$.messager.alert('提示','服务器错误!');
						}
					});
				}else{
					$.messager.alert('提示','请选择一个区域!');
				}
			};
			
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
			
			function init_grid() {
				$('#dg').datagrid({
					url: 'get_camera_by_region_id',
					fit: true,
					columns: [
						[
							{ field: 'ck',checkbox:true, width: 30 },
							{ field: 'name', title: '名称', width: 150 },
							{ field: 'ipc_channel', title: '通道号', width: 100 },
							{ field: 'type_id', title: '类型', width: 100 },
							{ field: 'code', title: '资源编码', width: 180 },
							{ field: 'gmt_create', title: '创建时间', align: 'center', width: 120, formatter: function(value, row, index) { return timeStampFormat(value) } },
							{ field: 'gmt_modified', title: '修改时间', align: 'center', width: 120, formatter: function(value, row, index) { return timeStampFormat(value) } },
							{ field: 'remark', title: '备注', width: 300 }
						]
					],
					onBeforeLoad:function(param){
				 		param.queryMap = {
				 			region_id:_region_id
	    			    };
					},
					toolbar: '#toolbar',
					pagination: true,
					rownumbers: true,
					singleSelect:false,
					pageSize:20
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
