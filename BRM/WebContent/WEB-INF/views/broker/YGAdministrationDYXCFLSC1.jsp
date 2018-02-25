<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经纪人管理-当月福利报表生成</title>
<!--[if lte IE 8]><link rel="stylesheet" media="screen" href="css/ie.css"/><![endif]-->	
<!--[if lte IE 6]><link rel="stylesheet" media="screen" href="css/ie6.css"/><![endif]-->
<!--[if IE 7]><link rel="stylesheet" media="screen" href="css/ie7.css"/><![endif]-->
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
	function produceExcel(){
		var excelType=[];
		$('input[name="excelType"]:checked').each(function(){    
			excelType.push($(this).val());    
			  });
		alert(excelType);
	    $.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/produceExcel',
			dataType:'json',
			data:"excelType="+excelType,
			callBackFn:function(msg){
				if(msg!=""){
					$("#success").html(msg);
				}
			}
		}); 
	}
   function showFrame(title,url,width,height){
			ShowIframe(title,url,width,height);
	  }
   function closeFrame(){
			ClosePop();
	  }
</script>
</head>

<body>
    <div class="right">
    	<div class="xcdl1">
        	<p style="margin:10px 0; display:block;">勾选记录薪酬福利：</p>
        	<span class="scx" style="margin:0px; margin-bottom:10px;">
            	<input type="checkbox" name="excelType" id="excelType" value="0"/>个人所得税
                <input type="checkbox" name="excelType" id="excelType" value="1"/>社保
                <input type="checkbox" name="excelType" id="excelType" value="2"/>绩效
                <input type="checkbox" name="excelType" id="excelType" value="3"/>奖惩
                <input type="checkbox" name="excelType" id="excelType" value="4"/>提成                
            </span>
        	<input type="button" class="sc_but" onclick="produceExcel();"/>
        	<p>
            	重大提醒：<br />
				生成薪酬福利报表之前，请确认绩效、奖惩、考勤、提成、计件、异动都已经录入无误！
            </p>
            <input type="button" class="jd_but" />
            <span id="success"></span>
        </div>
      </div>  
<!--end中间-->
</body>
</html>