<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<title>社保</title>
</head>
<body>
	<div class="HR_ZZJL">
		<p>
			社保类型名称：<input class="XXMCinput" value="${security.ssName }"/>
		</p>
		<p class="HR_RZBL_Casual">社保名称类型说明：<br />
			<textarea style="width:620px; height:50px;" name="" cols="" rows="">${security.ssDesc }</textarea>
		</p>
		<p>
			<span>
				地区名称：<input class="XXMCinput" style="width:206px;" value="${security.areaName }" />
			</span>
			户口类型：<input class="XXMCinput" style="width:206px;" value="${security.hkType }"/>
		</p>
		<p>
			<span>
				养老险个人缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.endowmentInsurancePersonRate }" />
			</span>
			养老险公司缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.endowmentInsuranceCompanyRate }" />
		</p>
		<p>
			<span>
				养老险总比率：<input class="XXMCinput" value="${security.endowmentInsuranceRate }" />
			</span>
			养老险附加额：<input class="XXMCinput" value="${security.endowmentInsurancePlus }" />
		</p>
		<p style="border-bottom:1px solid #60B9F9; width:620px; _margin-top:-20px;"></p>
		<p>
			<span>
				失业险个人缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.unemploymentPersonRate }" />
			</span>
			失业险公司缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.unemploymentCompanyRate }"/>
		</p>
		<p>
			<span>
				失业险总比率：<input class="XXMCinput" value="${security.unemploymentRate }" />
			</span>
			失业险附加额：<input class="XXMCinput" value="${security.unemploymentPlus }" />
		</p>
		<p style="border-bottom:1px solid #60B9F9; width:620px; _margin-top:-20px;"></p>
		
		<p>
			<span>
				医疗险个人缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.healthInsurancePersonRate }"/>
			</span>
			医疗险公司缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.healthInsuranceCompanyRate }"/>
		</p>
		<p>
			<span>
				医疗险总比率：<input class="XXMCinput" value="${security.healthInsuranceRate }"/>
			</span>
			医疗险附加额：<input class="XXMCinput" value="${security.healthInsurancePlus }"/></p>
		<p style="border-bottom:1px solid #60B9F9; width:620px; _margin-top:-20px;"></p>
		<p>
			<span>
				工伤险个人缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.injuryInsurancePersonRate }" />
			</span>
			工伤险公司缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.injuryInsuranceCompanyRate }"/></p>
		<p>
			<span>
				工伤险总比率：<input class="XXMCinput" value="${security.injuryInsuranceRate }"/>
			</span>
			工伤险附加额：<input class="XXMCinput" value="${security.injuryInsurancePlus }"/>
		</p>
		<p style="border-bottom:1px solid #60B9F9; width:620px; _margin-top:-20px;"></p>
		<p>
			<span>
				生育险个人缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.birthInsurancePersonRate }"/>
			</span>
			生育险公司缴纳比率：<input class="XXMCinput" style="width:147px;" value="${security.birthInsuranceCompanyRate }"/>
		</p>
		<p>
			<span>
				生育险总比率：<input class="XXMCinput" value="${security.birthInsuranceRate }"/>
			</span>
			生育险附加额：<input class="XXMCinput" value="${security.birthInsurancePlus }"/>
		</p>
		<p style="border-bottom:1px solid #60B9F9; width:620px; _margin-top:-20px;"></p>
		<p>
			<span>
				住房公积金个人缴纳比率：<input class="XXMCinput" style="width:123px;" value="${security.housingFundPersonRate }"/>
			</span>
			住房公积金公司缴纳比率：<input class="XXMCinput" style="width:120px;" value="${security.housingFundCompanyRate }"/>
		</p>
		<p>
			<span>
				住房公积金总比率：<input class="XXMCinput" style="width:158px;" value="${security.housingFundRate }"/>
			</span>
			住房公积金附加额：<input class="XXMCinput" style="width:157px;" value="${security.housingFundPlus }"/>
		</p>
	</div>
</body>
</html>