package com.fc.brms.broker.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.account.web.LoginController;
import com.fc.brms.broker.service.IBirthRemindService;
import com.fc.brms.common.domain.CfgCompany;
import com.fc.brms.common.domain.EmployeeFamilyInfo;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.service.ICommonMailService;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.common.util.mail.HolidayRegardsTemplate;
import com.fc.brms.common.util.mail.SimpleMail;
import com.fc.brms.common.util.mail.SimpleMailSender;

@Controller
public class BirthdayRemindController {
	
	@Resource
	private IBirthRemindService birthRemindService;

	@Resource
	private ICommonMailService mailService;
	
	private static Log logger = LogFactory.getLog(LoginController.class);
	
	@RequestMapping(value="/BirthdayRemind")
	public String birthdayRemind(HttpServletRequest request,Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		int today = birthRemindService.todayBirthday(map).size();
		int tomorrow = birthRemindService.tomorrowBirthday(map).size();
		int bermorgen = birthRemindService.bermorgenBirthday(map).size();
		int thisWeek = birthRemindService.thisWeekBirthday(map).size();
		int thisMonth = birthRemindService.thisMonthBirthday(map).size();
		model.addAttribute("today", today);
		model.addAttribute("tomorrow", tomorrow);
		model.addAttribute("bermorgen", bermorgen);
		model.addAttribute("thisWeek", thisWeek);
		model.addAttribute("thisMonth", thisMonth);
		return "/broker/YGAdministrationSRWW";
	}
	
	/**
	 * 今天生日
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/todayBirthday")
	@ModelAttribute("rows")
	public List<EmployeeFamilyInfo> todayBirthday(HttpServletRequest request,Page page,String dayName){
		Map<String, Object> map = new HashMap<String, Object>();
		List<EmployeeFamilyInfo> employeeInfos = null;
			if(dayName!=null){
				if(dayName.equals("today")){
					int count = birthRemindService.todayBirthday(map).size();
					page.setRecords(count);
					map.put("limit", page.getLimit());
				    employeeInfos = birthRemindService.todayBirthday(map);			
				}
				if(dayName.equals("tomorrow")){
					int count = birthRemindService.tomorrowBirthday(map).size();
					page.setRecords(count);
					map.put("limit", page.getLimit());
				    employeeInfos = birthRemindService.tomorrowBirthday(map);			
				}
				if(dayName.equals("bermorgen")){
					int count = birthRemindService.bermorgenBirthday(map).size();
					page.setRecords(count);
					map.put("limit", page.getLimit());
					employeeInfos = birthRemindService.bermorgenBirthday(map);
				}
				if(dayName.equals("thisWeek")){
					int count = birthRemindService.thisWeekBirthday(map).size();
					page.setRecords(count);
					map.put("limit", page.getLimit());
					employeeInfos = birthRemindService.thisWeekBirthday(map);
				}
				if(dayName.equals("thisMonth")){
					int count = birthRemindService.thisMonthBirthday(map).size();
					page.setRecords(count);
					map.put("limit", page.getLimit());
					employeeInfos = birthRemindService.thisMonthBirthday(map);
	            }
			}else{
				int count = birthRemindService.todayBirthday(map).size();
				page.setRecords(count);
				map.put("limit", page.getLimit());
			    employeeInfos = birthRemindService.todayBirthday(map);
			}
			
		return employeeInfos;
	}

	/**
	 * 条件查询生日
	 * @param start 开始日期
	 * @param end   结束日期
	 * @param term  关键词 
	 * @return
	 */
	@RequestMapping(value="/FindBirthdayTerm")
	@ModelAttribute("rows")
	public List<EmployeeFamilyInfo> findBirthdayTerm(HttpServletRequest request,Date start,Date end,String term){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startBirth", dateFormat.format(start));  
		map.put("endBirth", dateFormat.format(end));  
		map.put("term", term);  			
		List<EmployeeFamilyInfo> employeeInfos = birthRemindService.checkBirthdayTerm(map);		
		
		return employeeInfos;
	}
	
	@RequestMapping(value="/SR")
	public String SR(HttpServletRequest request,Model model,String dayName){
		model.addAttribute("dayName", dayName);
		return "/broker/SR";
	}
	
	/**
	 * 生日提醒
	 * @return
	 */
	@RequestMapping(value="/BirthdayRemindTwo")
	public String birthdayRemindTwo(HttpServletRequest request,String dayName,int row,Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeId", row);  
		List<EmployeeFamilyInfo> employeeFamilyInfos = birthRemindService.EmployeeFamilyBirthToday(map);
		model.addAttribute("employeeFamilyInfos", employeeFamilyInfos);
		return "/broker/BirthdayRemindM";
	}
	
	/**
	 * 生日慰问
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/BirthBlessin")
	public String birthBlessin(HttpServletRequest request,int row,Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeId", row);  
		EmployeeInfo employeeInfo = birthRemindService.EmployeeBirthToday(map);
		model.addAttribute("employeeInfo", employeeInfo);
		return "/broker/SendBirthdayBlessing";
	}
	
	@RequestMapping(value="/SendBirthRemind")
	@ResponseBody
	public String SendBirthRemind(String userName,String companyName,String sendUserName,String date,String email,HttpServletRequest request)throws Exception{
		System.out.println(email);
		CfgCompany companyInfo = mailService.selectCompanyEmailById(SessionInfo.getCompanyId(request));
		SimpleMailSender sms = new SimpleMailSender(companyInfo.getCompanyEmail(),"123456abcd");
		String content = HolidayRegardsTemplate.getBirthModel(userName, companyName, sendUserName, date);
		try {
			sms.send(email, "生日慰问", content);
		} catch (AddressException e) {
			logger.error(e);
		} catch (MessagingException e) {
			logger.error(e);
		}
		return "true";		
	}
}
