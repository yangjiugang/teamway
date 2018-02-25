package com.fc.brms.broker.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.broker.service.IAppraisalManagementService;
import com.fc.brms.broker.service.IRewardPunishmentService;
import com.fc.brms.common.domain.DateProperty;
import com.fc.brms.common.domain.EmployeeAppraisal;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;

@Controller
public class AppraisalManagementController {
	
	@Resource
	private IAppraisalManagementService ams;
	@Resource
	private IRewardPunishmentService rps;
	
	/**
	 * iframe
	 * @return
	 */
	@RequestMapping(value="/AppraisalManagement")
	public String AppraisalManagement(DateProperty dateProperty,Model model){
		model.addAttribute("dateProperty",dateProperty);
		return "/broker/AppraisalManagement";
	}
	
	/**
	 * iframe Left
	 * @return
	 */
	@RequestMapping(value="/AppraisalManagementLeft")
	public String AppraisalManagementLeft(){
		return "/broker/AppraisalManagementLeft";
	}
	
	/**
	 * 条件查询
	 * @param employeeInfo
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/searchEmployeeAppraisal")
	@ModelAttribute("EmployeeAppraisalList")
	public List<EmployeeAppraisal> searchEmployeeAppraisal(EmployeeInfo employeeInfo,Page page,DateProperty dateProperty){
		return ams.searchEmployeeAppraisal(employeeInfo,page,dateProperty);
	}
	
	
	/**
	 * 弹出框(传什么参数弹什么框)
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/AppraisalManagementPage")
	public String AppraisalManagementPage(String page,Model model,String employeeIds,String type,String startTime){
		if("AppraisalHistoryRecord".equals(page)){
			Integer[] ids = CommonUtil.getIntegers(employeeIds);
			List<EmployeeInfo> employeeInfoList = new ArrayList<EmployeeInfo>();
			for(int employeeId : ids){
				EmployeeInfo employeeInfo = rps.getEmployeeInfoById(employeeId);
				employeeInfoList.add(employeeInfo);
			}			
			model.addAttribute("firstId",ids[0]);
			model.addAttribute("employeeInfoList",employeeInfoList);
		}
		if("AppraisalUpdate".equals(page)){
			 EmployeeAppraisal employeeAppraisal = new EmployeeAppraisal();
			 employeeAppraisal.setEmployeeId(Integer.parseInt(employeeIds));
			 employeeAppraisal.setAppraisalStartDate(startTime);
			 employeeAppraisal = ams.getEmployeeAppraisalByIdAndStartTime(employeeAppraisal);
			 model.addAttribute("employeeAppraisal",employeeAppraisal);
		}
		List<EmployeeAppraisal> organizationList = ams.allOrganization();
		model.addAttribute("organizationList",organizationList);
		return "/broker/"+page;
	}
	
	/**
	 * 根据Id查找EmployeeAppraisal
	 * @param employeeId
	 * @return
	 */
	@RequestMapping(value="/getEmployeeAppraisalById")
	@ModelAttribute("EmployeeAppraisalListById")
	public List<EmployeeAppraisal> getEmployeeAppraisalById(int employeeId,Page page){
		return ams.getEmployeeAppraisalById(employeeId,page);
	}
	
	/**
	 * 提交天验证绩效是否可以添加
	 * @return
	 */
	@RequestMapping(value="/verifyEmployeeAppraisalByIdStartTimeEndTime")
	@ResponseBody
	public int verifyEmployeeAppraisalByIdStartTimeEndTime(String monthType,EmployeeAppraisal employeeAppraisal){
		return ams.countEmployeeAppraisalByIdStartTimeEndTime(employeeAppraisal, monthType);
	}
	
	/**
	 * 新增绩效
	 * @param monthType
	 * @param employeeAppraisal
	 * @return
	 */
	@RequestMapping(value="/insertEmployeeAppraisal")
	@ResponseBody
	public int insertEmployeeAppraisal(String monthType,EmployeeAppraisal employeeAppraisal){
		return ams.insertEmployeeAppraisal(employeeAppraisal, monthType);
	}
	
	/**
	 * 更新 
	 * @return
	 */
	@RequestMapping(value="/updateEmployeeAppraisal")
	@ResponseBody
	public int updateEmployeeAppraisal(EmployeeAppraisal employeeAppraisal){
		return ams.updateEmployeeAppraisal(employeeAppraisal);
	}
	
	/**
	 * 历史绩效结构分析
	 * @param employeeInfo
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/searchHistoryAnalyse")
	@ModelAttribute("HistoryAnalyseList")
	public List<EmployeeAppraisal> searchHistoryAnalyse(EmployeeInfo employeeInfo,Page page){
		return ams.searchHistoryAnalyse(employeeInfo, page);
	}
}
