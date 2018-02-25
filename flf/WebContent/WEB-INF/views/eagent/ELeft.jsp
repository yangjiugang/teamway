<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fc.flf.common.util.*" %>
 	<div class="FLHLeft">
    	<div class="FLHzl">
        	<span class="photo"><img src="images/touxiang.jpg" /></span>
            <ul class="nickname">
            	
                <li>姓名：赵美丽</li>
                <li>生日：8.26</li>
                <li><img src="images/80.jpg" /></li>
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
        	<% 
        	   String module = SessionInfo.getEagentModule(request);
        	   if(Constants.EAGENT_MODULES.HOME.name.equals(module)) { 
        	%>
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="eagent_geren_info">资料</a></font>
              </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="rizhiY04.html">日志</a></font>
               </div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="Y13xiangce-geren.html">相册</a></font>
                </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="GRZYkxjlY06.html">开销</a></font>
               </div>
              <div class="xian"></div> 	
            </li>
			<li>&nbsp;</li>
            <li>&nbsp;</li>
        	<% } else if(Constants.EAGENT_MODULES.CLIENT.name.equals(module)) { %>
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="Y03juluyuehui-kehu.html">约会管理</a></font>
                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="index-kehu-tianjia.html">添加客户</a></font>
                </div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="index-b-a.html">全部客户</a></font>
                </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="index-b-c.html">下过单的客户</a></font>
                </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><font><a href="index-b-e.html">看过房的客户</a></font>
                </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/6.jpg" /><font><a href="index-b-d.html">参加过购房团的客户</a> </font>
                </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/7.jpg" /><font><a href="index-b-f.html">参加过活动的客户</a></font>
                </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/8.jpg" /><font><a href="index-b-b.html">发表过评论的客户</a></font>
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
        	<% } else if(Constants.EAGENT_MODULES.HOUSE.name.equals(module)) { %>
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="#">我发布的房源</a></font>
                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="saleHouse?userId=${user.userId}">我认售的房源</a></font> 
				</div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="studyHouse?userId=${user.userId}">我学习过的房源</a></font>
                </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="customerSkimHouse?userId=${user.userId}">我的客户关注的房源</a></font>
                </div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><font><a href="customerCollectHouse?userId=${user.userId}">我的客户收藏的房源</a></font>
                </div>
                <div class="xian"></div>
            </li>
			<li>&nbsp;</li>
            <li>&nbsp;</li>
        	<% } else if(Constants.EAGENT_MODULES.ORDER.name.equals(module)) { %>
        	<li>
            	<div class="treefont">
                	<img src="images/7.jpg" /><font><a href="jiaoyiY4.html">报名（下订单）</a></font>
               	</div>
                <div class="xian"></div>
          	</li>
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="myBuyHouseOrder?index=1">我的购房类订单</a></font>
              	</div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="myBuyHouseOrder?index=2">我的看房类订单</a></font>
              	</div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="myBuyHouseOrder?index=3">我的参团类订单</a></font>
               	</div>
              	<div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="myBuyHouseOrder?index=4">我的参加活动类订单</a></font>
              	</div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><font><a href="dingdanY4.html">我的全部类型订单</a></font>
           		</div>
                <div class="xian"></div>
            </li>
			<li>&nbsp;</li>
            <li>&nbsp;</li>
        	<% } else if(Constants.EAGENT_MODULES.STUDY.name.equals(module)) { %>
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="eagent_study_jumpClubStudy?type=0">形象礼仪</a></font>
              	</div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="eagent_study_jumpClubStudy?type=1">销售技巧</a></font>
               	</div>
               	<div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="eagent_study_jumpClubStudy?type=2">行业政策</a></font>
               	</div>
              	<div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="eagent_study_jumpClubStudy?type=3">其他学习</a></font>
             	</div>
               <div class="xian"></div>	
            </li>
			<li>&nbsp;</li>
            <li>&nbsp;</li>
        	<% } else if(Constants.EAGENT_MODULES.FRIEND.name.equals(module)) { %>
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="index-haoyou.html">好友管理</a></font>
                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="jumpInvite">邀请好友</a></font>
                </div>
               <div class="xian"></div>	
            </li>
			<li>&nbsp;</li>
            <li>&nbsp;</li>
            <% } else if(Constants.EAGENT_MODULES.PLAY.name.equals(module)) { %>
        	<% } else { %>
        	<li>
            	<div class="treefont">
                	<img src="images/1.jpg" /><font><a href="shouSaleHouse?userId=${userid }">认售楼盘</a></font>
                </div>
                <div class="xian"></div>
            </li> 
            <li>
            	<div class="treefont">
                	<img src="images/2.jpg" /><font><a href="index-a-tianjia.html">添加客户</a></font>
               </div>
               <div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/3.jpg" /><font><a href="queryCustomerContact?curPage=1&pageSize=10">记录约会</a></font>
               	</div>
              <div class="xian"></div> 	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/4.jpg" /><font><a href="eagent_dailyHome">写日志</a></font>
              	</div>
               	<div class="xian"></div>	
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/5.jpg" /><font><a href="Y13xiangce.html">传靓照</a></font>
                </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/6.jpg" /><font><a href="costFee?CurPage=1&PageSize=10">记录开销</a></font>
             	</div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/7.jpg" /><font><a href="queryCustomerApply">报名（下订单）</a></font>
                </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/8.jpg" /><font><a href="HomeTJFXY4.html">推荐分享</a></font>
                </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><font><a href="#">社交hub</a></font>
               	</div>
                <div class="xian"></div>
            </li>
			<li>&nbsp;</li>
            <li>&nbsp;</li>
        	<% } %>
            <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><font><a href="#">我的财富<%=module %></a></font>
               	</div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><font><a href="#">积分商场</a></font>
               	</div>
                <div class="xian"></div>
            </li>
			<li>
            	<div class="treefont">
                	<img src="images/9.jpg" /><font><a href="#">积分兑换</a></font>
               	</div>
                <div class="xian"></div>
            </li>
            <li>&nbsp;</li>
            <li>&nbsp;</li>
            <li>
            	<div class="treefont">
                	<img src="images/10.jpg" /><font><a href="../funlifun/monopolyofsale.html">搜索房源</a></font>
                </div>
                <div class="xian"></div>
            </li>
            <li>
            	<div class="treefont">
                	<img src="images/11.jpg" /><font><a href="search">搜索购房团</a></font>
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
                	<img src="images/12.jpg" /><font><a href="../funlifun/monopolyofsaleM2.html">搜索蜂蜜</a></font>
               	</div>
                <div class="xian"></div>
            </li>
        </ul>
    </div>