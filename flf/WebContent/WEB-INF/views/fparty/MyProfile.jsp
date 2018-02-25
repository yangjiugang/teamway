<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Date date=new Date();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的资料</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css"/>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
<script type="text/javascript" src="js/calendar.js"></script> 
<script type="text/javascript" src="js/dataValidate.js"></script>
<script type="text/javascript" src="js/idNumValidate.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".Out").each(function(){
		var obj = $(this);
		obj.find(".updown").toggle(function(){
			$(this).attr("src", "images/zhankai.jpg");
			obj.find(".ycLi").slideUp('slow');
		},function(){
			$(this).attr("src", "images/zhankai1.jpg");
			obj.find(".ycLi").slideDown('slow');
		});
	});
	$(".Out").each(function(){
		var obj = $(this);
		obj.find(".updown").toggle(function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content").slideUp('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content").slideDown('slow');
		});
	});
	
	
});

</script>
<script type="text/javascript">
	var settext1=function setText1(){
		$("#cxingming").val($("#xingming").html());
		 if($("#xingbie").html().replace(/(^\s*)|(\s*$)/g, '')=="男"){
			$("#male").attr("checked",true);
		}else{
			$("#female").attr("checked",true);
		}; 
		$("#birthday").val($("#shengri").html());
		$("#tijiao1").removeAttr("disabled");
	};
	
	var settext2=function setText2(){
		$("#cshoujihao").val($("#shoujihao").html());
		$("#ce-mail").val($("#email").html());
		$("#tijiao2").removeAttr("disabled");
	};
	
	var settext3=function setText3(){
		$("#czhengjian").val($("#zhengjian").html());
		 if($("#zhengjian").html().replace(/(^\s*)|(\s*$)/g, '')=="身份证"){
			$("#cshengfenzheng").attr("checked",true);
		}else{
			$("#chuzhao").attr("checked",true);
		};
		$("#czhengjianhaoma").val($("#zhengjianhaoma").html());
		$("#czhiye").val($("#zhiye").html().replace(/(^\s*)|(\s*$)/g, ''));
		$("#czhiwu").val($("#zhiwu").html().replace(/(^\s*)|(\s*$)/g, ''));
		$("#tijiao3").removeAttr("disabled");
	};
	
	function changeContext(id,fun){
		$("#"+id).css("display","block");
		fun();
	}
	function changeContextPart3(){
		$("#cusinfo3").css("display","block");
		$("#incomePut").htmlSelect({data:Constant.incomeData, selectId:1} );
		settext3();
	}
	function openbutton(buttonid,vali){
		if(vali){
			$("#"+buttonid).removeAttr("disabled");
		}else{
			$("#"+buttonid).attr("disabled","disabled");
		}
	}
	/*提交1*/
	function submitData1(){
		var cusId=$("#customerId").val();
		var name=$("#cxingming").val();
		var sex=$("input[name='sex']:checked").val();
		var birthday=$("#birthday").val();
		 $.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/updateCustomerInfoPartOne',
			dataType:'json',
			data:"customerId="+cusId+"&name="+name+"&fcSysVisitor.sex="+sex+"&birthday="+birthday,
			callBackFn:function(msg){		
                $("#xingming").html("").append(msg.name);
              	if(msg.fcSysVisitor.sex==0){
              		$("#xingbie").html("").append("男");
              	}else{
              		$("#xingbie").html("").append("女");
              	}
              	$("#shengri").html("").append(msg.birthday);
              	$("#cusinfo1").css("display","none");
              	$("#tijiao1").attr("disabled","disabled"); 
			}
		}); 
	}
	
	/*提交2*/
	function submitData2(){
		var cusId=$("#customerId").val();
	    var mail=$("#ce-mail").val();
		var phone=$("#cshoujihao").val();
		$.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/updateVisitorInfo',
			dataType:'json',
			data:"visitorId="+cusId+"&email="+mail+"&phone="+phone,
			callBackFn:function(msg){	
			    $("#shoujihao").html("").append(msg.fcSysVisitor.phone);
              	$("#email").html("").append(msg.fcSysVisitor.email);
              	$("#cusinfo2").css("display","none");
              	$("#tijiao2").attr("disabled","disabled");
			}
		}); 
	}
	
	/*提交3*/
	function submitData3(){
		var cusId=$("#customerId").val();
		var idNum=$("#czhengjianhaoma").val();
		var idType=$("input[name='idType']:checked").val();
		var business=$("#czhiwu").val();
		var jobDuty=$("#czhiye").val();
		var income=$("input[name='incomePut']").val();
		 $.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/updateCustomerInfoPartTwo',
			dataType:'json',
			data:"customerId="+cusId+"&idNum="+idNum+"&idType="+idType+"&business="+jobDuty+"&jobDuty="+business+"&income="+income,
			callBackFn:function(msg){		
              	if(msg.idType==0){
              		$("#zhengjian").html("").append("护照");
              	}else{
              		$("#zhengjian").html("").append("身份证");
              	}
              	$("#zhengjianhaoma").html("").append(msg.idNum);
              	$("#zhiye").html("").append(msg.business);
              	$("#zhiwu").html("").append(msg.jobDuty);
              	$("#shourufanwei").html("");
              	 $.each(Constant.incomeData, function(i, o){
                 	if(o.id == msg.income){
                 		$("#shourufanwei").html(o.text);
                 	};
                 	if(msg.income==1){
              	 		$("#shourufanwei").html("未填");
              	 	};
                 });
                 if($("#shourufanwei").html() == ""){
                 	$("#shourufanwei").html("未填");
                 }
              	$("#cusinfo3").css("display","none");
              	$("#tijiao3").attr("disabled","disabled");
			}
		}); 
	}
	
	/*第一部分验证  start*/
	var nameOk=true;
	var birthdayOk=true;
	var vali1 = true;
	function checkName(){
		$("#xingming_eror").html("");
		$("#cxingming").css("border-color", "");
		if(($("#cxingming").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#xingming_eror").html("姓名必须填写");
			$("#cxingming").css("border-color", "red");
			nameOk=false;
		}else if(($("#cxingming").val().replace(/(^\s*)|(\s*$)/g, '')).length>8){
			$("#xingming_eror").html("姓名长度不能大于八个字符");
			$("#cxingming").css("border-color", "red");
			nameOk=false;
		}else{
			nameOk=true;
		}
		vali1 = (nameOk && birthdayOk);
		openbutton("tijiao1",vali1);
	}
	function checkBirthday(){
		$("#shengri_eror").html("");
		$("#birthday").css("border-color", "");	
		if(CheckDate($("#birthday").val().replace(/(^\s*)|(\s*$)/g, ''))){
			$("#shengri_eror").html("请输入正确的日期格式");
			$("#birthday").css("border-color", "red");	
			birthdayOk=false;
		}else{
			birthdayOk=true;
		}
		vali1 = (nameOk && birthdayOk);
		openbutton("tijiao1",vali1);
	}
	
	/*第一部分验证  end*/
	
	/*第二部分验证  start*/
	var phoneOk=true;
	var emailOk=true;
	var vali2 = true;
	function checkPhone(){
		$("#shoujihao_eror").html("");
		$("#cshoujihao").css("border-color", "");
		if(($("#cshoujihao").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#shoujihao_eror").html("手机号必须填写");
			$("#cshoujihao").css("border-color", "red");
			phoneOk=false;
		}
		if(!/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/.test($("#cshoujihao").val())){
			$("#shoujihao_eror").html("请填写正确的手机号");
			$("#cshoujihao").css("border-color", "red");
			phoneOk=false;
		}else {
			phoneOk=true;
		}
		vali2 = (phoneOk && emailOk);
		openbutton("tijiao2",vali2);
	}
	function checkEmail(){
		$("#mail_eror").html("");
		$("#ce-mail").css("border-color", "");
		if(($("#ce-mail").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#mail_eror").html("邮箱必须填写");
			$("#ce-mail").css("border-color", "red");
			emailOk=false;
		}
		if(!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test($("#ce-mail").val())){
			$("#mail_eror").html("请填写正确的邮箱");
			$("#ce-mail").css("border-color", "red");
			emailOk=false;
		}else {
			emailOk=true;
		}
		vali2 = (phoneOk && emailOk);
		openbutton("tijiao2",vali2);
	}
	/*第二部分验证  end*/
	
	/*第三部分验证  start*/
	var idNumOK=true;
	var vali3 = true;
	function checkIdNum(){
		var idType=$("input[name='idType']:checked").val();
		var idNum=$("#czhengjianhaoma").val().replace(/(^\s*)|(\s*$)/g, '');
		var shengri=$("#shengri").html().replace(/(^\s*)|(\s*$)/g, '').replace(/-/g,"");
		$("#zhengjianhaoma_eror").html("");
		$("#czhengjianhaoma").css("border-color", "");
		if(idType==1){
			if(checkIdcard(idNum)){
				$("#zhengjianhaoma_eror").html("请填写正确的身份证号码");
				$("#czhengjianhaoma").css("border-color", "red");
				idNumOK=false;
			}else
			if(shengri!=idNum.substr(6,8)){
				$("#zhengjianhaoma_eror").html("出生日期与身份证不匹配，请修改生日");
				$("#czhengjianhaoma").css("border-color", "red");
				idNumOK=false;
			}
			else{
				idNumOK=true;
			}
		}else{
			if(!/(P\d{7})|(G\d{8})/.test(idNum)){
				$("#zhengjianhaoma_eror").html("请填写正确的护照号码");
				$("#czhengjianhaoma").css("border-color", "red");
				idNumOK=false;
			}else{
				idNumOK=true;
			}
		}
		vali3 = (idNumOK);
		openbutton("tijiao3",vali3);
	}
</script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>

<body>
<!--头部-->
<%@ include file="FHeader.jsp" %>
<!--End头部-->
<div class="middle">
<!--左边-->
 	<div class="FLHLeft">
    	<div class="FLHzl">
        	<span class="photo"><img src="images/touxiang.jpg" /></span>
            <ul class="nickname">
                <li>姓名：赵美丽</li>
                <li>生日：8.26</li>
                <li><img src="images/80.jpg" /></li>
            </ul>
            <span class="linkage">
            	<span style="margin:0;"><a href="">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a href="">[修改密码]</a></span>           
            </span>
        </div>
        <ul class="treeNav">
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><a href="index.html"><font>我的主页</font></a>
                </div>
                <div class="xian"></div>
            </li> 
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><a href="MyProfile.html"><font>我的资料</font></a>
                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><a href="loupan.html"><font>我的楼盘</font></a><span id="FLHli1"><img src="images/zhankai.jpg" /></span><span id="FLHli01" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>
               </div>
               	<ul id="FLHul1" class="ycLi" style="display:block;">
                	<li><a href="loupan.html">我关注的楼盘</a></li>
                    <li><a href="loupan.html">我收藏的楼盘</a></li>
                    <li><a href="loupan.html">我喊过价的楼盘</a></li>
                    <li><a href="loupan.html">我实地看过的楼盘</a></li>
                    <li><a href="loupan.html">蜂蜜推荐的楼盘</a></li>
                </ul>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><a href="lvyougoufantuan.html"><font>我的旅游购房团</font></a><span id="FLHli2"><img src="images/zhankai.jpg" /></span><span id="FLHli02" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>
               </div>
               	<ul id="FLHul2" class="ycLi">
                	<li><a href="lvyougoufantuan.html">我关注的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">我收藏的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">我参加过的旅游购房团</a></li>
                    <li><a href="lvyougoufantuan.html">蜂蜜推荐的旅游购房团</a></li>
                </ul>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><a href="huodong.html"><font>我的活动</font></a><span id="FLHli3"><img src="images/zhankai.jpg" /></span><span id="FLHli03" class="FLHspan00"><img src="images/zhankai1.jpg" /></span>
               </div>
               	<ul id="FLHul3" class="ycLi">
                	<li><a href="huodong.html">我关注的活动</a></li>
                    <li><a href="huodong.html">我报名的活动</a></li>
                    <li><a href="huodong.html">我参加的活动</a></li>
                    <li><a href="huodong.html">蜂蜜推荐的活动</a></li>
                </ul>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><a href="jiaoyi.html"><font>我的交易</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/6.jpg" /><a href="wdfm/Y611WDFM.html"><font>我的蜂蜜</font></a><span><img src="images/+.jpg" /></span>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/7.jpg" /><a href="pinglun.html"><font>我的评论</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/8.jpg" /><a href="index.html"><font>我的消息</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	&nbsp;
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><a href="../funlifun/monopolyofsale.html"><font>房源搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><a href="../funlifun/monopolyofsale(L).html"><font>旅游购房搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><a href="#"><font>活动搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/12.jpg" /><a href="../funlifun/monopolyofsaleM2.html"><font>蜂蜜搜索</font></a>
               </div>
                <div class="xian"></div>
            </li>
        </ul>
    </div>
<!--End左边--> 
<!--右边-->
    <div class="FLHRight">
		<div class="Rightleft">
        	<div class="Out" id="Out">
            	<div class="ProfileTittle">我的基本资料<span><img id="zhankai1" src="images/zhankai(black).jpg" class="updown"/></span></div>
                <div class="Content">
                    <div style=" overflow:hidden">
                    <input type="hidden" id="customerId" value="${customerInfo.customerId }"/>
                    <ul class="Content1">
                        <li><font>我的账号：</font><span id="zhanghao">${customerInfo.fcSysVisitor.visitorName }</span></li>    
                        <li><font>我的姓名：</font><span id="xingming">${customerInfo.name }</span></li>
                        <li><font>性别：</font><span id="xingbie">
	                        <c:if test="${customerInfo.fcSysVisitor.sex==0 }">男</c:if>
	                        <c:if test="${customerInfo.fcSysVisitor.sex==1 }">女</c:if>
                        </span>
                        </li>
                        <li><font>出生日期：</font><span id="shengri"><fmt:formatDate value="${customerInfo.birthday}" pattern="yyyy-MM-dd" /></span></li>
                        <li></li>
                    </ul>
                    <span style="float:right; display:block; margin:20px 20px 0 0;"><img src="images/newphoto.jpg" /></span>
                    <div class="xgzl16" id="cusinfo1" style="display: none;">
						<div class="xgzl16Q">
						<div class="xgzl16QL">我的姓名：</div>
						<div class="xgzl16QR"><input id="cxingming" class="input16" type="text" onblur="checkName();" /><br /><span id="xingming_eror"></span></div></div>
						<div class="xgzl16Q">
						<div class="xgzl16QL">性别：</div>
						<div class="xgzl16QR">&nbsp;&nbsp;&nbsp;<input  type="radio" name="sex" id="male" value="0" class="radio16" />  男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																<input  type="radio" name="sex" id="female" value="1"  class="radio16"/>  女</div></div>
						<div class="xgzl16Q">
							<div class="xgzl16QL">出生日期：</div>
							<div class="xgzl16QR"> <!-- <input class="input16" type="text" /> -->
							
							  <input class="input16" name="" id="birthday" size="12" maxlength="10"
	onkeydown="if(event.keyCode==8)event.returnValue=false;" onblur="checkBirthday();"
							/><img height="20" src="images/rili.gif"
							width="20" align="middle"
							onclick="new Calendar(1900,2050).show(document.getElementById('birthday'));"> 
							<span id="shengri_eror"></span>
							</div>
						</div>
					</div>
                    
                    </div>
                    <div class="button16">
	                    <form><input type=button class="button" onclick="changeContext('cusinfo1',settext1);"/>
								<input id="tijiao1" type=button class="button1" onclick="submitData1();" disabled="disabled"/></form>
	           		</div>

                </div>
            </div>
            <div class="Out" id="Out" style="margin-top:60px;">
            	<div class="ProfileTittle">我的联系方式<span><img  src="images/zhankai(black).jpg" class="updown"/></span></div>
            	<div class="Content">
            	<ul >
            		<li><font>手机号：</font><span id="shoujihao">${customerInfo.fcSysVisitor.phone}</span></li>    
               		<li><font>E-mail：</font><span id="email">${customerInfo.fcSysVisitor.email}</span></li>
                </ul>
                
                
                <div class="xgzl16" id="cusinfo2" style="display: none;">
						<div class="xgzl16Q">
						<div class="xgzl16QL">手机号：</div>
						<div class="xgzl16QR"><input id="cshoujihao" class="input16" type="text" onblur="checkPhone();"/><br /><span id="shoujihao_eror"></span></div></div>
						<div class="xgzl16Q">
						<div class="xgzl16QL">E-mail：</div>
						<div class="xgzl16QR"><input id="ce-mail" class="input16" type="text" onblur="checkEmail();"/><br /><span id="mail_eror"></span></div></div>
				</div>
                <div class="button16">
	                 <form><input type=button class="button" onclick="changeContext('cusinfo2',settext2);"/>
				     		<input id="tijiao2" type=button class="button1" disabled="disabled" onclick="submitData2();"/></form>
	      		</div>
	      		</div>
                    
            </div>
            <div class="Out" id="Out"  style="margin-top:60px;">
            	<div class="ProfileTittle">我的其他信息<img  src="images/zhankai(black).jpg" class="updown"/></div>
            	<div class="Content">
            	<ul >
            		<li><font>证件：</font><span id="zhengjian">
	            		<c:if test="${customerInfo.idType==1}">身份证</c:if>
	            		<c:if test="${customerInfo.idType==0}">护照</c:if>
            		</span>
            		</li>    
               		<li><font>证件号码：</font><span id="zhengjianhaoma">${customerInfo.idNum}</span></li>
                    <li><font>职业：</font><span id="zhiye">
                    <c:if test="${customerInfo.business==null}">未填</c:if>
                    ${customerInfo.business}</span></li>
                    <li><font>职务：</font><span id="zhiwu">
                    <c:if test="${customerInfo.jobDuty==null}">未填</c:if>
                    ${customerInfo.jobDuty}</span></li>
                    <li><font>收入范围：</font><span id="shourufanwei" ></span></li>
                    <script>
                    var income = ${empty customerInfo.income ? 0 : customerInfo.income};
                    $.each(Constant.incomeData, function(i, o){
                    	if(o.id == income){
                    		$("#shourufanwei").html(o.text);
                    	};
                    	if(income==1){
                  	 		$("#shourufanwei").html("未填");
                  	 	};
                    });
                    if($("#shourufanwei").html() == "")
                    	$("#shourufanwei").html("未填");
                    </script>
                </ul>
                
                <div class="xgzl16" id="cusinfo3" style="display:none; ">
						<div class="xgzl16Q">
						<div class="xgzl16QL">证件：</div>
						<div class="xgzl16QR">&nbsp;&nbsp;&nbsp;
							<input type="radio" name="idType" id="cshengfenzheng" value="1" class="radio16" />身份证 &nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="idType" id="chuzhao" value="0"  class="radio16"/>  护照</div>
						</div>
						<div class="xgzl16Q">
						<div class="xgzl16QL">证件号码：</div>
						<div class="xgzl16QR"><input id="czhengjianhaoma" class="input16" type="text" onblur="checkIdNum();"/><br /><span id="zhengjianhaoma_eror"></span></div></div>
						<div class="xgzl16Q">
						<div class="xgzl16QL">职业：</div>
						<div class="xgzl16QR"><input id="czhiye" class="input16" type="text" /><br /></div></div>
						<div class="xgzl16Q">
						<div class="xgzl16QL">职务：</div>
						<div class="xgzl16QR"><input id="czhiwu" class="input16" type="text" /><br /></div></div>
						<!-- <div class="xgzl16Q">
						<div class="xgzl16QL">收入范围：</div>
						<div class="xgzl16QR"><input id="cshourufanwei" class="input16" type="text" /><br /></div></div> -->
						<div class="xgzl16Q">
						<div class="xgzl16QL">目前收入：</div>
						<div class="xgzl16QR"><input class="input29" id="incomePut" type="text" value="readonly" readonly="true"/><br /></div></div>
				</div>
                <div class="button16">
	                 <form><input type=button class="button" onclick="changeContextPart3();"/>
				     		<input id="tijiao3" type=button class="button1" disabled="disabled" onclick="submitData3();"/></form>
	      		</div>
                </div>
            </div>
        </div>
        <div class="Rightright">
          <%@ include file="Rnickname.jsp" %>
          <img src="images/wybm.jpg" border="0" usemap="#Map" />
          <map name="Map" id="Map">
            <area shape="rect" coords="43,42,244,66" href="../funlifun/lifang/index.html" />
            <area shape="rect" coords="61,68,249,95" href="../funlifun/line.html" />
            <area shape="rect" coords="16,98,227,123" href="#" />
          </map>
           <div class="rightTittle">
          	<font>蜂蜜推荐的楼盘</font><span class="aa"><img src="images/zhankai(black).jpg" /></span>
          </div> 
           <ul class="corridorConter" style="padding-top:10px;">
           		<li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
           </ul>
           <div class="rightTittle">
          	<font>您可能感兴趣的楼盘</font><span class="aa" style="width:110px;"><img src="images/zhankai(black).jpg" /></span>
          </div> 
           <ul class="corridorConter" style="padding-top:10px;">
           		<li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
                <li>
                	<a href="../funlifun/lifang/index-gonggao.html"><img src="images/kk.jpg" border="0" /></a>
                        <ul>
                               <li><a href="../funlifun/lifang/index-gonggao.html"><h3 style="color:#000;">绿城-Z字型天上人间</h3></a></li>
                                <li>3888元/m&sup2;</li>
                                <li>北京&nbsp;&ndash;&nbsp;三里屯</li>
                        </ul>
                     <div class="dian"></div>
                </li>
           </ul>
        </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>