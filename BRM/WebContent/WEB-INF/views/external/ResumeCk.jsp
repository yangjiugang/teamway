<%
/**********************************************************************
 * 查看在线简历
 * 2012-3-26 邓祥 新建
 **********************************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>查看简历</title>
	<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
	<style>
		.HR_RZXXLeft{ float:left; width:530px;}
		.HR_RZXXLeft p{ margin-left:20px; padding:5px 0; margin-bottom:5px;}
		.HR_RZXXLeft p input{ width:150px; margin:0 5px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff;}
		.HR_RZXXLeft p span{ margin-right:20px;}
		.HR_RZXXRight{ float:right; width:120px; text-align:center;}
		.HR_RZBL{ width:680px; padding:25px 0 0 20px; clear:both;}
		.HR_RZBL li{ float:left; width:340px; height:30px; line-height:30px;}
		.HR_RZBL li span{ width:90px; float:left; text-align:right;}
		.rzblInput{ width:200px; height:20px; line-height:20px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff;}
		.HR_ZZJL{ width:680px; padding:25px 0 0 20px; clear:both;}
		.NYinput{ width:100px; margin:0 5px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff;}
		.HR_ZZJL p{ margin-left:20px; padding:5px 0; margin-bottom:5px;}
		.XXMCinput{ width:182px; border-bottom:1px solid #C5E4F9; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff; margin-right:7px;}
		.selectXL{ width:120px; margin-right:5px;}
		.HR_RZBL_Casual textarea{ color:#025FA0; border:1px solid #C5E4F9;  box-shadow: 0 0 0 #FFFFFF inset;   line-height: 18px; overflow-x: hidden;  overflow-y: auto;text-indent:1em; margin-top:5px;}
		.xqah12{ width:680px; padding:25px 0 0 20px; clear:both;}
		.xqah12 li{ float:left; width:80px; margin-bottom:10px;}
		.xqah12 li input{ margin-right:5px;}
	</style>
	<script type="text/javascript">
	
		
		
		function clickEvent(key){
			var id= "#mode_"+key;
			var obj = this;
			intiModelCss();
			$(id).css("display","block");
			$("#"+obj.id).css("color","#EA0611");
		}
		
		function intiModelCss(){
			$("#mode_1").css("display","none");
			$("#mode_2").css("display","none");
			$("#mode_3").css("display","none");
			$("#mode_4").css("display","none");
			$("#mode_5").css("display","none");
			$("#mode_6").css("display","none");
			
		}
	</script>
</head>

<body>


<div class="HR_yidongweihu_Bottom myBox03">
	

	<div class="HR_lishijixiaoContent jixiaoContent" id="zzjs_zzjs" style="display: block;">
			<div class="H_left">
		   		<ul class="ul_tittle">
		        	<li><img src="images/-.jpg"  class="up"/>简历/外部人才库<br />
			            <ul class="ul_tittle">
							<li><a onclick="clickEvent(1)" style="cursor: pointer;"><span class="aa"></span>基本资料</a></li>
							<li><a onclick="clickEvent(2)" style="cursor: pointer;"><span class="aa"></span>工作经历</a></li>
							<li><a onclick="clickEvent(3)" style="cursor: pointer;"><span class="aa"></span>教育经历</a></li>
							<!--  <li><a onclick="clickEvent(4)" style="cursor: pointer;"><span class="aa"></span>培训经历</a></li>-->
		                    <li><a onclick="clickEvent(5)" style="cursor: pointer;"><span class="aa"></span>项目经验</a></li>
		                    <li><a onclick="clickEvent(6)" style="cursor: pointer;"><span class="aa"></span>技能专长</a></li>
						</ul>
		            </li>
		        </ul>
		    </div>
		<div class="H_right">
			<div class="HR_lishijixiaoR">
				<input type="button" class="HR_SearchR_DY29" />
				<input type="button" class="HR_SearchR_BC29" />
				<input type="button" class="HR_SearchR_FX29" />
			</div>
	        
		<div id="mode_1">
			<!-- 基本信息 -->
			<div class="HR_RZXXLeft">
				<p>
					<span>人才编号：<input class="rzblInput" value="${basic.userNum }" readonly="readonly"/></span>
					姓名：<input class="rzblInput" value="${basic.userName }" readonly="readonly" style="width:175px;"/>
				</p>
				<p>
					<span>性别：<input class="rzblInput" value="${basic.userSex==0?'男':'女' }" readonly="readonly" style="width:175px;"/></span>
					出生日期：<input class="rzblInput" value="<fmt:formatDate value="${basic.userBirthday }" pattern="yyyy年MM月dd日" type="date"/>" readonly="readonly"/>
					
				</p>
				<p>
					<span>Email：<input class="rzblInput" value="${basic.email }" readonly="readonly" style="width:167px;"/></span>
					联系电话：<input class="rzblInput" value="${basic.userTelphone }" readonly="readonly"/>
				</p>
				<p>
					户口所在地：<input class="rzblInput" value="${basic. hkPlace}" readonly="readonly" style="width:380px;"/>
				</p>
				<p>
					目前居住地：<input class="rzblInput" value="${basic.userAddress }" readonly="readonly" style="width:380px;"/>
				</p>
				
				<p>
					<span>证件类型：<input class="rzblInput" 
					  value=<c:if test="${basic.certificateType==0 }">"身份证"</c:if>
					        <c:if test="${basic.certificateType==1 }">"护照"</c:if>
					        <c:if test="${basic.certificateType==2 }">"其他"</c:if>
					  readonly="readonly"/></span>
					证件号码：<input class="rzblInput" value="${basic.certificateNum }" readonly="readonly"/>
				</p>
				<p>
					<span>籍贯：<input class="rzblInput" value="${basic.birthPlace }" readonly="readonly" style="width:175px;"/></span>
					身高：<input class="rzblInput" value="${basic.userHeight }cm" readonly="readonly" style="width:175px;"/>
				</p>
				<p> 
					
					最高学历名称：<input class="rzblInput" value="${basic.highestEducationName }" readonly="readonly" style="width:380px;"/>
				</p>
				<p>
					<span>学位：<input class="rzblInput" 
					value=<c:if test="${basic.degree == 0}">"无"</c:if>  
					<c:if test="${basic.degree == 1}">"学士"</c:if>
					<c:if test="${basic.degree == 2}">"双学士"</c:if>
					<c:if test="${basic.degree == 3}">"硕士"</c:if>
					<c:if test="${basic.degree == 4}">"博士"</c:if>
					readonly="readonly" style="width:175px;"/></span>
					专业：<input class="rzblInput" value="${basic.profession }" readonly="readonly" style="width:175px;"/>
				</p>
				<p>
					工作年限：<input class="rzblInput" value="${basic.workYears }年" readonly="readonly"/>
				</p>
				<p>
					<span>婚姻：
						<input class="rzblInput" value="${basic.isMarry==1?'单身':'已婚' }" readonly="readonly" style="width:175px;"/>
					</span>
					政治身份：
					<input class="rzblInput" 
							value=<c:if test="${basic.politicalConnection ==0}">"无党派"</c:if>  
									<c:if test="${basic.politicalConnection ==1}">"民主党派"</c:if> 
									<c:if test="${basic.politicalConnection ==2}">"党员"</c:if> 
					readonly="readonly"/>
				</p>	
				<p>
					<span>目前行业：<input class="rzblInput" value="${basic.presentBusiness }" readonly="readonly"/></span>
					目前岗位：<input class="rzblInput" value="${basic.presentPost }" readonly="readonly"/></p>
				<p>
					<span>目前月薪：<input class="rzblInput" value="${basic.presentSalaryMonth }" readonly="readonly"/></span>
					目前年薪：<input class="rzblInput" value="${basic.presentSalaryYear }" readonly="readonly"/>
				</p>
				<p>
				
					<span>求职状态：<input class="rzblInput" 
										value=<c:if test="${basic.workStatus == 0 }">"目前已离职"</c:if>
										<c:if test="${basic.workStatus == 1 }">"目前在职 不打算换工作 "</c:if>
										<c:if test="${basic.workStatus == 2 }">"目前在职打算换工作"</c:if> 
										readonly="readonly"/>
									</span>
					简历来源：<input class="rzblInput" value="${basic.resumeFrom }" readonly="readonly"/>
				</p>
				<p>
					<span>收录时间：<input class="rzblInput" 
										value="<fmt:formatDate value="${basic.createDate }" pattern="yyyy年MM月dd日" type="date"/>" 
										readonly="readonly"/>
									</span>
					交流次数：<input class="rzblInput" value="${basic.contactCnt }次" readonly="readonly"/>
				</p>
				<p>
				<span>最后交流人：<input class="rzblInput" value="${basic.lastUpdateUser }" readonly="readonly" style="width:138px;"/></span>
				最后更新时间：
						<input class="rzblInput" 
							value="<fmt:formatDate value="${basic.lastUpdateDate }" pattern="yyyy年MM月dd日" type="date"/> "
							readonly="readonly" style="width:128px;"/>
				</p>
			</div>
				
			<!-- <div class="HR_RZXXRight"><img src="images/poto-a.gif" /></div> -->
			
		</div>
	
		<div id="mode_2" style="display:none;">
			<!-- 工作经历 -->
			<div class="HR_ZZJL">
				<c:if test="${fn:length(works) == 0}">
					<center><p>暂无数据</p></center>
				</c:if>
				<c:forEach items="${works}" var="work" varStatus="status">
				
					<p>
						从<input class="NYinput" value="<fmt:formatDate value="${work.startDate }" pattern="yyyy-MM-dd" type="date"/> " readonly="readonly" />
						到<input class="NYinput" value="<fmt:formatDate value="${work.endDate }" pattern="yyyy-MM-dd" type="date"/> " readonly="readonly" />
						<span>
							月薪：<input class="NYinput"  value="${work.monthlyPay }" readonly="readonly" />
							年收入：<input class="NYinput"  value="${work.annualIncome }" readonly="readonly" />
						</span>
					</p>
					<p>
						行业类型：
						<select class="selectXL" name="">
						<option>博士</option>
						</select>
						公司名称：<input class="XXMCinput"  value="${work.companyName }" readonly="readonly" />
						公司人数规模：<input class="NYinput" style="width:95px;"  value="${work.companyPopulationScale }" readonly="readonly" />
					</p>
					<p>
						       部门：<input class="NYinput" style="width:113px;"  value="${work.department }" readonly="readonly" />
						工作性质：<input class="NYinput" style="width:134px;"  value="${work.workType }" readonly="readonly" />
						<span>
							最高职务：<input class="NYinput"  value="${work.highestPositions }" readonly="readonly" />
						</span>
					</p>
					<p class="HR_RZBL_Casual">
						主要职责描述：<br />
						<textarea style="width:620px; height:50px;" name="" cols="" rows="">${work.mainResponsibilities }</textarea>
					</p>
					
				</c:forEach>
			</div>
		</div>
	
		<div id="mode_3" style="display:none;">
			<!-- 教育经历 -->
			<div class="HR_ZZJL">
				<c:if test="${fn:length(edus) == 0}">
					<center><p>暂无数据</p></center>
				</c:if>
				<c:forEach items="${edus}" var="edu" varStatus="status">
				
					<p>从<input class="NYinput" value="<fmt:formatDate value="${edu.eduStartDate }" pattern="yyyy-MM-dd" type="date"/>" readonly="readonly"/>
					到<input class="NYinput"  value="<fmt:formatDate value="${edu.eduEndDate }" pattern="yyyy-MM-dd" type="date"/> " readonly="readonly"/>
						<span>
							学历：
							<select class="selectXL" name="education" id="education" >
								<option value="0">高中</option>
								<option value="1">中专</option>
								<option value="2">大专</option>
								<option value="3">本科</option>
								<option value="4">硕士</option>
								<option value="5">博士</option>
							</select>
						</span>
					</p>
					<p>学校名称：<input class="XXMCinput" value="${edu.schoolName }" readonly="readonly"/>
					专业：<input class="XXMCinput" value="${edu.profession }" readonly="readonly"/>
					</p>
					<p class="HR_RZBL_Casual">其他辅修专业：<br/>
						<textarea style="width:620px; height:50px;" name="" cols="" rows="">${edu.otherProfession }</textarea>
					</p>
				</c:forEach>	
		
			</div>
		</div>
	
		<!--  <div id="mode_4" style="display:none;">
			<!-- 培训经历 -->
		<!--  </div>-->
		
		<div id="mode_5" style="display:none;">
			<!-- 项目经验 -->
			<div class="HR_ZZJL">
				<p class="HR_RZBL_Casual">
					项目描述：<br /><textarea style="width:620px; height:150px;" name="" cols="" rows="">${pro.projectDesc }</textarea>
				</p>
			</div>
		</div>
	
		<div id="mode_6" style="display:none;">
			<!-- 技能专长 -->
			<div class="HR_ZZJL">
				<p class="HR_RZBL_Casual">
					技能专长：<br />
					<textarea style="width:620px; height:150px;" name="" cols="" rows="">${skill.skillDesc}</textarea>
				</p>
			</div>
		</div>
		
		
	</div>

</div>

</div>



<div class="HR_lishijixiaoContent">
</div>
</body>
</html>
