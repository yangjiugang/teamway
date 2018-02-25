package com.fc.brms.homepage.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.broker.service.ITrainService;
import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.homepage.service.ITodayStatisticsAllService;

/**
 * 今日统计
 * 
 * @author Administrator
 * 
 */
@Controller
public class TodayStatisticsAllController {
	@Resource
	private ITodayStatisticsAllService todayStatisService;
	@Resource
	private ITrainService trainService;

	/**
	 * 左边
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayLeft")
	public String todayLeft(Model model,HttpServletRequest request) throws Exception {
		int visitorId = SessionInfo.getVisitorId(request);
		int todayInterviewCount = todayStatisService.findTodayInterviewCount(null,null,null,visitorId);
		int todayJobCount = todayStatisService.findTodayJobCount();
		int todayTrainingCount = todayStatisService.findTodayTrainingCount(visitorId);
		int todaySurveyCount=todayStatisService.findTodaySurveyCount(visitorId);
		int todayAppointmentsCount=todayStatisService.findTodayAppointmentsCount();
		
		model.addAttribute("todayInterviewCount", todayInterviewCount);
		model.addAttribute("todayJobCount", todayJobCount);
		model.addAttribute("todayTrainingCount", todayTrainingCount);
		model.addAttribute("todaySurveyCount", todaySurveyCount);
		model.addAttribute("todayAppointmentsCount", todayAppointmentsCount);
		return "/homepage/TodayLeft";
	}

	/**
	 * 今日面试
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayInterview")
	public String todayInterview(Model model,HttpServletRequest request) throws Exception{
		int visitorId = SessionInfo.getVisitorId(request);
		int todayInterviewCount = todayStatisService.findTodayInterviewCount(null,null,null,visitorId);
		model.addAttribute("todayInterviewCount", todayInterviewCount);
		return "/homepage/TodayInterview";
	}

	/**
	 * 今日面试ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayInterviewAjax")
	@ModelAttribute("rows")
	public List<UserResume> todayInterviewAjax(Page page,HttpServletRequest request) throws Exception{
		int visitorId = SessionInfo.getVisitorId(request);
		int todayInterviewCount = todayStatisService.findTodayInterviewCount(null,null,null,visitorId);
		page.setRecords(todayInterviewCount);
		List<UserResume> list = todayStatisService.findTodayInterview(page,null,null,null,visitorId);
		return list;
	}
	
	/**
	 * 今日面试ajax搜索
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayInterviewAjaxS")
	@ModelAttribute("rows")
	public List<UserResume> todayInterviewAjaxS(Page page,Date testStartTime,Date testEndTime ,String keyword,HttpServletRequest request) throws Exception{
		int visitorId = SessionInfo.getVisitorId(request);
		List<UserResume> list = todayStatisService.findTodayInterview(page,testEndTime,testStartTime,keyword,visitorId);
		return list;
	}

	/**
	 * 今日入职
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayJob")
	public String todayJob(Model model) {
		int todayJobCount = todayStatisService.findTodayJobCount();
		model.addAttribute("todayJobCount", todayJobCount);
		return "/homepage/TodayJob";
	}

	/**
	 * 今日入职ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayJobAjax")
	@ModelAttribute("rows")
	public List<UserResume> todayJobAjax(Page page) {
		List<UserResume> list = todayStatisService.findTodayJob(page);
		return list;
	}

	/**
	 * 今日培训
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayTraining")
	public String todayTraining(Model model,HttpServletRequest request)throws Exception {
		int visitorId = SessionInfo.getVisitorId(request);
		int todayTrainingCount = todayStatisService.findTodayTrainingCount(visitorId);
		model.addAttribute("todayTrainingCount", todayTrainingCount);
		return "/homepage/TodayTraining";
	}

	/**
	 * 今日培训ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayTrainingAjax")
	@ModelAttribute("rows")
	public List<TrainingTask> todayTrainingAjax(Page page,HttpServletRequest request) throws Exception {
		int visitorId = SessionInfo.getVisitorId(request);
		int todayTrainingCount = todayStatisService.findTodayTrainingCount(visitorId);
		page.setRecords(todayTrainingCount);
		List<TrainingTask> list = todayStatisService.findTodayTraining(page,visitorId);
		return list;
	}
	
	/**
	 * 参与培训评估ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayTrainingAjax2")
    @ResponseBody
	public int todayTrainingAjax2(int taskId) {
		TrainingTask task = trainService.findTaskById(taskId);
		int testId=task.getTestId();
		return testId;
	}

	/**
	 * 今日调查
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todaySurvey")
	public String todaySurvey(Model model,HttpServletRequest request) throws Exception{
		int visitorId = SessionInfo.getVisitorId(request);
        int todaySurveyCount=todayStatisService.findTodaySurveyCount(visitorId);
        model.addAttribute("todaySurveyCount", todaySurveyCount);
		return "/homepage/TodaySurvey";
	}
	
	/**
	 * 今日调查ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todaySurveyAjax")
	@ModelAttribute("rows")
	public List<QuestionTest> todaySurveyAjax(Page page,HttpServletRequest request) throws Exception{
		int visitorId = SessionInfo.getVisitorId(request);
	   int todaySurveyCount=todayStatisService.findTodaySurveyCount(visitorId);
	   page.setRecords(todaySurveyCount);
       List<QuestionTest> list=todayStatisService.findTodaySurvey(page,visitorId);
		return list;
	}

	/**
	 * 今日约谈
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayAppointments")
	public String todayAppointments(Model model) {
		int todayAppointmentsCount=todayStatisService.findTodayAppointmentsCount();
		model.addAttribute("todayAppointmentsCount", todayAppointmentsCount);
		return "/homepage/TodayAppointments";
	}
	
	/**
	 * 今日约谈ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todayAppointmentsAjax")
	@ModelAttribute("rows")
	public List<EmployeeTalkRecord> todayAppointmentsAjax(Page page) {
		List<EmployeeTalkRecord> list=todayStatisService.findTodayAppointments(page);
		return list;
	}

	/**
	 * 今日受访
	 * 
	 * @return
	 */
	@RequestMapping(value = "/homepage_todaySiuhong")
	public String todaySiuhong(Model model) {
		int todayAppointmentsCount=todayStatisService.findTodayAppointmentsCount();
		model.addAttribute("todayAppointmentsCount", todayAppointmentsCount);
		return "/homepage/TodaySiuhong";
	}

}
