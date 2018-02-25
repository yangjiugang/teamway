<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.HR_YDLSCXList1{ width:680px;}
.HR_YDLSCXList1 dl{ width:680px; height:25px; line-height:25px; border-bottom:1px solid #D7E0F0;}
.HR_YDLSCXList1 dl dd{ float:left; width:80px;}
.HR_YDLSCXList1 dl dt{ float:left; width:180px; text-align:center;}

.HR_YDLSCXList{ width:680px; color:#000;}
.HR_YDLSCXList dl{ width:680px; height:25px; line-height:25px; border-bottom:1px solid #D7E0F0;}
.HR_YDLSCXList dl dd{ float:left; width:80px;}
.HR_YDLSCXList dl dt{ float:left; width:180px; text-align:center;}
</style>
<link rel="stylesheet" media="screen" href="css/layout.css" />
<link rel="stylesheet" media="screen" href="css/index.css" />
<script type="text/javascript" src="js/openBox.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>

<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript" src="javascript/tabs/tabs.js"></script>
<link rel="stylesheet" type="text/css" href="javascript/tabs/tabs.css" />
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	//弹出维护异动div
	function findDetail() {
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		var strRow = rowId.toString();
		var idArray = new Array();
		idArray = strRow.split(",");
		var rowName="";
		var rowNames = "";
		for(var i = 0; i < idArray.length; i++){
			rowName = $("#tab_List").getRowData(idArray[i]);
			rowNames += rowName['employeeInfo.userName'] += ",";
		}
		if(rowId == ''){
			alert("请选择要查看的数据！");
			return false;
		}else{
			var nameArr = new Array();
			nameArr = rowNames.substring(0, rowNames.length-1).split(",");
			parent.showFrame('异动历史查询窗口','broker_postHisQuery?idArray='+idArray+'&nameArr='+nameArr,840,750);
		}
	}
	
	// 弹出添加异动div
	function addPost() {
		parent.showFrame('添加异动','broker_openDiv?url=AddPostPage',840,680);
	}

	// 查询列表数据
	$(document).ready(function(){
		var postChangeType = "${postChangeType}";
		$("#tab_List").jqGrid({
			url : "broker_postChangeList?postChangeType=" + postChangeType,
			datatype : 'json',
			mtype : 'POST',
			colNames : ['id','员工编号','姓名','性别','入职日期','出生日期','异动日期','异动类型','异动前部门','异动前岗位','异动后部门','异动后岗位','异动原因'],
			colModel : [{name : 'infoId',hidden : true,key : true},
			            {name : 'employeeInfo.employeeNum',width : 125},
			            {name : 'employeeInfo.userName'},
			            {name : 'employeeInfo.userSex'},
			            {name : 'employeeInfo.entryDate',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'employeeInfo.userBirthday',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'transactionDate',formatter : 'date',formatoptions : {newformat : 'Y-m-d'}},
			            {name : 'transactionType'}, 
			            {name : 'beforOrganizationName'},
			            {name : 'beforPostName'},
			            {name : 'employeeInfo.organizationName'},
			            {name : 'employeeInfo.postName'},
			            {name : 'transactionDesc'}],
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

	// 异动条件查询
	function queryCondition() {
		var postStartTime = $("input[name=postStartTime]").val();
		var postEndTime = $("input[name=postEndTime]").val();
		var keyWord = $("#keyWord").val();
		if ('请输入关键字' == keyWord) {
			keyWord = '';
		}
		if (postEndTime < postStartTime) {
			alert("开始时间不能大于结束时间！");
			return false;
		} else if ('' == postStartTime) {
			alert("开始时间不能为空！");
			return false;
		} else if ('' == postEndTime) {
			alert("结束时间不能为空！");
			return false;
		} else {
			$.extend($('#tab_List').getGridParam('postData'), $('#searchForm').getForm());
			$("#tab_List").trigger("reloadGrid");
		}
	}
	
	function reload(){
		$("#tab_List").trigger("reloadGrid");
	}
	
	// 删除异动
	function deletePost(){
		var rowId = $("#tab_List").jqGrid('getGridParam','selarrrow');
		if(rowId == ''){alert("请选择一条或多条数据！");return false;}
		if(confirm("确定要删除异动吗？")){
			$.ajax({
				url : "broker_deletePostChange",
				dataType : 'json',
				data : "infoId=" + rowId,
				success:function(data){
					if(data.flag > 0){
						reload();
					}else{
						alert("删除异动失败！");
					}
				}
			});
		}else{
			return false;
		}
	}
	
	$(document).ready(function(){
		var iFlag = "${iFlag}";
		if(iFlag == 1){
			alert("添加成功！");
		}else if(iFlag == 2){
			alert("添加失败！");
		}
		reload();
	});
	
	// 部门回调方法
	function setOrgSelectorVal(ids, names, nums){
		$("#org").val(names);
	}
	//岗位回调方法
	function setPostSelectorVal(ids, names, nums){
		$("#post").val(names);
	}
	
</script>
</head>

<body>
	<div class="right1">
		<form id="searchForm">
			<div class="R_top">
				<ul class="s_font zp_font">
					<li class="z_font">异动时间 从
						<input class="Wdate" name="postStartTime" type="text" style="width: 100px; _margin-top: -5px;" onClick="WdatePicker({readOnly:'true'})">到 
						<input class="Wdate" name="postEndTime" type="text" style="width: 100px" onClick="WdatePicker({readOnly:'true'})">
					</li>
					<li>部门：
						<input type="text" id="org" name="org" onclick="parent.popupOrgSelector()" />
					</li>
					<li>岗位：
						<input type="text" id="post" name="post" onclick="parent.popupPostSelector()" />
					</li>
					<li>查询条件：
						<input type="text" id="keyWord" name="keyWord" tip="请输入关键字" />
					</li>
					<li>
						<input type="button" class="seach_but" style="cursor: pointer;" onclick="queryCondition();" />
					</li>
				</ul>
			</div>
			<div class="r_but" style="margin-top:10px;">
				<ul class="t_but12">
					<li>
						<input type="button" class="addyd_but" onclick="addPost();" />
					</li>
					<li>
						<input type="button" value="取消" class="but1" onclick="deletePost();" />
					</li>
					<li>
						<input type="button" value="详情查看/维护" class="but1" onclick="findDetail();" />
					</li>
					<li style="margin-left: 20px;">
						<input type="button" class="dy_but" />
					</li>
					<li>
						<input type="button" class="email_but" onclick ="sendCommonEmail('tab_List','异动列表','typeId:0:未开始:1:进行中:2:已完成:3:终止:4:删除|testStatus:0:创建:1:发布:2:完成:3:终止:4:删除')"/>
					</li>
					<li>
						<input type="button" class="fx_but" />
					</li>
				</ul>
			</div>
		</form>
		<div class="font_ul">
			<p class="Number">
				共：<font id="totalCount"></font> 条
			</p>
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