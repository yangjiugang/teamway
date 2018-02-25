package com.fc.brms.broker.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.ICheckingInService;
import com.fc.brms.common.domain.EmployeeCheckingIn;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;

@Controller
public class CheckingInController {
	
	@Resource
	private ICheckingInService cis;
	
	@RequestMapping(value="/searchEmployeeCheckingIn")
	@ModelAttribute("EmployeeCheckingInList")
	public List<EmployeeCheckingIn> searchEmployeeCheckingIn(EmployeeCheckingIn employeeCheckingIn,Page page){	
		return cis.searchEmployeeCheckingIn(employeeCheckingIn, page);
	}
	
	/**
	 * iframe
	 * @return
	 */
	@RequestMapping(value="/CheckingInManagement")
	public String CheckingInManagement(String type,Model model){
		EmployeeCheckingIn employeeCheckingIn = new EmployeeCheckingIn();
		DateTools dt = new DateTools();
		Date date = new Date();
		String strTime = "";
		String endTime = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);		
		if("1".equals(type)){
			endTime = DateTools.dateToString(cld.getTime());
			cld.add(Calendar.DATE, -1);
			strTime = DateTools.dateToString(cld.getTime());
		}else if("2".equals(type)){
			Date monday = new Date();
			monday = DateTools.getMondayOFWeek();
			strTime = DateTools.dateToString(monday);
			cld.setTime(monday);
			cld.add(Calendar.DATE, 7);
			endTime = DateTools.dateToString(cld.getTime());			
		}else if("3".equals(type)){
			cld.add(Calendar.MONTH, 1);
			strTime = cld.get(Calendar.YEAR)+"-"+cld.get(Calendar.MONTH)+"-1";
			endTime = cld.get(Calendar.YEAR)+"-"+cld.get(Calendar.MONTH)+"-31";
		}
			model.addAttribute("strTime",strTime);
			model.addAttribute("endTime",endTime);
		return "/broker/CheckingInManagement";
	}
	
	/**
	 * iframeLeft
	 * @return
	 */
	@RequestMapping(value="/CheckingInManagementLeft")
	public String CheckingInManagementLeft(Model model){
		EmployeeCheckingIn employeeCheckingIn = new EmployeeCheckingIn();
		DateTools dt = new DateTools();
		Date date = new Date();
		String strTime;
		String endTime;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		endTime = DateTools.dateToString(cld.getTime());
		cld.add(Calendar.DATE, -1);
		strTime = DateTools.dateToString(cld.getTime());
		employeeCheckingIn.setSearchTimeStart(strTime);
		employeeCheckingIn.setSearchTimeEnd(endTime);
		Integer yesterdayCNT =cis.countEmployeeCheckingIn(employeeCheckingIn); //昨天记录
		model.addAttribute("yesterdayCNT",yesterdayCNT);
		Date monday = new Date();
		monday = DateTools.getMondayOFWeek();
		strTime = DateTools.dateToString(monday);
		cld.setTime(monday);
		cld.add(Calendar.DATE, 7);
		endTime = DateTools.dateToString(cld.getTime());
		employeeCheckingIn.setSearchTimeStart(strTime);
		employeeCheckingIn.setSearchTimeEnd(endTime);
		Integer weekCNT = cis.countEmployeeCheckingIn(employeeCheckingIn); //本周记录
		model.addAttribute("weekCNT",weekCNT);
		strTime = cld.get(Calendar.YEAR)+"-"+cld.get(Calendar.MONTH)+"-1";
		employeeCheckingIn.setSearchTimeStart(strTime);
		endTime = cld.get(Calendar.YEAR)+"-"+cld.get(Calendar.MONTH)+"-31";
		employeeCheckingIn.setSearchTimeEnd(endTime);
		Integer monthCNT = cis.countEmployeeCheckingIn(employeeCheckingIn); //本月记录
		model.addAttribute("monthCNT",monthCNT);
		return "/broker/CheckingInManagementLeft";
	}
	
	/**
	 * 弹出框(传什么参数弹什么框)
	 * @param model
	 * @param page
	 * @param CheckingInIds
	 * @param type
	 * @return
	 */
	@RequestMapping(value="/CheckingInPage")
	public String CheckingInPage(Model model,String page,String CheckingInIds,String type){
		if(page=="CheckingInHistoryRecord"||"CheckingInHistoryRecord".equals(page)){
			List<EmployeeInfo> list = new ArrayList<EmployeeInfo>();
			Integer[] ids = CommonUtil.getIntegers(CheckingInIds);
			for(int id:ids){
				EmployeeInfo employeeInfo = cis.getEmployeeInfoById(id);
				list.add(employeeInfo);
				
			}
			model.addAttribute("firstId",ids[0]);
			model.addAttribute("employeeInfoList",list);
		}
		return "/broker/"+page;
	}
	
	/**
	 * 历史记录信息
	 * @param page
	 * @param employeeCheckingInId
	 * @return
	 */
	@RequestMapping(value="/getEmployeeCheckingInById")
	@ModelAttribute("EmployeeCheckingInListById")
	public List<EmployeeCheckingIn> getEmployeeCheckingInById(Page page,int employeeCheckingInId){
		EmployeeCheckingIn employeeCheckingIn = new EmployeeCheckingIn();
		employeeCheckingIn.setEmployeeId(employeeCheckingInId);
		return cis.getEmployeeCheckingInById(employeeCheckingIn, page);
	}
}
