package com.fc.brms.homepage.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.homepage.service.ITodayStatisticsAllService;

@Controller
public class HomeController {
	@Resource
	private ITodayStatisticsAllService todayStatisService;

	@RequestMapping(value = {"/index"})
	public String index(Model model,HttpServletRequest request) throws Exception{
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
		return "/homepage/Index";
	}
	
	@RequestMapping(value = "/main")
	public String main(Model model, String flag) {
		model.addAttribute("flag", flag);
		return "/homepage/Main";
	}
}
