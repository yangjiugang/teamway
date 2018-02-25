<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!--当前位置-->
 <script type="text/javascript" src="js/popupBox.js"></script>
 <script type="text/javascript" src="js/common.js"></script>
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
 <script>
 $(document).ready(function(){
		
		$("#showPriceDiv").click(function(){
			$("#updateTxtDiv").css({ position:"fixed", left:"50%",top: "50%", margin:"-50px 0 0 -50px"});
			if($("#updateTxtDiv").css("display")=="none")
				showBox('updateTxtDiv');
			else
				closeBox('updateTxtDiv');
			alert('click');
		});
		
			
		function showColorDiv(objId){
			if($("#"+objId).css("display")=="block"){
				$("#"+objId).css({ position:"fixed", left:"35%",top: "20%", margin:"-50px 0 0 -50px"});
				$("#"+objId).show();
			}else{
				$("#"+objId).hide();
			}
		}
		
		$("#fengxiangImg").click(function(){closeBox('fenxiangDiv');});
		
		$("#doSubmitBtn").click(function(){
			houseId=$("#houseId").val();
			housePrice=parseInt($("#housePrice").val());
			hPrice=parseInt($("#hPrice").val());
			avgPrice=0;
			if($("#avgPrice").val()!=0){
				avgPrice=parseInt($("#avgPrice").val());
			}
			
			if(avgPrice!=0){
				alert("if");
				topPrice=Math.floor(parseInt(avgPrice) * 0.6);
				downPrice = avgPrice+topPrice;
			}else{
				topPrice=hPrice+5000;
				downPrice=hPrice-6000;
			}
			
			if(housePrice > topPrice && housePrice < downPrice){alert('A');
				$.fc.ajaxSubmit({
					url : "updatePriceOnHouseInfo?"+"houseId="+houseId+"&housePrice="+housePrice+"&math="+Math.random(),
					dataType : "json",
					callBackFn : function(data) {alert(data.avgCount+":?");
						if(data!=null && data!="" && data.avgCount!=null){
							$("#reutrnPriceTotal").html('<br/><font class="text-pj" style="font-size: 14px;">'+
						        	'总共有<strong style="font-size: 15px;">'+data.avgCount+'</strong>人开过价<br/>'+
						            	'<strong>最低价:</strong> '+data.minPrice+'元/平  &nbsp;<strong>最高价:</strong> '+data.maxPrice+'元/平'+
						            '</font><font class="text-pj" style="font-size: 14px;">忽略不合理开价，平均开价：'+data.avgPrice+'元/平</font>');
							closeBox('updateTxtDiv');
							$("#showPriceTJ").css({ position:"fixed", left:"35%",top: "20%", margin:"-50px 0 0 -50px"});
							showBox('showPriceTJ');
						}else{
							closeBox('updateTxtDiv');
							alert('请登录后重试！');
						}
					}
				});
			}else{
				alert('您开的价格不合理.请重新输入');
			}
		});
		
		
		$("#collectHouseImg").click(function(){
			houseId=$("#houseId").val();
			
			$.fc.ajaxSubmit({
				url : "collectHouse?"+"houseId="+houseId+"&math="+Math.random(),
				dataType: "json",
				callBackFn : function(data) {
						if(data>0){
							$("#stowCollectDiv").html('<div><font>你的收藏成功！可以进入 <a href="">你的空间</a> 查看。<br />'+'你还可以将这个楼盘信息分享给你的好友！</font>'+
									'<input type="text" value="请选择好友的邮箱地址！" class="text-email"/><input type="image" src="images/qudingBut.jpg" onclick="closeCollectHouseDiv(true)"/></div>');
							$("#stowCollectDiv").css({ position:"fixed", left:"35%",top: "20%", margin:"-50px 0 0 -50px"});
							showBox('stowCollectDiv');
						}else{
							if(data==-2){
								$("#stowCollectDiv").html('<div><font>您还没有登录哦！立即 <a href="#"> 登录</a>/<a href="#"> 注册</a>方立方吧<br /></font><input type="button" value="提交" onclick="closeCollectHouseDiv(false)"/></div>');
								$("#stowCollectDiv").css({ position:"fixed", left:"35%",top: "20%", margin:"-50px 0 0 -50px"});
								showBox('stowCollectDiv');
							}else{
								alert('您已收藏过该楼盘!');
							}
						}
					}
				});
		});
	});
 
	function closeCollectHouseDiv(isNext){
		if(isNext){
			closeBox('stowCollectDiv');
			$("#fenxiangDiv").css({ position:"fixed", left:"35%",top: "20%", margin:"-50px 0 0 -50px"});
			showBox('fenxiangDiv');
		}else{
			closeBox('stowCollectDiv');
		}
		return false;
	}
	
 </script>
	<div class="top-a">
		  <div class="top-a-l">您的位置： 新房专卖 >> 福州 >> 东街塔 >> 世欧·澜山</div>
		  <div class="top-a-r">
		     <ul>
			     <li><span class="red">${houseInfo.houseAttenttionCnt==0? 0 :houseInfo.houseAttenttionCnt}</span>人关注</li>
				 <li><span class="red">${houseInfo.houseCollectCnt==0? 0 : houseInfo.houseCollectCnt}</span>人收藏</li>
				 <li><span class="red">${count}</span>人蜂蜜认售</li>
				 <li>收藏楼盘</li>
				 <li class="ig">(8)</li>
			 </ul>
		  </div>
		</div>
		<!--当前位置-->
		
		<!--广告-->
		 <div class="hot"><span><img src="images/Advertis01.gif" id="collectHouseImg"/></span>
		 <span><img src="images/Advertis02.gif" id="showPriceDiv" /></span>
		 <a href="getUserInfoList?curPage=1&pageSize=10"><img src="images/Advertis03.gif" /></a>
		 </div>
		<!--广告-->
		
		<!--文字-->
	     <div class="text-a">${houseInfo.houseName}——${houseInfo.houseNameExtend}</div>
		<!--文字-->
		
		<!--菜单-->
		<div class="menu">
		  <ul>
		     <li><a ${read=='houseIndex'?'id="current" ':'' } href="getHouseInfoById?houseId=${houseInfo.houseId}" target="_blank" >楼盘首页</a></li>
			 <li><a ${read=='houseInfo'?'id="current" ':'' } href="getHouseInfoServey?houseId=${houseInfo.houseId}" target="_blank">楼盘概况</a></li>
			 <li><a ${read=='housePrice'?'id="current" ':'' } href="jumpAnalytic?year=2012&houseId=${houseInfo.houseId}" target="_blank">价格分析</a></li>
			 <li><a ${read=='picList'?'id="current" ':'' } href="showHouseInfoPhotoList?houseId=${houseInfo.houseId }" target="_blank">详细相册</a></li>
			 <li><a ${read=='picPT'?'id="current" ':'' } href="showHousePrepareList?houseId=${houseInfo.houseId }" target="_blank">周边配套</a></li>
			 <li><a ${read=='ditu'?'id="current" ':'' } href="getHousePicInfoByType?houseId=${houseInfo.houseId }" target="_blank">电子地图</a></li>
			 <li><a ${read=='houseNews'?'id="current" ':'' } href="houseNews?houseId=${houseInfo.houseId}&page=0&pageSize=5" target="_blank">楼盘动态</a></li>
			 <li><a ${read=='houseDiscuss'?'id="current" ':'' } href="houseInfoRemark?houseId=${houseInfo.houseId }&userType=0&curPage=1&pageSize=10" target="_blank">评论</a></li>
		  </ul>
		</div>
		<!--菜单-->
		<input type="hidden" id="avgPrice" value="${avgPrice }"/>
		<input type="hidden" id="hPrice" value="${houseInfo.housePrice }"/>
		  <div id="updateTxtDiv" class="windowOut" style="display: none;">
    	<div>
        	<font>不合理开价将被系统忽略，请客观评价呦！</font>
	            <input type="hidden" id="houseId" name="houseId" value="${houseInfo.houseId }" />	
            	<input id="housePrice" name="housePrice" type="text" maxlength="5" value="26000" class="text-pic" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onfocus="txtOnFocus('请输入你的价格！',this)" onblur="txtOnBuler('请输入你的价格！',this)" />
            	<img id="doSubmitBtn" src="images/tijiaoBut1.png" style="cursor: hand;" class="but-tijiao" />
        </div>
    </div>
    
<div class="windowOut2" id="showPriceTJ" style="display: none;">
<div class="windowCenter">
			<div id="reutrnPriceTotal"></div>
        	<form>
            	<a href="houseInfoRemark?houseId=${houseInfo.houseId }&userType=0&curPage=1&pageSize=10"><img  src="images/pl.jpg" /></a>
                <img src="images/esc.jpg" style="cursor: hand;" onclick="doCloseDiv('showPriceTJ')"/>
            </form>
        </div>
    </div>
    
    
 <div class="windowOut3" id="stowCollectDiv" style="display: none;">
    	
</div>
    <div class="windowOut4" id="fenxiangDiv" style="display: none;">
    	<div>
        	<font>
            	分享成功！已将楼盘信息分享给你的好友。
            </font>
            <form>
                <input type="image" src="images/qudingBut.jpg" id="fengxiangImg" onclick="return false;"/>
            </form>
        </div>
    </div>