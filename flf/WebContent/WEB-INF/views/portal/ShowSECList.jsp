<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>新房专卖</title>
<link href="css/portal/SEC_globle3.css" rel="stylesheet" type="text/css" />
<link href="css/portal/SEC_index.css" rel="stylesheet" type="text/css"/>
<link href="css/portal/SEC_index3.css" rel="stylesheet" type="text/css"/>
<link href="css/portal/SEC_layout.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<link rel="stylesheet" type="text/css" href="css/portal/layout.css" />
<link rel="stylesheet" type="text/css" href="css/portal/Y01home.css" />
<link rel="stylesheet" type="text/css" href="js/htmlSelect/htmlSelect.css" />

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/iframeSetHeight.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/Layer.js"></script>
<script type="text/javascript" src="js/htmlSelect/htmlSelect.js"></script>
<script type="text/javascript" src="js/popupBox.js"></script>

<style>
	.fangmi{ width:268px; margin:8px auto 0 auto; float:left;}
	.fangmi dl{ width:268px; margin:5px 0 3px 0; border-bottom:1px dashed #DCDDDE; float:left; padding:0px 0 8px 0;}
	.fangmi dl img{ padding:1px; border:1px solid #DCDDDE; width:49px; height:54px; float:left;}
	.fangmi dl dd{ width:200px; float:right; line-height:20px;}
	.fangmi dl dd span{ width:90px; float:left;}
	
	.SelectOuts{height:55px; margin:8px auto 0; width:990px;}
	.SelectOuts .selectRights{ width:990px; float:left; margin:20px 0 0 0;}
	.selectRights .single{ height:22px;}
	.selectRights span{width:99px; float:left; margin-left:7px; display:block;position:relative; _margin-left:2px;}
	.selectRights input{border:#36a3e0 1px solid; color:#9bc7e0; font-family:"宋体"; font-size:12px; width:95px; height:23px; background:url(images/select_img.jpg) 73px center no-repeat; vertical-align:middle; line-height:22px; background-color:#eaeaeb;}
	.selectRights span .Menu {width:99px;display:none;background: #FFF; border:#0566ad 1px solid; position:absolute; top:18px; left:0; z-index:9999; _top:21px; _left:2px;}
	.SelectOuts .selectRights .multiples{ margin:5px 0; width:990px; clear:both; overflow:hidden; margin-top:8px; _margin-left:1px;}
	.SelectOuts .multiples input{ margin-left:5px; width:99px; float:left; _margin-left:4px;}
	.SelectOuts .multiples form{ float:left;}
	.SelectOuts .multiples .selectText{ background-image:none; width:199px; background-color:#eaeaeb; text-indent:5px; height:23px; line-height:23px; _width:199px;}
	.SelectOuts .multiples .selectBut{height:21px; border:none; width:101px;}
	
	.Idebar{ width:287px; float:right; margin-top:20px;}
.Idebar .bannerBoder{ width:281px; border:#c9c9c9 1px solid; padding:2px;}
.Idebar .SymbianOut{ border:#c9c9c9 1px solid; margin:10px auto; padding:3px;}
.Idebar .SymbianOut h2,.Housing1 h3,.Housing2 h3{ width:279px; background-image:url(images/tittle_Bg.gif); text-indent:15px; color:#FFF; font-size:14px; font-weight:normal; padding-top:12px; letter-spacing:1px; height:18px; position:relative;}
.Idebar .SymbianOut h2 a{ color:#FFF;}
.Idebar .SymbianOut h2 font{ position:absolute; right:20px; font-size:13px;}
	
</style>
<script type="text/javascript">
function showAndHide(obj,types){
	var Layer=window.document.getElementById(obj);
	switch(types){
		case "show":
			Layer.style.display="block";
			break;
		case "hide":
			Layer.style.display="none";
			break;
	}
}
function getValue(obj,str){
	var input=window.document.getElementById(obj);
		input.value=str;
}

$(document).ready(function(){
	
	var Constant = {
			isOnline : [//是否在线
			        {id:0,text:'离线'},{id:1,text:'在线'}
			],
			userCity : [//现居城市
			        {id:'深圳市',text:'深圳市'},{id:'上海市',text:'上海市'},{id:'北京市',text:'北京市'},{id:'广州市',text:'广州市'},{id:'中山市',text:'中山市'},{id:'重庆市',text:'重庆市'}
			],
			registeredAddress : [//户籍地址
				        {id:1,text:'深圳市'},{id:2,text:'上海市'},{id:3,text:'北京市'},{id:4,text:'广州市'},{id:5,text:'中山市'},{id:6,text:'重庆市'}
			],
			jinyan : [//现居城市
				        {id:1,text:'1年'},{id:2,text:'2年'}
			],
			sex : [//现居城市
			        {id:0,text:'女'},{id:1,text:'男'}
			]
	};
	
	var curPage=${curPage};
	var pageCount=${pageCount};
	
	var isOnline;
	var userCity;
	var registeredAddress;
	var sex;
	var keyWord;
	
	
	$("#fenye").pager({curPage:curPage,pageSize:10, pageCount:pageCount, goPageCall:goPage});
	
	function goPage(curPage, pageSize){
		<c:if test="${isLikeFind==null}">
			window.location.href="getUserInfoList?curPage="+curPage+"&pageSize="+pageSize+"&userId=1";
		</c:if>
		<c:if test="${isLikeFind!=null}">
			isOnline=${map.isOnline==null ? -1:map.isOnline};
			userCity=${map.userCity == null ? '':map.userCity};
			registeredAddress=${map.registeredAddress==null ? -1 : map.registeredAddress};
			sex=${map.sex == null ? -1 : map.sex};
			keyWord=${map.keyWord};
			window.location.href="userByLikeFind?userId=1&curPage="+curPage+"&pageSize="+pageSize+"&isOnline="+isOnline+"&userCity="+userCity+"&registeredAddress="+registeredAddress+"&sex="+sex+"&keyWord="+keyWord;
		</c:if>
	}
	
	<c:if test="${isLikeFind!=null}">
		$("#isOnline").htmlSelect({data:Constant.isOnline ,selectId:"${map.isOnline==null ? -1:map.isOnline}"} );
		$("#userCity").htmlSelect({data:Constant.userCity,selectId:"${map.userCity == null ? '':map.userCity}"} );
		$("#registeredAddress").htmlSelect({data:Constant.registeredAddress,selectId:"${map.registeredAddress == null ? '':map.registeredAddress}" });
		$("#jinyan").htmlSelect({data:Constant.jinyan,selectId:"1"} );
		$("#sex").htmlSelect({data:Constant.sex,selectId: "${map.sex == null ? -1 : map.sex}"} );
	</c:if>
	<c:if test="${isLikeFind==null}">
		$("#isOnline").htmlSelect({data:Constant.isOnline} );
		$("#userCity").htmlSelect({data:Constant.userCity,selectId:'深圳市'} );
		$("#registeredAddress").htmlSelect({data:Constant.registeredAddress} );
		$("#jinyan").htmlSelect({data:Constant.jinyan,selectId:"1"} );
		$("#sex").htmlSelect({data:Constant.sex} );
	</c:if>
});

function hello(){
	$("#submitBtn").val("submitBtn");
}

function showInfo(objId){
	goUserInfo(objId);
	$("#showInfo").css({ position:"fixed", left:"10%",top:"20%" ,margin:"-50px 0 0 -50px",display:"block"});
	$("#showInfo").show();
	
}
function checkForm(){
	var isOnline=$("input[name=isOnline]").val();
	var userCity=$("input[name=userCity]").val();
	var registeredAddress=$("input[name=registeredAddress]").val();
	var sex=$("input[name=sex]").val();
	var keyWord=$("input[name=keyWord]").val();
	
	if(isOnline==null || isOnline=='')
		$("input[name=isOnline]").val('-1');
	if(userCity==null || userCity=='')
		$("input[name=userCity]").val('notVal');
	if(registeredAddress==null || registeredAddress=='')
		$("input[name=registeredAddress]").val('-1');
	if(sex==null || sex=='')
		$("input[name=sex]").val('-1');
	if(keyWord==null || keyWord=='')
		$("input[name=keyWord]").val('notVal');
	
	return true;
}
function goUserInfo(userId){
	document.getElementById("SECInfoIframe").src="showSECInfo?userId="+userId;
}
</script>
</head>

<body onbeforeunload="goPage()">
<!--头部-->
<div class="head">
	<div class="loginBarOut">
    	<div class="loginBar">
        	<span class="left"><a href="../FLH/landing.html">[登陆<font>房乐会</font>]</a><a href="../FLH/register.html">[注册]</a> 中国最专业的房地产流通行业社交平台</span>
            <span class="right"><font>易介宝</font><a href="../FLH01/denglu.html">[登陆]</a> | <font>售楼宝</font><a href="../SLB/landing.html">[登陆]</a> | <span class="cc"><a href="">主题会所分布</a></span></span>
        </div>
    </div>
	<div class="logoNav">
    	<div class="logo"></div>
        <ul>
        	<li><a href="index.html"><font>首 页</font></a></li>
            <li><a href="monopolyofsaleM1.html">新房专卖</a></li>
            <li><a href="hotline.html">旅游购房</a></li>
            <li><a href="abroad.html">海外置业</a></li>
            <li><a href="Brand.html">品牌专区</a></li>
        </ul>
        <span>
        	<!--<font style="float:left;">关注城市</font><img src="images/gzcs.jpg" style="float:left;"/>
             <font><a href="">[深圳]</a></font>-->
            <div>
				<font class="font1">关注城市</font><img src="images/gzcs.jpg" style="float:left; margin-top:3px;"/>
                <font class="font2">[深圳]</font>
            </div>
        	<img src="images/TEL.gif" style="float:right;"/>
        </span>
    </div>
    <div class="searchOut">
    	<div>
        	<div class="input1">
                <form>
                    <input type="text" class="inputText" value="请输入关键词" onclick="this.select();"/>
                    <input type="image" src="images/Search.gif" class="inputBut"/>
                </form>
             </div>   
            <span><a href="news.html">武汉| 协信打造浮躁城市里唯一的完美小城</a></span>
        </div>
    </div>
</div>
<!--End头部-->

    
<div class="SelectOuts">
    	<div class="banner"><img src="images/Banner1.jpg" /></div>
        <div class="selectRights">
          
          <div class="multiples">     
          <form  onsubmit="return checkForm()" action="userByLikeFind?userId=1&curPage=1&pageSize=10" method="post">     	
             <input type="text" value="登陆状态" id="isOnline" autocomplete="off">
             <input type="text" value=" 所在地" id="userCity" autocomplete="off">
           
             <input type="text" value=" 籍贯" id="registeredAddress" autocomplete="off">
             
             <input type="text" value=" 经验" id="jinyan" autocomplete="off">
            
             <input type="text" value=" 性别" id="sex" autocomplete="off">
             
             <input type="hidden" id="submitBtn" name="submitBtn" value="${map.submitBtn=='' ? '提交':''}" />
                <input type="text" value="请输入关键词" onclick="this.select();" name="keyWord" id="keyWord" class="selectText"/>
                <input type="submit" value="提交" src="images/seachBut1.jpg" class="selectBut" onclick="hello()"/>
              </form>
           </div>
        </div>
    </div>
    
    
   <div class="conts">
     
   <div class="conters">
     <div class="pailies">
       <div style="overflow:hidden;">
         <div style="width:260px; float:left; line-height:25px;">&nbsp;共有<font color="#FF0000">${rowCount}</font>个符合条件的房秘书<font style="margin-left:30px;">排序方式：</font></div>
         <span>
           <input type="text" id="txt" name="txt" onfocus="showAndHide('List1','show');" onblur="showAndHide('List1','hide');" value="工作经验年限" />
           <div class="Menu" id="List1">
             <ul>
               <li onmousedown="getValue('txt','2011-12-14 10:30:00');showAndHide('List1','hide');">2011-12-14</li>
               <li onmousedown="getValue('txt','美国USA');showAndHide('List1','hide');">美国USA</li>
             </ul>
           </div>
         </span>
       </div>
       <div class="fmstittle">房秘书列表</div>
       </div>
       
      
   <c:forEach items="${userInfos}" var="userInfo" varStatus="status">
    <div class="con-vips" style="border:none; margin:0 0 8px 0;">
	     <dl> 
		     <span class="idm"><img src="${userInfo.photoPath}" /></span>
		     <dd>
			  <ul>
			     <li class="sa">经纪人： ${userInfo.name}</li>
		        <li class="sa">性别：${userInfo.sex==0 ? "男":"女"}</li>
                 
                 <li class="sa">所在地： ${userInfo.userCity }</li>
				 <li class="sa">年龄：xxx</li>
                 
			   </ul>  
		   </dd> 
			<dd><img src="images/gengduo.gif" border="0" onclick="showInfo('${userInfo.userId}')"/></dd>	
			<dd>
			     <ul>
			     
			     <li class="sa">入行时间：<fmt:formatDate value="${userInfo.firstWorkDate}" pattern="yyyy年MM月dd日" type="date"/></li>
				 <li class="sa">擅长楼盘：${userInfo.userSkills}</li>
				 </ul>
			</dd>
			<dd>
                <ul>
                
               <li class="sa">关注人数：${userInfo.bhri }</li> 
			   <li>诚信指数:${userInfo.trustrank}</li>
                </ul>
	      </dd>
            <dt>个人简介：
            	${userInfo.userDesc}
            </dt>
		 </dl>
     </div>
    </c:forEach>    
    
       <div id="fenye">
   	</div>  
	</div>
    
    <div class="Idebar" style="margin:38px 0 0 0;">
      <div class="SymbianOut" style=" float:left;">
   	    <h2><a href="">房秘书一周人气榜</a></h2>
   	    
         <c:forEach items="${skimUsersOnTop }" var="skimUser">
	         <div class="fangmi">
	          <dl>
	            <img src="${skimUser.photoPath }" border="0" />
	            <dd>${skimUser.name}</dd>
	            <dd><span>常住地：${skimUser.userCity}</span><span>关注人数：${skimUser.bhri}</span></dd>
	            <dd>擅长楼盘：${skimUser.userSkills}</dd>
	          </dl>
	        </div>
         </c:forEach>
         
           
      </div>
      <div class="SymbianOut" style=" float:left;">
   	    <h2><a href="">房秘书历史人气榜</a></h2>
        
			<c:forEach items="${skimUsersOnOldTop }" var="skimUser">
	         <div class="fangmi">
	          <dl>
	            <img src="${skimUser.photoPath }" border="0" />
	            <dd>${skimUser.name}</dd>
	            <dd><span>常住地：${skimUser.userCity}</span><span>关注人数：${skimUser.bhri}</span></dd>
	            <dd>擅长楼盘：${skimUser.userSkills}</dd>
	          </dl>
	        </div>
         </c:forEach>

      </div>
      <div class="SymbianOut" style=" float:left;">
   	    <h2><a href="">您最近了解过的房秘书</a></h2>
   	    
   	    <c:forEach items="${skimUsers }" var="skimUser">
	         <div class="fangmi">
	          <dl>
	            <img src="${skimUser.photoPath }" border="0" />
	            <dd>${skimUser.name}</dd>
	            <dd><span>常住地：${skimUser.userCity}</span><span>关注人数：${skimUser.bhri}</span></dd>
	            <dd>擅长楼盘：${skimUser.userSkills}</dd>
	          </dl>
	        </div>
         </c:forEach>
       
      </div>
    </div>
</div>

<!-- SEC INFO -->


<div id="showInfo" style="display:NONE">
<iframe id="SECInfoIframe" name="SECInfoIframe" src=""  style="scroll-face-color:#ffffff"
						width="890" height="500" scrolling="no" frameborder="no">
			</iframe>
</div>

<!-- SEC info -->

<!--尾部-->
	 <div class="footBorder">
	<div class="foot" >
    <div class="dian"></div>
	<div class="footCenter" >
    	<h3><span></span>选择楼盘</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>注册登陆</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>选房秘书</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>线下服务</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>报名置房</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>现场看房</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>签约下定</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>按揭办理</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    <div class="footCenter" >
    	<h3><span></span>购买成功</h3>
        <ul class="footFont">
        	<li><a href="">楼盘咨询</a></li>
			<li><a href="">个性化置</a></li>
            <li><a href="">楼盘咨询</a></li>
        </ul>
    </div>
    </div>
	<div class="FootInformation">
	<div>
    	<ul>
        	<li><a href="">房立方介绍</a></li>
            <li><a href="">关于我们</a></li>
            <li><a href="">广告服务</a></li>
            <li><a href="">合作伙伴</a></li>
            <li><a href="">联系我们</a></li>
            <li><a href="">诚聘英才</a></li>
            <li><a href="">会员注册</a></li>
            <li><a href="">产品答疑</a></li>
            <li style="border:none;"><a href="">客户投诉</a></li>
        </ul>
    	<span>
        	Copyright ? 2011 www.funlifun.com Corporation, All Rights Reserved<br />
            房立方用户服务、信息咨询、技术支持、客服服务热线：0755-61355288
        </span>
    </div>
</div>
</div>
 <!--尾部-->
</body>
</html>
