<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="css/fparty/layout.css" />
<link rel="stylesheet" href="css/eagent/tanchu.css" type="text/css"/>
<script type="text/javascript" src="js/popupBox.js"></script>
<script type="text/javascript">
$(function(){
	if('${userInfo.userId}'==null ||'${userInfo.userId}'==''){
		$("#change_click").attr("onclick","").click(function(){
			alert("您目前还没有房秘书！赶快寻找您的房秘书吧");
		}) ;
		$("#complaint_click").attr("onclick","").click(function(){
			alert("您目前还没有房秘书！赶快寻找您的房秘书吧");
		}) ;
	}
});
function submitChange(){
	var changeMsg=$("#ChangeMsg").val();
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/cusChangeUser',
		dataType:'json',
		data:"msgContent="+changeMsg+"&receiveUserId=${userInfo.userId}&receiveUserType=0&msgType=3"
			+"&sendUserName=${customer.name}&sendUserType=1",
		callBackFn:function(msg){
			$("#ChangeMsg").val("");
			closeBox("changeFeng");
			if(msg=='SUCCESS'){
				$("#nickname_name").html("");
				$("#nickname_brithday").html("");
				$("#nickname_phone").html("");
				$("#nickname_address").html("");
				$("#nickname_msg").html("");
			}
		}
	});
}

function submitComplaint(){
	var complaintMsg=$("#complaintMsg").val();
	$.fc.ajaxSubmit({
		url:'${pageContext.request.contextPath}/cusComplaint',
		dataType:'json',
		data:"msgContent="+complaintMsg+"&receiveUserId=${userInfo.userId}&receiveUserType=0&msgType=4"
			+"&sendUserName=${customer.name}&sendUserType=1",
		callBackFn:function(msg){
			$("#complaintMsg").val("");
			closeBox("complaint");
			
		}
	});
}

</script>
  			 <div class="Rnickname">
        		<span class="nicknameLeft"><img src="images/touxiang.jpg" style="width: 103px;height: 104px;" /></span>
                <span class="nicknameRight">
                	<form><input type="image" src="images/wdfmBut.jpg" /></form>
                	<ul>
                    	<li><a href="getUserInfoList">我要寻找蜂蜜</a></li>
                        <li><a id="change_click" href="#" onclick="showBox('changeFeng')">我想换蜂蜜</a></li>
                        <li><a id="complaint_click" href="#" onclick="showBox('complaint')">我要投诉</a></li>
                        <li><a href="MyFengMi?customerId=${customerId}">我要给蜂蜜留言</a></li>
                        <li><a href="MyFengMi?customerId=${customerId}">蜂蜜正在线(发消息)</a></li>
                    </ul>
                </span>
                <ul class="nicknameUl">
                	<li >姓名：<span id="nickname_name">${userInfo.name}</span></li>
                    <li >出生年月：<span id="nickname_brithday"><fmt:formatDate value="${userInfo.birth}" pattern="yyyy.M" /></span></li>
                    <li>联系电话：<span id="nickname_phone">${userInfo.userInfoDetail.cellphone}</span></li>
                    <li>常驻地址：<span id="nickname_address">${userInfo.userCity}</span></li>
                    <li>她给您的消息( <font><span id="nickname_msg">${countMsg}</span></font> )</li>
                </ul>
          </div>
          
          <!--我想换蜜蜂-->   
 <div class="tanchuc" id="changeFeng">
     <div class="tanchusc">
      <div class="tanchuc-tel">
         <img src="images/mifeng.png" width="146" height="52" />
         <span><a href="#" onclick="closeBox('changeFeng')">[ 取消 ]</a></span>
      </div>
      <div class="tanchuc-tel-right"></div>
      </div>
      
      <div class="tanchuc-co">
         <div class="tanchuc-cos">
        
           <form action="" method="get"><textarea id="ChangeMsg" name="myeara" class="" reg="" tip="不能为空" cols="39" rows="6" style="width:378px; height:100px; line-height:22px; text-indent:1em;">请输入更换蜜蜂理由:</textarea>
	    <span class="tijiao"><a href="#" onclick="submitChange();"><img src="images/submit-b.gif" width="50" height="17" /></a></span>
           </form> 
         
         </div>
        
      </div>
      <div class="tanchuc-bottom">
         <div class="tanchuc-bottom-left"><img src="images/bottom-leftbg.png" width="17" height="16" /></div>
         <div class="tanchuc-bottom-con"></div>
         <div class="tanchuc-bottom-right"><img src="images/rightjiao-bg.png" width="16" height="16" /></div>
      </div>
      
   </div> 
 
 <!--我投诉-->   
 <div class="tanchuc" id="complaint">
     <div class="tanchusc">
      <div class="tanchuc-tel">
         <img src="images/tousu.png" width="146" height="52" />
         <span><a href="#" onclick="closeBox('complaint')">[ 取消 ]</a></span>
      </div>
      <div class="tanchuc-tel-right"></div>
      </div>
      
      <div class="tanchuc-co">
         <div class="tanchuc-cos">
        
           <form action="" method="get"><textarea id="complaintMsg" name="comeara" class="" reg="" tip="不能为空" cols="39" rows="6" style="width:378px; height:100px; line-height:22px; text-indent:1em;">请输入投诉信息</textarea>
	    <span class="tijiao"><a href="#" onclick="submitComplaint();"><img src="images/submit-b.gif" width="50" height="17" /></a></span>
           </form> 
         
         </div>
        
      </div>
      <div class="tanchuc-bottom">
         <div class="tanchuc-bottom-left"><img src="images/bottom-leftbg.png" width="17" height="16" /></div>
         <div class="tanchuc-bottom-con"></div>
         <div class="tanchuc-bottom-right"><img src="images/rightjiao-bg.png" width="16" height="16" /></div>
      </div>
      
   </div>