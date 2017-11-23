<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 
 <%@ include file="exp/header.jsp"%>
			<table id="dg"></table>
		
			<div id="toolbar" style="display:none;">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add-t" plain="true" onclick="_dlg_open('add')">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit-t" plain="true" onclick="editRole()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove-t" plain="true" onclick="delRole()">删除</a>	
				<input  id="search" type="text" />
			</div>

		</div>
		
	<div id="dlg" class="easyui-dialog"  title="角色信息" style="display:none;width:600px;height:300px;" data-options="closed:true,iconCls:'ico i-edit',resizable:true,modal:true,buttons:[{
				text:'保存',
				handler:function(){
				   newRole();
				}
			},{
				text:'取消',
				handler:function(){$('#dlg').dialog('close')}
			}]">
   		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center',split:false" style="width:250px;padding:10px">

				<form id="role_form" class="easyui-form" method="post" data-options="novalidate:true">
					<div style="margin-bottom:5px">
						<input type="hidden" id="id" name="id" />
						<input class="easyui-textbox" label="角色名称：" id="role_name" name="role_name" labelPosition="left" data-options="prompt:'请输入角色名称...',required:true,validType:['maxLength[20]','specialCharacter']" style="width:500px;height:35px">
					</div>

					<div style="margin-bottom:5px">
						<input class="easyui-textbox" label="备注信息：" id="remark" name="remark" labelPosition="left" data-options="prompt:'请输入备注信息...',multiline:true,validType:['maxLength[200]','specialCharacter']" style="width:500px;height:80px;">
					</div>
				</form>

			</div>
		</div>	
	</div>
	
	<div id="id_div_set" class="easyui-dialog" style="display:none;" data-options="closed: true" title="角色控制权限分配">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',collapsible:false" style="width:300px;" title="角色菜单权限树">
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'south',border:false" style="height:31px;">
						<div class="datagrid-toolbar" style="border-width: 1px 0 0 0;">
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
						<ul id="id_ul_control" class="ztree"> </ul>
					</div>
				</div>
			</div>
			<div data-options="region:'center'" title="角色预览权限分配">
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'south',border:false" style="height:31px;">
						<div class="datagrid-toolbar" style="border-width: 1px 0 0 0;">
							<table cellspacing="0" cellpadding="0">
							<tbody>
							<tr>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ico i-down'" id="id_a_camera_expand">展开</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ico i-up'" id="id_a_camera_collapse">收起</a></td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
					<div data-options="region:'center',border:false">
						<ul id="id_ul_camera" class="ztree"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		


		<script type="text/javascript">
		var _sync_url = 'add';
		var _dg_url = 'getAllRole';
		var _role_name = '';
		var _fn_gridReLoad;
		$(document).ready(function() {
			$('#search').textbox({
			    buttonText:'查询',
			    buttonIcon:'ico i-search',
			    prompt:'角色名称',
			    width:200
			});
			
			$.messager.defaults = { ok: "是", cancel: "否" };
			
			init_grid();
			
			// 绑定菜单展开函数事件
			$('#id_a_control_expand').click(function(){
				fn_ztree_expand_collapse("id_ul_control",true);
			});
			// 绑定菜单收起函数事件
			$('#id_a_control_collapse').click(function(){
				fn_ztree_expand_collapse("id_ul_control",false);
			});
			// 绑定资源展开函数事件
			$('#id_a_camera_expand').click(function(){
				fn_ztree_expand_collapse("id_ul_camera",true);
			});
			// 绑定资源收起函数事件
			$('#id_a_camera_collapse').click(function(){
				fn_ztree_expand_collapse("id_ul_camera",false);
			});
		});
		
		
		
		function pad2(num, n) {
			if ((num + "").length >= n) return num;
			return pad2("0" + num, n);
		}
		
		 function timeStampFormat(timestamp) { 
			if(typeof(timestamp) == 'undefined'){
				return '';
			} 
			var d = new Date(timestamp);
			var year=d.getYear()+1900; 
			var month=d.getMonth()+1; 
			var date=d.getDate(); 
			var hour=d.getHours(); 
			var minute=d.getMinutes(); 
			var second=d.getSeconds(); 
			return year+"-"+pad2(month,2)+"-"+pad2(date,2)+" "+pad2(hour,2)+":"+pad2(minute,2)+":"+pad2(second,2); 
		} 
		
		 
		 function userStateFormat(state) { 
			 if(state==1){
				return '启用'; 
			 }else{
				return '禁用'; 
			 }
		 }
		 
		 _fn_gridReLoad = function(){
			 $('#dg').datagrid({
					method:'POST',
				    url:_dg_url,
				    dataType:'json',
				    fit: true,
				    onBeforeLoad: function(param){
						param.role_name = _role_name;
					},
				    columns:[[
						{field: 'ck',checkbox:true, width: 30 },
				        {field:'role_name',title:'角色名称',width:100},
				        {field:'id',title:'权限配置',width:200,
							formatter: function(value,row,index){
								return '<a href="javascript:void(0);" onclick="fn_dialog_set(\''+value+'\')">点击进入配置页面</a>';
							}
						},
				        {field:'gmt_create',title:'创建时间',align:'center',width:200,formatter:function(value,row,index){ return timeStampFormat(value)}},
				        {field:'gmt_modified',title:'修改时间',align:'center',width:200,formatter:function(value,row,index){ return timeStampFormat(value)}},
				        {field:'remark',title:'备注',width:300}
				    ]],
				   
				    toolbar: '#toolbar',
				    pagination: true,
				    rownumbers: true
				});
				
				var p = $('#dg').datagrid('getPager');
	            $(p).pagination({
	                pageSize: 20,  
	                pageList: [10, 20, 30,40,50],  
	                beforePageText: '第',  
	                afterPageText: '页    共 {pages} 页',
	                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
	            });
			};
		 
		function init_grid()
		{
			_fn_gridReLoad();
            
            $('a', $('#search').next('span')).click(function() {    
                _role_name = ($('#search').textbox('getText'));
                if(_role_name == ''){
                	$.messager.alert('提示','查询名称不能为空!');
                	return;
                }
                _dg_url = 'getRoleLikeRoleName';
                _fn_gridReLoad();
 			});
			
		}
	
		function _dlg_open(flag) {
			if(flag=='add'){
				_sync_url = 'newRole';
				$('#role_from').form('reset');
			}else{
				_sync_url = 'editRole';
			}
			$('#dlg').dialog('open');
		}
		
		function newRole()
		{
			var isValidate = $('#role_form').form('enableValidation').form('validate');
			if(isValidate){
				var role_data = $('#role_form').serializeArray();
				$.ajax({
					type: "POST",
					url: _sync_url,
					dataType:'json',
					data: role_data,
					success: function(data, textStatus) {
						if(data.error==-1){
							$.messager.alert('提示',data.msg);
							return;
						}
						$.messager.alert('提示', data.msg);
						$('#dlg').dialog('close');
						_dg_url = 'getAllRole';
						_fn_gridReLoad();
					},
					error: function() {
						$.messager.alert('错误','服务器错误!');
					}
				});
			}				
		}
			
			function editRole(){
				var rows= $('#dg').datagrid('getSelections');
				if(rows.length == 0 || rows.length > 1){
					$.messager.alert('提示','请选择要修改的记录！<br>且一次只能选择一条记录！');
					return;
				}
		        var row_id = rows[0].id;
		        
				$.ajax({
					type: "POST",
					url: 'getRoleById',
					dataType: 'json',
					data: {id:row_id},
					success: function(data, textStatus) {
						var _arr=['role_name','remark'];
						for (i in _arr){
							var item = _arr[i];
							$('#'+item).textbox('setValue',data[item])
						}
						$('#id').val(data.id);
						_dlg_open('edit');
					},
					error: function() {
						$.messager.alert('错误','服务器错误!');
					}
				});
			}
			
			
			function delRole(){
				var rows= $('#dg').datagrid('getSelections');
				if(rows.length == 0){
					$.messager.alert('提示', '请选择要删除的记录!');
					return;
				}				
				$.messager.confirm('删除角色', '是否要删除角色?', function(flag) {
					var _ids = [];
					for(var i=0; i<rows.length; i++){
						_ids.push(rows[i].id);
					}
					var _data = {};
					_data = _ids.join(',');	
					if(flag) {
						$.ajax({
							type: 'POST',
							url: 'delRole',
							dataType: 'json',
							data: { ids: _data },
							success: function(data, textStatus) {
								$.messager.alert('提示',data.msg);
								_dg_url = 'getAllRole';
								_fn_gridReLoad();
							},
							error: function() {
								$.messager.alert('提示', '服务器错误!');
							}
						});
					}
				});

				
			}
			
			function fn_ztree_expand_collapse(id,type){
				var treeObj = $.fn.zTree.getZTreeObj(id);
				treeObj.expandAll(type);
			}
			
			function fn_control_ztree_getChecked(){
				var treeObj = $.fn.zTree.getZTreeObj('id_ul_control');
				var nodes = treeObj.getCheckedNodes(true);
				var ss = [];
				for(var i=0;i<nodes.length;i++){
					if(nodes[i].level != 0){
						ss.push(nodes[i].id);
					}
				}
				return ss.join(',');
			}
			
			function fn_camera_ztree_getChecked(){
				var treeObj = $.fn.zTree.getZTreeObj('id_ul_camera');
				var nodes = treeObj.getCheckedNodes(true);
				var ss = [];
				for(var i=0;i<nodes.length;i++){
					if(nodes[i].resCode!=''){
						ss.push(nodes[i].resCode);
					}
				}
				return ss.join(',');
			}
			
			
			function fn_dialog_set(roleId){
				$('#id_div_set').dialog({
					// title: '角色权限设置',
					width: 800,
					height: 400,
					top: ($(window).height() - 400) * 0.5,
					left: ($(window).width() - 800) * 0.5,
					closed: true,
					modal: true,
					buttons: [{
							text:'保存',
							iconCls:'ico i-open',
							plain:true,
							handler:function(){
								$.ajax({
									url: 'save_permission',
									type: 'post',
									dataType:'json',
									data: {
										roleId: roleId,
										rolePermissionIds: fn_control_ztree_getChecked(),
										roleResourceorgIds: fn_camera_ztree_getChecked()
									},
									success: function(data,textStatus) {console.log(data.msg);
										$.messager.alert('提示',data.msg);
										$('#id_div_set').dialog('close');
									}
								});
							}
						},{
							text:'取消',
							iconCls:'ico i-closed',
							plain:true,
							handler:function(){
								$('#id_div_set').dialog('close');
							}
						}]
				});
				$('#id_div_set').dialog('open');
				
				// ---------- 控制权限树 ----------
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
				
				
				
				$.ajax({
					url: 'control_tree',
					type: 'post',
					data: {role_id: roleId},
					dataType: "json", 
					success: function(data,textStatus){ data;
						$.fn.zTree.init($("#id_ul_control"), setting, data);
						fn_ztree_expand_collapse("id_ul_control",true);
					}
				});
		
				// ---------- 预览权限树 ----------
				var setting_no = {
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
					},
					callback: {
						// onCheck: onCheck
					}
				};
				$.ajax({
					url: 'camera_tree',
					type: 'post',
					data: {role_id: roleId},
					dataType: "json", 
					success: function(data,textStatus){
						$.fn.zTree.init($("#id_ul_camera"), setting_no, data);
						fn_ztree_expand_collapse("id_ul_camera",true);
					}
				});
			}
			
			
		

		
		</script>
<!-- 
	</body>

</html>
 -->
 
 <%@ include file="exp/footer.jsp"%>