<%
/**********************************************************************
 * 在线简历设置 
 * 2011-3-30 邓祥 新建
 **********************************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线简历设置 </title>
<%@ include file="../common.jsp" %>
<link rel="stylesheet" media="screen" href="css/diaochahuodong.css"/>
<script type="text/javascript">
		function settab_zzjs(name,num,n){
			 for(i=1;i<=n;i++){
			  var menu=document.getElementById(name+i);
			  var con=document.getElementById(name+"_"+"zzjs"+i);
			  menu.className=i==num?"on_zzjs":"";
			    con.style.display=i==num?"block":"none";
			 }
		}
		
		$(document).ready(function(){
			
			$("#list").jqGrid({
				url:"resumeConfigList",
				datatype: 'json',
				mtype: 'POST',
				colNames: ['id','','网站名称','发布职位数', '剩余职位数','下载简历数','剩余简历数','结束时间','使用状态','更换账号'],
				colModel: [{name:'accountId',hidden:true,key:true},
				           {name:'accountName',width:35,align: 'center',formatter:formatAccountName1},
					   		{name:'accountName',formatter:formatAccountName},
					   		{name:'publishJobs',align: 'center'},
					   		{name:'surplusJobs',align: 'center'},
							{name:'downResumes',align: 'center'},
							{name:'surplusResumes',align: 'center'},
							{name:'endDate',align: 'center'},
							{name:'accountStatus',align: 'center',editable:false,sortable:false,formatter:formatStatus},
							{name:'',align: 'center',editable:false,sortable:false,formatter:function(cellvalue, options, rowObject){return '<a href="javascript:instead('+rowObject['accountId']+')">更换</a>'}}
							],
				
				jsonReader:{
					root: 'rows',
					repeatitems: false
					},
				autowidth: true,
				hidegrid: true,
				height:'auto',
				multiselect: false,
				viewrecords: true
			});
		});
		
		function formatStatus(cellvalue, options, rowObject){
			
			var status = "";
			var accountStatus;
			if(cellvalue==0){
				status = "已开启";
				accountStatus=1;
			}
			if(cellvalue==1){
				status = "已暂停";
				accountStatus=0;
			}
			return '<a href="javascript:updateType('+rowObject['accountId']+','+accountStatus+')">'+status+'</a>'
				
		}
		
		function formatAccountName(cellvalue, options, rowObject){
			
			var accountName;
			if(cellvalue==1){
				accountName = "人才热线";
				$("#renc").attr("disabled","disabled");
			}
			if(cellvalue==2){
				accountName = "前程无忧";
				$("#qianc").attr("disabled","disabled");
			}
			if(cellvalue==3){
				accountName = "58同城";
				$("#tongc").attr("disabled","disabled");
			}
			if(cellvalue==4){
				accountName = "中华英才网";
				$("#zhongh").attr("disabled","disabled");
			}
			return accountName;
				
		}
		
		function formatAccountName1(cellvalue, options, rowObject){
			var accountName1;
			if(cellvalue==1){
				accountName1 = '<img src="images/cjol.gif" style="margin-bottom:-3px;" />';
			}
			if(cellvalue==2){
				accountName1 = '<img src="images/51job.gif" style="margin-bottom:-3px;" />';
			}
			if(cellvalue==3){
				accountName1 = '<img src="images/58.gif" style="margin-bottom:-3px;" /> ';
			}
			if(cellvalue==4){
				accountName1 = '<img src="images/chinahr.gif" style="margin-bottom:-3px;" />';
			}
			return accountName1;
				
		}
		
		
		//关联
		function add(type){
			window.location.href('intoAddResumeConfig?type='+type);
			
		}
		
		//更换
		function instead(accountId){
			window.location.href('cfgResumeAccountById?accountId='+accountId);
			
		}
		
		//修改使用状态
		function updateType(accountId,accountStatus){
			alert(accountId);
			window.location.href('closeCfgResumeAccount?accountId='+accountId+'&accountStatus='+accountStatus);
			
		}
		
</script>


</head>
<body>


<div class="HR_zhaopin_Bottom myBox03">
	<div class="tabZ">
		<ul>
			<li id="zzjs1" onClick ="settab_zzjs('zzjs',1,2)" class="on_zzjs">招聘网站管理</li>
		<!-- 	<li id="zzjs2" onClick ="settab_zzjs('zzjs',2,2)">邮箱</li> -->
		</ul>
	</div>

	<div class="listZ">
		<div id="zzjs_zzjs1">
			<ul class="guanlian">
				<li style=" padding-right:50px;">
				
				<input type="button" value="关联" id="qianc" onclick="add(2)"/>
				<img src="images/51job.gif" style="margin-bottom:-3px;" /> 前程无忧
				</li>
				<li>
				<input type="button" value="关联" id ="tongc" onclick="add(3)"/>
				<img src="images/58.gif" style="margin-bottom:-3px;" /> 58同城
				</li>
				<li style=" padding-right:50px;">
					<input type="button" value="关联" id="zhongh" onclick="add(4)"/>
					<img src="images/chinahr.gif" style="margin-bottom:-3px;" /> 中华英才网
				</li>
				<li><input type="button" value="关联" id="renc" onclick="add(1)"/>
				<img src="images/cjol.gif" style="margin-bottom:-3px;" /> 中国人才热线
				</li>
			</ul>
		
			<div class="guanlianWebC">
				<div class="guanlianWebTop">已关联的人才网站 <input type="button" value="刷新账号信息"/></div>
					<table id="list"></table>
				
			</div>
		</div>

		<div id="zzjs_zzjs2" style="display:none;">
			<div class="zhaopinE">
				<input type="button" value="设置默认邮箱"/>
				<input type="button" value="删除"/>
				<input type="button" value="新建"/>
				<input type="button" value="编辑"/>
			</div>
			<div class="guanlianWebC">
			
				<div class="HR_zhaopinList">
					<div class="HR_zhaopinList1" style="text-align:center;">全部</div>
					<div class="HR_zhaopinList2" style="text-align:center;">邮箱账号</div>
					<div class="HR_zhaopinList3" style="text-align:center;">发送邮件数</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>