<%@ page language="java" contentType="text/html; charset=UTf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户添加-客户</title>

<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css"/>
<script type="text/javascript" src="js/newCusYanz.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript" src="js/calendar.js"></script> 
<script type="text/javascript" src="js/dataValidate.js"></script>
<script type="text/javascript" src="js/idNumValidate.js"></script>
<script type="text/javascript" src="js/common.js"></script>
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
<style type="text/css">
.p08{	margin-left: 110px;
	color: red;
	line-height:16px;
	
	}
</style>
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
    	<font>欢迎您进入房乐会! <a href="denglu.html">[安全退出]</a></font>
    </div>
</div>
<!--End头部-->
<div class="middle">
<!--左边-->
 	<div class="FLHLeft">
    	<div class="FLHzl">
        	<span class="photo"><img src="images/touxiang.jpg" /></span>
            <ul class="nickname">
            	<li>昵称：魅力一抖</li>
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
						<img src="images/2.jpg" /><font><a
							href="KehuTianjiaZhuce">添加客户</a></font>
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
   <form >
		<div class="Out1">
        	<div class="khzlTitle"><font class="updown">基本资料</font><img src="images/zhankai(black).jpg" class="updown1"/></div>
            <div class="Content1">
            	
                <div class="jbzlIpunt">
                	<span><label>姓名：</label><input class="input08" type="text" id="name" name="name" value="${customerInfoDetail.name}" onblur="test();"/><font>*</font>
                			<p class="p08"  id="name_error"></p></span>
                    <span><label>性别：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="sex" id="sex" value="0" class="radio08" onblur="checkSex();"/>  男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input type="radio" name="sex" id="sexNv" value="1"  class="radio08" onblur="checkSex();"/>  女<font>*</font>
                    		<p class="p08"  id="sex_error"></p></span>
                    <span><label>出生年月日：</label> <input class="input08" name="birthday" id="shengri" size="12" maxlength="10"
					onkeydown="if(event.keyCode==8)event.returnValue=false;" onblur="checkBirthday();"
							/><img height="20" src="images/rili.gif"
							width="20" align="middle"
							onclick="new Calendar(1900,2050).show(document.getElementById('shengri'));"> 
							<font>*</font><p class="p08"  id="shengri_error"></p></span>
                    <span><label>国籍：</label><input class="input08" type="text" name="citizenship" id="citizenship" onblur="checkTeshu('#citizenship','#citizenship_error');"/><font>*</font>
                    		<p class="p08"  id="citizenship_error"></p></span>
                    <span><label>籍贯：</label><input class="input08" type="text" name="birthPlace" id="birthPlace" onblur="checkBirthPlace();"/><font>*</font>
                    		<p class="p08"  id="birthPlace_error"></p></span>
                    <span><label>民族：</label><input class="input08" type="text" name="nation" id="nation" onblur="checkTeshu('#nation','#nation_error');"/><font>*</font>
                            <p class="p08"  id="nation_error"></p></span>
                    <span><label>婚姻状况：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="maritalStatus" id="maritalStatus" value="0" class="radio08" />  已婚 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input type="radio" name="maritalStatus" id="maritalStatus" value="1"  class="radio08"/>  未婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input type="radio" name="maritalStatus" id="maritalStatus" value="2"  class="radio08"/>  离异<font>*</font>
                    		<p class="p08"  id="maritalStatus_error"></p></span>
                </div>
                <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
                
            </div>
        </div>
        
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">证件及照片</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	
                <div class="jbzlIpunt">
                	<span><label>有效证件名称：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="radio" name="idType" id="idType" value="1" class="radio08" checked="checked" />身份证 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                	<input type="radio" name="idType" id="idType" value="0"  class="radio08"/>  护照<font>*</font><p class="p08"  id="idType_error"></p></span>
                    <span><label>证件号码：</label><input class="input08" type="text" name="iDNum" id="iDNum" value="${customerInfoDetail.iDNum }" 
                    onblur="checkIdNum();"/><font>*</font>
                    <p class="p08"  id="iDNum_error"></p></span>
                </div>
                <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
                
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">联系方式</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	
                <div class="jbzlIpunt">
                	<span><label>家庭电话：</label><input class="input08" type="text" name="tellphone" id="tellphone" onblur="checkTellphone();"/><font>*</font>
                			<p class="p08"  id="tellphone_error"></p></span>
                    <span><label>手机：</label><input class="input08" type="text" name="cellphone" value="${customerInfoDetail.cellphone }"/><font>*</font></span>
                    <span><label>QQ：</label><input class="input08" type="text" name="qQ" id="qQ" onblur="checkQQ();"/><font>*</font>
                    		<p class="p08"  id="qQ_error"></p></span>
                    <span><label>MSN：</label><input class="input08" type="text" name="mSN" id="mSN" onblur="checkZH('#mSN','#mSN_error');"/><font>*</font>
                    		<p class="p08"  id="mSN_error"></p></span>
                    <span><label>E-mail：</label><input class="input08" type="text" name="email" value="${customerInfoDetail.email }" id="email"/><font>*</font>
                   			<p class="p08"  id="email_error"></p></span>
                    <span><label>博客：</label><input class="input08" type="text" name="blog" id="blog" onblur="checkZH('#blog','#blog_error');"/><font>*</font>
                    		<p class="p08"  id="blog_error"></p></span>
                    <span><label>微博：</label><input class="input08" type="text" name="weibo" id="weibo" onblur="checkZH('#weibo','#weibo_error');"/><font>*</font><p class="p08"  id="weibo_error"></p></span>
                    <span><label>工作地：</label><input class="input08" type="text" name="workPlace" id="workPlace" onblur="checkTeshu('#workPlace','#workPlace_error');"/><font>*</font>
                    		<p class="p08"  id="workPlace_error"></p></span>
                    <span><label>家庭常住地址：</label><input class="input08" type="text" name="address" id="address" onblur="checkTeshu('#address','#address_error');"/><font>*</font>
                    		<p class="p08"  id="address_error"></p></span>
                    <span><label>户口所在地：</label><input class="input08" type="text" name="registeredAddress" id="registeredAddress" onblur="checkTeshu('#registeredAddress','#registeredAddress_error');"/><font>*</font>
                    		<p class="p08"  id="registeredAddress_error"></p></span>
                </div>
                
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">家庭成员信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">           	               
                <!---家庭成员信息列表--->
<div class="jiaoyijtcy08" id="familyID">
<ul class="jiaoyijtcytop">
<li>姓名</li>
<li>与本人关系</li>
<li>年龄</li>
<li>工作单位</li>
<li>职务</li>
<li>联系电话</li>
<li></li>
</ul>

<ul class="jiaoyijtcyinput">
<li><input value="" style="background:#EAEAEC;" id="memberName" onblur="checkMemberName();"></li>
<li><input value="" style="background:#EAEAEC;" id="relationship" onblur="checkRelationship();"></li>
<li><input value="" style="background:#EAEAEC;" id="age" onblur="checkAge();"></li>
<li><input value="" style="background:#EAEAEC;" id="work" onblur="checkTeshu('#work','#family_error');"></li>
<li><input value="" style="background:#EAEAEC;" id="jobDuty" onblur="checkTeshu('#jobDuty','#family_error');"></li>
<li><input value="" style="background:#EAEAEC;" id="contactphone" onblur="checkContactphone();"></li>
<li><input id="familyD" type=button class="jtcy81" style="width:54px; height:22px;" onclick="newLi();"></li>
</ul>
<p class="jtcyts8"  id="family_error"></p>

</div>
</div>
<!---End 家庭成员信息列表--->
              
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">兴趣与爱好</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	
                <ul class="jbzlIpunt" id="jbzlIpunt">
                	<li><input id="interests" name="customerInterests.interests" type="checkbox" value="财经/股市" />  财经/股市</li>
                    <li><input id="interests" name="customerInterests.interests" type="checkbox" value="房产/家居" />  房产/家居</li>
                    <li><input id="interests" name="customerInterests.interests" type="checkbox" value="图书/音像" />  图书/音像</li>
                    <li><input id="interests" name="customerInterests.interests" type="checkbox" value="娱乐" />  娱乐</li>
                    <li><input id="interests" name="customerInterests.interests" type="checkbox" value="旅游/度假" />  旅游/度假</li>
                    <li><input id="interests" name="customerInterests.interests" type="checkbox" value="体育/户外/健身" />  体育/户外/健身</li>
                    <li><input id="interests" name="customerInterests.interests" type="checkbox" value="汽车" />  汽车</li>
                    <li><input id="interests" name="customerInterests.interests" type="checkbox" value="游戏/股市" />  游戏/股市</li>
                </ul>
                
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">教育</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	
                <div class="jbzlIpunt">
                	<span><label>最高学历：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="radio" name="customerEduInfo.degree " id="radio" value="初中" class="radio08" />  初中 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                	<input type="radio" name="customerEduInfo.degree" id="radio" value="高中"  class="radio08"/>  高中 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                	<input type="radio" name="customerEduInfo.degree" id="radio" value="中专"  class="radio08"/>  中专 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                	<input type="radio" name="customerEduInfo.degree" id="radio" value="大专"  class="radio08"/>  大专<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                	<input type="radio" name="customerEduInfo.degree" id="radio" value="本科"  class="radio08" style="margin-left:97px;"/>  本科 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                	<input type="radio" name="customerEduInfo.degree" id="radio" value="硕士 "  class="radio08"/>  硕士 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                	<input type="radio" name="customerEduInfo.degree" id="radio" value="博士"  class="radio08"/>  博士<font>*</font></span>
                    <span><label>毕业学院：</label><input class="input08" type="text" name="customerEduInfo.school" id="school" onblur="checkSchool();"/><font>*</font>	
                    		<p class="p08" id="school_error"></p></span>
                    <span><label>专业：</label><input class="input08" type="text" name="customerEduInfo.graduate" id="graduate" onblur="checkGraduate();"/><font>*</font>
                    		<p class="p08" id="graduate_error"> </p></span>
                </div>
                
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">职业</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	
                <div class="jbzlIpunt">
                	<span><label>行业：</label><input class="input08" type="text" name="business" id="business" onblur="checkTeshu('#business','#business_error');"/><font>*</font>
                			<p class="p08" id="business_error"></p></span>
                    <span><label>公司名称：</label><input class="input08" type="text" name="company" id="company" onblur="checkTeshu('#company','#company_error');"/><font>*</font>
                    		<p class="p08" id="company_error"></p></span>
                    <span><label>职务：</label><input class="input08" type="text" name="jobDuty"  id="jobDuty" onblur="checkTeshu('#jobDuty','#jobDuty_error');"/><font>*</font>
                    		<p class="p08" id="jobDuty_error"></p></span>
                    <span><label>目前收入：</label><input class="input08" type="text" name="income"  id="income" onblur="checkIncome();"/><font>*</font>
                    		<p class="p08" id="income_error"></p></span>
                </div>
                
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">置业信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	
                <div class="jbzlIpunt">
                	<span><label>行业：</label><input class="input08" type="text" /><font>*</font></span>
                    <span><label>公司名称：</label><input class="input08" type="text" /><font>*</font></span>
                    <span><label>职务：</label><input class="input08" type="text" /><font>*</font></span>
                    <span><label>目前收入：</label><input class="input08" type="text" /><font>*</font></span>
                </div>
                
            </div>
        </div>
        
        	<p class="p08" id="errorEnd" ></p>
        <div class="tijiao">
        	<input type="image" id="tijiao" src="images/submit.jpg"  />
        	<input type="image" src="images/quxiao.jpg"/>
        </div>
        </form>
    </div>
    </div>
<!--End右边-->    
</body>
</html>