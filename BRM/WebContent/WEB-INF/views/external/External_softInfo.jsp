<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经纪人管理-办理入职</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function settab_zzjs(name,num,n){
	for(var i=1;i<=n;i++){
		  var menu=document.getElementById(name+i);
		  var con=document.getElementById(name+"_"+"zzjs"+i);
		  menu.className=i==num?"on_zzjs":"";
		    con.style.display=i==num?"block":"none";
		 }
}

function init_zzjsDiv(size){
	for(var i=1;i<=size;i++)
		$("#zzjs_zzjs"+i).hide();
}
</script>

<script type="text/javascript">

function clickEvent(uid,key){
	var id= "#mode"+uid+"_"+key;
	var obj = this;
	intiModelCss(uid);
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
}
</script>
</head>

<body>


<div class="HR_yidongweihu_Bottom myBox03">
<div class="tabY">
	<ul>
		<c:forEach items="${userList }" var="user" varStatus="status">
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
								<li><a onclick="clickEvent(${user.userId },1)" style="cursor: pointer;"><span class="aa"></span>基本资料</a></li>
								<li><a onclick="clickEvent(${user.userId },2)" style="cursor: pointer;"><span class="aa"></span>工作经历</a></li>
								<li><a onclick="clickEvent(${user.userId },3)" style="cursor: pointer;"><span class="aa"></span>教育经历</a></li>
								<li><a onclick="clickEvent(${user.userId },4)" style="cursor: pointer;"><span class="aa"></span>培训经历</a></li>
                                <li><a onclick="clickEvent(${user.userId },5)" style="cursor: pointer;"><span class="aa"></span>项目经验</a></li>
                                <li><a onclick="clickEvent(${user.userId },6)" style="cursor: pointer;"><span class="aa"></span>技能专长</a></li>
                                <li><a onclick="clickEvent(${user.userId },7)" style="cursor: pointer;"><span class="aa"></span>兴趣爱好</a></li>
							</ul>
            </li>
        </ul>
    </div>
<div class="H_right">
	<div class="HR_lishijixiaoR">
		<input type="button" class="HR_SearchR_DY29" />
		<input type="button" class="HR_SearchR_BC29" />
		<input type="button" class="HR_SearchR_FX29" />
	</div>
        
<div id="mode${user.userId }_1">
	<!-- 基本信息 -->
	<iframe src="external_getUserResumeInfo?type=basic&userId=${user.userId }&page=1&rows=5" height="600" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.userId }_2" style="display:none;">
	<!-- 工作经历 -->
	<iframe src="external_getUserResumeInfo?type=works&userId=${user.userId }&page=1&rows=5" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.userId }_3" style="display:none;">
	<!-- 教育经历 -->
	<iframe src="external_getUserResumeInfo?type=edus&userId=${user.userId }&page=1&rows=5" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.userId }_4" style="display:none;">
	<!-- 培训经历 -->
	<iframe src="external_getUserResumeInfo?type=edusByType&userId=${user.userId }&page=1&rows=5" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.userId }_5" style="display:none;">
	<!-- 项目经验 -->
	<iframe src="external_getUserResumeInfo?type=project&userId=${user.userId }&page=1&rows=5" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.userId }_6" style="display:none;">
	<!-- 技能专长 -->
	<iframe src="external_getUserResumeInfo?type=skills&userId=${user.userId }&page=1&rows=5" height="576" width="100%" frameborder="0" scrolling="no"></iframe>
</div>

<div id="mode${user.userId }_7" style="display:none;">
	<!-- 兴趣爱好 -->
		
</div>
</div>

</div>
</c:forEach>
</div>



<div class="HR_lishijixiaoContent">
</div>
</body>
</html>
