<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新房专卖</title>
<link rel="stylesheet" type="text/css" href="css/portal/brand.css" />
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<script type="text/javascript"> 
<!--
var SellerScroll = function(options){
	this.SetOptions(options);
	this.lButton = this.options.lButton;
	this.rButton = this.options.rButton;
	this.oList = this.options.oList;
	this.showSum = this.options.showSum;
	
	this.iList = $("#" + this.options.oList + " > li");
	this.iListSum = this.iList.length;
	this.iListWidth = this.iList.outerWidth(true);
	this.moveWidth = this.iListWidth * this.showSum;
	
	this.dividers = Math.ceil(this.iListSum / this.showSum);	//共分为多少块
	this.moveMaxOffset = (this.dividers - 1) * this.moveWidth;
	this.LeftScroll();
	this.RightScroll();
};
SellerScroll.prototype = {
	SetOptions: function(options){
		this.options = {
			lButton: "left_scroll",
			rButton: "right_scroll",
			oList: "carousel_ul",
			showSum: 1	//一次滚动多少个items
		};
		$.extend(this.options, options || {});
	},
	ReturnLeft: function(){
		return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
	},
	LeftScroll: function(){
		if(this.dividers == 1) return;
		var _this = this, currentOffset;
		$("#" + this.lButton).click(function(){
			currentOffset = _this.ReturnLeft();
			if(currentOffset == 0){
				for(var i = 1; i <= _this.showSum; i++){
					$(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
				}
				$("#" + _this.oList).css({ left: -_this.moveWidth });
				$("#" + _this.oList + ":not(:animated)").animate( { left: "+=" + _this.moveWidth }, { duration: "slow", complete: function(){
					for(var j = _this.showSum + 1; j <= _this.iListSum; j++){
						$(_this.iList[_this.iListSum - j]).prependTo($("#" + _this.oList));
					}
					$("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 1) });
				} } );
			}else{
				$("#" + _this.oList + ":not(:animated)").animate( { left: "+=" + _this.moveWidth }, "slow" );
			}
		});
	},
	RightScroll: function(){
		if(this.dividers == 1) return;
		var _this = this, currentOffset;
		$("#" + this.rButton).click(function(){
			currentOffset = _this.ReturnLeft();
			if(Math.abs(currentOffset) >= _this.moveMaxOffset){
				for(var i = 0; i < _this.showSum; i++){
					$(_this.iList[i]).appendTo($("#" + _this.oList));
				}
				$("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });
				
				$("#" + _this.oList + ":not(:animated)").animate( { left: "-=" + _this.moveWidth }, { duration: "slow", complete: function(){
					for(var j = _this.showSum; j < _this.iListSum; j++){
						$(_this.iList[j]).appendTo($("#" + _this.oList));
					}
					$("#" + _this.oList).css({ left: 0 });
				} } );
			}else{
				$("#" + _this.oList + ":not(:animated)").animate( { left: "-=" + _this.moveWidth }, "slow" );
			}
		});
	}
};
$(document).ready(function(){
	var ff = new SellerScroll();
});
//-->
</script>
</head>

<body>
<%@ include file="Header.jsp" %>
<div id="carousel_container">
    	<div id="left_scroll"></div>
        <div id="carousel_inner">
          <ul id="carousel_ul">
                <li><img src="images/a_pic_1.jpg" /><p>绿城房地产集团有限公司（以下简
    称绿城）是中国知名的住宅物业开发商之一，以优秀的房产品质量占据行业内的领先地位。</p></li>
                <li><img src="images/a_pic_2.jpg" /><p>复地（集团）股份有限公司（以下简称"复地"）， 是中国大型的房地
    产开发和投资集团，国家一级开发资质，中国驰名商标企业，是复星集团的创始成员企业。</p></li>
                <li><img src="images/a_pic_3.jpg" /><p>SOHO 中国有限公司创立于1995 年，是中国房地产行业领袖，目前北京最大的房地产开发商，主要在北京、上海城市中心开发高档商业地产。</p></li>
                <li><img src="images/a_pic_4.jpg" /><p>世茂，是以房地产开发为主的国际化企业集群，旗下拥有世茂房地产控股有限公司（HK.0813)及上海世茂股份有限公司(SH.600823) 两家控股上市公司。</p></li>
                <li><img src="images/a_pic_1.jpg" /><p>绿城房地产集团有限公司（以下简
    称绿城）是中国知名的住宅物业开发商之一，以优秀的房产品质量占据行业内的领先地位。</p></li>
                <li><img src="images/a_pic_2.jpg" /><p>复地（集团）股份有限公司（以下简称"复地"）， 是中国大型的房地
    产开发和投资集团，国家一级开发资质，中国驰名商标企业，是复星集团的创始成员企业。</p></li>
                <li><img src="images/a_pic_3.jpg" /><p>SOHO 中国有限公司创立于1995 年，是中国房地产行业领袖，目前北京最大的房地产开发商，主要在北京、上海城市中心开发高档商业地产。</p></li>
                <li><img src="images/a_pic_4.jpg" /><p>世茂，是以房地产开发为主的国际化企业集群，旗下拥有世茂房地产控股有限公司（HK.0813)及上海世茂股份有限公司(SH.600823) 两家控股上市公司。</p></li>
            </ul>
        </div>
        <div id="right_scroll"></div>
</div>
<!--End图片滚动-->
<div class="middle">
    <div class="Exhibition">
    	<div class="left" id="LSZD">
        	<div>
            	<p><a href="">"让建筑赞美生命"是万科企业的核心理念，也是万科坚持的产品核心价值观。万科始终不懈地致力
于为不同消费者提供展现自我、和谐共生的理想生活空间，保护环境、改善环境，促进人与自然的可持续发展。</a></p>
            </div>
        </div>
        <div class="right">
        	<ul class="RightImg">
            	<li><a href="news.html"><img src="images/b_pic_2.jpg" alt="万科-倡导绿色生活"/><br />万科-倡导绿色生活</a></li>
                <li><a href="news.html"><img src="images/b_pic_3.jpg" alt="2010世博会万科馆-金色麦垛"/><br />2010世博会万科馆-金色麦垛</a></li>
                <li><a href="news.html"><img src="images/b_pic_4.jpg" alt="第32届香港赛艇锦标赛"/><br />第32届香港赛艇锦标赛</a></li>
            </ul>
            <div class="dian"></div>
            <div class="dynamic">
            	<ul>
                	<li><p>万科企业股份有限公司成立于1984年5月，是目前中国最大的专业住宅开发企业。</p></li>
                </ul>
            	<div class="YnamicFont"><a href="">进入官网&nbsp;>></a></div>
            </div>
        </div>
    </div>
    <div class="Exhibition">
    	<div class="left" id="WKZD">
        	<div>
            	<p><a href="">"让建筑赞美生命"是万科企业的核心理念，也是万科坚持的产品核心价值观。万科始终不懈地致力
于为不同消费者提供展现自我、和谐共生的理想生活空间，保护环境、改善环境，促进人与自然的可持续发展。</a></p>
            </div>
        </div>
        <div class="right">
        	<ul class="RightImg">
            	<li><a href="lifang/index.html"><img src="images/b_pic_2.jpg" alt="万科-倡导绿色生活"/><br />万科-倡导绿色生活</a></li>
                <li><a href="lifang/index.html"><img src="images/b_pic_3.jpg" alt="2010世博会万科馆-金色麦垛"/><br />2010世博会万科馆-金色麦垛</a></li>
                <li><a href="lifang/index.html"><img src="images/b_pic_4.jpg" alt="第32届香港赛艇锦标赛"/><br />第32届香港赛艇锦标赛</a></li>
            </ul>
            <div class="dian"></div>
            <div class="dynamic">
            	<ul>
                	<li><p>万科企业股份有限公司成立于1984年5月，是目前中国最大的专业住宅开发企业。</p></li>
                </ul>
            	<div class="YnamicFont"><a href="">进入官网&nbsp;>></a></div>
            </div>
        </div>
    </div>
    
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
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
