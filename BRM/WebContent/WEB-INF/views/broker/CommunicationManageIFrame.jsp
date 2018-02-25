<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>沟通管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">

	$(document).ready(function(){
		$("#tab_List").jqGrid({
			url : "broker_CommunicationList",
			datatype : 'json',
			mtype : 'POST',
			colNames : ['id','员工编号','姓名','','性别','部门','岗位','入职日期','受访次数','最近受访时间','最近受访主谈','主谈次数','最近主谈时间','最近谈话对象'],
			colModel : [{name : 'employeeId',hidden : true,key : true},
			            {name : 'employeeNum',width : 125},
			            {name : 'userName',formatter: showLink},
			            {name : 'userName1',hidden : true,formatter:function(cellvalue,options,rowObject){return rowObject['userName']}},
			            {name : 'userSex'},
			            {name : 'organizationName'},
			            {name : 'postName'},
			            {name : 'entryDate',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'contactCnt'},
			            {name : 'lastContactTime'},
			            {name : 'lastContactEmployee'},
			            {name : 'mainContactCnt'},
			            {name : 'lastMainContactTime'},
			            {name : 'lastMainContactEmployee'}],
			jsonReader : {
				root : 'lstData',
				repeatitems : false
			},
			pager : '#pageList',
			height : 'auto',
			autowidth : true,
			hidegrid : true,
			multiselect : true,
			viewrecords : true,
			rowNum : pageSize[0],
			height:'auto',
			rowList : pageSize
		});
	});
	
	// 打开详细页面
	function queryDetail(idArray,nameArr){
		parent.showFrame('约谈记录历史查询','broker_queryDetail?id='+idArray+'&name='+nameArr,840,750);
	}
	
	// 按钮点击查看多条记录
	function queryMoreDetail(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		var strRow = rowId.toString();
		var idArray = new Array();
		idArray = strRow.split(",");
		var rowName="";
		var rowNames = "";
		for(var i = 0; i < idArray.length; i++){
			rowName = $("#tab_List").getRowData(idArray[i]);
			rowNames += rowName['userName1'] += ",";
			
		}
		if(rowId == ''){
			alert("请选择要查看的数据！");
			return false;
		}else{
			var nameArr = new Array();
			nameArr = rowNames.substring(0, rowNames.length-1).split(",");
			queryDetail(idArray,nameArr);
		}
	}
	
	function search(){
		$("#tab_List").trigger("reloadGrid");
	}
	
	// 点击单条记录查看
	function showLink(cellvalue,options,rowObject){
		return "<a href='#' onclick='queryDetail("+rowObject['employeeId']+","+"&quot;"+rowObject['userName']+"&quot;)'>"+rowObject['userName']+"</a>";
	}
	
	// 打开约谈信息录入页面
	function addCommPage(){
		parent.showFrame('约谈信息记录','broker_pageForWard?url=AddCommuncation',840,750);
	}
	
	// 发送约谈提醒
	function sendRemind(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		var strRow = rowId.toString();
		var idArray = new Array();
		idArray = strRow.split(",");
		var rowName="";
		var rowNames = "";
		for(var i = 0; i < idArray.length; i++){
			rowName = $("#tab_List").getRowData(idArray[i]);
			rowNames += rowName['userName1'] += ",";
			
		}
		if(rowId == ''){
			alert("您还没有选择给谁发送提醒！");
			return false;
		}else{
			var nameArr = new Array();
			nameArr = rowNames.substring(0, rowNames.length-1).split(",");
			parent.showFrame('约谈通知窗口 ','broker_sendCommRemind?idArray='+idArray+'&nameArr='+nameArr,670,260);
		}
	}
</script>
</head>
<body>
	<div class="right1">
		<div class="R_top">
        	<ul class="s_font zp_font">
                <li>
	                <select>
	                	<option>岗位</option>
	                </select>
                </li>
                <li>
	                <select>
	                	<option>部门</option>
	                </select>
                </li>
                <li class="time">
                	<input class="Wdate" name="postStartTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">
                </li>
                <li><select style="width:80px;"><option>受访次数</option></select></li>
                <li><select style="width:80px;"><option>主访次数</option></select></li>
                <li><input type="text" tip="请输入关键字" style="width:80px; _border:medium none;"/></li>
                <li><input type="button" class="seach_but"/></li>
            </ul> 
        </div>
        
		<div class="r_but" style="margin-top:10px;">
       		<ul class="t_but12">
	        	<li><input type="button" value="约谈提醒" class="but1" onclick="sendRemind();" /></li>
	            <li><input type="button" value="查看访谈记录" class="but1" onclick="queryMoreDetail();" /></li>
	            <li><input type="button" value="添加访谈记录" class="but1" onclick="addCommPage();" /></li>
	            <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
	            <li><input type="button" class="email_but"/></li>
	            <li><input type="button" class="fx_but"/></li>
       	 	</ul> 
        </div> 	
	    <!-- 查询数据列表  start -->
		<div id="gridContainer">
			<table id="tab_List"></table>
			<div id="pageList"></div>
		</div>
		<!-- 查询数据列表  end -->
    </div>
</body>
</html>