<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<title>角色关联功能码</title>
<style>
.myBox03 { /* Do rounding (native in Opera, Firefox and Safari) */
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
}

.HR_lishichaxun_Bottom {
	width: 596px;
	background: #fff;
	padding-bottom: 20px;
	color: #025FA0;
	clear: both;
	overflow: hidden;
	font-size: 12px;
}

.QXsz_t {
	margin: 20px 0 0 55px;
	clear: both;
	_margin: 20px 0 0 30px;
}

.QXsz_t dd {
	margin: 10px 0 5px 20px;
	_ margin: 10px 0 5px 10px;
}

.QXsz_r {
	float: left;
	margin: 20px 0 0 0px;
}

.QXsz_r ul {
	margin-left: 35px;
	list-style-type: none;
	clear: both;
}

.QXsz_r li {
	width: 100px;
	float: left;
	margin: 10px 0 5px 10px;
}

.QXsz_r div {
	float: right;
	margin-top: 20px;
}

.QXsz_r .queding {
	width: 55px;
	height: 23px;
	background-image: url(images/HR_qd.gif);
	background-repeat: no-repeat;
	border: medium none;
	clear: both;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
$(function(){
	$(".funcUl").each(function(){
		   var id=this.id;
		   $(this).unbind().toggle(function(){
			   $("#funcUl"+id).css("display","block");
		   },function(){
			   $("#funcUl"+id).css("display","none");
		   });
	 });
	var funcIds='${funces.funcIds}';
	if(funcIds!="" && funcIds !=null){
		funcIds=funcIds.split(",");
		for(var i=0;i<funcIds.length;i++){
			$("#func"+funcIds[i]).attr("checked",true);
		}
	}
	$(".fcSysFunc1").each(function(){
		   var son=this.alt;
		   var id=this.value;
		   if(son > 0){
			   $(this).unbind("click").bind("click",function(){
				   if($(this).attr("checked")=='checked'){
					   $(".fcSysFunc2"+id).each(function(){
							$(this).attr("checked",true) ; 
							$(".fcSysFunc3"+this.value).each(function(){
								$(this).attr("checked",true) ; 
							});
					   }); 
				   }else{
					   $(".fcSysFunc2"+id).each(function(){
							$(this).attr("checked",false) ; 
							$(".fcSysFunc3"+this.value).each(function(){
								$(this).attr("checked",false) ; 
							});
					   }); 
				   }
				   
			   });
		   }
	 });
	$("input[name='fcSysFunc2']").each(function(){
		   var son=this.alt;
		   var id=this.value;
		   if(son > 0){
			   $(this).unbind("click").bind("click",function(){
				   var cl=$(this).attr("class");
				   cl=cl.substring(10);
				   if($(this).attr("checked")=='checked'){
					   $("#func"+cl).attr("checked",true); 
					   $(".fcSysFunc3"+id).each(function(){
							$(this).attr("checked",true) ; 
					   }); 
				   }else{
					   $(".fcSysFunc3"+id).each(function(){
							$(this).attr("checked",false) ; 
					   });
					   var select=0;
					   $(".fcSysFunc2"+cl).each(function(){
						   if($(this).attr("checked")=='checked'){
							   select++;
						   }
					   });
					   if(select<1){
						   $("#func"+cl).attr("checked",false); 
					   }
				   }
			   });
		   }else{
			 $(this).unbind().bind("click",function(){
				   var cl=$(this).attr("class");
				   cl=cl.substring(10);
				   if($(this).attr("checked")=='checked'){
				   		$("#func"+cl).attr("checked",true);
				   }
				   var select=0;
				   $(".fcSysFunc2"+cl).each(function(){
					   if($(this).attr("checked")=='checked'){
						   select++;
					   }
				   });
				   if(select<1){
					   $("#func"+cl).attr("checked",false); 
				   }
			   });  
		   }
	 });
	
	$("input[name='fcSysFunc3']").each(function(){
		var id=this.value;
		$(this).unbind("click").bind("click",function(){
			var cl=$(this).attr("class");
			cl=cl.substring(10);
			if($(this).attr("checked")=='checked'){
				$("#func"+cl).attr("checked",true);
				$("#func"+$("#func"+cl).attr("class").substring(10)).attr("checked",true); 
			 }else{
				var select=0;
				$(".fcSysFunc3"+cl).each(function(){
				if($(this).attr("checked")=='checked'){
						select++;
					}
				});
				if(select<1){
						$("#func"+cl).attr("checked",false); 
						var fa=0;
						$(".fcSysFunc2"+$("#func"+cl).attr("class").substring(10)).each(function(){
							if($(this).attr("checked")=='checked'){
								fa++;
							}
						});
						if(fa<1){
							$("#func"+$("#func"+cl).attr("class").substring(10)).attr("checked",false); 
						}
					}
				}
		 });
	 });
	
	
	
	
});
function changeRoleFunc(id){
	var selectedfunc=[];
	$("input[name='fcSysFunc1']:checked").each(function(){
		selectedfunc.push($(this).val());
	}); 
	$("input[name='fcSysFunc2']:checked").each(function(){
		selectedfunc.push($(this).val());
	}); 
	$("input[name='fcSysFunc3']:checked").each(function(){
		selectedfunc.push($(this).val());
	}); 
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/changeRoleFunc',
		dataType:'json',
		data:"roleId="+id+"&funcIds="+selectedfunc.join(","),
		callBackFn:function(msg){
			if(msg=='SUCCESS'){
				alert("设置成功");
			}else{
				alert("操作失败");
			}
		}
	});
	
	
	
}
</script>

</head>

<body>
	<div class="HR_lishichaxun_Bottom myBox03">
		<div class="QXsz_r">
			<c:forEach items="${allFunces}" var="func">
				<c:if test="${fn:length(func.funcCode) == 13}">
					<dl class="QXsz_t">
						<dt>
							<input  class="fcSysFunc1" name="fcSysFunc1" id="func${func.funcId}" type="checkbox" value="${func.funcId}" alt="${func.son}"/> ${func.funcName}
						</dt> 
						
						 <c:forEach items="${allFunces}" var="func2">
							<c:if test="${fn:length(func2.funcCode) gt 13 && fn:length(func2.funcCode) le 16 && fn:substring(func2.funcCode,0,13)==func.funcCode}">
								<dd>
									<input class="fcSysFunc2${func.funcId}"  name="fcSysFunc2" id="func${func2.funcId}" type="checkbox" value="${func2.funcId}" alt="${func2.son}"/>
									<c:if test="${func2.son > 0}">
										<a href="#" class="funcUl" id="${func2.funcId}"> ${func2.funcName}</a>
									</c:if>
									<c:if test="${func2.son < 1}">
										<a class="funcUl" id="${func2.funcId}" style="text-decoration: none;"> ${func2.funcName}</a>
									</c:if>
								</dd>
								<ul id="funcUl${func2.funcId}"  style="display: none;">
								<c:forEach items="${allFunces}" var="func3">
									<c:if test="${fn:length(func3.funcCode) gt 16 && fn:length(func2.funcCode) le 19 && fn:substring(func3.funcCode,0,16)==func2.funcCode}">
											<li><input class="fcSysFunc3${func2.funcId}" name="fcSysFunc3" id="func${func3.funcId}" type="checkbox" value="${func3.funcId}" alt="${func3.son}"/> ${func3.funcName}</li>
									</c:if>
								</c:forEach>
								</ul>
							</c:if>
						</c:forEach> 
					</dl>
				</c:if>
			</c:forEach>
			
		<!-- 	<dl class="QXsz_t">
				<dt>
					<input type="checkbox" />角色二
				</dt>
				<dd>
					<input type="checkbox" /><a href="">蜘蛛精</a>
				</dd>
			</dl>
			<ul>
				<li><input type="checkbox" /> 功能码1</li>
				<li><input type="checkbox" /> 功能码2</li>
				<li><input type="checkbox" /> 功能码3</li>
				<li><input type="checkbox" /> 功能码4</li>
				<li><input type="checkbox" /> 功能码5</li>
				<li><input type="checkbox" /> 功能码6</li>
			</ul> -->
			<div>
				<input type="button" class="queding" onclick="changeRoleFunc(${funces.roleId});"/>
			</div>
		</div>

	</div>
</body>
</html>
