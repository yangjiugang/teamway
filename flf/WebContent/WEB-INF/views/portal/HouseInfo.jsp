<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>楼盘首页</title>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link href="css/portal/globle.css" rel="stylesheet" type="text/css" />
<link href="css/portal/houseInfo_index.css" rel="stylesheet" type="text/css"/>
<link href="css/portal/houseInfo_layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/iframeSetHeight.js"></script>

<link rel="stylesheet" type="text/css" href="css/portal/layout.css" />
<link rel="stylesheet" type="text/css" href="js/page/page.css" />
<script type="text/javascript" src="js/page/page.js"></script>
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
	var count=document.getElementById("countPage").value;
	var houseId=document.getElementById("houseInfoId").value;
	$("#fenye").pager({pageSize:2, pageCount:count, goPageCall:goPage});
	
	$("#showPriceDiv").click(function(){
		$("#updateTxtDiv").css({ position:"fixed", left:"50%",top: "50%", margin:"-50px 0 0 -50px"});
		if($("#updateTxtDiv").css("display")=="none")
			showBox('updateTxtDiv');
		else
			closeBox('updateTxtDiv');
	});
	
		
	function showColorDiv(objId){
		if($("#"+objId).css("display")=="block"){
			$("#"+objId).css({ position:"fixed", left:"35%",top: "20%", margin:"-50px 0 0 -50px"});
			$("#"+objId).show();
		}else{
			$("#"+objId).hide();
		}
	}
	
});

function goPage(curPage, pageSize) {
	var count=document.getElementById("countPage").value;
	var houseId=document.getElementById("houseInfoId").value;
	
	document.getElementById("BannerImgIframe").src="showHouseInfoBannerImg?houseId="+houseId+"&pageCount="+count+"&page="+curPage+"&pageSize="+pageSize;
}

function doCloseDiv(id){
	closeBox(id);
}
function txtOnFocus(oldText,obj){
	if(obj.value==oldText)
		obj.value="";
}

function txtOnBuler(oldText,obj){
	if(obj.value=="" || obj.value==null)
		obj.value=oldText;
}
function closeFrameDiv(){
	$("#infoTopDiv").hide(600);
	$("#showBtn").show();
}

function showFrameDiv(){
	$("#infoTopDiv").show(600);
	$("#showBtn").hide();
}

</script>
<style>
	.windowOut,.windowOut2{ width:458px; height:458px; background-image:url(images/houseInfo_tanchuang.png); padding:1px; margin:auto;}
	.windowOut div{ width:290px; margin:80px auto 0 auto; overflow:hidden;}
	.windowOut div font{ margin:70px 30px 0 30px; color:#FFF; display:block; }
	.windowOut div .text-pic{border:#FFF 1px solid; margin:20px 40px 0 40px; width:190px; height:24px; background-image:url(images/houseInfo_yuanping.png); padding:5px; color:#a4dd8a;}
	.but-tijiao{ margin:35px 0 0 90px;}
	
	.windowCenter{ width:290px; margin:130px auto 0 auto; overflow:hidden; text-align:center; line-height:25px;}
	.windowCenter ul{ display:block; color:#fff; overflow:hidden;}
	.windowCenter ul li{ width:230px; margin:5px auto 0 auto; text-align:center;}
	.windowCenter ul li span{ width:90px; float:left;}
	.windowCenter ul li div{ width:110px; background-color:#c8eab9; height:5px; float:left; margin-top:9px;}
	.windowCenter ul li font{ width:10px; float:left; margin-left:5px;}
	.windowCenter .text-pj{ font-size:12px; color:#fff; display:block; margin:10px auto 15px auto;}
	
	.windowOut3,.windowOut4{ width:458px; height:458px; background-image:url(images/tanchuang1.png); padding:1px; margin:auto;}
	.windowOut3 div,.windowOut4 div{ width:290px; margin:160px auto 0 auto; overflow:hidden; text-align:center; line-height:25px; color:#FFF;}
	.windowOut3 a{ color:#FFF; text-decoration:underline;}
	.text-email{border:#FFF 1px solid; margin:20px 40px 30px 40px; width:190px; height:24px; background-image:url(images/textBG.png); padding:5px; color:#e78ac9;}
	
	.windowOut4 div{ margin:190px auto 0 auto;}
	.windowOut4 input{ margin-top:30px;}
	
	.con-bot-r{ float:right; margin:0 0 0 5px; display:inline; color:#a00000;}
	.con-bot-r li{background-image:url(images/Mark03.gif); background-repeat: no-repeat; background-position: right center; padding:0 0 0 15px; width:40px; float:right; line-height:24px;}
	.con-bot-r .st{background-image:url(images/Mark02.gif); background-repeat: no-repeat; background-position: right center; padding:0 0 0 15px; width:40px; float:right; line-height:24px; overflow:hidden;}
</style>
</head>

<body>
 <!--头部-->
<div class="head">
	<div class="loginBarOut">
    	<div class="loginBar">
        	<span class="left"><a href="../../FLH/landing.html">[登陆<font>房乐会</font>]</a><a href="../../FLH/register.html">[注册]</a> 中国最专业的房地产流通行业社交平台</span>
            <span class="right"><font>易介宝</font><a href="../../FLH01/denglu.html">[登陆]</a> | <font>售楼宝</font><a href="../../SLB/landing.html">[登陆]</a> | <a href="">主题会所分布</a> </span>
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
            <span><a href="../news.html">武汉| 协信打造浮躁城市里唯一的完美小城</a></span>
        </div>
    </div>
</div>
<!--End头部-->

    <div class="banner"><img src="images/Banner1.jpg" /></div>
<div class="SelectOut">
    	<span class="selectLeft"><img src="images/SearchImg.gif" /></span>
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
                <a href="../monopolyofsale.html"><img  src="images/seachBut1.jpg" class="selectBut" style="margin-left:5px;"/></a>
              </form>
           </div>
        </span>
    </div>
    <ul class="Area">
    	<li><a href="monopolyofsale.html">北京</a></li>
        <li><a href="">上海</a></li>
        <li><a href="">广州</a></li>
        <li><a href="">深圳</a></li>
        <li><a href="">天津</a></li>
        <li><a href="">成都</a></li>
        <li><a href="">重庆</a></li>
        <li><a href="">杭州</a></li>
        <li><a href="">海南</a></li>
        <li><a href="">厦门</a></li>
        <li><a href="">苏州</a></li>
        <li><a href="">福州</a></li>
        <li><a href="">南昌</a></li>
        <li><a href="">长沙</a></li>
        <li><a href="">沈阳</a></li>
        <li><a href="">青岛</a></li>
        <li><a href="">大连</a></li>
        <li><a href="">南京</a></li>
        <li><a href="">西安</a></li>
        <li style="width:50px;"><a href="">石家庄</a></li>
        <li><a href="">武汉</a></li>
        <li><a href="">郑州</a></li>
        <li style="border:none; width:50px;"><a href="">更多>></a></li>
    </ul> 
    


  <div class="conter">
    <div class="clear"></div>
     <div class="conter-con">
     
	<%@include file="HouseInfoTopMeun.jsp" %>
	
		<div class="con-bot" style="margin-top: -30px; border:0px;">
		<div class="con-bot-r" id="showBtn" style="margin:0px; display: none;">
		   <ul>
			 <li class="st"><a href="#" class="red" onclick="showFrameDiv()">展开</a></li>
		   </ul>
		  </div>
		  </div>
		<div class="bao">
	<div id="infoTopDiv">
	
		<!--详情介绍-->
		<div class="introduction">
		   <div class="introduction-a"><img src="${houseInfo.housePic}" /></div>
		   <div class="introduction-t">
		      <span class="big">${houseInfo.houseName}——${houseInfo.houseNameExtend}</span>
			  
		        <ul>
				     <li class="tet">
					<span class="bn">房秘书推荐次数：</span>${houseInfo.userRecommendCnt}
					</li>
				    <li class="tet"><span class="bn">楼盘位置：</span>${houseInfoDetail.houseAddress} <span class="blue">
				    <a href="getHousePicInfoByType?houseId=${houseInfo.houseId}" class="blue">查看地图</a></span></li>
					<li class="tet"><span class="bn">主力户型：</span>${houseInfo.houseMinArea}-${houseInfo.houseMaxArea}m </li>
					<li class="tet"><span class="bn">物业类型：</span>
						<c:if test="${houseInfo.houseProperties == 0}">
							普通住宅
						</c:if>
						<c:if test="${houseInfo.houseProperties == 1}">
							花园洋房
						</c:if>
						<c:if test="${houseInfo.houseProperties == 2}">
							别墅
						</c:if>
						<c:if test="${houseInfo.houseProperties == 3}">
							商住楼
						</c:if>
						<c:if test="${houseInfo.houseProperties == 4}">
							写字楼
						</c:if>
						<c:if test="${houseInfo.houseProperties == 5}">
							商铺
						</c:if>
						<c:if test="${houseInfo.houseProperties == 6}">
							厂房
						</c:if>
						<c:if test="${houseInfo.houseProperties == 7}">
							仓库
						</c:if>
						<c:if test="${houseInfo.houseProperties == 8}">
							其他
						</c:if>
					</li>
					<li class="tet"><span class="bn">所属商圈：</span>${houseInfo.businessRegion}</li>
					<li class="tet"><span class="bn">开盘时间：</span><fmt:formatDate value="${houseInfoDetail.houseOpenDate}" pattern="yyyy年MM月dd日" type="date"/></li>
					<li class="tet"><span class="bn">所属旅游购房团：</span>${groupName}</li>
			    </ul>
		   </div>
		   <div class="introduction-td">
			 <span class="top">
			     <dl>
				    <img src="images/Telephone.gif" />
					<dd>客服时间:9:00-21:00</dd><dd>&nbsp;&nbsp;&nbsp;&nbsp;房价：<span class="redb">均价${houseInfo.housePrice }/m</span></dd>
					<dd>咨询电话：<span class="redb">${houseInfoDetail.houseSaleTelphone}</span></dd>
				 </dl>
			  </span> 
		   </div>
		</div>
		
		<!--详情介绍-->
		
		<!--户型图-->
		<div class="graph">
		   <div class="graph-tel">
		    <span class="bm">户型图<span class="grey">(${picInfoListSize }张)</span></span>
			<span class="tm"><a href="showHouseInfoPhotoList?houseId=${houseInfo.houseId }" class="red">查看全部>></a></span>	
		  </div>
			<div class="graph-con">
			  <ul>
			  <c:if test="${picInfoListSize==0}">
			  	<li><a href="showHouseInfoPhotoList?houseId=${houseInfo.houseId }"><img src="#" /><span class="red">改楼盘当前没有图片</span></a></li>
			  </c:if>
			  <c:forEach items="${housePicInfoList }" var="housePicInfo" begin="0" end="3" varStatus="status">
			  	<c:if test="${status.index==0 }">
			  		<li><a href="showHouseInfoPhotoList?houseId=${houseInfo.houseId }"><img src="${housePicInfo.picPath }" /><span class="red">户型图 A1户型</span></a></li>
			  	</c:if>
			    <c:if test="${status.index!=0 }">
			  		<li class="gb"><a href="showHouseInfoPhotoList?houseId=${houseInfo.houseId }"><img src="${housePicInfo.picPath }" border="0" /><span class="red">户型图 A2户型</span></a></li>
			  	</c:if>
			</c:forEach>
			  </ul>
			</div>
		</div>
		<!--户型图-->
	
		<div class="clear"></div>
		<div class="con-bot">
		  <div class="con-bot-l">
		    <ul>
			   <li><a href="#" onclick="window.open('credit','房贷计算器', 'height=500,width=700,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');" class="red">房贷计算器</a></li>
			   <li><a href="#" onclick="window.open('advanceRepayment','提前还款计算器', 'height=700,width=700,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');" class="red">提前还款</a></li>
			   <li><a href="#" onclick="window.open('taxesCalculator','税费计算器', 'height=500,width=700,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');" class="red">税费计算器</a></li>
			   <li><a href="#" onclick="window.open('capacityAssesCalc','购房能力评估', 'height=500,width=700,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');" class="red">购房能力评估</a></li>
			   <li><a href="#" onclick="window.open('providentFundCredit','公积金贷款计算器', 'height=800,width=700,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');" class="red">公积金贷款</a></li>
			</ul>
		  </div>
		  <div class="con-bot-r">
		   <ul>
		     <li><a href="javaScript:closeFrameDiv()" class="red">收起</a></li>
		   </ul>
		  </div>
		  
		</div>
		</div>
	</div>
		<div id="imgFrameDiv">
			<iframe id="BannerImgIframe" name="BannerImgIframe" src="showHouseInfoBannerImg?houseId=${houseId }&pageCount=${pageCount }&page=1&pageSize=2"  style="scroll-face-color:#ffffff;overflow-x:hidden;overflow-y:auto"
						width="100%" height="1250" frameborder="no">
			</iframe>
			
			<input type="hidden" id="countPage" value="${pageCount }"/>
			<input type="hidden" id="houseInfoId" value="${houseInfo.houseId }"/>
			<input type="hidden" id="avgPrice" value="${avgPrice }"/>
			
			
			<div id="fenye">
        
       		</div>
		</div>
		
	   <!--页面切换--> 
	</div>
  <!--弹窗-->

   
<!--End弹窗-->

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
