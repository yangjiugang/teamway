<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TVS9000</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easyui/themes/black/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/ztree/css/zTreeStyle/zTreeStyle.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/style/common-6.0.css">
<link rel="icon" href="<%=basePath %>/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="<%=basePath %>/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath %>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/ztree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.cookie.js"></script>



<style type="text/css">
body{
	background:#666;
}

.l-btn {
  background: linear-gradient(to bottom,#4b91da 0,#224e84 100%);
}
.l-btn:hover {
  background: #4b91da;
  color: #fff;
  border: 1px solid #555;
  filter: none;
}

</style>
<script type="text/javascript">
	
$(window).resize(function(){ 
    $("#loginPanel").css({ 
        position: "absolute", 
        left: ($(window).width() - $("#loginPanel").outerWidth())/2, 
        top: ($(window).height() - $("#loginPanel").outerHeight())/3 
    });        
}); 
	
	
	$(document).ready(function() {
		 $(window).resize(); 
		 
		 $('#username').textbox({
			    iconCls:'icon-man',
			    iconAlign:'left'
		 })
		 
	
		
		var name = $.cookie('logion_cookie_username');
		var pwd = $.cookie('logion_cookie_password');
		
		if(name !== 'null'){
			$('#username').textbox('setValue',name);
			$('#password_').textbox('setValue',pwd);
			 $('#password_').passwordbox('hidePassword');
			
		
		}else{
			 $('#password_').passwordbox('showPassword');
		}
		
		var isSave = $.cookie('logion_cookie_save');
		if(isSave ==1){
			$('#savePwd').attr("checked", true)
		}else{
			$('#savePwd').attr("checked", false)
		}
		
	});
	
	
	
	function userLogin()
	{
        var name = $('#username').val();
        var pwd = $('#password_').val();
		$.ajax({
			type: "POST",
			url: 'loginAuth',
			dataType:'json',
			data: {username:name,password:pwd},
			success: function(data, textStatus) {
				if(data.error==-1){
					$.messager.alert('提示',data.msg);
					return;
				}else{
					
					if($('#savePwd').is(':checked')) {
						$.cookie('logion_cookie_username',name, { expires: 30, path: '/' }); 
						$.cookie('logion_cookie_password',pwd, { expires: 30, path: '/' });
						$.cookie('logion_cookie_save',1, { expires: 30, path: '/' });
					}else{
						$.cookie('logion_cookie_username',null); 
						$.cookie('logion_cookie_password',null);
						$.cookie('logion_cookie_save',null);
					}
					self.location = "<%=basePath %>"; 
				}
			},
			error: function() {
				$.messager.alert('错误','服务器错误!');
			}
		});
	}
	
</script>
</head>

<body >

	   <div id="loginPanel" style="width:360px;height:240px;padding:10px; border:1px solid #444; background:#444;">
       
       <div style="margin-bottom:20px;margin-left:100px;color:#fff;">
       		<label>TVS9000配置工具</label>
       </div>
       <div style="margin-bottom:10px; margin-left:60px;">
            <input class="easyui-textbox" id="username" style="width:80%;height:32px;padding:12px" data-options="prompt:'用户名',iconCls:'icon-man',iconWidth:30">
        </div>
        <div style="margin-bottom:20px; margin-left:60px;">
            <!-- 
            <input class="easyui-textbox" type="password"  id="password"  style="width:80%;height:32px;padding:12px" data-options="prompt:'请输入密码',iconCls:'icon-lock',iconWidth:30">
             -->
             <input class="easyui-passwordbox" prompt="密码" iconWidth="28" id="password_"  style="width:80%;height:32px;padding:12px" data-options="iconAlign:'left'">
             
             <!-- 
              <input  class="easyui-passwordbox" prompt="Password"  iconWidth="28" id="password"   style="width:80%;height:32px;padding:12px" data-options="iconCls:'icon-lock',iconWidth:30,iconAlign:'right' "  >
 -->
        
        </div>
        <div style="margin-bottom:20px;margin-left:60px;">
            <input type="checkbox" checked="checked" id="savePwd">
            <span>记住密码</span>
        </div>
        <div style="margin-left:60px;">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:80%;"  onClick="userLogin()" > 
                <span style="font-size:14px;">登录</span>
            </a>
        </div>
        
    	</div>
	
	
	<script>
	
	
	$.parser.onComplete = function()
	{
	
	}
	
	
	</script>
</body>
</html>