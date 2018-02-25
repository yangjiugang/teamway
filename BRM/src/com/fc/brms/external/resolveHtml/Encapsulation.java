package com.fc.brms.external.resolveHtml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserEduInfo;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.domain.UserWorkExperience;
import com.fc.brms.common.util.DateTools;


/**
 * 
 * @author 邓祥
 * 从网站上抓取的数据封装
 * @version 2012-3-26
 */
public class Encapsulation {

	 
	/**
	 * 封装基本信息数据
	 * @param basic
	 * @return
	 */
	public  UserResume getUserResume(List basic) {
		
		UserResume userResume = new UserResume();
		DateTools dateTools = new DateTools();
		
		
		 int basicSize = basic.size();
		 for (int y = 1; y < basicSize; y++) {
				 String tr = basic.get(y).toString();
				 if(tr.indexOf("姓名")!=-1){
					 userResume.setUserName(basic.get(y+1).toString());
				 }else if(tr.indexOf("性别")!=-1){
					 String strSex = basic.get(y+1).toString();
					 if("男".equals(strSex)){
		        		 userResume.setUserSex(0);//性别
		        	 }else{
		        		 userResume.setUserSex(1);//性别
		        	 }
				 }else if(tr.indexOf("年龄")!=-1){
					 userResume.setYear(basic.get(y+1).toString());
				 }else if(tr.indexOf("出生日期")!=-1){
					 String userBirthday = basic.get(y+1).toString();
					 if(!"".equals(userBirthday)){
						 userResume.setUserBirthday( dateTools.stringToDateD(userBirthday));
					 }
				 }else if(tr.indexOf("婚姻状况")!=-1){
					 String isMarry = basic.get(y+1).toString();
					 if("未婚".equals(isMarry)){
		        		 userResume.setIsMarry(1);
		        	 }else if("已婚".equals(isMarry)){
		        		 userResume.setIsMarry(2);
		        	 }else if("离异".equals(isMarry))
		        		 userResume.setIsMarry(3);
				 }else if(tr.indexOf("身高")!=-1){
					 String height = basic.get(y+1).toString();
					 if(!"".equals(height)){
						 height =  height.substring(0, height.indexOf("C"));
		 				 userResume.setUserHeight(Integer.valueOf(height));
					 }
				 }else if(tr.indexOf("目前所在地")!=-1){
					 userResume.setUserAddress(basic.get(y+1).toString());
				 }else if(tr.indexOf("户囗所在地")!=-1){
					 userResume.setHkPlace(basic.get(y+1).toString());
				 }else if(tr.indexOf("最高学历")!=-1){
					 userResume.setHighestEducationName(basic.get(y+1).toString());
				 }else if(tr.indexOf("专业")!=-1){
					 userResume.setProfession(basic.get(y+1).toString());
				 }else if(tr.indexOf("目前岗位")!=-1){
					 userResume.setPresentPost(basic.get(y+1).toString());
				 }else if(tr.indexOf("目前月薪")!=-1){
					 String presentSalaryMonth = basic.get(y+1).toString();
					 if(!"".equals(presentSalaryMonth)){
						 if(presentSalaryMonth.indexOf("保密")!=-1){
							 userResume.setPresentSalaryMonth(0);
						 }else{
							 presentSalaryMonth = presentSalaryMonth.replaceAll("￥", "");
							 presentSalaryMonth = presentSalaryMonth.replaceAll("以上", "");
							 userResume.setPresentSalaryMonth(Integer.valueOf(presentSalaryMonth));
						 }
					 }
					 
				 }else if(tr.indexOf("目前行业")!=-1){
					 userResume.setPresentBusiness(basic.get(y+1).toString());
				 }
				 //else if("英语水平：" .equals(tr)){
//					 //userResume.setYear(basic.get(y+1).toString());
//				 }else if("英语级别：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
//				 }else if("计算机：" .equals(tr)){
//					 //userResume.setYear(basic.get(y+1).toString());
//				 }else if("第二外语：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
//				 }else if("水平：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
				 //}
		 		
//				 else if("期望月薪：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
//				 }else if("意向地区：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
//				 }else if("住房要求：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
//				 }else if("意向行业：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
//				 }else if("可到岗时间：" .equals(tr)){
//					 //userResume.setYear(basic.get(y+1).toString());
//				 }else if("意向岗位：" .equals(tr)){
//					// userResume.setYear(basic.get(y+1).toString());
//				 }
			}
		 userResume.setResumeFrom("人才热线");
		
		return userResume;
	}
	
	
	/**
	 * 封装工作经验
	 * @param experience
	 * @return
	 */
	public List getExperience(List experience){
		
		Map strMap = new HashMap();
		List listJihe = new ArrayList();
		List experienceList = new ArrayList();
		DateTools dateTools = new DateTools();
		int experienceSize =  experience.size();
		 int m = 0;
		 for (int i = 1; i < experienceSize; i++) {
		 	listJihe.add(experience.get(i));
			int s = i%6;
			if(s==0){
				strMap.put(m++, listJihe);
				listJihe = new ArrayList();
			}
		}
		 int mapSize = strMap.size();
		 for (int y = 0; y < mapSize; y++) {
			 List listV =  (List) strMap.get(y);
			 UserWorkExperience  exp = new UserWorkExperience(); 
			 String allDate = listV.get(0).toString();//工作时间
			 allDate = allDate.replaceAll("/", "-");
			 allDate = allDate.replaceAll(" ", "");
			 String startDate = allDate.substring(0, allDate.indexOf("至"));//开始时间
			 startDate = startDate+"-00";
			 String endDate = allDate.substring(allDate.indexOf("至")+1, allDate.length());//结束时间
			 if("今".equals(endDate)){
				 endDate = dateTools.getToday();
			 }else{
				 endDate = endDate +"-00";
			 }
			 
			 exp.setStartDate(dateTools.stringToDateD(startDate));
			 exp.setEndDate(dateTools.stringToDateD(endDate));
			 exp.setHighestPositions(listV.get(1).toString());//最高职务
			 exp.setCompanyName(listV.get(2).toString());//公司名称
			 String monthlyPay = listV.get(4).toString();//月薪
			 if("保密".equals(monthlyPay)){
				 exp.setMonthlyPay(0);
			 }else{
				 monthlyPay = monthlyPay.replaceAll("￥", "");
				 exp.setMonthlyPay(Integer.valueOf(monthlyPay));
			 }
			 exp.setMainResponsibilities(listV.get(5).toString());//主要职责描述：
			 experienceList.add(exp);
		 }
		 
		return experienceList;
		
		
	}

	
	/**
	 * 封装教育背景
	 * @param educate
	 * @return
	 */
	public List getEducate(List educate){
		
		
		Map strMap = new HashMap();
		List listJihe = new ArrayList();
		List educateList = new ArrayList();
		int educateSize =  educate.size();
		DateTools dateTools = new DateTools();
		 int m = 0;
		 for (int i = 1; i < educateSize; i++) {
		 	listJihe.add(educate.get(i));
			int s = i%5;
			if(s==0){
				strMap.put(m++, listJihe);
				listJihe = new ArrayList();
			}
		}
		 int mapSize = strMap.size();
		 for (int y = 0; y < mapSize; y++) {
			 List listV =  (List) strMap.get(y);
			 UserEduInfo  userEduInfo = new UserEduInfo(); 
			 userEduInfo.setEduType(0);
			 String allDate = listV.get(0).toString();//受教育时间
			 allDate = allDate.replaceAll("/", "-");
			 allDate = allDate.replaceAll(" ", "");
			 
			 String startDate = allDate.substring(0, allDate.indexOf("至"));//开始时间
			 startDate = startDate+"-00";
			 String endDate = allDate.substring(allDate.indexOf("至")+1, allDate.length());//结束时间
			 endDate = endDate +"-00";
			 userEduInfo.setEduStartDate(dateTools.stringToDateD(startDate));
			 userEduInfo.setEduEndDate(dateTools.stringToDateD(endDate));
			 String education = listV.get(1).toString();//学历
			 education = education.replaceAll(" ","");
			 //高中0；中专1；大专2；本科3；硕士研究生4；博士研究生5；博士后6
			 if("初中".equals(education)){
				 userEduInfo.setEducation(0);
			 }else if("高中".equals(education)){
				 userEduInfo.setEducation(0);
			 }else if("中技".equals(education)){
				 userEduInfo.setEducation(1);
			 } else if("中专".equals(education)){
				 userEduInfo.setEducation(1);
			 }else if("大专".equals(education)){
				 userEduInfo.setEducation(2);
			 }else if("本科".equals(education)){
				 userEduInfo.setEducation(3);
			 }else if("硕士".equals(education)){
				 userEduInfo.setEducation(4);
			 }else if("博士".equals(education)){
				 userEduInfo.setEducation(5);
			 }else{
				 userEduInfo.setEducation(0);
			 }
			 //userEduInfo.set
			 userEduInfo.setProfession(listV.get(2).toString());//专业
			 userEduInfo.setSchoolName(listV.get(3).toString());//学校
			 educateList.add(userEduInfo);
		 }
		 
		return educateList;
		
		
		
	}
	
	
}
