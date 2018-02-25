<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>电子地图</title>
<link href="css/portal/globle.css" rel="stylesheet" type="text/css" />
<link href="css/portal/houseInfo_index.css" rel="stylesheet" type="text/css"/>
<link href="css/portal/houseInfo_layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/popupBox.js"></script>
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
</script>
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
                <input type="image" src="images/seachBut1.jpg" class="selectBut"/>
              </form>
           </div>
        </span>
    </div>
    <ul class="Area">
    	<li><a href="">北京</a></li>
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
     <div class="conter-con">
	 <!--当前位置-->
	    <div class="top-a">
		  <div class="top-a-l">您的位置： 新房专卖 >> 福州 >> 东街塔 >> 世欧·澜山</div>
		  <div class="top-a-r">
		     <ul>
			     <li><span class="red">1688</span>人关注</li>
				 <li><span class="red">32</span>人收藏</li>
				 <li><span class="red">133</span>人蜂蜜认售</li>
				 <li>收藏楼盘</li>
				 <li class="ig">(8)</li>
			 </ul>
		  </div>
		</div>
		<!--当前位置-->
		
		<!--广告-->
		 <div class="hot"><span><img src="images/Advertis01.gif" /></span>
		 <span><img src="images/Advertis02.gif" /></span>
		 <img src="images/Advertis03.gif" />
		 </div>
		<!--广告-->
		
		<!--文字-->
	     <div class="text-a">世欧·澜山——40000m2私家园林，彰显豪宅品质</div>
		<!--文字-->
		
		<!--菜单-->
		<div class="menu">
		 <ul>
		     <li><a href="index.html" target="_blank">楼盘首页</a></li>
			 <li><a href="index-a.html" target="_blank">楼盘概况</a></li>
			 <li><a href="index-b.html" target="_blank">价格分析</a></li>
			 <li><a href="index-c.html" target="_blank">详细相册</a></li>
			 <li><a href="index-d.html" target="_blank">周边配套</a></li>
			 <li><a href="index-e.html" target="_blank" id="current">电子地图</a></li>
			 <li><a href="index-f.html" target="_blank">楼盘动态</a></li>
			 <li><a href="index-g.html" target="_blank">评论</a></li>
		  </ul>
		
		
		</div>
		<!--菜单-->
		
		
		<div class="bao">
		<!--地图-->
		<div class="map-mune">
      <ul>
	      <li class="current"><a href="#"><img src="images/ico-1.gif" />公交路线</a></li>
		  
	      <li><a href="#"><img src="images/ico-2.gif" />公交路线</a></li>
          <li><a href="#"><img src="images/ico-3.gif" />公交路线</a></li>
          <li><a href="#"><img src="images/ico-4.gif" />公交路线</a></li>
		  
          <li><a href="#"><img src="images/ico-5.gif" />公交路线</a></li>
          <li><a href="#"><img src="images/ico-6.gif" />公交路线</a></li>
          <li><a href="#"><img src="images/ico-7.gif" />公交路线</a></li>
          <li><a href="#"><img src="images/ico-8.gif" />公交路线</a></li>
          
	  </ul>
   </div>
   
    <div class="dian-map"><img src="images/map.gif" /></div>
		<!--地图-->
 
<div class="clear"></div>
		<div class="con-bot">
		  <div class="con-bot-l">
		    <ul>
			   <li><a href="#" class="red">房贷计算器</a></li>
			   <li><a href="#" class="red">提前还款算</a>器</li>
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
	 
	  
	   <!--页面切换--> 
	<div id="fenye">
        	<ul>
            	<li><a href="">&lt;</a></li>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li><a href="">4</a></li>
                <li><a href="">5</a></li>
                <li><a href="">6</a></li>
                <li style="border:none;">&hellip;</li>
                <li><a href="">99</a></li>
                <li><a href="">100</a></li>
                <li><a href="">&gt;</a></li>
            </ul>
            <span><form>
            	跳转：<input type="text" class="Gotext"/> 页&nbsp;<input type="image" src="images/Go.jpg" style="position:absolute; bottom:2px; _bottom:3px;"/>
            </form></span>
        </div>
	   <!--页面切换--> 
	 
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
