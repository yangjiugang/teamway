<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经纪人档案管理</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script>
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
		url:"getUserList",
		datatype: 'json',
		mtype: 'POST',
		colNames: ['employeeId','员工编号','姓名','部门','岗位','职系','职等','薪酬等级','性别','出生日期','学历','毕业院校','培训次数','受访次数','入职时间','联系方式'],
		colModel: [{name:'employeeId',hidden:true,key:true},
			   		{name:'employeeNum',width:200,align: 'center'},
			   		{name:'userName',align: 'center',width:180},
			   		{name:'organizationName',align: 'center',width:220},
					{name:'postName',width:220,align: 'center'},
					{name:'jobGradeName',align: 'center',width:100},
					{name:'jobLevelName',align: 'center',width:100},
					{name:'salaryLevelOrder',align: 'center',width:100},
					{name:'userSex',align: 'center',width:130},
					{name:'userBirthday',align: 'center',width:230},
					{name:'highestEducation',align: 'center',width:180},
					{name:'graduateSchool',width:180},
					{name:'trainingCnt',align: 'center',width:180},
					{name:'contactCnt',align: 'center',width:180},
					{name:'entryDate',align: 'center',width:230},
					{name:'telephone',align: 'center',width:230}
					],
		jsonReader:{
			root: 'infos',
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

function showHtml(title,src,w,h,cnt){
	var rowId = $("#list").jqGrid('getGridParam','selarrrow');
	if(rowId!="")
		if(cnt==1){
			if (rowId.length>1) {
				alert('只能选择一个活动！！！请重新选择！！！');
			}else{
				parent.showFrame(title,src+"?userId="+rowId,w,h);
			}
		}else{
			parent.showFrame(title,src+"?userId="+rowId,w,h);
		}
	else
		alert('请勾选经纪人进行操作！');
}
</script>
</head>

<body>
<div class="right1">
      <form>
      <input type="hidden" name="isSubmit" id="isSubmit" value="1"/>
        <div class="R_top">
        	<ul class="s_font zp_font">
           		<li>交流日期  从 
            		<input class="Wdate" style="width:120px;" id="startTime" name="startTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
            			 到 
            		<input class="Wdate"  style="width:120px;" id="endTime" name="endTime" value="${test.testEndTime}" onClick="WdatePicker({readOnly:'true'})" />
            	</li>
                <li><input type="text" id="keyWord" name="keyWord" value="请输入关键字"/></li>
                <li><input type="button" class="seach_but"/></li>
                <li><a href="" style="text-decoration:underline;">精准搜索</a></li>
                
            </ul> 
        </div>
        </form>
        <div class="r_but" >
            	<ul class="t_but12">
                    <!--<li><input type="button" class="HR_SearchR_CKXQ" onclick="javascript:location.href='YG_Administration_YGXXZL.html';return false;"/></li>-->
                     <li><input type="button"class="addrz_but" onclick="javascript:parent.location.href='YG_Administration_ZPGL.html';return false;"/></li>
              <li><input type="button" value="查看维护明细档案" class="but1" onclick="showHtml('查看维护明细档案','jumpUserInfo',820,800,0)"/></li>
                    <li><input type="button" value="加入人才梯队" class="but1" onclick="javascript:location.href='jiarurencaitidui.html';return false;" /></li>
                    <li><input type="button" value="薪酬发放记录" class="but1" onclick="javascript:location.href='xzffjl.html';return false;"/></li>
                    <li><input type="button" value="交流记录" class="but1" onclick="javascript:location.href='jiaoliujilu.html';return false;" /></li>
                    <li><input type="button" value="考 勤" class="but1" onclick="javascript:location.href='YQKQLSCX.html';return false;" /></li>
                    <li><input type="button" value="异 动" class="but1" onclick="javascript:location.href='yidongweihu.html';return false;" /></li>
                    <li><input type="button" value="奖 惩" class="but1" onclick="javascript:location.href='jiangcheng.html';return false;" /></li>
                    <li><input type="button" value="绩 效" class="but1" onclick="javascript:location.href='jxcx.html';return false;"/></li>
                    <li><input type="button" value="调 查" class="but1" onclick="javascript:location.href='Tianjiadiaocha.html';return false;" /></li>
                    <li><input type="button" value="培 训" class="but1" onclick="javascript:location.href='peixun.html';return false;" /></li>
                    <li><input type="button" value="慰 问" class="but1" onclick="javascript:location.href='fasongshengrizhufu.html';return false;"/></li>
                    
                    <li style="margin-left:10px;"><input type="button" class="dy_but" /></li>
                    <li><input type="button" class="email_but"/></li>
                    <li><input type="button" class="fx_but"/></li>
                    
            	 </ul> 
        	</div> 
         
        
       <div>
        	<table id="list" style="font-size: 12px;"></table>
        	<div id="pageList"></div>
        </div>
    </div>
</body>
</html>
