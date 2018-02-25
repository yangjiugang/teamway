package com.fc.brms.broker.web;

import java.util.List;
import javax.annotation.Resource;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fc.brms.broker.service.IQuestionLibraryService;
import com.fc.brms.broker.service.IQuestionTestService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.QuestionLibrary;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.util.Page;

/**
 * 详情查看
 * @author 龚红军 
 * 2012-03-20 10:15
 */
@Controller
public class ActivitySurveyController {
	@Resource
	private IQuestionTestService questionTestService;
	@Resource
	private IQuestionLibraryService questionLibraryService;
	/**
	 * 活动调查统计窗口
	 * @return
	 */
	@RequestMapping(value="/broker_activitySurveyStatistics")
	public String activitySurveyStatistics(String[] rows,Model model){
		int testId=Integer.parseInt(rows[0]);
		QuestionTest questionTest=questionTestService.getQuestionTestByTestId(testId); //活动的基本情况
		int paperId=questionTest.getPaperId();
		QuestionPapers qp=questionTestService.findQuertionpapers(paperId);
		model.addAttribute("questionTest", questionTest);
		model.addAttribute("questionPapers", qp);
		model.addAttribute("date",getDefaultPieDataset(testId));
		model.addAttribute("date2",getDefaultPieDataset2(testId));
		return "/broker/ActivitySurveyStatistics";
	}
	
	/**
	 * 问卷题目的详情
	 * @param page
	 * @param paperId
	 * @return
	 */
	@RequestMapping(value="/broker_questionLibrary")
	@ModelAttribute("datas")
	public List<QuestionLibrary> questionLibrary(Page page,int paperId){
		int questionLibraryCount=questionLibraryService.findQuestionLibraryByPaperIdCount(paperId); //总条数
		page.setRecords(questionLibraryCount);  //设置总页数
		List<QuestionLibrary> questionLibraryList=questionLibraryService.findQuestionLibraryByPaperId(paperId, page); //得到问卷题目的集合
		return questionLibraryList;
	}
	
	/**
	 * 参加活动人的详情
	 * @param page
	 * @param paperId
	 * @return
	 */
	@RequestMapping(value="/broker_findEmployInfo")
	@ModelAttribute("datas")
	public List<EmployeeInfo> findEmployInfo(Page page,int testId,EmployeeInfo employeeInfo){
		int employeeInfoCount=questionTestService.findEmployeeInfoCount(testId,employeeInfo); //总条数
		page.setRecords(employeeInfoCount);  //设置总页数
		List<EmployeeInfo> list=questionTestService.findEmployeeInfo(testId, page,employeeInfo);
		return list;
	}
	
	/**
	 * 活动基本情况
	 * @return
	 */
	@RequestMapping(value="/broker_activityBasicSituation")
	public String activityBasicSituation(){
		
		return "/broker/ActivitySurvey";
	}
	/**
	 * 活动问卷详情
	 * @return
	 */
	@RequestMapping(value="/broker_activityQuestionDetail")
	public String activityQuestiondetail(){
		
		return "/broker/ActivityQuestionDetail";
	}
	/**
	 * 参与对象详情
	 * @return
	 */
	@RequestMapping(value="/broker_participateObjectDetail")
	public String participateObjectDetail(){
		
		return "/broker/ParticipateObjectDetail";
	}
	/**
	 * 活动统计
	 * @return
	 */
	@RequestMapping(value="/broker_activityStatistics")
    public String activityStatistics(){
		
    	return "/broker/ActivityStatistics";
    }
	
	/**
	 * 饼状图数据方法
	 * @return
	 */
	public DefaultPieDataset getDefaultPieDataset(int testId) {
		// create a dataset...
		DefaultPieDataset data = new DefaultPieDataset();
		int totalNumber=questionLibraryService.findSurveyStatistics(testId, 9, 9);  
		int participateNumber=questionLibraryService.findSurveyStatistics(testId, 1, 9);
		int noParticipateNumber=questionLibraryService.findSurveyStatistics(testId, 0, 9);
		int effectiveNumber=questionLibraryService.findSurveyStatistics(testId, 1, 1);
		int noEffectiveNumber=questionLibraryService.findSurveyStatistics(testId, 1, 0);
		if (totalNumber!=0) {
			data.setValue("总人数", totalNumber);
		}
		if (participateNumber!=0) {
			data.setValue("参与人", participateNumber);
		}
		if (noParticipateNumber!=0) {
			data.setValue("未参与", noParticipateNumber);
		}
		if (effectiveNumber!=0) {
			data.setValue("参与有效", effectiveNumber);
		}
		if (noEffectiveNumber!=0) {
			data.setValue("参与无效", noEffectiveNumber);
		}
		return data;
	}
	
	/**
	 * 饼状图数据方法
	 * @return
	 */
	public DefaultPieDataset getDefaultPieDataset2(int testId) {
		// create a dataset...
		DefaultPieDataset data = new DefaultPieDataset();
		int a=questionLibraryService.findScoreStatistice(testId,40,50);
		int b=questionLibraryService.findScoreStatistice(testId,50,60);
		int c=questionLibraryService.findScoreStatistice(testId,60,70);
		int d=questionLibraryService.findScoreStatistice(testId,70,80);
		int e=questionLibraryService.findScoreStatistice(testId,80,90);
		int f=questionLibraryService.findScoreStatistice(testId,90,100);
		if(a!=0){
			data.setValue("40-50", a);
		}else if(b!=0){
			data.setValue("50-60", b);
		}else if(c!=0){
			data.setValue("60-70", c);
		}else if(d!=0){
			data.setValue("70-80", d);
		}else if(e!=0){
			data.setValue("80-90", e);
		}else if(f!=0){
			data.setValue("90以上", f);
		}
		return data;
	}
}
