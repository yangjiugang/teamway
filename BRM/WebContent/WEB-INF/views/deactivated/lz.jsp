<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>

<script>
    var parentFactor="";  
	function showHtml(title,src,w,h){
		parent.showFrame(title,src,w,h);
	}
	function setToBlack(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		if(rows==''){
			alert('请选择要加入黑名单的经济人！！！');
		}else{
			if (rows.length>10) {
				alert('一次最多只能操作10个经济人！！！请重新选择！！！');
			} else {
				var flag=confirm("确定要将他们加入黑名单位吗？");
				var userIds="";
				for(var i=0;i<rows.length;i++){
					if(i==(rows.length-1)){
						userIds=userIds+($("#list").getRowData(rows[i]))["employeeInfo.userId"];
					}else{
						userIds=userIds+($("#list").getRowData(rows[i]))["employeeInfo.userId"]+",";
					}
				}
				if(flag){
					$.fc.ajaxSubmit({
						url:'${pageContext.request.contextPath}/updateDimissionUserToBlack',
						dataType:'json',
						data:"userIds="+userIds+"&redBlack=2",
						callBackFn:function(msg){
							if(msg=='SUCCESS'){
								alert("已加入黑名单");
								$("#list").trigger("reloadGrid"); 
							}else{
								alert("操作失败");
							}
						}
					});
				}else{
					
				}
			}
		}
	}
	 $(document).ready(function(){
		 getDimissionUser("getDimissionUserResumeInfoByPage");
	}); 
	 function clearText(){
		 var keyword=$("#keyWord").val();
		 if(keyword=="请输入关键字"){
			 $("#keyWord").val(""); 
		 }
	 }
	 function initText(){
		var keyword=$("#keyWord").val();
		if(keyword==""){
			$("#keyWord").val("请输入关键字");
		}
	 }
	 var hightestEducation="0:高中;1:中专;2:大专;3:本科;4:硕士研究生;5:博士研究生;6:博士后;";
	 function getDimissionUser(url){
		 $("#list").jqGrid({
				url:url,
				datatype: 'json',
				mtype: 'POST',
				colNames: ['id','userId','员工编号','姓名', '出生日期','离职部门','离职岗位','离职原因','入职时间','离职时间','所在地','学历','最近交流日期','最近交流人','联系方式'],
				colModel: [{name:'employeeInfo.employeeId',hidden:true,key:true},
				            {name:'employeeInfo.userId',hidden:true},
					   		{name:'employeeInfo.employeeNum',width:180},
					   		{name:'employeeInfo.userName'},
					   		{name:'employeeInfo.userBirthday',formatter:'date', formatoptions:{newformat:'Y-m-d'}},
							{name:'employeeInfo.organizationName'},
							{name:'employeeInfo.postName'},
							{name:'employeeInfo.turnoverCause'},
							{name:'employeeInfo.entryDate',formatter:'date', formatoptions:{newformat:'Y-m-d'}},
							{name:'employeeInfo.turnoverDate',formatter:'date', formatoptions:{newformat:'Y-m-d'}},
							{name:'employeeInfo.employeeInfoDetail.userAddress'},
							{name:'employeeInfo.highestEducation',formatter:'select',edittype:'select',editoptions:{value:hightestEducation}},
							{name:'userTrackRecord.startTime',formatter:'date',formatoptions:{newformat:'Y-m-d'},width:180},
							{name:'userTrackRecord.mainTalkEmployeeName'},
							{name:'employeeInfo.telephone'}],
				jsonReader:{
					root: 'dimissionEmp',
					repeatitems: false
				},
				pager: '#pageList',
				height:'auto'/* gridHeight()-$(".right1").height() */,
				autowidth: true,
				hidegrid: true,
				multiselect: true,
				rowNum:pageSize[0],
				rowList:pageSize
			});
	 }
	 function seachDimissionUser(){
		 var startDate=$dp.$('testStartTime').value;
		 var endDate=$dp.$('testEndTime').value;
		 var talkNum=$('#talkNum').find('option:selected').val();
		 var education=$('#education').find('option:selected').val();
		 var keyWord=$("#keyWord").val();
		 if(keyWord=="请输入关键字"){
			 keyWord="";
		 }
		 $('#list').setGridParam({url:"getDimissionUserResumeInfoWithFactorByPage"});
		 $.extend($('#list').getGridParam('postData'),  {"startDate":startDate,"endDate":endDate,"talkNum":talkNum,"education":education,"keyWord":keyWord,"parentFactor":parentFactor} ); 
		 $("#list").trigger("reloadGrid"); 
	 }
	/*  function showDetailInfo(){
		 var rows=$("#list").jqGrid('getGridParam','selarrrow');
			if(rows==''){
				alert('请选择要查看的经济人！！！');
			}else{
				if (rows.length>5) {
					alert('一次最多查看5个经济人！！请重新选择！！');
				} else {
					 showHtml('YG_Administration_YGXXZL?userId='+rows,900,950);
				}
			}
	 } */
	 function showBlackDimissionUser(){
		$('#list').setGridParam({url:"getBlackDimissionUserResumeInfo"});
		$("#list").trigger("reloadGrid"); 
	}
	 function sendHolidayRegards(){
		var rows=$("#list").jqGrid('getGridParam','selarrrow');
		var data=$("#list").getRowData(rows);
		if(rows==''){
			alert('您还没有选择要发送问候的经济人！');
		}else{
			if (rows.length>1) {
				alert('一次只能给一个经济人发送节日问候哦！');
			} else {
				showHtml("节日问候",'jieriwenhou?userId='+rows+"&userName="+data['employeeInfo.userName'],670,240);
			}
		} 
	 }
</script>

</head>

<body>
<div class="right1">
      <form>
        <div class="R_top" style="">
        	<ul class="s_font zp_font">
            	<li>离职日期  从<input id="testStartTime" class="Wdate" type="text" style="width:100px" name="testStartTime" onclick="WdatePicker({readOnly:'true',maxDate:'#F{$dp.$D(\'testEndTime\')||\'%y-%M-%d\'}'})" /> 
            				到 <input id="testEndTime" class="Wdate" type="text" style="width:100px" name="testEndTime" onclick="WdatePicker({readOnly:'true',minDate:'#F{$dp.$D(\'testStartTime\')}',maxDate:'%y-%M-%d'})" />
            	</li>
                <li><select id="talkNum" name="talkNum" style="width:80px;">
                		<option value="0">交流次数</option>
                		<option value="1">1次</option>
                		<option value="2">2次</option>
                		<option value="3">3次</option>
                		<option value="4">4次</option>
                		<option value="5">5次</option>
                		<option value="6">6次</option>
                		<option value="7">更多...</option>
                	</select>
                </li>
                <li><select id="education" style="width:60px;">
                		<option value="7">学历</option>
                		<option value="0">高中</option>
                		<option value="1">中专</option>
                		<option value="2">大专</option>
                		<option value="3">本科</option>
                		<option value="4">硕士研究生</option>
                		<option value="5">博士研究生</option>
                		<option value="6">博士后</option>
                	</select>
                </li>
                <li><input id="keyWord" type="text" value="请输入关键字" onclick="clearText();" onblur="initText()"/></li>
                <li ><input type="button" class="seach_but" style="cursor:pointer;" onclick="seachDimissionUser();"/></li>
                <!-- <li><a href="" style="text-decoration:underline;">精准搜索</a></li> -->
            </ul> 
        </div>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                     <!--<li><input type="button" value="添加" class="but1" onclick="javascript:location.href='Tianjiadiaochahuodong.html';return false;"/></li>-->
<!--              <li><input type="button" value="修改" class="but1" /></li>
-->               	<authz:authorize ifAllGranted="FUNC_AUTH_DEA_01"><li><input type="button" value="黑名单" class="but1" onclick="setToBlack();"/></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_DEA_02"><li><input type="button" value="查看详细档案" class="but1" onclick="showDetailInfo()"/></li></authz:authorize>
                    <!--<li><input type="button" value="查看联系方式" class="but1" /></li>-->
                    <!-- <li><input type="button" value="面试/交流记录" class="but1" onclick="showHtml('mianshijiaoliujilu',900,950)" /></li>
                    <li><input type="button" value="面试通知" class="but1"onclick="showHtml('Mianshitongzhi',900,950)" /></li>
                    <li><input type="button" value="入职通知" class="but1"onclick="showHtml('Ruzhitongzhi',900,950)"  /></li> -->
                    <!--<li><input type="button" value="恢复入职" class="but1" onclick="javascript:location.href='YG_Administration_BLRZ.html';return false;" /></li>-->
                    <authz:authorize ifAllGranted="FUNC_AUTH_DEA_05"><li><input type="button" value="节日问候" class="but1"onclick="sendHolidayRegards();" /></li></authz:authorize>
                    <authz:authorize ifAllGranted="FUNC_AUTH_DEA_06"><li><input type="button" value="生日关怀" class="but1"onclick="showHtml('shengriguanhuai',900,950)" /></li></authz:authorize>
                    
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but" onclick ="sendCommonEmail('list','停用经济人列表','employeeInfo.highestEducation:0:高中:1:中专:2:大专:3:本科:4:硕士研究生:5:博士研究生:6:博士后')"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        </form> 
        <div>
        	<table id="list" style="font-size: 12px;"></table>
        	<div id="pageList"></div>
        </div>
        
        <!-- <div class="font_ul">
        	<p class="Number">共：<font>10</font> 条</p>
        	<ul class="f_ul">
            	<li style="color:#056900;">全部</li>
               	<li>员工工号</li>
                <li>姓名</li>
                <li>出生日期</li>
                <li>离职部门</li>
                <li>离职岗位</li>
                <li>离职原因</li>
                <li>入职时间</li>
                <li>离职时间</li>
                <li>所在地</li>
                <li>学历</li>
                <li>新工作岗位</li>
                <li>离职后交流</li>
                <li style="width:8%">最近交流日期</li>
                <li>最近交流人</li>
                <li>联系方式</li>
            </ul>
        </div>
        <div class="n_ul">
        	<form>
            	<ul class="nul1">
                	<li>
                    	<ul class="f_ul">
                    	<li style="display: none;"><input type="text"  value="0001"/></li>
                        	<li><input type="checkbox" /></li>
                        	<li><a href="">T001</a></li>
                            <li><a href="">赵山河</a></li>
                            <li><a href="">技术部</a></li>
                            <li><a href="">数据库统计</a></li>
                            <li><a href="">技术系</a></li>
                            <li><a href="">高级程序员</a></li>
                            <li><a href="">5级</a></li>
                            <li><a href="">1983.3.21</a></li>
                            <li><a href="">本科 </a></li>
                            <li><a href="">湘雅医学院</a></li>
                            <li><a href="">5次</a></li>
                            <li><a href="">3次</a></li>
                            <li style="width:8%"><a href="">2006.3.12</a></li>
                             <li><a href="">赵山河</a></li>
                            <li><a href="">13712345678</a></li>
                        </ul>
                    </li>
                    <li>
                    	<ul class="f_ul">
                    	<li style="display: none;"><input type="text"  value="0001"/></li>
                        	<li><input type="checkbox" /></li>
                        	<li><a href="">T002</a></li>
                            <li><a href="">赵山河</a></li>
                            <li><a href="">技术部</a></li>
                            <li><a href="">数据库统计</a></li>
                            <li><a href="">技术系</a></li>
                            <li><a href="">高级程序员</a></li>
                            <li><a href="">5级</a></li>
                            <li><a href="">1983.3.21</a></li>
                            <li><a href="">本科 </a></li>
                            <li><a href="">湘雅医学院</a></li>
                            <li><a href="">5次</a></li>
                            <li><a href="">3次</a></li>
                            <li style="width:8%"><a href="">2006.3.12</a></li>
                             <li><a href="">赵山河</a></li>
                            <li><a href="">13712345678</a></li>
                        </ul>
                    </li>
                </ul>
            </form>
        </div> -->
    </div>
</body>
</html>