<%@ page language="java" contentType="text/html; charset=UTf-8"
	pageEncoding="UTf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户-详细资料</title>
<link rel="stylesheet" href="css/eagent/layout.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/index.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/yijiebao.css" type="text/css" />
<link rel="stylesheet" href="css/eagent/kehu.css" type="text/css" />
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
    	<font>欢迎您进入房乐会! <a href="Denglu">[安全退出]</a></font>
    </div>
</div>
<!--End头部-->
<div class="middle">
<!--左边-->
 	<div class="FLHLeft">
    	<div class="FLHzl">
        	<span class="photo"><img src="images/touxiang.jpg" id="open_btn"/></span>
            <ul class="nickname">
            	
                <li>姓名：赵美丽</li>
                <li>生日：8.26</li>
                <li><img src="images/8%.jpg" /></li>
            </ul>
            <span class="linkage">
            	<span style="margin:0;"><a href="" id="open_btn">[更换头像]</a></span><span><a href="">[完善资料]</a></span><span><a href="">[修改密码]</a></span>           
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
						<img src="images/2.jpg" /><font><a href="IndexKehuTianjia">添加客户</a></font>
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
						<img src="images/10.jpg" /><font><a
							href="../funlifun/monopolyofsale.html">搜索房源</a></font>
					</div>
					<div class="xian"></div>
				</li>
				<li>
					<div class="treefont">
						<img src="images/11.jpg" /><font><a
							href="../funlifun/monopolyofsale(L).html">搜索购房团</a></font>
					</div>
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
						<img src="images/12.jpg" /><font><a
							href="../funlifun/monopolyofsaleM2.html">搜索蜂蜜</a></font>
					</div>
					<div class="xian"></div>
				</li>
        </ul>
    </div>
<!--End左边-->
<!--右边-->
   <div class="FLHRight">
     <div class="kehu-c" style=" margin:30px 0 0 28px; float:left; display:inline; border:none;">
	           <dl>
		          <a href="IndexKehuXiangqing?nameXiangqing=${list.customerInfoDetail.cusId}"><img src="images//mishu-mg.gif" border="0" /></a>
			      <dt><span><a href="#">发信息</a></span><span><a href="">留言</a></span><span><a href="HomeTJFXY4">推荐</a></span>姓名：<a href="IndexKehuXiangqing?nameXiangqing=${list.customerInfoDetail.cusId}">${list.customerInfoDetail.neme}</a></dt>
                  <dt>生日： <fmt:formatDate value="${list.customerInfoDetail.birthday}" type="date"/>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户类别： ${list.typeName}</dt>
                  <dt>手机号：${list.customerInfoDetail.cellphone}&nbsp;&nbsp;&nbsp;兴趣爱好：${list.customerInterests.interests}</dt>				
		      </dl>
	</div>	
	<div style=" float:right; margin:78px 45px 0 0; display:inline;">客户信息完成度：<span class="red">50%</span></div> 
		<div class="Out1" style="float:left; margin:0 0 0 38px; display:inline; width:700px;">
        	<div class="khzlTitle"><font>基本资料</font><img src="images/zhankai(black).jpg" class="updown1"/></div>
            <div class="Content1">
            	<form>
           <ul class="jbzl08">
<li><label>姓名：</label> ${cusInfo.neme}</li>
<li><label>性别：</label> ${cusInfo.sex}</li>
<li><label>出生年月日：</label> <fmt:formatDate value="${cusInfo.birthday}" type="date"/></li>
<li><label>国籍：</label> ${cusList.citizenship}</li>
<li><label>籍贯：</label> ${cusList.registeredAddress}</li>
<li><label>民族：</label>  ${cusInfo.nation}</li>
<li><label>婚姻状况：</label> ${cusInfo.maritalStatus}</li>
</ul>
                
                
                
              <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
           <ul class="jbzl08">
<li><label>姓名：</label> ${cusInfo.neme}</li>
<li><label>性别：</label> ${cusInfo.sex}</li>
<li><label>出生年月日：</label> <fmt:formatDate value="${cusInfo.birthday}" type="date"/></li>
<li><label>国籍：</label> ${cusList.citizenship}</li>
<li><label>籍贯：</label> ${cusList.registeredAddress}</li>
<li><label>民族：</label>  ${cusInfo.nation}</li>
<li><label>婚姻状况：</label> ${cusInfo.maritalStatus}</li>
</ul>
            	<div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
                
            </div>
        </div>
        
        <div class="Out">
        	<div class="khzlTitle"><font>证件及照片</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>有效证件名称：</label> ${cusInfo.idType}</li>
                <li><label>证件号码：</label> ${cusInfo.iDNum}</li>
                </ul>
                <div class="newphoto">
                	<img src="images/newphoto.jpg" />
                </div>
				<div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font>联系方式</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li><label>家庭电话：</label> ${cusInfo.telphone}</li>
                    <li><label>手机：</label> ${cusInfo.cellphone}</li>
                    <li><label>QQ：</label> ${cusInfo.qQ}</li>
                    <li><label>MSN：</label>${cusInfo.mSN}</li>
                    <li><label>博客：</label>${cusInfo.blog}</li>
                    <li><label>微博：</label>${cusInfo.weibo}</li>
                    <dl><label >E-mail：</label>${cusInfo.email}</dl>
                    <dl><label>工作地：</label> ${cusInfo.workPlace}</dl>
                    <dl><label>家庭常住地址：</label> ${cusInfo.address}</dl>
                    <dl><label>户口所在地：</label> ${cusInfo.registeredAddress}</dl>
                    
                </ul>
				<div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font>家庭成员信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <c:forEach items="${famList }" var="famList">
                <div class="jbzlIpunt">
                	<span class="xinxi">成员信息：<img src="images/zhankai(black)1.jpg" class="updown2"/></span>
                    <ul class="jbzl08 Content2">
                    <li><label>姓名：</label> ${famList.memberName}</li>
                        <li><label>与本人关系：</label>  ${famList.relationship}</li>
                        <li><label>年龄：</label> *****</li>
                        <li><label>工作单位：</label>${famList.workPlace}</li>
                        <li><label>职务：</label>${famList.jobDuty}</li>
                        <li><label>联系电话：</label>${famList.contactphone}</li>
                    </ul>
                </div>
       			</c:forEach>
				<div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font>兴趣与爱好</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                <li>${cusInList.interests}</li>
</ul>
<div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font>教育</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                 <li><label>最高学历：</label> ${eduList.degree}</li>   
                    <li><label>毕业学院：</label>${eduList.school}</li>   
                    <li><label>专业：</label>${cusInfo.profession}</li>
                 </ul>
<div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
				
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font>职业</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                 <li><label>行业：</label>${cusInfo.profession}</li>   
                    <li><label>公司名称：</label> ${cusInfo.company}</li>   
                    <li><label>职务：</label> ${cusInfo.jobDuty}</li>
                    <li><label>目前收入：</label> ${cusInfo.income}</li>
                   
                </ul>                
				<div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
            </div>
        </div>
        <div class="Out">
        	<div class="khzlTitle"><font>置业信息</font><img src="images/zhankai(black)1.jpg" class="updown"/></div>
            <div class="Content">
            	<form>
                <ul class="jbzl08">
                    <li><label>行业：</label>${cusInfo.profession}</li>   
                    <li><label>公司名称：</label> ${cusInfo.company}</li>   
                    <li><label>职务：</label> ${cusInfo.jobDuty}</li>
                    <li><label>目前收入：</label> ${cusInfo.income}</li>
                </ul> 
                <div class="tijiao" style="float:right;">
        	          <input type="image" src="images/bc11.gif" />
        	          <input type="image" src="images/submit-b.gif" />
                  </div>
                </form>
            </div>
        </div>
        
       
  </div>
    </div>
<!--End右边-->    
</div>
</body>
</html>