package com.fc.brms.broker.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.broker.mapper.IAppraisalManagementMapper;
import com.fc.brms.broker.service.IAppraisalManagementService;
import com.fc.brms.common.domain.DateProperty;
import com.fc.brms.common.domain.EmployeeAppraisal;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.SessionInfo;

@Service
public class AppraisalManagementServiceImpl implements IAppraisalManagementService{

	@Resource
	private IAppraisalManagementMapper amm;
	
	/**
	 * 获取绩效记录(条件搜索)
	 * @param employeeAppraisal
	 * @return
	 */
	public List<EmployeeAppraisal> searchEmployeeAppraisal(
			EmployeeInfo employeeInfo,Page page,DateProperty dateProperty) {
		if(employeeInfo.getStartTime()=="" ||employeeInfo.getStartTime()==null){
			String[] str = monthDayAndLastDay(1);
			employeeInfo.setStartTime(str[0]);
			employeeInfo.setEndTime(str[1]);
		}
		if(dateProperty.getYear()!=""&&dateProperty.getMonth()!=""){
			if("0".equals(dateProperty.getMonth())){
				employeeInfo.setStartTime(dateProperty.getYear());
				employeeInfo.setEndTime(dateProperty.getYear());
				
			}else{
				int year = Integer.parseInt(dateProperty.getYear());
				int month = Integer.parseInt(dateProperty.getMonth());
				String fristDay = getFirstDayOfMonth(year,month);
				String lastDay = getLastDayOfMonth(year,month);
				employeeInfo.setStartTime(fristDay);
				employeeInfo.setEndTime(lastDay);
				System.out.println(lastDay);				
			}
		}
		page.setRecords(amm.countSearchEmployeeAppraisal(employeeInfo));
		employeeInfo.setLimit(page.getLimit());
		return amm.searchEmployeeAppraisal(employeeInfo);
	}

	/**
	 * 返回本/上月第一天和最后一天 
	 * @param i 0 上个月  1 本月
	 * @return
	 */
	public String[] monthDayAndLastDay(int i){
		Date date = new Date();
		String strTime = "";
		String endTime = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		cld.add(Calendar.MONTH, i);
		strTime = cld.get(Calendar.YEAR)+"-"+addZeroForNum(cld.get(Calendar.MONTH)+"",2)+"-"+addZeroForNum("1",2);
		cld.set(Calendar.DAY_OF_MONTH, -1);
		cld.roll(Calendar.DAY_OF_MONTH, 1);
		endTime = DateTools.dateToString(cld.getTime());
		return new String[]{strTime,endTime};
	}
	
	
	/**
	 * 得到某年某月的最后一天
	 * @param year
	 * @param month
	 * @return
	 */
	public String getLastDayOfMonth(int year, int month) {  	    

		  Calendar cal = Calendar.getInstance();     
		  cal.set(Calendar.YEAR, year); 		    
		  cal.set(Calendar.MONTH, month-1); 	   
		  cal.set(Calendar.DAY_OF_MONTH, 1);  
		  int value = cal.getActualMaximum(Calendar.DAY_OF_MONTH);  
		  cal.set(Calendar.DAY_OF_MONTH, value);  
		  return new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()); 	   
		 } 
	

	/**
	 * 得到某年某月的第一天
	 * @param year
	 * @param month
	 * @return
	 */
	 public String getFirstDayOfMonth(int year, int month) {  
		 Calendar cal = Calendar.getInstance();  
		 cal.set(Calendar.YEAR, year);  
		 cal.set(Calendar.MONTH, month-1);  
		 cal.set(Calendar.DAY_OF_MONTH, cal.getMinimum(Calendar.DATE));   
   return new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()); 
 } 


	
	public String addZeroForNum(String str, int strLength) {
			int strLen = str.length();
			if (strLen < strLength) {
				while (strLen < strLength) {
					StringBuffer sb = new StringBuffer();
					sb.append("0").append(str);//左补0
					// sb.append(str).append("0");//右补0
					str = sb.toString();
					strLen = str.length();
				}
			}
	
			return str;
	}


	/**
	 * 根据Id查找EmployeeAppraisal
	 * @param employeeId
	 * @return
	 */
	public List<EmployeeAppraisal> getEmployeeAppraisalById(int employeeId,Page page){
		page.setRecords(amm.countEmployeeAppraisalById(employeeId));
		return amm.getEmployeeAppraisalById(employeeId,page.getLimit());
	}
	
	/**
	 * 检查新增的绩效是否在本月重复
	 * monthType :0 本月 
	 * monthType :1 上月
	 * @return
	 */
	public int countEmployeeAppraisalByIdStartTimeEndTime(EmployeeAppraisal employeeAppraisal,String monthType){
		if("0".equals(monthType)){
			String[] str = monthDayAndLastDay(1);
			employeeAppraisal.setAppraisalStartDate(str[0]);
			employeeAppraisal.setAppraisalEndDate(str[1]);
		}
		if("1".equals(monthType)){
			String[] str = monthDayAndLastDay(0);
			employeeAppraisal.setAppraisalStartDate(str[0]);
			employeeAppraisal.setAppraisalEndDate(str[1]);
		}
		return amm.countEmployeeAppraisalByIdStartTimeEndTime(employeeAppraisal);
	}
	
	/**
	 * 新增绩效
	 * monthType :0 本月 
	 * monthType :1 上月
	 * @param employeeAppraisal
	 */
	public int insertEmployeeAppraisal(EmployeeAppraisal employeeAppraisal,String monthType){
		int temp = -1;
		if("0".equals(monthType)){
			String[] str = monthDayAndLastDay(1);
			employeeAppraisal.setAppraisalStartDate(str[0]);
			employeeAppraisal.setAppraisalEndDate(str[1]);
		}
		if("1".equals(monthType)){
			String[] str = monthDayAndLastDay(0);
			employeeAppraisal.setAppraisalStartDate(str[0]);
			employeeAppraisal.setAppraisalEndDate(str[1]);
		}
		employeeAppraisal.setCreateDate(new Date());
		if(employeeAppraisal.getCompanyId()==0){
			employeeAppraisal.setCompanyId(1);
		}
		try{
			employeeAppraisal.setCreateUser(SessionInfo.getVisitorId(CommonUtil.getRequest()));
			amm.insertEmployeeAppraisal(employeeAppraisal);
			temp = 1;
		}catch (Exception e) {
			temp = 0;
		}
		return temp;
	}
	
	/**
	 * 根据id 和 时间查看绩效信息
	 * @param employeeAppraisal
	 * @return
	 */
	public EmployeeAppraisal getEmployeeAppraisalByIdAndStartTime(EmployeeAppraisal employeeAppraisal){
		return amm.getEmployeeAppraisalByIdAndStartTime(employeeAppraisal);		
	}
	
	/**
	 * 更新 EmployeeAppraisal 
	 * @param employeeAppraisal
	 */
	public int updateEmployeeAppraisal(EmployeeAppraisal employeeAppraisal){
		int temp = -1;
		try {
			amm.updateEmployeeAppraisal(employeeAppraisal);
			temp = 1;
		} catch (Exception e) {
			temp = 0;
		}
		return temp;
	}
	
	/**
	 * 历史绩效结构分析
	 * @param employeeInfo
	 * @return
	 */
	public List<EmployeeAppraisal> searchHistoryAnalyse(EmployeeInfo employeeInfo,Page page){
		try {
			if(employeeInfo.getOrganizationId()==0){
				employeeInfo.setOrganizationId(SessionInfo.getVisitorId(CommonUtil.getRequest()));				
			}
		} catch (Exception e) {
		}
		if(employeeInfo.getStartTime()==null||employeeInfo.getStartTime()==""){
			String[] time = monthDayAndLastDay(1);
			employeeInfo.setStartTime(time[0]);
			employeeInfo.setEndTime(time[1]);			
		}
		page.setRecords(amm.countSearchHistoryAnalyse(employeeInfo));
		employeeInfo.setLimit(page.getLimit());
		return amm.searchHistoryAnalyse(employeeInfo);
	}
	
	/**
	 * 得到所有部门的下拉列表的
	 * @return
	 */
	public List<EmployeeAppraisal> allOrganization(){
		return amm.allOrganization();
	}
	@Transactional(readOnly=true)
	public List<EmployeeAppraisal> getUserAppraisalListById(
			Map<String, Object> map, Page page) {
		int count = amm.getUserAppraisalListCountById(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		List<EmployeeAppraisal> appraisals = amm.getUserAppraisalListById(map);
		return appraisals;
	}

}
