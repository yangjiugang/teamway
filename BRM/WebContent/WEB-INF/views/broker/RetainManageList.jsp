<%
/**********************************************************************
 * 招聘管理列表
 * 2011-3-22 邓祥 新建
 **********************************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
		
		$(document).ready(function(){
			var taskId = ${taskId};
			var userSex = "0:男;1:女;";
			//var interviewResult = "0:不通过;1:通过;2:备选"; 
			//var entryNotice = "0:未通知;1:已通知;";
			//var entryStatus = "0:已发offer，未入职;1:推迟入职;2:取消入职;3.已入职";
			$("#list").jqGrid({
				url:"retainManageList?taskId="+taskId,
				datatype: 'json',
				mtype: 'POST',
				colNames: ['id','taskId','员工编号','姓名', '性别','出生日期','对应岗位','工作年限','所在地','最高学历','毕业院校','专业','入库日期','交流记录','最近交流人','联系方式'],
				colModel: [{name:'userResume.userId',hidden:true,key:true},
				           {name:'taskId',hidden:true},
					   		{name:'userResume.userNum'},
					   		{name:'userResume.userName',align: 'center'},
					   		{name:'userResume.userSex',align: 'center',align:'center',formatter:'select',edittype:'select',editoptions:{value:userSex}},
							{name:'userResume.userBirthday'},
							{name:'userResume.presentPost',align: 'center'},
							{name:'userResume.workYears',align: 'center'},
							{name:'userResume.hkPlace'},
							{name:'userResume.highestEducationName'},
							{name:'userResume.graduateSchool'},
							{name:'userResume.profession',align: 'center'},
							{name:'userResume.createDate'},
							{name:'userResume.contactCnt',align: 'center'},
							{name:'userResume.lastUpdateUser',align: 'center'},
							{name:'userResume.userTelphone'}
							],
				
				jsonReader:{
					root: 'rows',
					repeatitems: false
				},
				pager: '#pageList',
				autowidth: true,
				hidegrid: true,
				height:'auto',
				multiselect: true,
				viewrecords: true,
				rowNum:pageSize[0],
				rowList:pageSize
			});
		});
		
		//加入红 黑 名单 
		function setToBlack(type){
			var rows=$("#list").jqGrid('getGridParam','selarrrow');
			if(rows==''){
				alert('没有选择记录！！！');
			}else{
				if (rows.length>10) {
					alert('一次最多只能操作10个经济人！！！请重新选择！！！');
				} else {
					var flag;
					if(type==1){
						flag=confirm("您确定要将选中的"+rows.length+"记录加入红名单位吗？");
					}else{
						flag=confirm("您确定要将选中的"+rows.length+"记录加入黑名单位吗？");
					}
					
					if(flag){
						$.fc.ajaxSubmit({
							url:'${pageContext.request.contextPath}/updateDimissionUserToBlack',
							dataType:'json',
							data:"userIds="+rows+"&redBlack="+type,
							callBackFn:function(msg){
								if(msg=='SUCCESS'){
									alert("操作成功");
									$("#list").trigger("reloadGrid"); 
								}else{
									alert("操作失败");
								}
							}
						});
					}
				}
			}
		}

	//本地
	function bendi(){
		parent.changeMenu('external_frameJsp?jsp=External_Left','external_frameJsp?jsp=Personnel&type=');
	}
	//在线
	function zaixian(){
		parent.showFrame('在线查看简历','intoCjol',1000,700);
		//parent.changeMenu('','intoCjol');
		//parent.location.href="<%=path%>/intoCjol";
	}
	
	
</script>
</head>
<body>
	<div class="right1">
      <form>
        <div class="R_top">
        	<ul class="s_font zp_font">
            	<li class="z_font">
            		期望到岗日期  从
            	 	<input  id = "startDate" name = "startDate" value="">
            	 	  到 
            	 	<input id = "startDate" name = "startDate" value="">
            	 </li>
                <li>
	                <select>
	                <option>部门</option>
	                </select>
                </li>
                <li>
	                <select>
	                <option>岗位</option>
	                </select>
                </li>
                <li>
	                <select style="width:90px;">
	                <option>入职状态</option>
	                </select>
                </li>
                <li>
	                <select style="width:90px;">
	                <option>面试结果</option>
	                </select>
                </li>
                <li><input type="text" value="请输入关键字"/></li>
                <li><input type="button" class="seach_but"/></li>
                
            </ul> 
      
        </div>
        <div class="r_but" >
            	<ul class="t_but12">
            		<!-- 本地 -->
                   <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_01">
                   		<li><input type="button" class="ZXppjl_but" onclick="bendi()"/></li>
                   </authz:authorize>
                   <!-- 在线 -->
                   <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_02">
                   		<li><input type="button" class="BDppjl_but" onclick="zaixian()"/></li>
                   </authz:authorize>
                   <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_03">
                    	<li><input type="button" value="面试通知" class="but1" onclick="" /></li>
                    </authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_04">
                    	<li><input type="button" value="面试记录" class="but1" onclick="" /></li>
                    </authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_06">
                		<li><input type="button" value="入职通知" class="but1" onclick="" /></li>
                	</authz:authorize>
                	<authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_07">     
                    	<li><input type="button" value="入职办理" class="but1" onclick=""/></li>
                    </authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_08">
                   		<li><input type="button" value="简历查看" class="but1" onclick=""/></li>
                   </authz:authorize>
                   <authz:authorize ifAllGranted="FUNC_AUTH_BRO_01_09">
	                    <li><input type="button" value="加入红名单"  onclick="setToBlack(1)" class="but1" /></li>
	                    <li><input type="button" value="加入黑名单"  onclick="setToBlack(2)" class="but1" /></li>
                    </authz:authorize>
                    <li ><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        </form> 
        
        <table id="list"></table>
        <div id="pageList"></div>
        
    </div>

</body>
</html>