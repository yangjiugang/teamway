<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>楼盘评论</title>

<link href="css/portal/discuss_globle.css" rel="stylesheet" type="text/css" />
<link href="css/portal/discuss_index.css" rel="stylesheet" type="text/css"/>
<link href="css/portal/discuss_layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.raty.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var curPage=${curPage};
	var pageCount=${pageCount};
	
	$("#fenye").pager({curPage:curPage,pageSize:10, pageCount:pageCount, goPageCall:goPage});
	
	function goPage(curPage, pageSize){
		var houseId = $("#houseId").val();
		var userType = $("#visitorType").val();
		window.location.href="houseInfoRemark?houseId="+houseId+"&userType="+userType+"&curPage="+curPage+"&pageSize="+pageSize;
	}
	
	$('#target').raty({
		path:'images/',
		start:3,
		hintList:['1', '2', '3', '4', '5'],
		number:5,
		onClick: function(score) {
			$("#houseGrade").val(score);
			$("#xingPinText").text(score+"星评");
	  	}
	});
});
</script>
<script type="text/javascript">
function settab_zzjs(name,num,n){
	for(i=num;i<=n;i++){
		var menu=document.getElementById(name+i);
		var con=document.getElementById("type"+(i-1)+"Div");
		menu.className=i==num?"on_zzjs":"";
		con.style.display=i==num?"block":"none";
	}
}

function goRemarkType(type){
	var houseId = $("#houseId").val();
	$("#visitorType").val(type);
	window.location.href="houseInfoRemark?houseId="+houseId+"&userType="+type+"&curPage=1&pageSize=10";
}

function appendRemarkIMG(img){
	i=img.src.lastIndexOf("/");
	img=img.src.substring(i+1,img.src.length);
	imgStr="["+img+"]";
	$("#myeara").val($("#myeara").val()+imgStr);
}
function checkForm(){
	if($("#myeara").val()==null || strTrim($("#myeara").val())==""){
		alert("评论不能为空");
		return false;
	}
	return true;
}
function strTrim(str)  
{   
    return str.replace(/(^\s*)|(\s*$)/g,   "");  
}   
</script>

</head>

<body onload="settab_zzjs('zzjs',${userType+1},4)">
<input type="hidden" id="visitorType" value="${userType}"/>
<!--头部-->
<div class="head">
	<div class="loginBarOut">
    	<div class="loginBar">
        	<span class="left"><a href="../../FLH/landing.html">[登陆<font>房乐会</font>]</a><a href="../../FLH/register.html">[注册]</a> 中国最专业的房地产流通行业社交平台</span>
             <span class="right"><span class="cc"><a href="">主题会所分布</a></span>  | <font>易介宝</font><a href="../FLH01/denglu.html">[登陆]</a> | <font>售楼宝</font><a href="../SLB/landing.html">[登陆]</a></span>
        </div>
    </div>
	<div class="logoNav">
    	<div class="logo"></div>
        <ul>
        	<li><a href="../../funlifun/index.html"><font>首 页</font></a></li>
            <li><a href="../../funlifun/monopolyofsaleM1.html">新房专卖</a></li>
            <li><a href="../../funlifun/hotline.html">旅游购房</a></li>
            <li><a href="../../funlifun/abroad.html">海外置业</a></li>
            <li><a href="../../funlifun/Brand.html">品牌专区</a></li>
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
            <span><a href="../news.html">武汉| 协信打造浮躁城市里唯一的完美小城</a></span>
        </div>
    </div>
</div>
<!--End头部-->

    <div class="banner"><img src="images/Banner1.jpg" /></div>
<div class="SelectOut">
    	<span class="selectLeft"><img src="images/SearchImg.jpg" /></span>
        <span class="selectRight">
          <div class="single">
          		<span><input type="text" id="txt" name="txt" onfocus="showAndHide('List1','show');" onblur="showAndHide('List1','hide');" value=" 目标城市">
            <div class="Menu" id="List1">
                <ul>
                    <li onmousedown="getValue('txt','区位');showAndHide('List1','hide');">区位</li>
                    <li onmousedown="getValue('txt','美国USA');showAndHide('List1','hide');">美国USA</li>
                </ul>
            </div>
          </span>
                <span><input type="text" id="txt2" name="txt2" onfocus="showAndHide('List2','show');" onblur="showAndHide('List2','hide');" value=" 地产性质">
                <div class="Menu" id="List2">
                    <ul>
                        <li onmousedown="getValue('txt2','男Male');showAndHide('List2','hide');">男Male</li>
                        <li onmousedown="getValue('txt2','女Female');showAndHide('List2','hide');">女Female</li>
                    </ul>
                </div>
              </span>
                <span><input type="text" id="txt3" name="txt3" onfocus="showAndHide('List3','show');" onblur="showAndHide('List3','hide');" value=" 价格区间">
                <div class="Menu" id="List3">
                    <ul>
                        <li onmousedown="getValue('txt3','大专');showAndHide('List3','hide');">大专</li>
                        <li onmousedown="getValue('txt3','本科');showAndHide('List3','hide');">本科</li>
                        <li onmousedown="getValue('txt3','硕士');showAndHide('List3','hide');">硕士</li>
                        <li onmousedown="getValue('txt3','本科');showAndHide('List3','hide');">本科</li>
                    </ul>
                </div>
              </span>     
                <span><input type="text" id="txt4" name="txt4" onfocus="showAndHide('List4','show');" onblur="showAndHide('List4','hide');" value=" 面积区间">
                <div class="Menu" id="List4">
                    <ul>
                        <li onmousedown="getValue('txt4','大专');showAndHide('List4','hide');">大专</li>
                        <li onmousedown="getValue('txt4','本科');showAndHide('List4','hide');">本科</li>
                        <li onmousedown="getValue('txt4','硕士');showAndHide('List4','hide');">硕士</li>
                        <li onmousedown="getValue('txt4','本科');showAndHide('List4','hide');">本科</li>
                    </ul>
                </div>
              </span>
                <span><input type="text" id="txt5" name="txt5" onfocus="showAndHide('List5','show');" onblur="showAndHide('List5','hide');" value=" 房屋户型">
                <div class="Menu" id="List5">
                    <ul>
                        <li onmousedown="getValue('txt5','大专');showAndHide('List5','hide');">大专</li>
                        <li onmousedown="getValue('txt5','本科');showAndHide('List5','hide');">本科</li>
                        <li onmousedown="getValue('txt5','硕士');showAndHide('List5','hide');">硕士</li>
                        <li onmousedown="getValue('txt5','本科');showAndHide('List5','hide');">本科</li>
                    </ul>
                </div>
              </span>
                <span><input type="text" id="txt6" name="txt6" onfocus="showAndHide('List6','show');" onblur="showAndHide('List6','hide');" value=" 房屋装修">
                <div class="Menu" id="List6">
                    <ul>
                        <li onmousedown="getValue('txt6','大专');showAndHide('List6','hide');">大专</li>
                        <li onmousedown="getValue('txt6','本科');showAndHide('List6','hide');">本科</li>
                        <li onmousedown="getValue('txt6','硕士');showAndHide('List6','hide');">硕士</li>
                        <li onmousedown="getValue('txt6','本科');showAndHide('List6','hide');">本科</li>
                    </ul>
                </div>
              </span>
                <span><input type="text" id="txt7" name="txt7" onfocus="showAndHide('List7','show');" onblur="showAndHide('List7','hide');" value=" 建设情况">
                <div class="Menu" id="List7">
                    <ul>
                        <li onmousedown="getValue('txt7','大专');showAndHide('List7','hide');">大专</li>
                        <li onmousedown="getValue('txt7','本科');showAndHide('List7','hide');">本科</li>
                        <li onmousedown="getValue('txt7','硕士');showAndHide('List7','hide');">硕士</li>
                        <li onmousedown="getValue('txt7','本科');showAndHide('List7','hide');">本科</li>
                    </ul>
                </div>
              </span>
                <span><input type="text" id="txt8" name="txt8" onfocus="showAndHide('List8','show');" onblur="showAndHide('List8','hide');" value=" 营销活动">
                <div class="Menu" id="List8">
                    <ul>
                        <li onmousedown="getValue('txt8','大专');showAndHide('List8','hide');">大专</li>
                        <li onmousedown="getValue('txt8','本科');showAndHide('List8','hide');">本科</li>
                        <li onmousedown="getValue('txt8','硕士');showAndHide('List8','hide');">硕士</li>
                        <li onmousedown="getValue('txt8','本科');showAndHide('List8','hide');">本科</li>
                    </ul>
                </div>
              </span>
          </div>
          <div class="multiple">
             <input type="text" value=" 景观" id="multiple1" onfocus="showDiv('areaDiv')">
             <input type="text" value=" 交通" id="multiple2">
             <input type="text" value=" 学区" id="multiple3">
             <input type="text" value=" 医疗" id="multiple4">
             <input type="text" value=" 生活设施" id="multiple5">
             <form>
                <input type="text" value="请输入关键词" onclick="this.select();" class="selectText"/>
                <a href="monopolyofsale.html"><img  src="images/seachBut1.jpg" class="selectBut" style="margin-left:7px;_margin-left:0px;"/></a>
              </form>
           </div>
        </span>
    </div>
   
  <div class="conter">
    <div class="clear"></div>
     <div class="conter-con">
	
		<%@include file="HouseInfoTopMeun.jsp" %>
		
		<div class="bao">
		<!--详情介绍-->
		<!--详情介绍-->
        <!--户型图-->
<div class="graph">
		   <div class="graph-tel">
		    <span class="bm">我要写评论：</span>
            <div class="pinfen">
            	<font>评级：</font>
                <div id="target" style="margin-top: 5px;"></div>
            </div>
			<span class="tm">快速登陆通道   <a href="#" class="red">[房乐会]</a>   <a href="#" class="red">[易介宝]</a></span>	
	  </div>
	  
	  <div class="pingl">
	     <form action="saveDiscuss" method="post" onsubmit="return checkForm();">
	     <input type="hidden" id="houseId" name="houseId" value="${houseId}"/>
		 <input type="hidden" id="houseGrade" name="houseGrade" value="3"/>
		 <input type="hidden" id="anonymityFlag" name="anonymityFlag" value="1"/>
	     <textarea id="myeara" name="content" class="pingl-tec" style="width: 548px;" reg="" tip="不能为空" cols="88" rows="7"></textarea>
	    <input name="提交" type="submit" class="pingl-tetl" value="提交" />
	   </form>
	  </div>
      <ul class="biaoqin">
      	<li><img src="images/face/1.gif" onclick="appendRemarkIMG(this)"/></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/2.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A0H0-946233.gif"/></li>
  
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A1G0-a3492.gif" /></li>
        
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A3M0-1033233.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A03Z-93K24.gif" /></li>
        
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A10Z-959247.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A13F-963445.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A2040-bP93.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A2520-cTa.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A3120-1014301.gif" /></li>
        
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A4010-1044644.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295A4330-1056111.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295AP-10H430.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N29564aF-912921.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N29564D50-S1I4.gif" /></li>
        
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N29564J40-U4B2.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N29564O0-V12D.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N29564R0-WV34.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N29564V50-X1106.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N29564Z30-YKE.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295645E0-P42J.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295644930-N4044.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295645350-O6248.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295646060-QU00.gif" /></li>
        <li><img onclick="appendRemarkIMG(this)" src="images/face/12N295646440-R35G.gif" /></li>

 
      </ul>
      <div>
      		<div class="Y04rizhi_tab">
                <ul>
                <li id="zzjs1" onclick="goRemarkType(0)">全部评论</li>
                <li id="zzjs2" onclick="goRemarkType(1)">房友评论</li>
                <li id="zzjs3" onclick="goRemarkType(2)">蜂蜜评论</li>
                <li id="zzjs4" onclick="goRemarkType(3)">游客评论</li>
                </ul>
			 </div>
          <ul id="type${userType}Div" class="pinlun">
          <c:forEach items="${discussList}" var="discuss" varStatus="status">
          
                <li>
                    <div class="pinlunPhoto">
                        <img src="images/mishu-mg.gif" />
                        <font>${discuss.visitorName}</font>
                        <c:if test="${discuss.visitorType==1}">
                        	<font>经纪人</font>
                        </c:if>
                        <c:if test="${discuss.visitorType==2}">
                        	<font>购房客户</font>
                        </c:if>
                        <c:if test="${discuss.visitorType==0}">
                        	<font>访客</font>
                        </c:if>
                        
                    </div>
                    <div class="pinlunCenter">
                        <span><font>${discuss.discussId}F</font><b>发表于：</b><fmt:formatDate value="${discuss.createDate}" pattern="yyyy年MM月dd日" type="date"/> </span>
                        <p>
                        	${discuss.content}
                        </p>
                        <div id="${discuss.discussId}pingji" class="pingji"></div>
                        <script>
                        $(document).ready(function(){
                        	num=${discuss.houseGrade};
                        	if(num!=0){
		                        $("#${discuss.discussId}pingji").raty({
		                    		path:'images/',
		                    		start:${discuss.houseGrade},
		                    		hintList:['1', '2', '3', '4', '5'],
		                    		number:5,
		                    		readOnly:true
		                    	});
	                        }else{
	                        	 $("#${discuss.discussId}pingji").html("<span>未评级</span>");
	                        }
                        });
                        </script>
                        <div class="bianji">                            
                        </div>
                    </div>
                </li> 
        </c:forEach>
        
          </ul>
           <!--页面切换--> 
        <div id="fenye"></div>
           <!--页面切换-->
      </div>
      
		  </div>
<!--户型图-->
		<div class="clear"></div>
		<div class="con-bot">
		  <div class="con-bot-l">
		    <ul>
			   <li><a href="#" class="red">房贷计算器</a></li>
			   <li><a href="#" class="red">提前还款算器</a></li>
			   <li><a href="#" class="red">税费计算器</a></li>
			   <li><a href="#" class="red">购房能力评估</a></li>
			   <li><a href="#" class="red">公积金贷款</a></li>
			</ul>
		  </div>
		  <div class="con-bot-r">
		   <ul>
		     <li><a href="#" class="red">收起</a></li>
			 <li class="st"><a href="#" class="red">展开</a></li>
		   </ul>
		  </div>
		</div>
		
	   </div>
	 </div>
	 
	 <br /> 
	 
	 </div>
	 
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
