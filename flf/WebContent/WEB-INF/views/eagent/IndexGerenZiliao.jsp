<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易介宝个人主页</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/calendar.js"></script> 
<script type="text/javascript" src="js/common.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(".Out1").each(function(){
		var obj = $(this);
		obj.find(".updown1").toggle(function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content1").slideUp('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content1").slideDown('slow');
		});
	});
	
	$(".Out").each(function(){
		var obj = $(this);
		obj.find(".updown").toggle(function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content").slideDown('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content").slideUp('slow');
		});
	});
	$(".jbzlIpunt").each(function(){
		var obj = $(this);
		obj.find(".updown2").toggle(function(){
			$(this).attr("src", "images/zhankai(black).jpg");
			obj.find(".Content2").slideDown('slow');
		},function(){
			$(this).attr("src", "images/zhankai(black)1.jpg");
			obj.find(".Content2").slideUp('slow');
		});
	});
});

/**
 * 判断是不是数字
 */
function IsNum(e) 
{ 
      var k = window.event ? e.keyCode:e.which; 
     if (((k >= 48) && (k <= 57)) || k==8 || k==0) 
     { 
     }else 
   { 	

         if(window.event) 
          { 
               window.event.returnValue = false; 
        } 
        else 
         { 
               e.preventDefault();//for firefox 
       } 
   } 
} 

//身份证号码校验函数
function checkIdcard2(idcard){
var Errors=new Array(
"验证通过!",
"身份证号码位数不对!",
"身份证号码出生日期超出范围或含有非法字符!",
"身份证号码校验错误!",
"身份证地区非法!"
);
var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 

var idcard,Y,JYM;
var S,M;
var idcard_array = new Array();
idcard_array = idcard.split("");
//地区检验
if(area[parseInt(idcard.substr(0,2))]==null) 
{
//alert(Errors[4]);
$("#errCardId").html(Errors[4]);
$("#errCardId").show(400);
return false ; 
}
//身份号码位数及格式检验
switch(idcard.length){
case 15:
if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
} else {
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
}
if(ereg.test(idcard)) return true;
else
{
//alert(Errors[2]);
$("#errCardId").html("<font color='red'>"+Errors[2]+"</font>");
$("#errCardId").show(400);
return false; 
} 
break;
case 18:
//18位身份号码检测
//出生日期的合法性检查 
//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
ereg=/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
} else {
ereg=/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
}
if(ereg.test(idcard)){ //测试出生日期的合法性
//计算校验位
S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
+ parseInt(idcard_array[7]) * 1 
+ parseInt(idcard_array[8]) * 6
+ parseInt(idcard_array[9]) * 3 ;
Y = S % 11;
M = "F";
JYM = "10X98765432";
M = JYM.substr(Y,1);//判断校验位
if(M == idcard_array[17]) return true; //检测ID的校验位
else
{ 
//alert(Errors[3]);
$("#errCardId").html("<font color='red'>"+Errors[3]+"</font>");
$("#errCardId").show(400);
return false;
}
}
else 
{
//alert(Errors[2]);
$("#errCardId").html("<font color='red'>"+Errors[2]+"</font>");
$("#errCardId").show(400);
return false; 
}
break;
default:
//alert(Errors[1]);
$("#errCardId").html("<font color='red'>"+Errors[1]+"</font>");
$("#errCardId").show(400);
return false ; 
break;
}
}



/**
 * 基本资料修改按钮
 */
function ProfileButton1(){
	$("#basisInfo").slideToggle(400);	
}

/**
 * 证件及照片修改按钮
 */
function ProfileButton2(){
	$("#cardId").slideToggle(400);
}

/**
 * 联系方式修改按钮
 */
function ProfileButton3(){
	$("#ContactInformation").slideToggle(400);
}

/**
 * 教育修改按钮
 */
function ProfileButton4(){
	$("#Education").slideToggle(400);
}

/**
 * 培训经历修改按钮
 */
function ProfileButton5(){
	$("#Training").slideToggle(400);
}

/**
 * 工作经历修改按钮
 */
function ProfileButton6(){
	$("#Work").slideToggle(400);
}

/**
 * 兴趣爱好修改按钮
 */
function ProfileButton8(){
	$("#Hobbies").slideToggle(400);
}
/**
 * 基本资料提交按钮
 */
function submitButton1(){
	if($("#basisInfo").is(":hidden")){
		return;
	}
	var name=$("#name").val();
	var birthPlace = $("#birthPlace").val();
	var sex = $("input[name='sex']:checked").val();
	var nation = $("#nation").val();
	var maritalStatus = $("input[name='maritalStatus']:checked").val();
	var height = $("#height").val();
	var weight = $("#weight").val();
	var salary = $("#salary").val();
	var highestDegree = $("#highestDegree").val();
	var profession = $("#profession").val();
	var graduateSchool = $("#graduateSchool").val();
	var firstWorkDate = $("#firstWorkDate").val();
	var userDesc = $("#userDesc").val();
	var career = $("#career").val();
	if(name==""||name==null){
		$("#errName").html("<font color='red'>名字不能为空</font>");
		return;
	}else{
		$("#errName").hide();
	}
	if(salary==""||salary==null){
		$("#errSalary").html("<font color='red'>薪资不能为空</font>");
		return;
	}
	if(maritalStatus==""||maritalStatus==null){
		maritalStatus = 0;
	}
	 $.fc.ajaxSubmit({
		 url:'${pageContext.request.contextPath}/updateuserInfoDetailPartOne',
		 dataType:'json',
		 data:"name="+name+"&birthPlace="+birthPlace+"&sex="+sex+"&nation="+nation+"&maritalStatus="+maritalStatus+"&height="+height+"&weight="+weight+"&salary="+salary+"&highestDegree="+highestDegree+"&profession="+profession+"&graduateSchool="+graduateSchool+"&firstWorkDate="+firstWorkDate+"&userDesc="+userDesc+"&career="+career,
		 callBackFn:function(msg){
			 $("#spanName").html(name);
 			 $("#spanBirthPlace").html(birthPlace);
			 if(sex==0){
				 $("#spanSex").html("男");
			 }else{
				 $("#spanSex").html("女");
			 }
			 $("#spanNation").html(nation);
			switch(maritalStatus){
				case "0": $("#spanMaritalStatus").html("未婚");break;
				case "1": $("#spanMaritalStatus").html("已婚");break;
				case "2": $("#spanMaritalStatus").html("离异");break;
				case "3": $("#spanMaritalStatus").html("再婚");break;
			}
			$("#spanHeight").html(height);
			$("#spanWeight").html(weight);
			$("#spanSalary").html(salary);
			$("#spanHighestDegree").html(highestDegree);
			$("#spanProfession").html(profession);
			$("#spanGraduateSchool").html(graduateSchool);
			$("#spanFirstWorkDate").html(firstWorkDate);
			$("#spanUserDesc").html(userDesc);
			$("#spanCareer").html(career);
		 }
	 }); 
	 $("#basisInfo").hide(400);
}

/**
 * 证件及照片提交按钮
 */
function submitButton2(){
	if($("#cardId").is(":hidden")){
		return;
	}
	var IDcard = $("#IDcard").val();
	if(IDcard==null||IDcard==""){
		$("#errCardId").html("<font color='red'>身份证号码不能为空</font>");
		return;
	}else{
		$("#errCardId").hide();
	}
	if(!(checkIdcard2(IDcard))){
		return;
	}else{
		$("#errCardId").hide();
	}
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/updateuserInfoDetailPartTwo',
		dataType:'json',
		data:"iDcard="+IDcard,
		callBackFn:function(msg){
			$("#spanIDcard").html(IDcard);
		}
	}); 
	$("#cardId").hide(400);
	
}

/**
 * 联系方式提交按钮
 */
function submitButton3(){
	if($("#ContactInformation").is(":hidden")){
		return;
	}
	var telphone =$("#telphone").val();
	var cellphone = $("#cellphone").val();
	var qQ = $("#qQ").val();
	var mSN = $("#mSN").val();
	var email = $("#email").val();
	var blog = $("#blog").val();
	var weibo =$("#weibo").val();
	var emergencyPerson = $("#emergencyPerson").val();
	var emergencyPhone = $("#emergencyPhone").val();
	var userCity = $("#userCity").val();
	var homeAddress = $("#homeAddress").val();
	var registeredAddress = $("#registeredAddress").val();
	if(telphone==""||telphone==null){
		$("#errTelphone").html("<font color='red'>家庭电话不能为空</font>");
		$("#errTelphone").show();
		return;
	}else{
		$("#errTelphone").hide();
	}
	if(userCity==null||userCity==""){
		$("#errUserCity").html("<font color='red'>工作地不能为空</font>");
		$("#errUserCity").show();
		
	}
	if(cellphone==null||cellphone==""){
		$("#errCellphone").html("<font color='red'>手机不能为空</font>");
		$("#errCellphone").show();
		return;
	}else{
		$("#errCellphone").hide();
	}
	var reg =/^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
	var objExp=new RegExp(reg); 
	if(!(objExp.test(cellphone))){
		$("#errCellphone").html("<font color='red'>手机号码格式不正确</font>");
		$("#errCellphone").show();
		return;
	}else{
		$("#errCellphone").hide();
	}
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/updateUserInfoPartThree',
		dataType:'json',
		data:"telphone="+telphone+"&cellphone="+cellphone+"&qQ="+qQ+"&mSN="+mSN+"&email="+email+"&blog="+blog+"&weibo="+weibo+"&emergencyPerson="+emergencyPerson+"&emergencyPhone="+emergencyPhone+"&userCity="+userCity+"&homeAddress="+homeAddress+"&registeredAddress="+registeredAddress,
		callBackFn:function(msg){
 			$("#spanTelphone").html(telphone);
  			$("#spanCellphone").html(cellphone);
  			$("#spanQQ").html(qQ);
  			$("#spanMSN").html(mSN);
  			$("#spanEmail").html(email);
  			$("#spanBlog").html(blog);
  			$("#spanWeibo").html(weibo);
  			$("#spanEmergencyPerson").html(emergencyPerson);
  			$("#spanEmergencyPhone").html(emergencyPhone);
  			$("#spanUserCity").html(userCity);
  			$("#spanHomeAddress").html(homeAddress);
  			$("#spanRegisteredAddress").html(registeredAddress);
		}
	});
	$("#ContactInformation").hide(400);
}

/**
 * 教育提交按钮
 */
function submitButton4(){
	if($("#Education").is(":hidden")){
		return;
	}
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var school = $("#school").val();
	var profession = $("#profession").val();
	var degree = $("#degree").val();
	var graduate = $("#graduate").val();
	if(beginDate==null||beginDate==""){
		$("#erroWorkBeginTime").html("<font color='red'>时间不能为空</font>");
		$("#erroWorkBeginTime").show();
		return;
	}else{
		$("#erroWorkBeginTime").hide();
	}
	if(endDate ==null||endDate==""){
		$("#erroWhorEndTime").html("<font color='red'>时间不能为空</font>");	
		$("#erroWhorEndTime").show();
	}else{
		$("#erroWhorEndTime").hide();
	}
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/updateUserInfoPartFour',
		dataType:'json',
		data:"beginDate="+beginDate+"&endDate="+endDate+"&school="+school+"&profession="+profession+"&degree="+degree+"&graduate="+graduate,
		callBackFn:function(msg){
			$("#spanBeginDate").html(beginDate);
			$("#spanEndDate").html(endDate);
			$("#spanSchool").html(school);
			$("#spanProfession").html(profession);
			$("#spanDegree").html(degree);
			$("#spanGraduate").html(graduate);
		}
	});
	$("#Education").hide(400);
}

/**
 * 培训经历提交按钮
 */
function submitButton5(){
	if($("#Training").is(":hidden")){
		return;
	}
	var trainingCompany = $("#trainingCompany").val();
	var title = $("#title").val();
	var profession = $("#profession").val();
	var havePassport = $("input[name='havePassport']:checked").val();
	var beginDate = $("#PbeginDate").val();
	var endDate = $("#PendDate").val();
	var trainingAddress = $("#trainingAddress").val();
	var trainingDesc = $("#trainingDesc").val();
	if(beginDate==null||beginDate==""){
		$("#erroPBeginTime").html("<font color='red'>时间不能为空</font>");
		$("#erroPBeginTime").show();
		return ;
	}else{
		$("#erroPBeginTime").hide();
	}
	if(endDate==null||endDate==""){
		$("#erroPEndTime").html("<font color='red'>时间不能为空</font>");
		$("#erroPEndTime").show();
		return;
	}else{
		$("#erroPEndTime").hide();
	}
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/updateUserInfoPartFive',
		dataType:'json',
		data:"trainingCompany="+trainingCompany+"&title="+title+"&profession="+profession+"&havePassport="+havePassport+"&beginDate="+beginDate+"&endDate="+endDate+"&trainingAddress="+trainingAddress+"&trainingDesc="+trainingDesc,
		callBackFn:function(msg){
			$("#spanTrainingCompany").html(trainingCompany);
			$("#spanTitle").html(title);
			$("#spanProfession").html(profession);
			switch(havePassport){
			case "0": $("#spanHavePassport").html("没有");break;
			case "1": $("#spanHavePassport").html("有");break;
			}
			$("#spanPBeginDate").html(beginDate);
			$("#spanPEndDate").html(endDate);
			$("#spanTrainingAddress").html(trainingAddress);
			$("#spanTrainingDesc").html(trainingDesc);
		}
	});
	$("#Training").hide(400);
}

/**
 * 工作经历提交按钮
 */
function submitButton6(){
	if($("#Work").is(":hidden")){
		return;
	}
	var beginDate = $("#WbeginDate").val();
	var endDate = $("#WendDate").val();
	var workCompany = $("#workCompany").val();
	var jobDuty = $("#jobDuty").val();
	var reference = $("#reference").val();
	var contactPhone = $("#contactPhone").val();
	var workDesc = $("#workDesc").val();
	if(beginDate==null||beginDate==""){
		$("#erroWBTime").html("<font color='red'>时间不能为空</font>");
		$("#erroWBTime").show();
		return;
	}else{
		$("#erroWBTime").hide();		
	}
	if(endDate==null||endDate==""){
		$("#erroWETime").html("<font color='red'>时间不能为空</font>");
		$("#erroWETime").show();
		return;
	}else{
		$("#erroWETime").hide();
	}
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/updateUserInfoPartSix',
		dataType:'json',
		data:"beginDate="+beginDate+"&endDate="+endDate+"&workCompany="+workCompany+"&jobDuty="+jobDuty+"&reference="+reference+"&contactPhone="+contactPhone+"&workDesc="+workDesc,
		callBackFn:function(msg){
			$("#spanWBeginDate").html(beginDate);
			$("#spanWEndDate").html(endDate);
			$("#spanWorkCompany").html(workCompany);
			$("#spanJobDuty").html(jobDuty);
			$("#spanReference").html(reference);
			$("#spanContactPhone").html(contactPhone);
			$("#spanWorkDesc").html(workDesc);
		}
	});
	$("#Work").hide(400);
}

/**
 * 按照日期 转换成 年龄
 */
 function getAge(val){
	var age;
	var aDate=new Date();
	var thisYear=aDate.getYear();
	var thisMonth=aDate.getMonth()+1;
	var thisDay=aDate.getDate();
	 var brith=val;
	 brithy=brith.substr(0,4);
	 brithm=brith.substr(4,2);
	 brithd=brith.substr(6,2);
	 if ($.browser.mozilla) { 
		 thisYear += 1900; 
		 }
	 if(thisYear-brithy<0)
	 {
	        alert("输入错误!");
	        age="";
	 }
	 else
	 {
	        if(thisMonth-brithm<0)
	        {
	               age = thisYear-brithy-1;
	        }
	        else
	        {
	               if(thisDay-brithd>=0)
	               {//alert(thisDay+'-'+brithd+"_ddd");
	                      age = thisYear-brithy;
	               }
	               else
	               {
	                      age = thisYear-brithy;
	               }
	        }
	 }
	 return age;
}

/**
 * 年龄转换成日期
 */
function getBrith(val){
	var brith;
	var aDate=new Date();
	var thisYear=aDate.getYear();
	var thisMonth=aDate.getMonth()+1;
	var thisDay=aDate.getDate();
	var age = val;
	 if ($.browser.mozilla) { 
		 thisYear += 1900; 
		 }
	 brith = thisYear-age+"-"+thisMonth+"-"+thisDay;
	return brith;
}
/**
 * 家庭信息确定按钮
 */
function submitButton7(){
	var memberName = $("#memberName").val();
	var relationship = $("#relationship").val();
	var birth = $("#birth").val();
	var workCompany = $("#workCompany").val();
	var duty = $("#duty").val();
	var contactphone = $("#contactphone").val();
	var id = $("#id").val();
	var age;
	if(memberName.trim()==null||memberName.trim()==""){
		$("#errP").html("请输入姓名!");
	}else{
		$("#errP").html("");
	}
	if(relationship.trim()==null||relationship.trim()==""){
		$("#errP").html("请输入关系!");
	}else{
		$("#errP").html("");
	}
	if(birth.trim()==null||birth.trim()==""){
		$("#errP").html("请输入年龄");
	}else{
		age = getBrith(birth);
		$("#errP").html("");
	}
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/insertUserFamilyInfo',
		dataType:'json',
		data:"memberName="+memberName+"&relationship="+relationship+"&birth="+age+"&workCompany="+workCompany+"&duty="+duty+"&contactphone="+contactphone+"&id="+id,
		callBackFn:function(msg){
				$("#spanUL").html("");
			for(var i=0;i<msg.length;i++){
				var time = ChangeDateFormat(msg[i].birth);
				time = getAge(time);
				$("#spanUL").append("<ul class='jiaoyijtcytext' id='familyInfoUL"+msg[i].id+"'>");
				$("#familyInfoUL"+msg[i].id).append("<li id='memberName"+msg[i].id+"'>"+msg[i].memberName+"</li>");
				$("#familyInfoUL"+msg[i].id).append("<li id='relationship"+msg[i].id+"'>"+msg[i].relationship+"</li>");birth
				$("#familyInfoUL"+msg[i].id).append("<li id='birth"+msg[i].id+"'>"+time+"</li>");
				$("#familyInfoUL"+msg[i].id).append("<li id='workCompany"+msg[i].id+"'>"+msg[i].workCompany+"</li>");
				$("#familyInfoUL"+msg[i].id).append("<li id='duty"+msg[i].id+"'>"+msg[i].duty+"</li>");
				$("#familyInfoUL"+msg[i].id).append("<li id='contactphone"+msg[i].id+"'>"+msg[i].contactphone+"</li>");
				$("#familyInfoUL"+msg[i].id).append("<input type='hidden' value='"+msg[i].id+"' id='id"+msg[i].id+"'/>");
				$("#familyInfoUL"+msg[i].id).append("<li><input type='button' class='jtcy82' style='width:54px; height:22px;' id ='"+msg[i].id+"' onclick='modification("+msg[i].id+")'></li>");
				$("#spanUL").append("</ul>");			
				
			}
		}
	});
	$("#memberName").val("");
	$("#relationship").val("");
	$("#birth").val("");
	$("#workCompany").val("");
	$("#duty").val("");
	$("#contactphone").val("");
	$("#id").val("");
}
/**
 * 把json格式的时间格式转换成指定的时间格式
 */
function ChangeDateFormat(cellval)
{
     var date = new Date(cellval);
     var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
     var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
     return date.getFullYear() + "-" + month + "-" + currentDate;
 }

/**
 * 家庭信息修改按钮
 */
function modification(id){
	var mLi = $("#memberName"+id).html();
	var rLi = $("#relationship"+id).html();
	var bLi = $("#birth"+id).val();
	if(bLi==0){
		bLi = $("#birth"+id).html();
	}else{
		bLi = getAge(bLi);		
	}
	var wLi = $("#workCompany"+id).html();
	var dLi = $("#duty"+id).html();
	var cLi = $("#contactphone"+id).html();
	var id=$("#id"+id).val();
	$("#memberName").val(mLi);
	$("#relationship").val(rLi);
	$("#birth").val(bLi);
	$("#workCompany").val(wLi);
	$("#duty").val(dLi);
	$("#contactphone").val(cLi);
	$("#id").val(id);
}


/**
 * 兴趣爱好提交按钮
 */
function submitButton8(){
	if($("#Hobbies").is(":hidden")){
		return;
	}
	var hobbies = $("input[name='hobbies']:checked").val();
	var Is = $("input[name='hobbies']");
	var interest = "";
	for(var i=0;i<Is.length;i++){
		if(Is[i].checked){
			interest += Is[i].value+",";
		}
	}if(interest==""){
		$("#Hobbies").hide();
		return;
	}
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/updateHobbies',
		dataType:'json',
		data:"hobbies="+interest,
		callBackFn:function(msg){
			$("#spanHobbies").html("");
			var temp = interest.split(',');
			for(var i=0;i<temp.length;i++){
				$("#spanHobbies").append("<li>"+temp[i]+"</li>");			
			}
		}
	});
}

</script>
</head>

<body>
<!--头部-->
<%@include file="EHeader.jsp" %>
<!--End头部-->
<div class="middle">
<!--左边-->
 	<%@include file="ELeft.jsp" %>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
		<div class="Out1">
        	<div class="khzlTitle"><font class="updown">基本资料</font><img src="images/zhankai(black).jpg" class="updown1"/></div>
            <div class="Content1">
            	<form>
<ul class="jbzl08">
<li><label>姓名：</label> <span id="spanName">${userInfo.name }</span></li>
<li><label>性别：</label> <span id="spanSex"><c:if test="${userInfo.sex ==0}">男</c:if><c:if test="${userInfo.sex ==1}">女</c:if></span></li>
<li><label>籍贯：</label> <span id="spanBirthPlace">${userInfoDetail.birthPlace }</span></li>
<li><label>民族：</label> <span id="spanNation">${userInfoDetail.nation }</span></li>
<li><label>婚姻状况：</label> <span id="spanMaritalStatus"><c:if test="${userInfoDetail.maritalStatus ==0}">未婚</c:if><c:if test="${userInfoDetail.maritalStatus ==1}">已婚</c:if><c:if test="${userInfoDetail.maritalStatus ==2}">离异</c:if><c:if test="${userInfoDetail.maritalStatus ==3}">再婚</c:if></span></li>
<li> &nbsp; </li>
<li><label>身高：</label> <span id="spanHeight">${userInfoDetail.height }</span></li>
<li><label>体重：</label> <span id="spanWeight">${userInfoDetail.weight }</span></li>
<li><label>目前职业：</label> <span id="spanCareer">${userInfoDetail.career }</span></li>
<li><label>目前薪资：</label> <span id="spanSalary">${userInfoDetail.salary }</span></li>
<li><label>最高学历：</label> <span id="spanHighestDegree">${userInfoDetail.highestDegree }</span></li>
<li><label>专业：</label> <span id="spanProfession">${userInfoDetail.profession }</span></li>
<dl><label>毕业院校：</label> <span id="spanGraduateSchool">${userInfoDetail.graduateSchool }</span></dl>
<li><label>首次工作时间：</label> <span id="spanFirstWorkDate"><fmt:formatDate value="${userInfo.firstWorkDate }" pattern="yyyy-MM-dd "/></span></li>
<!-- <li><label>加盟平台日期：</label> 2011-07-24</li> -->
<div class="zwpj10"><div class="zwpj10left">自我评价：</div>
<div class="zwpj10right"><span id="spanUserDesc">${userInfo.userDesc }</span></div></div>
</ul>

                <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
				<div class="tijiao" style="float:right;">
					<div class="xgzl16" id="basisInfo" style="display: none;">
						<ul class="jbzl08">
						<li><label>姓名：</label> <input type="text" name="name" id="name" value="${userInfo.name }" maxlength="11"/><span id="errName"></span></li>
						<li><label>性别：</label><input type="radio" name="sex" id="sex" value="0" <c:if test="${userInfo.sex ==0}">checked="checked"</c:if>/>男<input type="radio" name="sex" value="1" <c:if test="${userInfo.sex ==1}">checked="checked"</c:if>/>女</li>
						<li><label>籍贯：</label> <input type="text" name="birthPlace" id="birthPlace" value="${userInfoDetail.birthPlace }" maxlength="11"/></li>
						<li><label>民族：</label> <input type="text" name="nation" id="nation" value="${userInfoDetail.nation }" maxlength="11"/></li>
						<li><label>婚姻状况：</label> <input type="radio" name="maritalStatus" value="0" <c:if test="${userInfoDetail.maritalStatus ==0}">checked="checked"</c:if>/>未婚  <input type="radio" name="maritalStatus" value="1" <c:if test="${userInfoDetail.maritalStatus ==1}">checked="checked"</c:if>/>已婚 <br/><input type="radio" name="maritalStatus" value="2" <c:if test="${userInfoDetail.maritalStatus ==2}">checked="checked"</c:if>/>离异 <input type="radio" name="maritalStatus" value="3" <c:if test="${userInfoDetail.maritalStatus ==3}">checked="checked"</c:if>/>再婚</li>
						<li> &nbsp; </li>
						<li><label>身高：</label> <input type="text" name="height" id="height" maxlength="5" onkeypress="IsNum(event)" value="${userInfoDetail.height }"/></li>
						<li><label>体重：</label> <input typ="text" name="weight" id="weight" maxlength="5" onkeypress="IsNum(event)" value="${userInfoDetail.weight }"/></li>
						<li><label>目前职业：</label> <input type="text" name="career" id="career" maxlength="11" value="${userInfoDetail.career }"/></li>
						<li><label>目前薪资：</label> <input type="text" onkeypress="IsNum(event)" maxlength="11" name="salary" id="salary" value="${userInfoDetail.salary }" maxlength="11"/><span id="errSalary"></span></li>
						<li><label>最高学历：</label> <input type="text" maxlength="11" name="highestDegree" id="highestDegree" value="${userInfoDetail.highestDegree }"/></li>
						<li><label>专业：</label> <input type="text" maxlength="11" name="profession" id="profession" value="${userInfoDetail.profession }"/></li>
						<li><label>毕业院校：</label> <input type="text" maxlength="11" name="graduateSchool" id="graduateSchool" value="${userInfoDetail.graduateSchool }"/></li>
						<li><label>首次工作时间：</label> <input class="input16" name="firstWorkDate" readonly = "readonly" id="firstWorkDate" size="12" maxlength="10" onkeydown="if(event.keyCode==8)event.returnValue=false;" value="<fmt:formatDate value="${userInfo.firstWorkDate }" pattern="yyyy-MM-dd "/>" pattern="yyyy-MM-dd "/>"<img width="20" height="20" align="middle" onclick="new Calendar(1900,2050).show(document.getElementById('firstWorkDate'));" src="images/rili.gif"></li>
						<div class="zwpj10"><div class="zwpj10left">自我评价：</div>
						<div class="zwpj10right"><textarea name="userDesc" id="userDesc" maxlength="300">${userInfo.userDesc }</textarea> </div></div>
						</ul>
					</div>
        	          <input type="button" class="xiugai1" onclick="ProfileButton1()"/>
        	          <input type="button" class="tijiao1" onclick="submitButton1()"/>
                  </div>
                </form>
            </div>
        </div>
        
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">证件及照片</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>有效证件名称：</label> 身份证</li>
                <li><label>证件号码：</label><span id="spanIDcard">${userInfoDetail.iDcard }</span></li>
                </ul>
             
                <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
				<div class="tijiao" style="float:right;">
					<div class="xgzl16" id="cardId" style="display: none;">
						<ul class="jbzl08">
						 	<li><label>证件号码：</label><input type="text" id="IDcard" name="IDcard" maxlength="20" onkeypress="IsNum(event)" value="${userInfoDetail.iDcard }"/><span id="errCardId"></span></li>
						</ul>
					</div>
        	          <input type="button" class="xiugai1" onclick="ProfileButton2()"/>
        	          <input type="button" class="tijiao1" onclick="submitButton2()"/>
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">联系方式</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>家庭电话：</label><span id="spanTelphone">${userInfoDetail.telphone }</span></li>
                    <li><label>手机：</label><span id="spanCellphone">${userInfoDetail.cellphone }</span></li>
                    <li><label>QQ：</label><span id="spanQQ">${userInfoDetail.qQ }</span></li>
                    <li><label>MSN：</label><span id="spanMSN">${userInfoDetail.mSN }</span></li>
                    <li><label>E-mail：</label><span id="spanEmail"> ${email }</span></li>
                    <li>&nbsp;</li>
                    <li><label>博客：</label><span id="spanBlog">${userInfoDetail.blog }</span></li>
                    <li><label>微博：</label><span id="spanWeibo">${userInfoDetail.weibo }</span></li>                    <li><label>紧急联系人：</label><span id="spanEmergencyPerson"> ${userInfoDetail.emergencyPerson }</span></li>
                    <li><label>紧急联系方式：</label><span id="spanEmergencyPhone">${userInfoDetail.emergencyPhone }</span></li>
                    <dl><label>工作地：</label><span id="spanUserCity">${userInfo.userCity }</span></dl>
                    <dl><label>家庭常住地址：</label><span id="spanHomeAddress">${userInfoDetail.homeAddress }</span></dl>
                    <dl><label>户口所在地：</label><span id="spanRegisteredAddress">${userInfoDetail.registeredAddress }</span></dl>
                    
                </ul>
                            
				<div class="tijiao" style="float:right;">
					<div class="xgzl16" id="ContactInformation" style="display: none;">
						 <ul class="jbzl08">
						 	   <li><label>家庭电话：</label><input type="text" name="telphone" id="telphone" maxlength="15" onkeypress="IsNum(event)" value="${userInfoDetail.telphone }"/><span id="errTelphone"></span></li>
						 	   <li><label>手机：</label><input type="text" name="cellphone" id="cellphone" onkeypress="IsNum(event)" maxlength="11" value="${userInfoDetail.cellphone }"/><span id="errCellphone"></span></li>
						 	   <li><label>QQ：</label><input type="text" name="qQ" id="qQ" onkeypress="IsNum(event)" value="${userInfoDetail.qQ }" maxlength="15"/></li>
						 	   <li><label>MSN：</label><input type="text" name="mSN" id="mSN" maxlength="40" value="${userInfoDetail.mSN }"/></li>
						 	   <li><label>E-mail：</label><input type="text" name="email" id="email" value="${email }" disabled="disabled"/></li>
	 	                       <li>&nbsp;</li>
	 	                       <li><label>博客：</label><input type="text" name="blog" id="blog" value="${userInfoDetail.blog }"/></li>
	 	                       <li><label>微博：</label><input type="text" name="weibo" id="weibo" value="${userInfoDetail.weibo }"/></li>                    <li><label>紧急联系人：</label><input type="text" name="emergencyPerson" id="emergencyPerson" value="${userInfoDetail.emergencyPerson }"/></li>
						 	   <li><label>紧急联系方式：</label><input type="text" maxlength="11" name="emergencyPhone" id="emergencyPhone" value="${userInfoDetail.emergencyPhone }"/></li>
						 	   <li><label>工作地：</label><input type="text" maxlength="40" name="userCity" id="userCity" value="${userInfo.userCity }"/><span id="errUserCity"></span></li>
						 	   <li><label>家庭常住地址：</label><input type="text" maxlength="40" name="homeAddress" id="homeAddress" value="${userInfoDetail.homeAddress }"/></li>
						 	   <li><label>户口所在地：</label><input type="text" maxlength="40" name="registeredAddress" id="registeredAddress" value="${userInfoDetail.registeredAddress }"/></li>
						 </ul>
					</div>
        	          <input type="button" class="xiugai1" onclick="ProfileButton3()"/>
        	          <input type="button" class="tijiao1" onclick="submitButton3()"/>
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">家庭成员信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
<!---家庭成员信息列表--->
	<div class="jiaoyijtcy08">
		<ul class="jiaoyijtcytop">
		<li>姓名</li>
		<li>与本人关系</li>
		<li>年龄</li>
		<li>工作单位</li>
		<li>职务</li>
		<li>联系电话</li>
		<li></li>
		</ul>
		<form id="familyForm">
		<ul class="jiaoyijtcyinput">
			<li><input value="" style="background:#EAEAEC;" name="memberName" id="memberName"></li>
			<li><input value="" style="background:#EAEAEC;" name="relationship" id="relationship"></li>
			<li><input value="" style="background:#EAEAEC;" name="birth" id="birth" maxlength="3" onkeypress="IsNum(event)"></li>
			<li><input value="" style="background:#EAEAEC;" name="workCompany" id="workCompany"></li>
			<li><input value="" style="background:#EAEAEC;" name="duty" id="duty"></li>
			<li><input value="" style="background:#EAEAEC;" name="contactphone" id="contactphone" maxlength="11" onkeypress="IsNum(event)"></li>
			<input type="hidden" value="" id="id"/>
			<li><input type="button" class="jtcy81" style="width:54px; height:22px;"  onclick="submitButton7()"></li>
		</ul>
			</form>
<p class="jtcyts8" id="errP"></p>
<span id="spanUL">
		<c:forEach items="${userFamilyInfoList }" var="userFamilyInfo">
			<ul class="jiaoyijtcytext" id="familyInfoUL${userFamilyInfo.id}">
				<li id="memberName${userFamilyInfo.id}">${userFamilyInfo.memberName }</li>
				<li id="relationship${userFamilyInfo.id}">${userFamilyInfo.relationship }</li>
				<li>
					<script type="text/javascript">	
						document.write(getAge("<fmt:formatDate value="${userFamilyInfo.birth }" pattern="yyyy-MM-dd "/>"));
					</script>
					<input id="birth${userFamilyInfo.id}" type="hidden" value="<fmt:formatDate value="${userFamilyInfo.birth }" pattern="yyyy-MM-dd "/>"/>
				</li>
				<li id="workCompany${userFamilyInfo.id}">${userFamilyInfo.workCompany }</li>
				<li id="duty${userFamilyInfo.id}">${userFamilyInfo.duty }</li>
				<li id="contactphone${userFamilyInfo.id}">${userFamilyInfo.contactphone }</li>
				<input type="hidden" value="${userFamilyInfo.id}" id="id${userFamilyInfo.id}"/>
				<li><input type="button" class="jtcy82" style="width:54px; height:22px;" id ="${userFamilyInfo.id}" onclick="modification(${userFamilyInfo.id})"></li>
			</ul>			
		</c:forEach>
</span>
</div>
<!---End 家庭成员信息列表--->
</form>
            </div>
        </div>
        
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">教育</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>起始时间：</label><span id="spanBeginDate"> <fmt:formatDate value="${userEduInfo.beginDate }" pattern="yyyy-MM-dd "/></span></li>   
                    <li><label>结束时间：</label><span id="spanEndDate"><fmt:formatDate value="${userEduInfo.endDate }" pattern="yyyy-MM-dd "/></span></li>   
                    <li><label>毕业学院：</label><span id="spanSchool">${userEduInfo.school }</span></li>
                    <li><label>专业：</label><span id="spanProfession">${userEduInfo.profession }</span></li>
                    <li><label>学位：</label><span id="spanDegree">${userEduInfo.degree }</span></li>                   
                </ul>
                <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">毕业肄业：</div>
<div class="zwpj10right" id="spanGraduate">${userEduInfo.graduate }</div></div>

				<div class="tijiao" style="float:right;">				
				<div class="xgzl16" id="Education" style="display: none;">
					<ul class="jbzl08">
						<li><label>起始时间：</label><input type="text" readonly = "readonly" name="beginDate" id="beginDate" maxlength="10" onkeydown="if(event.keyCode==8)event.returnValue=false;" value="<fmt:formatDate value="${userEduInfo.beginDate }" pattern="yyyy-MM-dd "/>"/><img width="20" height="20" align="middle" onclick="new Calendar(1900,2050).show(document.getElementById('beginDate'));" src="images/rili.gif"><span id="erroWorkBeginTime"></span></li> 
						<li><label>结束时间：</label><input type="text" readonly = "readonly" name="endDate" id="endDate" maxlength="10" onkeydown="if(event.keyCode==8)event.returnValue=false;" value="<fmt:formatDate value="${userEduInfo.endDate }" pattern="yyyy-MM-dd "/>"/><img width="20" height="20" align="middle" onclick="new Calendar(1900,2050).show(document.getElementById('endDate'));" src="images/rili.gif"><span id="erroWhorEndTime"></span></li>  
						<li><label>毕业学院：</label><input type="text" maxlength="30" name="school" id="school" value="${userEduInfo.school }"/></li>
						<li><label>专业：</label><input type="text" maxlength="30" name="profession" id="profession" value="${userEduInfo.profession }"/></li>
						<li><label>学位：</label><input type="text" name="degree" maxlength="11" id="degree" value="${userEduInfo.degree }"/></li>
						<div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">毕业肄业：</div>
<div class="zwpj10right"><textarea id="graduate" name="graduate" rows="5" cols="20" maxlength="300">${userEduInfo.graduate }</textarea></div></div>
					</ul>
				</div>
        	          <input type="button" class="xiugai1" onclick="ProfileButton4()"/>
        	          <input type="button" class="tijiao1" onclick="submitButton4()"/>
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">培训经历</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>培训机构：</label><span id="spanTrainingCompany">${userTrainingExperience.trainingCompany }</span></li>
                <li><label>职称：</label><span id="spanTitle">${userTrainingExperience.title }</span></li>
                 <li><label>专业：</label><span id="spanProfession">${userTrainingExperience.profession }</span></li>
                <li><label>有无证件：</label><span id="spanHavePassport"><c:if test="${userTrainingExperience.havePassport==0 }">没有</c:if><c:if test="${userTrainingExperience.havePassport==1 }">有</c:if></span></li>
                <li>&nbsp;</li>
                <li><label>起始时间：</label><span id="spanPBeginDate"><fmt:formatDate value="${userTrainingExperience.beginDate }" pattern="yyyy-MM-dd "/></span></li>
                <li><label>结束时间：</label><span id="spanPEndDate"><fmt:formatDate value="${userTrainingExperience.endDate }" pattern="yyyy-MM-dd "/></span></li>
                <dl><label>地址：</label><span id="spanTrainingAddress">${userTrainingExperience.trainingAddress }</span></dl>
              
                </ul>
                <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">详细描述：</div>
<div class="zwpj10right"><span id="spanTrainingDesc">${userTrainingExperience.trainingDesc }</span></div></div>
				<div class="tijiao" style="float:right;">
					<div class="xgzl16" id="Training" style="display: none;">
						<ul class="jbzl08">
							<li><label>培训机构：</label><input type="text" maxlength="40" name="trainingCompany" id="trainingCompany" value="${userTrainingExperience.trainingCompany }"/></li>
							 <li><label>职称：</label><input type="text" maxlength="40" name="title" id="title" value="${userTrainingExperience.title }"/></li>
							 <li><label>专业：</label><input type="text" name="profession" id="profession" value="${userTrainingExperience.profession }"/></li>
							 <li><label>有无证件：</label><input type="radio" name="havePassport" value="0" <c:if test='${userTrainingExperience.havePassport==0 }'>checked="checked"</c:if>/>没有 <input type="radio" name="havePassport" value="1" <c:if test='${userTrainingExperience.havePassport==1 }'>checked="checked"</c:if>/>有</li>
							 
							 <li><label>起始时间：</label><input type="text" name="beginDate" id="PbeginDate" readonly = "readonly" maxlength="10" onkeydown="if(event.keyCode==8)event.returnValue=false;" value="<fmt:formatDate value="${userTrainingExperience.beginDate }" pattern="yyyy-MM-dd "/>"/><img width="20" height="20" align="middle" onclick="new Calendar(1900,2050).show(document.getElementById('PbeginDate'));" src="images/rili.gif"><span id="erroPBeginTime"></span></li>
							 <li><label>结束时间：</label><input type="text" name="endDate" id="PendDate" readonly = "readonly" maxlength="10" onkeydown="if(event.keyCode==8)event.returnValue=false;" value="<fmt:formatDate value="${userTrainingExperience.endDate }" pattern="yyyy-MM-dd "/>"/><img width="20" height="20" align="middle" onclick="new Calendar(1900,2050).show(document.getElementById('PendDate'));" src="images/rili.gif"><span id="erroPEndTime"></span></li>
							 <li><label>地址：</label><input type="text" maxlength="40" name="trainingAddress" id="trainingAddress" value="${userTrainingExperience.trainingAddress }"/></li>
						</ul>
						  <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">详细描述：</div>
							<div class="zwpj10right"><textarea rows="5" cols="20" maxlength="300" name="trainingDesc" id="trainingDesc">${userTrainingExperience.trainingDesc }</textarea></div></div>
					</div>
        	          <input type="button" class="xiugai1" onclick="ProfileButton5()"/>
        	          <input type="button" class="tijiao1" onclick="submitButton5()"/>
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">工作经历</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>起始年月：</label><span id="spanWBeginDate"><fmt:formatDate value="${userWorkExperience.beginDate }" pattern="yyyy-MM-dd "/></span></li>
                    <li><label>结束年月：</label><span id="spanWEndDate"><fmt:formatDate value="${userWorkExperience.endDate }" pattern="yyyy-MM-dd "/></span></li>
                    <li><label>工作单位名称：</label><span id="spanWorkCompany">${userWorkExperience.workCompany }</span></li>
                    <li><label>职务：</label><span id="spanJobDuty">${userWorkExperience.jobDuty }</span></li>
                    <li><label>证明人：</label><span id="spanReference">${userWorkExperience.reference }</span></li>
                    <li><label>联系电话：</label><span id="spanContactPhone">${userWorkExperience.contactPhone }</span></li>
                    <!-- <li><label>擅长楼盘：</label> ******</li> -->
                </ul>                
                <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">详细描述：</div> 
<div class="zwpj10right"><span id="spanWorkDesc">${userWorkExperience.workDesc }</span></div></div>
                
                <div class="tijiao" style="float:right;">
                <div class="xgzl16" id="Work" style="display: none;">
                	<ul class="jbzl08">
                		<li><label>起始年月：</label><input type="text" name="beginDate" id="WbeginDate" readonly = "readonly" value="<fmt:formatDate value="${userWorkExperience.beginDate }" pattern="yyyy-MM-dd "/>"/><img width="20" height="20" align="middle" onclick="new Calendar(1900,2050).show(document.getElementById('WbeginDate'));" src="images/rili.gif"><span id="erroWBTime"></span></li>
                		 <li><label>结束年月：</label><input type="text" name="endDate" id="WendDate" readonly = "readonly" value="<fmt:formatDate value="${userWorkExperience.endDate }" pattern="yyyy-MM-dd "/>"/><img width="20" height="20" align="middle" onclick="new Calendar(1900,2050).show(document.getElementById('WendDate'));" src="images/rili.gif"><span id="erroWETime"></span></li>
                		 <li><label>工作单位名称：</label><input type="text" maxlength="20" name="workCompany" id="workCompany" value="${userWorkExperience.workCompany }"/></li>
                		  <li><label>职务：</label><input type="text" name="jobDuty" maxlength="20" id="jobDuty" value="${userWorkExperience.jobDuty }"/></li>
                		  <li><label>证明人：</label><input type="text" maxlength="11" name="reference" id="reference" value="${userWorkExperience.reference }"/></li>
                		  <li><label>联系电话：</label><input type="text" maxlength="20" name="contactPhone" id="contactPhone" value="${userWorkExperience.contactPhone }"/></li>
                		  <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">详细描述：</div> 
						<div class="zwpj10right"><textarea rows="5" cols="20" maxlength="300" name="workDesc" id="workDesc">${userWorkExperience.workDesc }</textarea></div></div>
                	</ul>
                </div>
        	          <input type="button" class="xiugai1" onclick="ProfileButton6()"/>
        	          <input type="button" class="tijiao1" onclick="submitButton6()"/>
                  </div>
                </form>
            </div>
        </div>
        <!--<div class="Out">
        	<div class="khzlTitle"><font>置业信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <div class="jbzlIpunt">
                	<span><label>行业：</label><input type="text" /><font>*</font></span>
                    <span><label>公司名称：</label><input type="text" /><font>*</font></span>
                    <span><label>职务：</label><input type="text" /><font>*</font></span>
                    <span><label>目前收入：</label><input type="text" /><font>*</font></span>
                </div>
                </form>
            </div>
        </div>-->
        
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">兴趣爱好</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                  <ul class="jbzl08" id="spanHobbies">
                  <c:forTokens items="${userInfoDetail.hobbies }" delims="," var="hobbies">
                	<li>${hobbies }</li>                  	
                  </c:forTokens>
                </ul>
				<div class="tijiao" style="float:right;">
				<div class="xgzl16" id="Hobbies" style="display: none;">
					<ul class="jbzl08">
						<li><input name="hobbies" type="checkbox" value="财经/股市" />  财经/股市</li>
                   		<li><input name="hobbies" type="checkbox" value="房产/家居" />  房产/家居</li>
                    	<li><input name="hobbies" type="checkbox" value="图书/音像" />  图书/音像</li>
                    	<li><input name="hobbies" type="checkbox" value="娱乐" />  娱乐</li>
                    	<li><input name="hobbies" type="checkbox" value="旅游/度假" />  旅游/度假</li>
                    	<li><input name="hobbies" type="checkbox" value="体育/户外/健身" />  体育/户外/健身</li>
                    	<li><input name="hobbies" type="checkbox" value="汽车" />  汽车</li>
                    	<li><input name="hobbies" type="checkbox" value="游戏/股市" />  游戏/股市</li>
                    </ul>
				</div>
        	          <input type="button" class="xiugai1" onclick="ProfileButton8()"/>
        	          <input type="button" class="tijiao1" onclick="submitButton8()"/>
                  </div>
                </form>
            </div>
        </div>
       
    </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>

