package com.fc.brms.broker.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.IRecruitTaskService;
import com.fc.brms.common.domain.RecruitInterview;
import com.fc.brms.common.domain.RecruitTask;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.external.service.IRecruitInterviewService;


/**
 * 
 * @author 邓祥
 * 招聘管理类
 * @version 2012-3-22
 */
@Controller
public class RetainManage {

	private static Logger logger = Logger.getLogger(RetainManage.class);
	
	@Resource
	private IRecruitTaskService recruitTaskService;
	@Resource
	private IRecruitInterviewService recruitInterviewService;
	
	
	/**
	 * 招聘管理
	 * @return
	 */
	@RequestMapping(value = "/retainManage")
	public String retainManage(Model model){
		
		try {
			int companyId = SessionInfo.getCompanyId(CommonUtil.getRequest());
			List recruitTask1 = recruitTaskService.recruitTaskList(1,companyId);//招聘任务进行中
			List recruitTask2 = recruitTaskService.recruitTaskList(2,companyId);//招聘任务已完成
			List recruitTask3 = recruitTaskService.recruitTaskList(3,companyId);//招聘任务取消
			model.addAttribute("recruitTask1", recruitTask1);
			model.addAttribute("recruitTask2", recruitTask2);
			model.addAttribute("recruitTask3", recruitTask3);
		} catch (Exception e) {
			logger.error("招聘管理出错", e);
		}
		
		return "/broker/RetainManage";
	
	}
	
	/**
	 * 初始化招聘管理列表
	 * @return
	 */
	@RequestMapping(value = "/intoRetainManageList")
	public String intoRetainManageList(int taskId,Model model){
		model.addAttribute("taskId", taskId);
		return "/broker/RetainManageList";
	
	}
	
	/**
	 * 招聘管理列表
	 * @return
	 */
	@RequestMapping(value = "/retainManageList")
	@ModelAttribute("rows")
	public List<RecruitInterview> retainManageList(Model model,int taskId){
		List<RecruitInterview> recList= new ArrayList<RecruitInterview>();
		try {
			if(taskId==0){
				recList = recruitInterviewService.getUserResume();
			}else{
				int companyId = SessionInfo.getCompanyId(CommonUtil.getRequest());
				recList = recruitInterviewService.getInterviewByTaskId(taskId,companyId);
			}
		} catch (Exception e) {
			logger.error("招聘管理列表出错",e);
			
		}
		return recList;
	
	}
	
	
	/**
	 * 初始化添加招聘
	 * @return
	 */
	@RequestMapping(value = "/intoRecruitTask")
	public String intoRecruitTask(Model model){
		
		DateTools dateTools = new DateTools();
		RecruitTask recruitTask = new RecruitTask();
		try {
			String  systemDate = dateTools.systemDateToHour();
			systemDate = systemDate.replaceAll("-", "");
			systemDate = systemDate.replaceAll(":", "");
			systemDate = systemDate.replaceAll(" ", "");
			String visitorName = SessionInfo.getVisitorName(CommonUtil.getRequest());//用户名
			int visitorID = SessionInfo.getVisitorId(CommonUtil.getRequest());//用户ID
			recruitTask.setTaskNum(systemDate);
			recruitTask.setRequireUserId(visitorID);
			recruitTask.setRequireUserName(visitorName);
			model.addAttribute("recruitTask", recruitTask);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/broker/RecruitTask";
	
	}
	
	/**
	 * 添加招聘
	 * @return
	 */
	@RequestMapping(value = "/addRecruitTask")
	public String addRecruitTask(Model model,RecruitTask recruitTask){
		
		try {
			DateTools dateTools = new DateTools();
			Date strTime = dateTools.dateToYear();
			Date taskCreateTime = dateTools.dateToHour();
			recruitTask.setRecruitDate(strTime);//招聘任务发出日期
			recruitTask.setRequireDate(strTime);//申请人时间
			recruitTask.setTaskCreateTime(taskCreateTime);//任务单创建时间
			recruitTask.setTaskStatus(1);//任务单状态  暂时改为1 
			recruitTask.setCompanyId(SessionInfo.getCompanyId(CommonUtil.getRequest()));//公司ID
		} catch (Exception e) {
			logger.error("添加招聘任务出错", e);
		}
		recruitTaskService.insertRecruitTask(recruitTask);
		model.addAttribute("state", 1);//操作成功 
		return "/broker/RetainManage";
	
	}
	
	/**
	 * 根据ID 查看招聘任务
	 * @return
	 */
	@RequestMapping(value = "/recruitTaskById")
	public String recruitTaskById(Model model,String taskId){
		
		RecruitTask recruitTask = recruitTaskService.recruitTaskById(Integer.valueOf(taskId));
		model.addAttribute("recruitTask", recruitTask);
		return "/broker/RecruitTask";
	
	}
	
	
	/**
	 * 终止招聘任务
	 * @return
	 */
	@RequestMapping(value = "/closeRecruitTask")
	public String closeRecruitTask(Model model,String taskId){
		
		recruitTaskService.closeRecruitTask(Integer.valueOf(taskId));
		model.addAttribute("state", 1);//操作成功 
		return "redirect:retainManage";
	
	}

	
	
}
