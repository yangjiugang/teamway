package com.fc.brms.echelon.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.IQuestionTestService;
import com.fc.brms.broker.service.ITrainService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.QuestionPapersEmployees;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.TrainingUsers;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.echelon.service.IBrokerEchelonService;


/**
 * 经纪人梯队控制器
 * 
 * @author 覃启轩
 * @version 1.0  2012-4-5
 */
@Controller
public class BrokerEchelonController {
	
	@Resource
	private IBrokerEchelonService brokerEchelonService;
	
	@Resource
	private IQuestionTestService questionTestService;
	
	@Resource
	private ITrainService trainService;
	/**
	 * 经纪人梯队页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_JSPForWard" })
	public String jSPForWard(String jspName) {
		return "/echelon/"+jspName;
	}
	
	/**
	 * 经纪人梯队页面带参数跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_JSPForWardParame" })
	public String jSPForWardParame(String jspName,String parame,Model model) {
		model.addAttribute("employeeId", parame);
		return "/echelon/"+jspName;
	}
	
	/**
	 * 查询经纪人梯队人员信息
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_queryEchelonInfo" })
	@ModelAttribute("lstData")
	public List<EmployeeInfo> queryEchelonInfo(Page page,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String orgClass = request.getParameter("orgClass");
		String keyWord = request.getParameter("keyWord");
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("orgClass", orgClass);
		map.put("keyWord", keyWord);
		int iCount = brokerEchelonService.queryEchelonEmployeeCount(map);
		page.setRecords(iCount);
		map.put("limit", page.getLimit());
		return brokerEchelonService.queryEchelonEmployeeList(map);
	}
	
	/**
	 * 移除梯队
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_removeEchelonInfo" })
	@ModelAttribute("iFlag")
	public int removeEchelonInfo(Page page,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		String employeeId = request.getParameter("employeeId");
		map.put("employeeIdes", employeeId.split(","));
		int iFlag = brokerEchelonService.removeEchelon(map);
		return iFlag;
	}
	
	/**
	 * 查询调查活动列表
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_querySurveyActivity" })
	@ModelAttribute("lstData")
	public List<QuestionTest> querySurveyActivity(Page page){
		QuestionTest questionTest = new QuestionTest();
		questionTest.setTestStatus(1);
		return questionTestService.getQuestionTest(page, questionTest);
	}
	
	/**
	 * 发送调查活动通知
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_sendSurActivityInform" })
	@ModelAttribute("iFlag")
	public int sendSurActivityInform(QuestionPapersEmployees paper,String employeeId,
			HttpServletRequest request){
		try {
			paper.setCompanyId(SessionInfo.getCompanyId(request));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionTestService.insertQuestionPaperEmployee(paper,employeeId);
	}
	
	/**
	 * 查询培训活动列表
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_queryTrainActivity" })
	@ModelAttribute("lstData")
	public List<TrainingTask> queryTrainActivity(Page page){
		TrainingTask task = new TrainingTask();
		task.setFlag("no");
		task.setTaskStatus(-1);
		return trainService.findTrainingTasks(page, task);
	}
	
	/**
	 * 发送培训活动通知
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/echelon_sendTrainActivityInform" })
	@ModelAttribute("iFlag")
	public int sendTrainActivityInform(TrainingUsers train, String strEmployeeId,
			HttpServletRequest request){
		try {
			train.setCompanyId(SessionInfo.getCompanyId(request));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return trainService.insertTrainEmployee(train, strEmployeeId);
	}
}
