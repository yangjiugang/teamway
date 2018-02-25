<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加客户资料</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/newCusYanz.js"></script>
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
</script>
<script type="text/javascript">
var nameOK = true;
var phoneOK = true;
var emailOK = true;
var isOK = true;
function setSubmit(){
	if(nameOK && phoneOK && emailOK){
		$("#tijiao").removeAttr("disabled");
	}else{
		$("#tijiao").attr("disabled","disabled"); 
	}
}
function checkName(){
	$("#name_error").html("");
	$("#name").css("border-color", "");
	if(($("#name").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
		$("#name_error").html("姓名必须填写");
		$("#name").css("border-color", "red");
		nameOK = false;
		setSubmit();
	}else{
		if(checkTeshu('#name','#name_error') == false){
			$("#name_error").html("姓名不能含特殊字符");
			$("#name").css("border-color", "");
			nameOK = false;
			setSubmit();
		}else{
			nameOK = true;
			setSubmit();
		}
	}
}
function checkPhone(){
	$("#cellphone_error").html("");
	$("#cellphone").css("border-color", "");
	if(($("#cellphone").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
		$("#cellphone_error").html("手机号必须填写");
		$("#cellphone").css("border-color", "red");
		phoneOK =false;
		setSubmit();
	}
	if(!/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/.test($("#cellphone").val())){
		$("#cellphone_error").html("请填定正确的手机号");
		$("#cellphone").css("border-color", "red");
		phoneOK =false;
		setSubmit();
	}else{
		phoneOK = true;
		setSubmit();
	}
}
function checkEmail(){
	$("#email_error").html("");
	$("#email").css("border-color", "");
	if(($("#email").val().replace(/(^\s*)|(\s*$)/g, ''))==''){
		$("#email_error").html("邮箱必须填写");
		$("#email").css("border-color", "red");
		eamilOk = false;
		setSubmit();
	}
	if(!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test($("#email").val())){
		$("#email_error").html("请填定正确的邮箱");
		$("#email").css("border-color", "red");
		eamilOk = false;
		setSubmit();
	}else{
		eamilOk = true;
		setSubmit();
	}
}
</script>
</head>

<body>
<!--头部-->
<div class="FlhTopOut">
	<div class="FlhTop">
        <div class="FlhLogo"></div>
		<div class="TopRight">
            <span class="FLHphone"><div>服务热线：</div><img  src="images/phone2.jpg"/><font>400 61355288</font></span>
        </div>
		<div id="menu">
		     <ul>
          <li><a href="IndexA">首页</a></li>
					<li><a href="IndexGeren" id="cur">个人主页</a></li>
					<li><a href="IndexBA">客户</a></li>
					<li><a href="IndexFang">房源</a></li>
					<li><a href="JiaoyiY4">订单</a></li>
					<li><a href="Y52xuexi">学习</a></li>
					<li><a href="IndexHaoyou">好友</a></li>
					<li><a href="Y7chihewanle">吃喝玩乐</a></li>
					<li><a href="IndexXiaoxi">消息</a></li>
		  </ul>
			          </div>
        
	</div>
</div>
<div class="FLHEscOUT">
	<div>
    	<font>欢迎您进入房乐会! <a href="Denglu">[安全退出]</a></font>
    </div>
</div>
<!--End头部-->
<div class="middle">
<!--左边-->
 	<div class="FLHLeft">
    	<div class="FLHzl">
        	<span class="photo"><img src="images/touxiang.jpg" /></span>
            <ul class="nickname">
            	
                <li>姓名：赵美丽</li>
                <li>生日：8.26</li>
                <li><img src="images/8%.jpg" /></li>
            </ul>
            <span class="linkage">
            	<span style="margin:0;"><a href="">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a href="">[修改密码]</a></span>           
            </span>
        </div>
		<div class="jieshao">
		   <ul>
		   <li> 已有<span class="red">3</span>同行加你为好友</li> 
           <li> 已有<span class="red">3</span>客户点名你为房秘书</li>
		   </ul>
	  </div>
        <ul class="treeNav">
		   <li>
					<div class="treefont">
						<img src="images/1.jpg" /><font><a
							href="Y03juluyuehuiKehu">约会管理</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/2.jpg" /><font><a href="IndexKehuTianjia">添加客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/3.jpg" /><font><a href="IndexBA">全部客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/4.jpg" /><font><a href="IndexBC">下过单的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/5.jpg" /><font><a href="IndexBE">看过房的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/6.jpg" /><font><a href="IndexBD">参加过购房团的客户</a>
						</font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/7.jpg" /><font><a href="IndexBF">参加过活动的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/8.jpg" /><font><a href="IndexBB">发表过评论的客户</a></font>
					</div>
					<div class="xian"></div>
				</li>
            <li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><font><a href="#">客户分析</a></font>
               </div>
                <div class="xian"></div>
            </li>
            <li>&nbsp;</li>
			<li>&nbsp;</li>
            <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><a href=""><font>我的财富</font></a>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><a href=""><font>积分商场</font></a>
               </div>
                <div class="xian"></div>
            </li>
			<li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><a href=""><font>积分兑换</font></a>
               </div>
                <div class="xian"></div>
            </li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
             <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><font><a href="../funlifun/monopolyofsale.html">搜索房源</a></font>               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><font><a href="../funlifun/monopolyofsale(L).html">搜索购房团</a></font>               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/12.jpg" /><font><a href="#">搜索活动</a></font>
               </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/12.jpg" /><font><a href="../funlifun/monopolyofsaleM2.html">搜索蜂蜜</a></font>
               </div>
                <div class="xian"></div>
            </li>
        </ul>
    </div>
<!--End左边-->
<!--右边-->
    <div class="FLHRight">
		<div class="registerOut">
        	<div id="registerFont">添加客户资料</div>
            
        <form action="KehuZhuece" method="post" >
            
            <div>
            <span><label>E-mail：</label><input type="text" name="email" id="email" onblur="checkEmail();"/><font>*</font><p id="email_error" style="color: red;margin-left: 120px;margin-top: 0px;height:25px; "></p></span>
            <span><label>手机号码：</label><input type="text" name="cellphone" id="cellphone" onblur="checkPhone();"/><font>*</font><p id="cellphone_error" style="color: red;margin-left: 120px;margin-top: 0px;height:25px;"></p></span>
            <span><label>身份证号码：</label><font>&nbsp;</font><input type="text" name="iDNum"/>&nbsp;</span>
            <span><label>姓名：</label><input type="text" name="name" id="name" onblur="checkName();"/>&nbsp;<font>*</font><br><p id="name_error" style="color: red;margin-left: 120px;margin-top: 0px;height:25px;"></p></span>
                      
            </div>
            
            <div id="zctj">
            <input id="tijiao" type="image" src="images/Next.jpg" style="width: 73px;height: 25px;" disabled="disabled">
            </div>
            </form> 
        </div>
        
    </div>
<!--End右边-->   
</div>
</body>
</html>
