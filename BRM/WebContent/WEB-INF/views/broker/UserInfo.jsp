<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经纪人管理-员工详细资料</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript" src="javascript/jquery.min.js"></script>

<script type="text/javascript">
function settab_zzjs(name,num,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
 }
}
</script>

<script type="text/javascript">
function clickEvent(uid,frameType,key){
	var id= "#mode"+uid+"_"+key;
	var frameId = "frame"+uid+"_"+key;
	var obj = this;
	intiModelCss(uid);
	var isOpen = "#"+uid+"_is_open_"+key;
	if($(isOpen).val()==0){
		document.getElementById(frameId).src="showUserInfo?type="+frameType+"&isStr="+uid+"&page=1&rows=5";
		$(isOpen).val("1");
	}
	$(id).css("display","block");
	$("#"+obj.id).css("color","#EA0611");
}

function intiModelCss(id){
	$("#mode"+id+"_1").css("display","none");
	$("#mode"+id+"_2").css("display","none");
	$("#mode"+id+"_3").css("display","none");
	$("#mode"+id+"_4").css("display","none");
	$("#mode"+id+"_5").css("display","none");
	$("#mode"+id+"_6").css("display","none");
	$("#mode"+id+"_7").css("display","none");
	$("#mode"+id+"_8").css("display","none");
	$("#mode"+id+"_9").css("display","none");
	$("#mode"+id+"_10").css("display","none");
	$("#mode"+id+"_11").css("display","none");
	$("#mode"+id+"_12").css("display","none");
	$("#mode"+id+"_13").css("display","none");
	$("#mode"+id+"_14").css("display","none");
	$("#mode"+id+"_15").css("display","none");
	$("#mode"+id+"_16").css("display","none");
	$("#mode"+id+"_17").css("display","none");
	$("#mode"+id+"_18").css("display","none");
	$("#mode"+id+"_19").css("display","none");
	$("#mode"+id+"_20").css("display","none");
	$("#mode"+id+"_21").css("display","none");
	$("#mode"+id+"_22").css("display","none");
}

function popupPersonSelector(params) { // 弹出人员选择器
	parent.popupPersonSelector(params);
}
$(document).ready(function(){
});

</script>

</head>

<body>



<div class="HR_yidongweihu_Bottom myBox03">
<div class="tabY">
	<ul>
		<c:forEach items="${userList}" var="user" varStatus="status">
			<c:if test="${status.first}">
				<li id="zzjs${status.count }" onClick ="settab_zzjs('zzjs',${status.count },${fn:length(userList)})" class="on_zzjs">${user.userName }</li>
			</c:if>
			<c:if test="${!status.first}">
				<li id="zzjs${status.count }" onClick ="settab_zzjs('zzjs',${status.count },${fn:length(userList)})">${user.userName }</li>
			</c:if>
		</c:forEach>
	</ul>
</div>

<c:forEach items="${userList }" var="user" varStatus="status">
<input type="hidden" name="user_${user.employeeId }_id" id="user_${user.employeeId }_id" value="${user.employeeId }" />
<c:if test="${status.first}">
	<div class="HR_lishijixiaoContent jixiaoContent" id="zzjs_zzjs${status.count}" style="display: block;">
</c:if>
<c:if test="${!status.first}">
	<div class="HR_lishijixiaoContent jixiaoContent" id="zzjs_zzjs${status.count}" style="display: none;">
</c:if>
	<div class="H_left">
   		<ul class="ul_tittle">
        	<li><img src="images/-.jpg"  class="up"/>简历/外部人才库<br />
							<ul class="ul_tittle">
								<li><a onclick="clickEvent(${user.employeeId },'basic',1)" style="cursor: pointer;"><span class="aa"></span>基本资料</a></li>
								<li><a onclick="clickEvent(${user.employeeId },'works',2)" style="cursor: pointer;"><span class="aa"></span>工作经历</a></li>
								<li><a onclick="clickEvent(${user.employeeId },'edus',3)" style="cursor: pointer;"><span class="aa"></span>教育经历</a></li>
								<li><a onclick="clickEvent(${user.employeeId },'edusByType',4)" style="cursor: pointer;"><span class="aa"></span>培训经历</a></li>
                                <li><a onclick="clickEvent(${user.employeeId },'project',5)" style="cursor: pointer;"><span class="aa"></span>项目经验</a></li>
                                <li><a onclick="clickEvent(${user.employeeId },'skills',6)" style="cursor: pointer;"><span class="aa"></span>技能专长</a></li>
                                <li><a onclick="clickEvent(${user.employeeId },'extend',7)" style="cursor: pointer;"><span class="aa"></span>兴趣爱好</a></li>
							</ul>
            </li>
            <li><a onclick="clickEvent(${user.employeeId },'family',8)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>家庭成员信息</a></li>
            <li><a onclick="clickEvent(${user.employeeId },'employeeInfo',9)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>入职信息</a></li>
            <li><a onclick="clickEvent(${user.employeeId },'contrack',24)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>合同信息</a></li>
            <li><img src="images/-.jpg"  class="up"/>岗位信息<br />
            <ul class="ul_tittle">
								<li><a onclick="clickEvent(${user.employeeId },'cfgPost',10)" style="cursor: pointer;"><span class="aa"></span>岗位</a></li>
								<li><a onclick="clickEvent(${user.employeeId },'jobGrade',11)" style="cursor: pointer;"><span class="aa"></span>职系</a></li>
								<li><a onclick="clickEvent(${user.employeeId },'jobLevel',12)" style="cursor: pointer;"><span class="aa"></span>职等职级</a></li>
								<li><a onclick="clickEvent(${user.employeeId },'salaryLevel',13)" style="cursor: pointer;"><span class="aa"></span>薪酬等级信息</a></li>
                                <li><a onclick="clickEvent(${user.employeeId },'security',14)" style="cursor: pointer;"><span class="aa"></span>社保信息</a></li>
                                <li><a onclick="clickEvent(${user.employeeId },'submit',23)" style="cursor: pointer;"><span class="aa"></span>所得税信息</a></li>
							</ul>
                       </li>
            <li><a onclick="clickEvent(${user.employeeId },'talkRecords',15)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>面试/访谈交流信息</a></li>
            <li><a onclick="clickEvent(${user.employeeId },'checkingIn',16)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>考勤信息</a></li>
            <li><a onclick="clickEvent(${user.employeeId },'trainingTask',17)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>培训信息</a></li>
            <li><a onclick="clickEvent(${user.employeeId },'appraisal',18)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>绩效信息</a></li>
            <li><a onclick="clickEvent(${user.employeeId },'punishment',19)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>奖惩信息</a></li>
            <li><a onclick="clickEvent(${user.employeeId },'basic',20)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>活动信息</a></li>
            <li style="display: none"><span class="aa"></span>思想动态信息</li>
            <li><a onclick="clickEvent(${user.employeeId },'basic',21)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>薪资收入信息</a></li>
            <li style="display: none"><span class="aa"></span>职业规划信息</li>
            <li><a onclick="clickEvent(${user.employeeId },'basic',22)" style="cursor: pointer; color:#426FB8;"><span class="aa"></span>人才梯队信息</a></li>
        </ul>
    </div>
	<div class="H_right">
    	<div class="HR_lishijixiaoR"><input type="button" value="入职手续办理表模板" class="but1" /><input type="button" class="HR_SearchR_DY29" /><input type="button" class="HR_SearchR_BC29" /><input type="button" class="HR_SearchR_FX29" /></div>
        
                
<div id="mode${user.employeeId }_1">
	<input type="hidden" id="${user.employeeId }_is_open_1" value="1"/>
	<!-- 基本信息 -->
	<iframe id="frame${user.employeeId }_1" src="showUserInfo?type=basic&isStr=${user.employeeId }&page=1&rows=5" height="600" width="100%" frameborder="0" scrolling="no"></iframe>
</div>
<div id="mode${user.employeeId }_2" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_2" value="0"/>
	<!-- 工作经历 -->
	<iframe id="frame${user.employeeId }_2" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_3" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_3" value="0"/>
	<!-- 教育经历 -->
	<iframe id="frame${user.employeeId }_3" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_4" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_4" value="0"/>
	<!-- 培训经历 -->
	<iframe id="frame${user.employeeId }_4" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_5" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_5" value="0"/>
	<!-- 项目经验 -->
	<iframe id="frame${user.employeeId }_5" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_6" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_6" value="0"/>
	<!-- 技能专长 -->
	<iframe id="frame${user.employeeId }_6" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_7" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_7" value="0"/>
	<!-- 兴趣爱好 -->
	<iframe  id="frame${user.employeeId }_7" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_8" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_8" value="0"/>
	<!-- 家庭成员信息 -->
	<iframe  id="frame${user.employeeId }_8" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_9" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_9" value="0"/>
	<!-- 入职信息 -->
	aaaa
	<iframe id="frame${user.employeeId }_9" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_10" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_10" value="0"/>
	<!-- 岗位 -->
	<iframe  id="frame${user.employeeId }_10" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_11" style="display:none;">
<input type="hidden" id="${user.employeeId }_is_open_11" value="0"/>
	<!-- 职系 -->
	<iframe  id="frame${user.employeeId }_11" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_12" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_12" value="0"/>
	<!-- 职等 -->
	<iframe  id="frame${user.employeeId }_12" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_13" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_13" value="0"/>
	<!-- 薪酬 -->
	<iframe  id="frame${user.employeeId }_13" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_14" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_14" value="0"/>
	<!-- 社保-->
	<iframe id="frame${user.employeeId }_14" src="" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_15" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_15" value="0"/>
	<!-- 面谈 -->
	<iframe  id="frame${user.employeeId }_15" src="" height="576" width="680" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_16" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_16" value="0"/>
	<!--考勤 -->
	<iframe id="frame${user.employeeId }_16" src="" height="576" width="680" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_17" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_17" value="0"/>
	<!--培训 -->
	<iframe id="frame${user.employeeId }_17" src="" height="576" width="680" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_18" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_18" value="0"/>
	<!--绩效 -->
	<iframe id="frame${user.employeeId }_18" src="" height="576" width="680" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_19" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_19" value="0"/>
	<!--奖惩 -->
	<iframe id="frame${user.employeeId }_19" src="" height="576" width="680" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_23" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_23" value="0"/>
	<!-- 所得税 -->
	<iframe id="frame${user.employeeId }_23" src="" height="576" width="680" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_24" style="display:none;">
	<input type="hidden" id="${user.employeeId }_is_open_24" value="0"/>
	<!-- 所得税 -->
	<iframe id="frame${user.employeeId }_24" src="" height="576" width="680" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.employeeId }_20" style="display:none;">

<div class="SOSO26">
时间  从 <select><option>2000.1.1</option></select> 到 <select><option>2001.12.3</option></select><select><option>负责人</option></select><input type="text" value="请输入关键字"><input type="button" class="seach_but"/>
        </div>
<div class="HR_ZZJL">
<div class="font_ul26">
        	<p class="Number26">共：<font>10</font> 条</p>
        	<ul class="f_ul26">
            	<li style="color:#056900; width:5%;">全部</li>
                <li style="width:15%;">调查活动编号</li>
                <li style="width:15%;">调查活动名称</li>
                <li>调查类型</li>
                <li>调查方式</li>
                <li>答题时长</li>
                <li style="width:15%;">活动说明</li>
            </ul>
        </div>
        
        <ul class="nul126">
                	<li>
                    	<ul class="f_ul">
                        
                        <li style="width:5%;"><input type="checkbox" /></li>
                <li style="width:15%;"><a href="">赵山河</a></li>
                <li style="width:15%;"><a href="">技术部</a></li>
                <li><a href="">技术部</a></li>
                <li><a href="">10</a></li>
                <li><a href="">20</a></li>
                <li style="width:15%;"><a href="">技术部</a></li>
                        </ul>
                    </li>
                    
                </ul>

</div>
</div>

<div id="mode${user.employeeId }_21" style="display:none;">

<div class="SOSO26">
时间  从 <select><option>2000.1.1</option></select> 到 <select><option>2001.12.3</option></select><select><option>负责人</option></select><input type="text" value="名称"><input type="button" class="seach_but"/>
        </div>
<div class="HR_ZZJL">
<div class="font_ul26">
        	<p class="Number26">共：<font>10</font> 条</p>
        	<ul class="f_ul26">
            	<li style="color:#056900; width:5%;">全部</li>
                <li>薪酬等级</li>
                <li>本月应发</li>
                <li>基本工资</li>
                <li>绩效工资</li>
                <li>提成</li>
                <li>午餐补贴</li>
                <li>高温补贴</li>
                <li style="width:25%;">应扣款项(社保、所得税、考勤)</li>
            </ul>
        </div>
        
        <ul class="nul126">
                	<li>
                    	<ul class="f_ul">
                        
                        <li style="width:5%;"><input type="checkbox" /></li>
                <li><a href="">赵山河</a></li>
                <li><a href="">技术部</a></li>
                <li><a href="">技术部</a></li>
                <li><a href="">10</a></li>
                <li><a href="">20</a></li>
                <li><a href="">10</a></li>
                <li><a href="">20</a></li>
                <li style="width:25%;"><a href="">技术部</a></li>
                        

                        </ul>
                    </li>
                    
                </ul>

</div>
</div>

<div id="mode${user.employeeId }_22" style="display:none;">
<div class="HR_ZZJL">
<p>
    <span>
        岗位编号：<input class="XXMCinput" />
    </span>
	岗位名称：<input class="XXMCinput" />
</p>
<p><span>隶属部门：<input class="XXMCinput" /></span>直接上级岗位：<input class="XXMCinput" style="width:158px;" /></p>
<p><span>职系：<input class="XXMCinput" style="width:206px;" /></span>职级：<input class="XXMCinput" style="width:206px;"/></p>
<p><span>最低薪酬等级：<input class="XXMCinput" style="width:158px;" /></span>最高薪酬等级：<input class="XXMCinput" style="width:158px;" /></p>
<p>定编数量：<input class="XXMCinput" /></p>
<p><span>编制日期：<input class="XXMCinput" /></span>编制人：<input class="XXMCinput" style="width:194px;" /></p>
<p><span>最后修改时间：<input class="XXMCinput" style="width:158px;" /></span>最后修改人：<input class="XXMCinput" style="width:170px;" /></p>
<p>是否为需要储备人才：<input class="XXMCinput" style="width:122px;" /></p>
</div></div>
    
    </div>
</div>
</c:forEach>
</div>


<div class="HR_lishijixiaoContent">
</div>

</body>
</html>
