package com.fc.brms.broker.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.IPostChangeManageService;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeTransactionInfo;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;


/**
 * 异动管理控制器
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-19
 */
@Controller
public class PostChangeManageController {

	@Resource
	private IPostChangeManageService postChangeService;
	
	/**
	 * 异动页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/broker_postChange" })
	public String postChangeManage() {
		return "/broker/PostChangeManagement";
	}

	
	/**
	 * 查询异动人员信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_postChangeIFrame" })
	public String postChangeManageIFrame(String postChangeType, Model model) throws Exception {
		model.addAttribute("postChangeType", postChangeType);
		return "/broker/PostChange";
	}
	
	/**
	 * 查询异动人员信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_openDiv" })
	public String openDiv(String url, Model model) {
		return "/broker/"+url;
	}
	
	/**
	 * 异动历史查询窗口
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_postHisQuery" })
	public String postHisQuery(Model model, HttpServletRequest request) {
		List<EmployeeTransactionInfo> lst = new ArrayList<EmployeeTransactionInfo>();
		
		String[] strId = request.getParameter("idArray").split(",");
		String[] strName = request.getParameter("nameArr").split(",");
		for(int i = 0; i < strId.length; i++){
			EmployeeTransactionInfo e1 = new EmployeeTransactionInfo();
			EmployeeInfo e2 = new EmployeeInfo();
			e1.setEmployeeId(Integer.parseInt(strId[i]));
			e2.setUserName(strName[i]);
			e1.setEmployeeInfo(e2);
			lst.add(e1);
		}
		
		model.addAttribute("lst", lst);
		return "/broker/QueryPostPage";
	}
	
	/**
	 * 查询异动人员信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_postChangeList" })
	@ModelAttribute("lstData")
	public List<EmployeeTransactionInfo> postChangeManageList(String postStartTime, 
			String postEndTime, String keyWord, String postChangeType, Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", postStartTime);
		map.put("endTime", postEndTime);
		int[] iPostChange = null;
		// 如果选择了过滤条件
		if(!"".equals(postChangeType) && !"undefined".equals(postChangeType)){
			postChangeType = postChangeType.substring(9, postChangeType.length()-1);
			String[] strPostChangeType = postChangeType.split(",");
			iPostChange = new int[strPostChangeType.length];
			for(int i = 0; i < strPostChangeType.length; i++){
				iPostChange[i] = Integer.parseInt(strPostChangeType[i]);
			}
		}
		map.put("postChangeType", iPostChange);
		if("请输入关键字".equals(keyWord)){
			map.put("keyWord", "");
		}else{
			map.put("keyWord", keyWord);
		}
		int iCount = postChangeService.queryEmployeePostChangeCount(map);
		page.setRecords(iCount);
		map.put("limit", page.getLimit());
		return postChangeService.queryEmployeePostChangeList(map);
	}
	
	/**
	 * 查看/维护详细信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_detailPost" })
	@ModelAttribute("detailData")
	public EmployeeTransactionInfo postChangeList(Model model, HttpServletRequest request) {
		String strId = request.getParameter("id");
		return postChangeService.getEmployeePostChangeById(Integer.parseInt(strId));
	}
	
	/**
	 * 查询员工异动前的所有信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_queryEmployeeAllInfo" })
	@ModelAttribute("employeeAllInfo")
	public EmployeeTransactionInfo queryEmployeeAllInfo(String employeeId, Model model) {
		return postChangeService.queryEmployeeAllInfo(Integer.parseInt(employeeId));
	}
	
	/**
	 * 查询薪酬信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_queryWelfareInfo" })
	@ModelAttribute("lstEmployeeTransactionInfo")
	public List<EmployeeTransactionInfo> broker_querySaleSecurityInfo(Model model, HttpServletRequest request) {
		int iCompanyId=0;
		try {
			iCompanyId = SessionInfo.getCompanyId(request);
			model.addAttribute("companyName", SessionInfo.getCompanyName(request));
			model.addAttribute("companyId", iCompanyId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("lstCfgJobGrade", postChangeService.findJobGradeInfo());
		model.addAttribute("lstSecurityType", postChangeService.getSalarySocialSecurity(iCompanyId));
		model.addAttribute("lstCfgSalaryLevel", postChangeService.getSalaryLevel());
		return postChangeService.getSalarySocialSecuritySubmit(iCompanyId); // 社保标识信息
	}
	
	/**
	 * 查询职级
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_queryJobLevelForGrade" })
	@ModelAttribute("lstCfgJobLevel")
	public List<CfgJobLevel> broker_queryJobLevelForGrade(String jobGradeId, Model model) {
		return postChangeService.findJobLevelForGrade(jobGradeId);
	}
	
	/**
	 * 添加员工异动信息
	 * 
	 * @param model
	 * @param employeeTransInfo 异动后数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_addPostChange" })
	public String addPostChange(Model model, EmployeeTransactionInfo employeeTransInfo, String postDate) {
		employeeTransInfo.setTransactionDate(DateTools.getTs(postDate));
		// 异动前数据
		EmployeeTransactionInfo employeeTransactionInfo = 
				postChangeService.queryEmployeeAllInfo(employeeTransInfo.getEmployeeId());
		int iFlag = postChangeService.addPostChangeInfo(employeeTransactionInfo, employeeTransInfo);
		model.addAttribute("iFlag", iFlag==1?iFlag:2);
		return "forward:broker_postChangeIFrame";
	}
	
	/**
	 * 删除员工异动信息
	 * 
	 * @param model
	 * @param infoId 异动数据主键
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_deletePostChange" })
	@ModelAttribute("flag")
	public int deletePostChange(String infoId, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		int[] iPostChange = null;
		// 如果选择了过滤条件
		String[] strInfoId = infoId.split(",");
		iPostChange = new int[strInfoId.length];
		for(int i = 0; i < strInfoId.length; i++){
			iPostChange[i] = Integer.parseInt(strInfoId[i]);
		}
		map.put("infoIds", strInfoId);
		int iFlag = postChangeService.getPostChangeByInfoId(map);
		return iFlag;
	}
}
