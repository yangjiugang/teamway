/*2012-2-8  start*/

var teShuOK = true ;
var shengriOK =true;
var birthPlaceOK = true;
var sexOK = true ;
var maritalStatusOK = true;
var celPhoneOK = true;
var email =true ;
var iDNumOK =true;
var tellpOK = true;
var qQOK = true ;
var zhOK = true;
var incomeOK = true ;
var liOK = true;
var mNameOK = true;
var guanxiOk = true;
var ageOK = true;
var cphoneOK = true;
var isOK = true;
function submitTijiao(){
	if(teShuOK&&shengriOK&&birthPlaceOK&&sexOK&&maritalStatusOK&&celPhoneOK&&email&&iDNumOK&&tellpOK&&qQOK&&zhOK&&incomeOK&&liOK&&liOK&&guanxiOk&&ageOK&&cphoneOK){
		$("#tijiao").removeAttr("disabled");
		}else{
			$("#tijiao").attr("disabled","disabled"); 
		}
	}
/* 特殊字符验证 */
function checkTeshu(element,error) {
	$(error).html("");
	$(element).css("border-color", "");	
	var pattern = new RegExp("[`~!@%#$^&*()=|{}':;',　\\[\\]<>/? \\.；：%……+￥（）【】‘”“'。，、？]");
	if(pattern.test($(element).val())){
		$(error).html("不能输入特殊字符，请重新输入");
		$(element).css("border-color", "red");
		teShuOK = false ;
		submitTijiao();
	}else{
		teShuOK = true;
		submitTijiao();
	}
}
/* 验证出生年月 */
	function checkBirthday(){
		$("#shengri_error").html("");
		$("#shengri").css("border-color", "");	
		if(CheckDate($("#shengri").val().replace(/(^\s*)|(\s*$)/g, ''))){
			$("#shengri_error").html("请输入正确的日期格式");
			$("#shengri").css("border-color", "red");
			shengriOK = false;
			submitTijiao();
		}else {
			shengri = true;
			submitTijiao();
		}
	}
	
	/* 验证籍贯 */
	function checkBirthPlace(){
		$("#birthPlace_error").html("");
		$("#birthPlace").css("border-color", "");
		if(($("#birthPlace").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#birthPlace_error").html("籍贯必须填写");
			birthPlaceOK = false;
			submitTijiao();
		}else{
			if(checkTeshu('#birthPlace','#birthPlace_error') == false){
			$("#birthPlace_error").html("毕业专业不能含特殊字符");
			$("#birthPlace").css("border-color", "");
			birthPlaceOK = false;
			submitTijiao();
		}else{
			birthPlaceOK = true;
			submitTijiao();
		}
		}
	};
	
	function checkSex(){
		var val=$('input:radio[name="sex"]:checked').val();    
		if(val==null){    
		$("#sex_error").html("请选择性别");  
		sexOK = false;    
		submitTijiao();
		}else{    
			sexOK = true;  
			submitTijiao(); 
		}
		};
		
	function checkMaritalStatus(){
			var val=$('input:radio[name="maritalStatus"]:checked').val();    
			if(val==null){    
			$("#maritalStatus_error").html("请选择性别");  
			maritalStatusOK = false; 
			submitTijiao();   
			}else{    
				maritalStatusOK = true;  
				submitTijiao(); 
		}
		};	
	/* 验证手机电话 */
	function checkPhone(){
		$("#cellphone_error").html("");
		$("#cellphone").css("border-color", "");
		if(($("#cellphone").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#cellphone_error").html("手机号必须填写");
			$("#cellphone").css("border-color", "red");
			celPhoneOK = false;
			submitTijiao();
		}else if(!/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/.test($("#cellphone").val())){
			$("#cellphone_error").html("请填定正确的手机号");
			$("#cellphone").css("border-color", "red");
			celPhoneOK = false;
			submitTijiao();
		}else{
			celPhoneOK = true;
			submitTijiao();
		}
	}
	
	/* 验证邮箱 */
	function checkEmail(){
		$("#email_error").html("");
		$("#email").css("border-color", "");
		if(($("#email").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#email_error").html("邮箱必须填写");
			$("#email").css("border-color", "red");
			email =false ;
			submitTijiao();
		}
		if(!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test($("#email").val())){
			$("#email_eror").html("请填定正确的邮箱");
			$("#email").css("border-color", "red");
			email =false ;
			submitTijiao();
		}else{
			email =true ;
			submitTijiao();
		}
	}
	
	/* 验证身份证 */
	function checkIdNum(){
		var idType=$("input[name='idType']:checked").val();
		var idNum=$("#iDNum").val().replace(/(^\s*)|(\s*$)/g, '');
		var shengri=$("#shengri").val().replace(/(^\s*)|(\s*$)/g, '').replace(/-/g,"");
		$("#iDNum_error").html("");
		$("#iDNum").css("border-color", "");
		if(idType==1){
			if(checkIdcard(idNum)){
				$("#iDNum_error").html("请填写正确的身份证号码");
				$("#iDNum").css("border-color", "red");
				iDNumOK =false;
				submitTijiao();
			}else
			if(shengri!=idNum.substr(6,8)){
				$("#iDNum_error").html("出生日期与身份证不匹配，请修改生日");
				$("#iDNum").css("border-color", "red");
				iDNumOK =false;
				submitTijiao();
			}else{
			};
		}else if(!/(P\d{7})|(G\d{8})/.test(idNum)){
				$("#iDNum_error").html("请填写正确的护照号码");
				$("#iDNum").css("border-color", "red");
				iDNumOK =false;
				submitTijiao();
		}else{
			iDNumOK =true;
			submitTijiao();
		}		
	};
	
	/* 验证固定电话 */
	function checkTellphone(){
		$("#tellphone_error").html("");
		$("#tellphone").css("border-color", "");
		if(($("#tellphone").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#tellphone_error").html("电话号码必须填写");
			$("#tellphone").css("border-color", "red");
			tellpOK = false;
			submitTijiao();
		}else if(!/(\d+)*-?\d{5,8}(-?\d+)*/.test($("#tellphone").val())){
			$("#tellphone_error").html("请填定正确的电话号码");
			$("#tellphone").css("border-color", "red");
			tellpOK = false;
			submitTijiao();
		}else{
			tellpOK = true;
			submitTijiao();
		}
	}
	
	/* 验证QQ */
	function checkQQ(){	
		$("#qQ_error").html("");
		$("#qQ").css("border-color", "");
		var len = $("#qQ").val().length;
		if(len > 0){  
            c = $("#qQ").val().charAt(0).charCodeAt();  
            if(c < 48 || c > 57){  
                $("#qQ_error").html("QQ必须为数值！");
    			$("#qQ").css("border-color", "red");
    			qQOK = false;
    			submitTijiao();
            }else{
            	qQOK = true;
            	submitTijiao();
            } 
		}
	}
	
	/* 验证中文 */
	function checkZH(element,error){
		$(error).html("");
		$(element).css("border-color", "");
		var length = $(element).val().length;           
		for(var i = 0; i <length; i++){           
		    if($(element).val().charCodeAt(i) > 127){   
	            $(error).html("不能为中文");
	    		$(element).css("border-color", "red");
	    		zhOK = false;
	    		submitTijiao();
		        }else{
		        	zhOK = true;
		        	submitTijiao();
		        }
		    }
		submitTijiao();
	}
	
	/* 验证毕业院校 */
	function checkSchool(){
		$("#school_error").html("");
		$("#school").css("border-color", "");
		if(($("#school").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
            $("#school_error").html("毕业院校不能为空");
    		$("#school").css("border-color", "red");
    		schoolOK = false;
    		submitTijiao();
		}else{
			if(checkTeshu('#school','#school_error') == false){
				$("#school_error").html("毕业院校不能含特殊字符");
				$("#school").css("border-color", "");
	    		schoolOK = false;
	    		submitTijiao();
			}else{
	    		schoolOK = true;
	    		submitTijiao();
			}
		}		
	}
	
	/* 验证专业 */
	function checkGraduate(){
		$("#graduate_error").html("");
		$("#graduate").css("border-color", "");
		if(($("#graduate").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
            $("#graduate_error").html("毕业专业不能为空");
    		$("#graduate").css("border-color", "red");
    		graduateOK = false;
    		submitTijiao();
		}else{
			if(checkTeshu('#graduate','#graduate_error') == false){
				$("#graduate_error").html("毕业专业不能含特殊字符");
				$("#graduate").css("border-color", "");
				graduateOK = false;
				submitTijiao();
			}else{
				graduateOK = true;
				submitTijiao();
			}
		}		
	}
	/* 验证目前收入 */
	function checkIncome(){	
		$("#income_error").html("");
		$("#income").css("border-color", "");
		var len = $("#income").val().length;
		if(len > 0){  
            c = $("#income").val().charAt(0).charCodeAt();  
            if(c < 48 || c > 57){  
                $("#income_error").html("当前收入必须为数值！");
    			$("#income").css("border-color", "red");
    			incomeOK = false;
    			submitTijiao();
            }else{
            	 if(len > 11){
                     $("#income_error").html("当前收入必须小于11位！");
         			$("#income").css("border-color", "red");
         			incomeOK = false;
         			submitTijiao();
            	 }else{
            	incomeOK = true;
            	submitTijiao();
            } 
            }
		}
	}
	/* end 2012-2-8 */
	var count = 0;
	function newLi(){
		var memberName = $("#memberName").val();
		var relationship = $("#relationship").val();
		var age = $("#age").val();
		var workPlace =  $("#work").val();
		var jobDuty = $("#jobDuty").val();
		var contactphone = $("#contactphone").val();
		var i = count;
			var li1Name = "customerFamilyInfosList["+i+"].memberName";
			var li2Name = "customerFamilyInfosList["+i+"].relationship";
			var li3Name = "customerFamilyInfosList["+i+"].age";
			var li4Name = "customerFamilyInfosList["+i+"].workPlace";
			var li5Name = "customerFamilyInfosList["+i+"].jobDuty";
			var li6Name = "customerFamilyInfosList["+i+"].contactphone";
			var mId = "memberName"+i+"";
			var rId = "relationship"+i+"";
			var aId = "age"+i+"";
			var wId = "work"+i+"";
			var jId = "jobDuty"+i+"";
			var cId = "contactphone"+i+"";
			if(memberName && relationship && age && workPlace && jobDuty && contactphone !=''){	
				liOK = (mNameOK && guanxiOk && ageOK && cphoneOK && teShuOK);	
				if(liOK == true){
					$("#familyID").append("<ul class='jiaoyijtcytext' id='ul"+i+"'>" +
							"<li><input type='text' style='background:#EAEAEC;' readonly='true' name='"+li1Name+"' id='"+mId+"' value=\""+memberName+"\"/></li>" +
							"<li><input type='text' style='background:#EAEAEC;' readonly='true' name='"+li2Name+"' id='"+rId+"' value=\""+relationship+"\"/></li>" +
							"<li><input type='text' style='background:#EAEAEC;' readonly='true' name='"+li3Name+"' id='"+aId+"' value=\""+age+"\"/></li>" +
							"<li><input type='text' style='background:#EAEAEC;' readonly='true' name='"+li4Name+"' id='"+wId+"' value=\""+workPlace+"\"/></li>" +
							"<li><input type='text' style='background:#EAEAEC;' readonly='true' name='"+li5Name+"' id='"+jId+"' value=\""+jobDuty+"\"/></li>" +
							"<li><input type='text' style='background:#EAEAEC;' readonly='true' name='"+li6Name+"' id='"+cId+"' value=\""+contactphone+"\"/></li>" +
							"<li><input type='text' type=button class='jtcy82' style='width:54px; height:22px;' onclick='xiugaiFun("+i+");'></li>" +
							"</ul>");
					$("#memberName").val("");
					$("#relationship").val("");
					$("#age").val("");
					$("#work").val("");
					$("#jobDuty").val("");
					$("#contactphone").val("");
					count=count+1;
					liOK == true;
					submitTijiao();
				}else{
					$("#family_error").html("有错误信息，请检查！！重新输入");
					liOK == false;
					submitTijiao();
			}
			}
	}

	function xiugaiFun(id){
		var ulId = "#ul"+id+"";
		var mId = "#memberName"+id+"";
		var rId = "#relationship"+id+"";
		var aId = "#age"+id+"";
		var wId = "#work"+id+"";
		var jId = "#jobDuty"+id+"";
		var cId = "#contactphone"+id+"";
		$("#memberName").val($(mId).val());
		$("#relationship").val($(rId).val());
		$("#age").val($(aId).val());
		$("#work").val($(wId).val());
		$("#jobDuty").val($(jId).val());
		$("#contactphone").val($(cId).val());
		$(ulId).remove();
	}
	
	function checkMemberName(){
		$("#family_error").html("");
		$("#memberName").css("border-color", "");
		var nval=$("#memberName").val().replace(/(^\s*)|(\s*$)/g, '');
		if(nval==''){
            $("#family_error").html("姓名不能为空");
    		$("#memberName").css("border-color", "red");
    		mNameOK = false;
			submitTijiao();
		}else{
			if(checkTeshu('#memberName','#family_error') == false){
				$("#family_error").html("姓名不能含特殊字符");
				$("#memberName").css("border-color", "");
				mNameOK = false;
				submitTijiao();
			}else{
				 if(nval.length >= 2 && nval.length < 20){
						mNameOK = true;
						submitTijiao();				
					}else{
						$("#family_error").html("姓名长度必须大于等于2小于20");
						$("#memberName").css("border-color", "");
						mNameOK = false;
						submitTijiao();
			}
				 }
		}		
	}
	
	function checkRelationship(){
		$("#family_error").html("");
		$("#relationship").css("border-color", "");
		if(($("#relationship").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
            $("#family_error").html("亲人关系不能为空");
    		$("#relationship").css("border-color", "red");
    		guanxiOk = false;
			submitTijiao();
		}else{
			if(checkTeshu('#relationship','#family_error') == false){
				$("#family_error").html("亲人关系不能含特殊字符");
				$("#relationship").css("border-color", "");
				guanxiOk = false;
				submitTijiao();
			}else{
				guanxiOk = true;
				submitTijiao();
			}
		}		
	}
	
	function checkAge(){
		$("#family_error").html("");
		$("#age").css("border-color", "");
		var len = $("#age").val().length;
		if(len > 0){  
            c = $("#age").val().charAt(0).charCodeAt();  
            if(($("#age").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
                $("#family_error").html("亲人关系不能为空");
        		$("#age").css("border-color", "red");
    			ageOK = false;
				submitTijiao();
            }else if(c < 48 || c > 57){  
                $("#family_error").html("年龄必须为数值！");
    			$("#age").css("border-color", "red");
    			ageOK = false;
				submitTijiao();
            }else{
            	if($("#age").val().replace(/(^\s*)|(\s*$)/g, '')>0 && $("#age").val().replace(/(^\s*)|(\s*$)/g, '')<120){
            		ageOK = true;
					submitTijiao();
            	}else{
                    $("#family_error").html("年龄必须大于0小于120！");
        			$("#age").css("border-color", "red"); 
        			ageOK = false;         
					submitTijiao();  		
            	}
            } 
		}
	}
	
 	function checkContactphone(){
		$("#family_error").html("");
		$("#contactphone").css("border-color", "");
		if(($("#contactphone").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
			$("#family_error").html("手机号必须填写");
			$("#contactphone").css("border-color", "red");
			cphoneOK = false;
			submitTijiao();
		}else if(!/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/.test($("#contactphone").val())){
			$("#family_error").html("请填定正确的手机号");
			$("#contactphone").css("border-color", "red");
			cphoneOK = false;
			submitTijiao();
		}else{
			cphoneOK = true;
			submitTijiao();
		}
	}
	/* end 2012-2-9*/
