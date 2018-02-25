<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>邀请好友</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/iframeSetHeight.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
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
	
	var Constant = {
			isOnline : [//是否在线
			            {id:-1,text:'不限'},{id:0,text:'在线'},{id:1,text:'离线'}
			],
			userCity : [//现居城市
			        {id:'深圳市',text:'深圳市'},{id:'上海市',text:'上海市'},{id:'北京市',text:'北京市'},{id:'广州市',text:'广州市'},{id:'中山市',text:'中山市'},{id:'重庆市',text:'重庆市'}
			],
			registeredAddress : [//户籍地址
			                     {id:-1,text:'不限'},{id:1,text:'深圳市'},{id:2,text:'上海市'},{id:3,text:'北京市'},{id:4,text:'广州市'},{id:5,text:'中山市'},{id:6,text:'重庆市'}
			],
			jinyan : [
				        {id:1,text:'1年'},{id:2,text:'2年'}
			],
			sex : [//现居城市
			       {id:-1,text:'不限'},{id:0,text:'男'},{id:1,text:'女'}
			]
	};
	
	$("#isOnline").htmlSelect({data:Constant.isOnline,selectId:-1,absolute:false} );
	$("#userCity").htmlSelect({data:Constant.userCity,selectId:'深圳市',absolute:false} );
	$("#registeredAddress").htmlSelect({data:Constant.registeredAddress,selectId:-1,absolute:false} );
	$("#jinyan").htmlSelect({data:Constant.jinyan,selectId:1,absolute:false} );
	$("#sex").htmlSelect({data:Constant.sex,selectId:-1,absolute:false} );
	
	
	var curPage=${curPage};
	var pageCount=${pageCount};
	
	var isOnline;
	var userCity;
	var registeredAddress;
	var sex;
	var keyWord;
	
	
	$("#fenye").pager({curPage:curPage,pageSize:6, pageCount:pageCount, goPageCall:goPage});
	
	function goPage(curPage, pageSize){
		<c:if test="${subBtn==null}">
			window.location.href="findFriends?curPage="+curPage+"&pageSize="+pageSize+"&userId=1";
		</c:if>
		<c:if test="${subBtn!=null}">
			isOnline=${map.isOnline==null ? -1:map.isOnline};
			userCity=${map.userCity==null ? "null":map.userCity};
			registeredAddress=${map.registeredAddress==null ? -1 : map.registeredAddress};
			sex=${map.sex == null ? -1 : map.sex};
			keyWord=${map.keyWord == null? "null":map.keyWord};
			window.location.href="findFriends?subBtn=1&curPage="+curPage+"&pageSize="+pageSize+"&isOnline="+isOnline+"&userCity="+userCity+"&registeredAddress="+registeredAddress+"&sex="+sex+"&keyWord="+keyWord;
		</c:if>
	}
});

function checkInput(){
	alert('submit');
	$("#findFriendForm").submit();
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

function sendMsg(id){
	setFriendId();
	document.getElementById("friendId").value=id;
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

</script>
</head>

<body>
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
                	<img src="images/2.jpg" /><font><a href="index-haoyou-yao.html">邀请好友</a></font>               </div>
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
	   
	   <form action="findFriends?subBtn=1" method="post" id="findFriendForm">
         <ul class="Y01homeSOSO"> 
		   <li><span>
		   	<input class="Y01homeSOSOinput" type="text" id="isOnline" name="isOnline"  value="请输入..." />
             </span>在线状态：
             </li>
            <li><span><input class="Y01homeSOSOinput" type="text" id="userCity" name="userCity"  value="请输入..." />
             </span>常驻地：</li>
			 <li><span><input class="Y01homeSOSOinput" type="text" id="registeredAddress" name="registeredAddress"  value="请输入..." />
             </span>籍贯：</li>
			  <li><span><input class="Y01homeSOSOinput" type="text" id="jinyan" name="jinyan" value="请输入..." />
             </span>经验：</li>
           <li><span><input type="text" class="Y01homeSOSOinput" id="sex" name="sex" value="请输入..." />
             </span>性别：</li>
            <li><input class="Y01input" name="keyWord" type="text" value="请输入关键词" onfocus="this.value=''" />
            	<input name="subBtn" type="image" src="images/Y01SOSO.gif" onclick="checkInput" />
            </li>
         </ul>

          </form>
	   
	   
	  <div class="Rightleft">
	     <div class="jiange-z">
                  <span class="tltle-wenzi">邀请好友</span>
                  <span  class="title-line" style="width:438px;"></span>
              </div> 
	<c:forEach items="${friends}" var="friend">
		<div class="kehu-c">
			<dl>
				<a href="index-haoyou-xiangqing.html"><img src="${friend.userInfo.photoPath }" border="0" /></a>
				<dt><span><a href="javaScript:showStatInfo(${friend.userInfo.userId})">详细统计</a></span><span><a href="#">发信息</a></span><span><a href="javaScript:sendMsg(${friend.userInfo.userId})">留言</a></span><span><a href="HomeTJFXY4.html">推荐</a></span>姓名： <a href="index-haoyou-xiangqing.html">${friend.userInfo.name}</a></dt>
				<dt>生日：<fmt:formatDate value="${friend.userInfo.firstWorkDate}" pattern="yyyy年MM月dd日" type="date"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;常住地： ${friend.userInfo.userCity }</dt>
				<dt>手机号：${friend.userInfoDetail.cellphone} &nbsp;&nbsp;&nbsp;  兴趣爱好：${friend.userInfoDetail.hobbies} </dt>
			</dl>
		</div>	  
	</c:forEach> 
		   
		   <!--页面切换--> 
	<div id="fenye"></div>
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
				   <input type="hidden" name="invite" id="invite" value="-1"/>
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
