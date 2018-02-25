<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好友管理</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/iframeSetHeight.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
<link rel="stylesheet" href="css/eagent/f_layuod.css" type="text/css"/>
<link rel="stylesheet" href="css/eagent/f_tanchu.css" type="text/css"/>
<script type="text/javascript" src="js/DD_belatedPNG.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
	
	
	var Constant={
			city : [//现居城市
			        {id:'不限',text:'不限'},{id:'深圳市',text:'深圳市'},{id:'上海市',text:'上海市'},{id:'北京市',text:'北京市'},{id:'广州市',text:'广州市'},{id:'中山市',text:'中山市'},{id:'重庆市',text:'重庆市'}
			],
			sex : [
			        {id:-1,text:"不限"},{id:0,text:"男"},{id:1,text:'女'}
			]
	};
	
	$("#city").htmlSelect({data:Constant.city,selectId:'不限'} );
	$("#sex").htmlSelect({data:Constant.sex,selectId:-1} );
	
	
});

function checkForm(){
	var city=$("input[name=city]").val();
	var sex=$("input[name=sex]").val();
	
	if(strTrim(city)=="所在地"){
		$("input[name=city]").val("");
	}
	if(strTrim(city)=="性别"){
		$("input[name=sex]").val("");
	}
	myform=document.getElemenById("findForm");
	myform.action="eagent_friend_jumpFriends";
	myform.method="post";
	return true;
}

function settab_zzjs(name,num,n){
	 for(i=1;i<=n;i++){
	  var menu=document.getElementById(name+i);
	  var con=document.getElementById(name+"_"+"zzjs"+i);
	  menu.className=i==num?"on_zzjs":"";
	    con.style.display=i==num?"block":"none";
	 }
	 if(num==1)
	 	$("#frameName").val("select");
	 if(num==2)
		 	$("#frameName").val("user");
	 if(num==3)
		 	$("#frameName").val("friend");
}
function strTrim(str){   
    return str.replace(/(^\s*)|(\s*$)/g,   "");  
}

function setFriendId(){
	$("#msgDiv").css({ position:"fixed", left:"50%",top: "50%", margin:"-50px 0 0 -50px"});
	$("#msgDiv").show();
}
function colseMsgDiv(){
	$("#msgDiv").hide();
}
function checkMsgForm(){
	if(strTrim($("#msgContent").val())=='' || $("#msgContent").val()==null){
		alert('留言不能为空');
		return false;
	}
	return true;
}
function loadMsg(msgStr){
	if(msgStr!="" && msgStr!=null){
		if(msgStr<0){
			alert('系统繁忙,请重新发送留言');
		}
	}
}

function showStatInfo(id){
	$.ajax({
		"url" : "statUserInfo?"+"userId="+id+"&math="+Math.random(),
		"type" : "POST",
		"dateType" : "json",
		"success" : function(data) {
			if(data!=null){
				$("#skimHouseCnt").html(data.skimHouseCnt);
				$("#saleHouseCnt").html(data.saleHouseCnt);
				$("#priceHouseCnt").html(data.priceHouseCnt);
				$("#discussHouseCnt").html(data.discussHouseCnt);
				$("#customerCnt").html(data.customerCnt);
				$("#customerContactCnt").html(data.customerContactCnt);
				$("#customerEventCnt").html(data.customerEventCnt);
				$("#customerLookCnt").html(data.customerLookCnt);
				$("#customerHousegroupCnt").html(data.customerHousegroupCnt);
				$("#customerDiscussCnt").html(data.customerDiscussCnt);
				$("#customerBuyhouseCnt").html(data.customerBuyhouseCnt);
				$("#friendCnt").html(data.friendCnt);
				$("#recommendTofriendCnt").html(data.recommendTofriendCnt);
				$("#recommendTocustomerCnt").html(data.recommendTocustomerCnt);
				
				var aArray=$("#statInfoDiv a");
				for(var i=0;i<aArray.size();i++){
					aArray[i].href="jumpStatUserInfo?userId="+id;
				}
				 
				$('#statInfoDiv').show();
			}else{
				alert('系统繁忙,请重试！');
			}
		}
	});
}
</script>
<style>
	.on_zzjs{color:#bb0e13; border-top:1px solid #D1D2D4; border-left:1px solid #D1D2D4; border-right:1px solid #D1D2D4; background:#EAEAEC;}
	.SelectOuts{height:55px; margin:8px auto 0; width:990px;}
	.SelectOuts .selectRights{ width:990px; float:left; margin:20px 0 0 0;}
	.selectRights .single{ height:22px;}
	.selectRights span{width:99px; float:left; margin-left:7px; display:block;position:relative; _margin-left:2px;}
	.selectRights input{border:#36a3e0 1px solid; color:#9bc7e0; font-family:"����"; font-size:12px; width:95px; height:23px; background:url(images/select_img.jpg) 73px center no-repeat; vertical-align:middle; line-height:22px; background-color:#eaeaeb;}
	.selectRights span .Menu {width:99px;display:none;background: #FFF; border:#0566ad 1px solid; position:absolute; top:18px; left:0; z-index:9999; _top:21px; _left:2px;}
	.SelectOuts .selectRights .multiples{ margin:5px 0; width:990px; clear:both; overflow:hidden; margin-top:8px; _margin-left:1px;}
	.SelectOuts .multiples input{ margin-left:5px; width:99px; float:left; _margin-left:4px;}
	.SelectOuts .multiples form{ float:left;}
	.SelectOuts .multiples .selectText{ background-image:none; width:199px; background-color:#eaeaeb; text-indent:5px; height:23px; line-height:23px; _width:199px;}
	.SelectOuts .multiples .selectBut{height:21px; border:none; width:101px;}
</style>
</head>

<body onload="loadMsg(${row})">
<!--头部-->
<%@include file="EHeader.jsp" %>
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
                	<img src="images/1.jpg" /><font><a href="index-haoyou.html">好友管理</a></font>                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="jumpInvite">邀请好友</a></font>               </div>
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
    <div class="SelectOuts">
    	<div class="banner"><img src="images/Banner1.jpg" /></div>
        <div class="selectRights">
		 <div class="multiples">     
          <form id="findForm" action="" onsubmit="return checkForm()" method="post">     	
             <input type="text" value="所在地" id="city" autocomplete="off">
             <input type="text" value="性别" id="sex" autocomplete="off">
             
             <input type="hidden" id="submitBtn" name="submitBtn" value="${map.submitBtn=='' ? '提交':''}" />
                <input type="text" value="请输入关键词" onclick="this.select();" name="keyWord" id="keyWord" class="selectText"/>
                <input type="submit" value="提交" src="images/seachBut1.jpg" class="selectBut"/>
              </form>
           </div>
	   
	   
	  <div class="Rightleft">
	    <div class="huodong_tab">
	           <ul>
		            <li id="zzjs1" onmouseover="settab_zzjs('zzjs',1,3)" class="on_zzjs">全部好友</li>
					<li id="zzjs2" onmouseover="settab_zzjs('zzjs',2,3)">我关注的好友</li>
					<li id="zzjs3" onmouseover="settab_zzjs('zzjs',3,3)">关注我的好友</li>
				</ul>
	         </div>
			 <div id="zzjs_zzjs1" class="kehu-c" >
		           <iframe id="select" name="select" src="myFriends?frameName=&sex=${sex}&city=${city}&curPage=1&pageSize=3"  style="scroll-face-color:#ffffff"
						width="100%" height="560" scrolling="no" frameborder="no">
					</iframe>    
		      </div>
		      
		       <div id="zzjs_zzjs2" class="kehu-c" style="display: none;">
		          <iframe id="user" name="friend" src="myFriends?frameName=user&sex=${sex}&city=${city}&curPage=1&pageSize=3"  style="scroll-face-color:#ffffff"
						width="100%" height="560" scrolling="no" frameborder="no">
					</iframe>       
		      </div>
		      
		       <div id="zzjs_zzjs3" class="kehu-c" style="display: none;">
		           <iframe id="friend" name="friend" src="myFriends?frameName=friend&sex=${sex}&city=${city}&curPage=1&pageSize=3"  style="scroll-face-color:#ffffff"
						width="100%" height="560" scrolling="no" frameborder="no">
					</iframe>       
		      </div>
		   <!--页面切换--> 
	
	   <!--页面切换--> 	
		   
		
		  <div class="tanchuc" id="msgDiv" style="display: none;">
		     <div class="tanchusc">
		      <div class="tanchuc-tel">
		         <img src="images/chengshi.png" width="146" height="52" />
		         <span><a href="javaScript:colseMsgDiv()">[ 关闭 ]</a></span>
		      </div>
		      <div class="tanchuc-tel-right"></div>
		      </div>
		      
		      <div class="tanchuc-co">
		         <div class="tanchuc-cos">
		         <form action="sendMsg" method="post" id="msgForm" onsubmit="return checkMsgForm()">
				   <input type="hidden" name="friendId" id="friendId" value="-1" />
		           <textarea cols="10" name="msgContent" id="msgContent" rows="10" style="width: 370px; height: 66px;margin: 5px 10px; border: 1px solid blue;"></textarea>
		            <input type="submit" name="subBtn" value="提交"/>
		          </form>
		         </div>
		      </div>
		      <div class="tanchuc-bottom">
		         <div class="tanchuc-bottom-left"><img src="images/bottom-leftbg.png" width="17" height="16" /></div>
		         <div class="tanchuc-bottom-con"></div>
		         <div class="tanchuc-bottom-right"><img src="images/rightjiao-bg.png" width="16" height="16" /></div>
		      </div>
		      
  		 </div>
		
		   
	  </div>
	  
     <div id="statInfoDiv" class="Rightright" style="display: none;">
       <ul class="Y2kehu" style=" margin:38px 0 0 0; background:url(images/Y2cjsj.gif) left top no-repeat;">
			<li><span id="skimHouseCnt">0</span><a href="jumpStatUserInfo" target="_blank">关注楼盘数:</a></li>
			<li><span id="saleHouseCnt">0</span><a href="jumpStatUserInfo" target="_blank">认售楼盘数:</a></li>
			<li><span id="priceHouseCnt">0</span><a href="jumpStatUserInfo" target="_blank">喊价楼盘数:</a></li>
			<li><span id="discussHouseCnt">0</span><a href="jumpStatUserInfo" target="_blank">评论楼盘数:</a></li>
			<li><span id="customerCnt">0</span><a href="jumpStatUserInfo" target="_blank">客户数量:</a></li>
			<li><span id="customerContactCnt">0</span><a href="jumpStatUserInfo" target="_blank">客户交流数:</a></li>
			<li><span id="customerEventCnt">0</span><a href="jumpStatUserInfo" target="_blank">客户参加活动数:</a></li>
			<li><span id="customerLookCnt">0</span><a href="jumpStatUserInfo" target="_blank">客户看房数:</a></li>
			<li><span id="customerHousegroupCnt">0</span><a href="jumpStatUserInfo" target="_blank">客户参团数:</a></li>
			<li><span id="customerDiscussCnt">0</span><a href="jumpStatUserInfo" target="_blank">客户评论数:</a></li>
			<li><span id="customerBuyhouseCnt">0</span><a href="jumpStatUserInfo" target="_blank">客户成交数:</a></li>
			<li><span id="friendCnt">0</span><a href="jumpStatUserInfo" target="_blank">好友数量:</a></li>
			<li><span id="recommendTofriendCnt">0</span><a href="jumpStatUserInfo" target="_blank">向好友推荐楼盘数:</a></li>
			<li><span id="recommendTocustomerCnt">0</span><a href="jumpStatUserInfo" target="_blank">向客户推荐楼盘数:</a></li>
		</ul>
      </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>
