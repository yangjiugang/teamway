<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资料 - 我的蜂蜜</title>
<link rel="stylesheet" href="css/fparty/layout.css" type="text/css" />
<link rel="stylesheet" href="css/fparty/index.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/hide.js"></script>
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
<!---总体分类样式--->
<link href="css/fparty/yijiebao.css" rel="stylesheet" type="text/css" />
<!---End 总体分类样式--->
</head>

<body>
	<!--头部-->
	<div class="FlhTopOuts">
		<div class="FlhTops">
			<div class="FlhLogos"><img src="images/logoF.png" /></div>
			<div class="Y611grzy">
				<a href="#">赵美丽</a>的个人主页
			</div>
			<div class="TopRights">
				<span class="FLHMaps"><div>房立方</div>
					<img src="images/mapImg.png" /><font>主题会所分布网点</font></span> <span
					class="FLHphones"><div>服务热线：</div>
					<img src="images/phone2.jpg" /><font>400 61355288</font></span>
			</div>
		</div>
	</div>
	<div class="FLHEscOUTs">
		<div>
			<font>赵美丽欢迎你进入Ta的个人主页!</font>
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
				<ul class="Y611wdfm">
					<li><a href="#">[给Ta留言]</a></li>
					<li><a href="#">[给Ta发消息]</a></li>
				</ul>
			</div>
			<ul class="treeNav">
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><a href="Y611WDFM.html"><font>Ta的个人主页</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" /><a href=""><font>资料</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><a href="Y611WDFM-xiangce.html"><font>相册</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><a href="Y611WDFM-rizhi.html"><font>日志</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/9.jpg" /><a href="myFengMiCostFee"><font>开销记录</font></a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/10.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="Y611WDFM-fang.html">Ta分享给我的楼盘</a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="Y611WDFM-lygft.html">Ta分享给我的旅游购房团</a>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/12.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">Ta分享给我的活动</a>
					</div>
					<div class="xian"></div>
				</li>

			</ul>
		</div>
		<!--End左边-->
		<!--右边-->
		<div class="FLHRight">
		<div class="Out1">
        	<div class="khzlTitle"><font class="updown">基本资料</font><img src="images/zhankai(black).jpg" class="updown1"/></div>
            <div class="Content1">
            	<form>
<ul class="jbzl08">
<li><label>姓名：</label> ${userInfo.name }</li>
<li><label>性别：</label><c:if test="${userInfo.sex ==0}">男</c:if><c:if test="${userInfo.sex ==1}">女</c:if></li>
<li><label>籍贯：</label> ${userInfo.userCity }</li>
<li><label>民族：</label> ${userInfoDetail.nation }</li>
<li><label>婚姻状况：</label> <c:if test="${userInfoDetail.maritalStatus ==0}">未婚</c:if><c:if test="${userInfoDetail.maritalStatus ==1}">已婚</c:if><c:if test="${userInfoDetail.maritalStatus ==2}">离异</c:if><c:if test="${userInfoDetail.maritalStatus ==3}">再婚</c:if></li>
<li> &nbsp; </li>
<li><label>身高：</label> ${userInfoDetail.height }</li>
<li><label>体重：</label> ${userInfoDetail.weight }</li>
<li><label>目前职业：</label> 网页设计师</li>
<li><label>目前薪资：</label> ${userInfoDetail.salary }</li>
<li><label>最高学历：</label> ${userInfoDetail.highestDegree }</li>
<li><label>专业：</label> ${userInfoDetail.profession }</li>
<dl><label>毕业院校：</label> ${userInfoDetail.graduateSchool }</dl>
<li><label>首次工作时间：</label> <fmt:formatDate value="${userInfo.firstWorkDate }" pattern="yyyy-MM-dd "/></li>
<!-- <li><label>加盟平台日期：</label> 2011-07-24</li> -->
<div class="zwpj10"><div class="zwpj10left">自我评价：</div>
<div class="zwpj10right">${userInfo.userDesc }</div></div>
</ul>

                <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
				
                </form>
            </div>
        </div>
        
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">证件及照片</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>有效证件名称：</label> 身份证</li>
                <li><label>证件号码：</label> ${userInfoDetail.IDcard }</li>
                </ul>
             
                <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
				
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">联系方式</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>家庭电话：</label> ${userInfoDetail.telphone }</li>
                    <li><label>手机：</label> ${userInfoDetail.cellphone }</li>
                    <li><label>QQ：${userInfoDetail.qQ }</label> </li>
                    <li><label>MSN：</label> ${userInfoDetail.mSN }</li>
                    <li><label>E-mail：</label> ${email }</li>
                    <li>&nbsp;</li>
                    <li><label>博客：</label> ${userInfoDetail.blog }</li>
                    <li><label>微博：</label> ${userInfoDetail.weibo }</li>                    <li><label>紧急联系人：</label> ${userInfoDetail.emergencyPerson }</li>
                    <li><label>紧急联系方式：</label> ${userInfoDetail.emergencyPhone }</li>
                    <dl><label>工作地：</label> ${userInfo.userCity }</dl>
                    <dl><label>家庭常住地址：</label> ${userInfo.userCity }</dl>
                    <dl><label>户口所在地：</label> ${userInfoDetail.registeredAddress }</dl>
                    
                </ul>
                            
				
                </form>
            </div>
        </div><!-- 
       <div class="Out">
        	<div class="khzlTitle"><font class="updown">家庭成员信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
<!---家庭成员信息列表
	<div class="jiaoyijtcy08">
		<ul class="jiaoyijtcytop">
		<li>姓名</li>
		<li>与本人关系</li>
		<li>年龄</li>
		<li>工作单位</li>
		<li>职务</li>
		<li>联系电话</li>
		<li></li>
		</ul>
		<form id="familyForm">
		<ul class="jiaoyijtcyinput">
			<li><input value="" style="background:#EAEAEC;" name="memberName" id="memberName"></li>
			<li><input value="" style="background:#EAEAEC;" name="relationship" id="relationship"></li>
			<li><input value="" style="background:#EAEAEC;" name="birth" id="birth"></li>
			<li><input value="" style="background:#EAEAEC;" name="workCompany" id="workCompany"></li>
			<li><input value="" style="background:#EAEAEC;" name="duty" id="duty"></li>
			<li><input value="" style="background:#EAEAEC;" name="contactphone" id="contactphone"></li>
			<li><input type="button" class="jtcy81" style="width:54px; height:22px;"  onclick="submitButton7()"></li>
			</ul>
			</form>
<p class="jtcyts8" id="errP"></p>
		<c:forEach items="${userFamilyInfoList }" var="userFamilyInfo">
			<ul class="jiaoyijtcytext" id="familyInfoUL">
				<li>${userFamilyInfo.memberName }</li>
				<li>${userFamilyInfo.relationship }</li>
				<li><script type="text/javascript">	
				document.write(getAge("<fmt:formatDate value="${userFamilyInfo.birth }" pattern="yyyy-MM-dd "/>"));
			</script></li>
				<li>${userFamilyInfo.workCompany }</li>
				<li>${userFamilyInfo.duty }</li>
				<li>${userFamilyInfo.contactphone }</li>
				<li><input type="button" class="jtcy82" style="width:54px; height:22px;"></li>
			</ul>
			
			<input type="hidden" value="${userFamilyInfo.id}"/>
		</c:forEach>

</div>
 <!---End 家庭成员信息列表
</form>
            </div>
        </div> -->
        
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">教育</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>起始时间：</label> <fmt:formatDate value="${userEduInfo.beginDate }" pattern="yyyy-MM-dd "/></li>   
                    <li><label>结束时间：</label> <fmt:formatDate value="${userEduInfo.endDate }" pattern="yyyy-MM-dd "/></li>  
                    <li><label>毕业学院：</label> ${userEduInfo.school }</li>
                    <li><label>专业：</label> ${userEduInfo.profession }</li>
                    <li><label>学位：</label> ${userEduInfo.degree }</li>
                   
                </ul>
                <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">毕业肄业：</div>
<div class="zwpj10right">${userEduInfo.graduate }</div></div>
				
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">培训经历</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>培训机构：</label> ${userTrainingExperience.trainingCompany }</li>
                <li><label>职称：</label> ${userTrainingExperience.title}</li>
                <li><label>有无证件：</label> <c:if test="${userTrainingExperience.havePassport==0 }">没有</c:if><c:if test="${userTrainingExperience.havePassport==1 }">有</c:if></li>
                <li>&nbsp;</li>
                <li><label>时间：</label> <fmt:formatDate value="${userTrainingExperience.beginDate }" pattern="yyyy-MM-dd "/></li>
                <dl><label>地址：</label> ${userTrainingExperience.trainingAddress }</dl>
              
                </ul>
                <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">详细描述：</div>
<div class="zwpj10right">${userTrainingExperience.trainingDesc }</div></div>
				
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">工作经历</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>起始年月：</label> <fmt:formatDate value="${userWorkExperience.beginDate }" pattern="yyyy-MM-dd "/></li>
                    <li><label>结束年月：</label> <fmt:formatDate value="${userWorkExperience.endDate }" pattern="yyyy-MM-dd "/></li>
                    <li><label>工作单位名称：</label> ${userWorkExperience.workCompany }</li>
                    <li><label>职务：</label> ${userWorkExperience.jobDuty }</li>
                    <li><label>证明人：</label> ${userWorkExperience.reference }</li>
                    <li><label>联系电话：</label> ${userWorkExperience.contactPhone }</li>
                    <!-- <li><label>擅长楼盘：</label> ******</li> -->
                </ul>                
                <div class="zwpj10" style="margin-left:38px;"><div class="zwpj10left">详细描述：</div>
<div class="zwpj10right">${userWorkExperience.workDesc }</div></div>
                
                
                </form>
            </div>
        </div>
        <!--<div class="Out">
        	<div class="khzlTitle"><font>置业信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <div class="jbzlIpunt">
                	<span><label>行业：</label><input type="text" /><font>*</font></span>
                    <span><label>公司名称：</label><input type="text" /><font>*</font></span>
                    <span><label>职务：</label><input type="text" /><font>*</font></span>
                    <span><label>目前收入：</label><input type="text" /><font>*</font></span>
                </div>
                </form>
            </div>
        </div>-->
        
        <div class="Out">
        	<div class="khzlTitle"><font class="updown">兴趣爱好</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                  <ul class="jbzl08">
                  <c:forTokens items="${userInfoDetail.hobbies }" delims="," var="hobbies">
                	<li>${hobbies }</li>                  	
                  </c:forTokens>
                </ul>
				
                </form>
            </div>
        </div>
       
    </div>
		<!--End右边-->
	</div>
</body>
</html>
