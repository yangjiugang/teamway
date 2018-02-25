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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.broker.service.IRewardPunishmentService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeRewardPunishment;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;

@Controller
public class RewardPunishmentController {
	
	@Resource
	private IRewardPunishmentService rps;
	
	/**
	 * 页面跳转
	 * @return
	 */
	@RequestMapping(value="/YGAdministrationJCGL")
	public String SkipUrlYGAdministrationJCGL(Model model){		
		return "/broker/YGAdministrationJCGL";
	}
	
	/**
	 *返回上个月的日期 
	 * @return
	 */
	String[] lastMonthDate(){
		DateTools dt = new DateTools();
		Date date = new Date();
		String strTime;
		String endTime;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		cld.add(Calendar.MONTH, 0);
		strTime = cld.get(Calendar.YEAR)+"-"+cld.get(Calendar.MONTH)+"-1";
		endTime = cld.get(Calendar.YEAR)+"-"+cld.get(Calendar.MONTH)+"-31";
		String[] time = {strTime,endTime};
		return time;
	}
	/**
	 * iframe
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/RewardPunishmentManagement")
	public String SkipUrlRewardPunishmentManagement(String type,Model model){
		String[] time = lastMonthDate();
		model.addAttribute("type",type);
		if(type!=""&&type!=null){
			model.addAttribute("causeDateStart",time[0]);
			model.addAttribute("causeDateEnd",time[1]);			
		}
		return "/broker/RewardPunishmentManagement";
	}
	
	/**
	 * iframe Left
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/RewardPunishmentManagementLeft")
	public String SkipUrlRewardPunishmentManagementLeft(String type,Model model){
		
		EmployeeRewardPunishment employeeRewardPunishment = new EmployeeRewardPunishment();
		String[] time = lastMonthDate();
		String strTime;
		String endTime;
		strTime = time[0];
		endTime = time[1];
		employeeRewardPunishment.setCauseDateStart(strTime);
		employeeRewardPunishment.setCauseDateEnd(endTime);
		employeeRewardPunishment.setRecordType(1);
		Integer lastMonthReward = rps.countSearchEmployeeRewardPunishment(employeeRewardPunishment);
		employeeRewardPunishment.setRecordType(2);
		Integer lastMonthPunish = rps.countSearchEmployeeRewardPunishment(employeeRewardPunishment);
		model.addAttribute("lastMonthReward",lastMonthReward);
		model.addAttribute("lastMonthPunish",lastMonthPunish);
		return "/broker/RewardPunishmentManagementLeft";
	}
	
	
	/**
	 * 得到所有记录
	 * @return
	 */
	@RequestMapping(value="/getAllEmployeeRewardPunishment")
	@ModelAttribute("EmployeeRewardPunishmentList")
	public List<EmployeeRewardPunishment> getAllEmployeeRewardPunishment(Page page){
			return rps.getAllRewardPunishment(page);			

	}
	
	/**
	 * 弹出框(传什么参数弹什么框)
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/RewardPunishmentManagementPage")
	public String RewardPunishmentManagementPage(Model model,String page,String employeeIds,String recordId,String type){
		if("JiangChengHistoryRecord".equals(page)){
			Integer[] ids = CommonUtil.getIntegers(employeeIds);
			List<EmployeeInfo> employeeInfoList = new ArrayList<EmployeeInfo>();
			for(int employeeId : ids){
				EmployeeInfo employeeInfo = rps.getEmployeeInfoById(employeeId);
				employeeInfoList.add(employeeInfo);
			}			
			model.addAttribute("firstId",ids[0]);
			model.addAttribute("employeeInfoList",employeeInfoList);
		}
		if("modifi".equals(type)||type!=null){
			int employeeId = Integer.parseInt(employeeIds);
			EmployeeRewardPunishment employeeRewardPunishment = new EmployeeRewardPunishment();
			employeeRewardPunishment.setEmployeeId(employeeId);
			employeeRewardPunishment.setRecordId(Integer.parseInt(recordId));
			employeeRewardPunishment = rps.getRewardPunishmentByIdAndrecordId(employeeRewardPunishment);
			EmployeeInfo employeeInfo = rps.getEmployeeInfoById(employeeRewardPunishment.getSignEmployeeId());
			String signName = employeeInfo.getUserName();
			model.addAttribute("employeeRewardPunishment",employeeRewardPunishment);
			model.addAttribute("signName",signName);
		}
		return "/broker/"+page;
	}
	
	/**
	 * 根据employeeId查找EmployeeRewardPunishment
	 * @param employeeIf
	 * @return
	 */
	@RequestMapping(value="/getRewardPunishmentById")
	@ModelAttribute("EmployeeRewardPunishmentByIdList")
	public List<EmployeeRewardPunishment> getRewardPunishmentById(Page page,int employeeId){
		return rps.getRewardPunishmentById(employeeId,page);
	}
	
	/**
	 * 修改
	 * @param employeeRewardPunishment
	 * @return
	 */
	@RequestMapping(value="/updateEmployeeRewardPunishment")
	@ResponseBody
	public int updateEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment,String signName){
		int employyId = rps.getEmployeeIdByName(signName);
		employeeRewardPunishment.setSignEmployeeId(employyId);
		return rps.updateEmployeeRewardPunishmentById(employeeRewardPunishment);
	}
	
	/**
	 * 新增
	 * @param employeeRewardPunishment
	 */
	@RequestMapping(value="/insertEmployeeRewardPunishment")
	@ResponseBody
	public int insertEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment,String signName){
		employeeRewardPunishment.setSignEmployeeId(rps.getEmployeeIdByName(signName));
		return rps.insertEmployeeRewardPunishment(employeeRewardPunishment);
	}
	
	
	/**
	 * 删除
	 * @param recordIds
	 * @return
	 */
	@RequestMapping(value="/deleteEmployeeRewardPunishment")
	@ResponseBody
	public void deleteEmployeeRewardPunishment(String recordIds){
		Integer[] ids = CommonUtil.getIntegers(recordIds);
		for(int recordId : ids){
			rps.deleteEmployeeRewardPunishment(recordId);
		}
	}
	
	/**
	 * 按照employeeNum查找employeeInfo
	 * @param employeeNum
	 * @return
	 */
	@RequestMapping(value="/getEmployeeInfoByEmployeeNum")
	@ResponseBody
	public EmployeeInfo getEmployeeInfoByEmployeeNum(String employeeNum){
		return rps.getEmployeeInfoByEmployeeNum(employeeNum);
	}
	
	/**
	 * 多条件搜索
	 * @param employeeRewardPunishment
	 * @return
	 */
	@RequestMapping(value="searchEmployeeRewardPunishment")
	@ModelAttribute("EmployeeRewardPunishmentList")
	public List<EmployeeRewardPunishment> searchEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment,Page page){
		return rps.searchEmployeeRewardPunishment(employeeRewardPunishment, page);
	}
}
