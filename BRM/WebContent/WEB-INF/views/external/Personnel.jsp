<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" media="screen" href="css/external_layout.css"/>
<link rel="stylesheet" media="screen" href="css/external_index.css"/>

<script>
	function showHtml(title,src,w,h,cnt){
		var rowId = $("#list").jqGrid('getGridParam','selarrrow');
		if(rowId!="")
			if(cnt==1){
				if (rowId.length>1) {
					alert('只能选择一个活动！！！请重新选择！！！');
				}else{
					parent.showFrame(title,src+"&userId="+rowId,w,h);
				}
			}else{
				parent.showFrame(title,src+"&userId="+rowId,w,h);
			}
		else
			alert('请勾选经纪人进行操作！');
	}
	
	$(document).ready(function(){
		
		//获取当前时间
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth();
		var day = myDate.getDate();
		
		
		$("#startTime").val(year+"-"+month+"-"+day);
		if(month!=12)
			$("#endTime").val(year+"-"+(month+1)+"-"+day);
		else
			$("#endTime").val(year+"-"+month+"-"+day);
		
		
		
		$("#list").jqGrid({
			url:"getExternalList?type=${type}",
			datatype: 'json',
			mtype: 'POST',
			colNames: ['id','员工编号','姓名', '性别','出生日期','对应岗位','工作年限','所在地','最高学历','毕业院校','专业','入库日期','交流记录','最近交流人','联系方式'],
			colModel: [{name:'userId',hidden:true,key:true},
				   		{name:'userNum',width:180,align: 'center'},
				   		{name:'userName',align: 'center',width:180},
				   		{name:'userSex',align: 'center',formatter:formatSex,width:100},
						{name:'userBirthday',formatter:'date',width:180},
						{name:'presentPost',align: 'center',width:180},
						{name:'workYears',align: 'center',formatter:formatworkYears,width:250},
						{name:'areaId',align: 'center',width:180},
						{name:'highestEducation',formatter:formatEducation,align: 'center',width:180},
						{name:'graduateSchool',align: 'center',width:200},
						{name:'profession',align: 'center',width:180},
						{name:'createDate',formatter:'date',width:180,formatoptions:{srcformat:'Y-m-d H:i',newformat:'Y-m-d H:i'}},
						{name:'contactCnt',align: 'center',width:180},
						{name:'lastUpdateUser',align: 'center',width:180},
						{name:'userTelphone',align: 'center',width:230}
						],
			jsonReader:{
				root: 'resumes',
				repeatitems: false
			},
			pager: '#pageList',
			height:'auto',
			autowidth: true,
			hidegrid: true,
			multiselect: true,
			rowNum:pageSize[0],
			rowList:pageSize
		});
		
		
		function formatSex(cellvalue, options, rowObject){
			if(cellvalue=="")
				return "无";
			if(cellvalue==0)
				return "男";
			if(cellvalue==1)
				return "女";
		}
		
		function formatEducation(cellvalue, options, rowObject){
			if(cellvalue=="")
				return "无";
			if(cellvalue==0)
				return "高中";
			if(cellvalue==1)
				return "中专";
			if(cellvalue==2)
				return "大专";
			if(cellvalue==3)
				return "本科";
			if(cellvalue==4)
				return "硕士研究生";
			if(cellvalue==5)
				return "博士研究生";
			if(cellvalue==5)
				return "博士后";
			if(cellvalue>5)
				return "无";
		}
		function formatworkYears(cellvalue, options, rowObject){
			return cellvalue+"年";
		}
		
		function foirmatDate(cellvalue, options, rowObject){
			var ddd = cellvalue;
			return ddd.format('yy-MM-dd hh:mm:ss');
		}
		
	});
		
	function findData(){
		var type = $("#perType").val();
		var isSubmit=$("#isSubmit").val();
		var startTime=$("#startTime").val();
		var endTime=$("#endTime").val();
		var contactCnt=$("#contactCnt").val();
		var highestEducation=$("#highestEducation").val();
		var keyWord=$("#keyWord").val();
		
		
		$("#list").setGridParam({url:"getExternalList"});
		$.extend($("#list").getGridParam('postData'),	
				{
					"type" : type,
					"isSubmit":isSubmit,
					"startTime":startTime,
					"endTime":endTime,
					"contactCnt":contactCnt,
					"highestEducation":highestEducation,
					"keyWord":keyWord});
		$("#list").trigger("reloadGrid");
	}
	
	
	//验证日期
	function checkInput(id){
		var dateStr = $("#houseDate").val();
		//获取当前时间
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth()+1;
		var day = myDate.getDate();
		
		var dateArray = dateStr.split("-");
		if(dateArray[0]<year){
			return false;
		}
		if(year==dateArray[0] &&dateArray[1]< month){
			return false;
		}
		if(month==dateArray[1] && dateArray[2]<day){
			return false;
		}
	}
	
</script>
</head>

<body>
<div class="right1">
      <form id="searchForm" name="searchForm" method="post">
      <input type="hidden" name="isSubmit" id="isSubmit" value="1"/>
      <input type="hidden" name="perType" id="perType" value="${type }"/>
        <div class="R_top">
        	<ul class="s_font zp_font">
            	<li>交流日期  从 
            		<input class="Wdate" style="width:120px;" id="startTime" name="startTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
            			 到 
            		<input class="Wdate"  style="width:120px;" id="endTime" name="endTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
            	</li>
                <li>
                	<select style="width:80px;" id="contactCnt" name="contactCnt">
                		<option value="-1">交流次数</option>
                		<option value="1">1</option>
                		<option value="2">2</option>
                		<option value="3">3</option>
                		<option value="4">4</option>
                		<option value="5">5</option>
                		<option value="6">6</option>
                		<option value="7">7</option>
                		<option value="8">8</option>
                		<option value="9">9</option>
                		<option value="10">10</option>
                	</select>
                </li>
                <li> 
                	<select style="width:60px;" id="highestEducation" name="highestEducation">
                		<option value="-1">学历</option>
                		<option value="0">高中</option>
                		<option value="1">中专</option>
                		<option value="2">大专</option>
                		<option value="3">本科</option>
                		<option value="4">硕士研究生</option>
                		<option value="5">博士研究生</option>
                		<option value="6">博士后</option>
                	</select>
                </li>
                <li>
                	<input type="text" id="keyWord" name="keyWord" tip="请输入关键字"/>
                </li>
                <li>
                	<input type="button" class="seach_but" onclick="findData()"/>
                </li>
                <li><a href="" style="text-decoration:underline;">精准搜索</a></li>
            </ul> 
        </div>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                    <li><input type="button" class=" addxjl_but" /></li>
                    <li><input type="button" value="查看" class="but1" onclick="showHtml('查看','external_softInfo?jsp=External_softInfo',820,800,0)"/></li>
                    <li><input type="button" value="面试/交流记录" class="but1" onclick="showHtml('面试/交流记录','showInterview?jsp=InterviewCall',590,580,1)" /></li>
                    <li><input type="button" value="面试通知" class="but1" onclick="showHtml('面试通知','showInterviewCall?jsp=InterviewCall',670,350,1)"/></li>
                    <li><input type="button" value="入职通知" class="but1" onclick="showHtml('入职通知','showNewOffer?jsp=InterviewCall',670,350,1)" /></li>
                    <li><input type="button" value="匹配招聘任务" class="but1" onclick="showHtml('匹配招聘任务','showTaskDiv?jsp=InterviewCall',800,350,1)" /></li>
                    <li style="margin-left:20px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
        </form> 
        
        <div>
        	<table id="list" style="font-size: 12px;"></table>
        	<div id="pageList"></div>
        </div>
        
    </div>
</body>
</html>
