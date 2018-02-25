<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/tree/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="js/tree/jquery.ztree.excheck-3.1.js"></script>
<link rel="stylesheet" type="text/css" href="js/tree/css/zTreeStyle/zTreeStyle.css"/>
<link rel="stylesheet" type="text/css" href="js/tree/css/demo.css"/>
<script>
var setting = {
		check: {
			enable: true,
			nocheckInherit: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		async: {
			enable: true,
			url:"findUsers",
			dataFilter: filter
		}
	};
	function filter(treeId, parentNode, childNodes) {
		if (!childNodes) return null;
		for (var i=0, l=childNodes.length; i<l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}
	function transfer(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var sNodes = treeObj.getCheckedNodes(true);
		$("#userList option").remove();
		for(var i=0;i<sNodes.length;i++){
			if(sNodes[i].id > 10){
				$("#userList").append("<option value='"+sNodes[i].id+"'>"+sNodes[i].name+"</option>");
			}
		}
	}
	function removeUserList(){
		$("#userList option:selected").remove();
	}
	function confirmUser(){
		var users="";
		$("select:[id='userList'] option").each(function () {
			users += $(this).text()+';';
         });
		$("#contactUserName").val(users);
		$.alerts._hide('popup_container_tree_win','tree_div','tree_win');
	}
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting);
	});
</script>
<div id="tree_win">
	<input type="button" value="添  加" onclick="transfer()" />
		<input type="button" value="移  除" onclick="removeUserList()" />	
		<input type="button" value="确  定" onclick="confirmUser()" />	
	<div id="tree_div">
		<br/>
		
		<ul id="treeDemo" style="float:left;width:150px;height:300px;" class="ztree"></ul>
	<select multiple="multiple" id="userList" ondblclick="removeUserList()" style="height:300px;width:150px;">
	</select>
	<br/>
	</div>
</div>