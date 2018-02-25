package com.fc.brms.broker.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.IBirthdayRemindMappeer;
import com.fc.brms.broker.service.IBirthRemindService;
import com.fc.brms.common.domain.EmployeeFamilyInfo;
import com.fc.brms.common.domain.EmployeeInfo;

/**
  * 生日提醒
  * @author 冯鹄
  * @version 1.0  2012-3-21
  *  
  */
@Service
public class BirthRemindServiceImpl implements IBirthRemindService {
	
	@Resource
	private IBirthdayRemindMappeer birthdayRemindMappeer;

	@Override
	public List<EmployeeFamilyInfo> todayBirthday(Map<String, Object> map) {
		map.put("birth", getToday().trim());
		List<EmployeeFamilyInfo> employeeInfos = birthdayRemindMappeer.todayBirthday(map);
		return employeeInfos;
	}


	@Override
	public List<EmployeeFamilyInfo> tomorrowBirthday(Map<String, Object> map) {
 		 map.put("birth", getTomorrow().trim());
 		 List<EmployeeFamilyInfo> employeeInfos = birthdayRemindMappeer.todayBirthday(map);
		return employeeInfos;
	}

	@Override
	public List<EmployeeFamilyInfo> bermorgenBirthday(Map<String, Object> map) {		
  		  map.put("birth", getBermorgen().trim());
		  List<EmployeeFamilyInfo> employeeInfos = birthdayRemindMappeer.todayBirthday(map);
		return employeeInfos;
	}
	
	@Override
	public List<EmployeeFamilyInfo> thisWeekBirthday(Map<String, Object> map) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
		int min = calendar.getActualMinimum(Calendar.DAY_OF_WEEK); //获取周开始基准
		int current = calendar.get(Calendar.DAY_OF_WEEK); //获取当天周内天数
		calendar.add(Calendar.DAY_OF_WEEK, min-current); //当天-基准，获取周开始日期
		String start = dateFormat.format(calendar.getTime());//获取本周的第一天
	    calendar.add(Calendar.DAY_OF_WEEK, 6); //开始+6，获取周结束日期
		String end = dateFormat.format(calendar.getTime());//获取本周的最后一天
		map.put("startBirth", start.trim());
		map.put("endBirth", end.trim());
		List<EmployeeFamilyInfo> employeeInfos = birthdayRemindMappeer.thisWeekBirthday(map);		
		return employeeInfos;
	}
	

	@Override
	public List<EmployeeFamilyInfo> thisMonthBirthday(Map<String, Object> map) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
		//当前月的第一天      
		calendar.set(GregorianCalendar.DAY_OF_MONTH, 1); 
	    String beginTime=dateFormat.format(calendar.getTime());
	        
        //当前月的最后一天   
	    calendar.set( Calendar.DATE, 1 );
	    calendar.roll(Calendar.DATE, - 1 );
        String endTime=dateFormat.format(calendar.getTime());
		map.put("startBirth", beginTime.trim());
		map.put("endBirth", endTime.trim());
		List<EmployeeFamilyInfo> employeeInfos = birthdayRemindMappeer.thisWeekBirthday(map);
		return employeeInfos;
	}

	@Override
	public List<EmployeeFamilyInfo> checkBirthdayTerm(Map<String, Object> map) {
		List<EmployeeFamilyInfo> employeeInfos = birthdayRemindMappeer.checkBirthdayTerm(map);
		return employeeInfos;
	}


	@Override
	public List<EmployeeFamilyInfo> findEmployeeForID(Map<String, Object> map) {
		map.put("birth", getToday().trim());
		List<EmployeeFamilyInfo> employeeFamilyInfos = birthdayRemindMappeer.findEmployeeForID(map);
		return employeeFamilyInfos;
	}

	private String getTomorrow(){
		GregorianCalendar gc = new GregorianCalendar();
        gc.add(GregorianCalendar.DATE,1);
        SimpleDateFormat ymdf = new SimpleDateFormat( "-MM-dd");
        String tomorrow = ymdf.format(new   Date(gc.getTimeInMillis()));//获得明天-月-日，用于模糊匹配查询
        return tomorrow;
	}

	private String getToday(){
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("-MM-dd");
		String today = dateFormat.format(calendar.getTime());//获得今天-月-日，用于模糊匹配查询
		return today;
	}
	private String getBermorgen(){
		GregorianCalendar gc = new GregorianCalendar();
        gc.add(GregorianCalendar.DATE,2);
        SimpleDateFormat ymdf = new SimpleDateFormat( "-MM-dd");
        String bermorgen = ymdf.format(new   Date(gc.getTimeInMillis()));//获得后天-月-日，用于模糊匹配查询
        return bermorgen;
	}


	@Override
	public EmployeeInfo EmployeeBirthToday(Map<String, Object> map) {
		map.put("birth", getToday());
		EmployeeInfo employeeInfo = birthdayRemindMappeer.EmployeeBirthToday(map);
		return employeeInfo;
	}


	@Override
	public List<EmployeeFamilyInfo> EmployeeFamilyBirthToday(Map<String, Object> map) {
		map.put("birth", getToday());
		List<EmployeeFamilyInfo> employeeFamilyInfo = birthdayRemindMappeer.EmployeeFamilyBirthToday(map);
		return employeeFamilyInfo;
	}
}
