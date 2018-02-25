package com.fc.brms.broker.web;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.broker.service.IQuestionLibraryService;
import com.fc.brms.broker.service.IQuestionPaperService;
import com.fc.brms.broker.service.IQuestionTestService;
import com.fc.brms.broker.service.ITrainService;
import com.fc.brms.common.domain.QuestionLibrary;
import com.fc.brms.common.domain.QuestionPaperType;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.domain.QuestionPapersDetail;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.QuestionTestType;
import com.fc.brms.common.domain.QuestionType;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.Page;

@Controller
public class QuestionTestController {
	@Resource
	private IQuestionTestService questionTestService;
	@Resource
	private IQuestionPaperService questionPaperService;
	@Resource
	private IQuestionLibraryService questionLibraryService;
	@Resource
	private ITrainService trainService;

	/*---------------  活动  -------------*/
	@RequestMapping(value = "/activitySave")
	@ModelAttribute("testId")
	public int InsertQuestionTest(QuestionTest questionTest,int trainTaskId) {
		questionTestService.insertQuestionTest(questionTest);
		if(trainTaskId > 0){
			trainService.updateTrainTestTestId(trainTaskId, questionTest.getTestId());
		}
		return questionTest.getTestId();
	}
	
	@RequestMapping(value="/getQuestionTest")
	@ModelAttribute("rows")
	public List<QuestionTest> getQuestionTest(Page page,QuestionTest test){
		List<QuestionTest> list=questionTestService.getQuestionTest(page,test);
		return list;
	}
	
	@RequestMapping(value="/questionTestPage")
	public String questionTestPage(Model model,int trainTaskId){
		List<QuestionTestType> testType =questionTestService.getQuestionTestType();
		List<QuestionPapers> paper = questionPaperService.getPaperName();
		model.addAttribute("testTypes", testType);
		model.addAttribute("paper", paper);
		model.addAttribute("trainTaskId", trainTaskId);
		return "/broker/AddActivity";
	}
	
	@RequestMapping(value="/getQuestionTestByTestNum")
	public String getQuestionTestByTestNum(Model model,int testId){
		QuestionTest test = questionTestService.getQuestionTestByTestNum(testId);
		List<QuestionTestType> testType =questionTestService.getQuestionTestType();
		model.addAttribute("test", test);
		model.addAttribute("testTypes", testType);
	   return "/broker/AddActivity";
	}
	@RequestMapping(value="/updateTestStatusByTestNum")
	public void updateTestStatusByTestNum(String testId,int testStatus){
		Integer[] testIdS =  CommonUtil.getIntegers(testId);
		for(int id :testIdS){
		questionTestService.updateTestStatusByTestNum(id,testStatus);
		}
	}
	
	@RequestMapping(value="/ReleaseActivity")
	public String releaseActivity(Model model,int testId){
		model.addAttribute("testId", testId);
		return "/broker/ReleaseActivity";
	}
	
	//发布调查活动
	@RequestMapping(value="/updateQuestionTest")
	public void updateQuestionTest(int testId,Date testStartTime,Date testEndTime){
		questionTestService.updateQuestionTest(testId, 1, testStartTime, testEndTime, new Date());
	}
	
	/*-------------- 问卷 ,题库------------------*/
	@RequestMapping(value = "/saveQuestionPaper")
	@ModelAttribute("paperId")
	public int saveQuestionPaper(QuestionPapers paper){
		questionPaperService.saveQuestionPaper(paper);
		return paper.getPaperId();
	}
	
	@RequestMapping(value="/getQuestionPaper")
	@ModelAttribute("rows")
	public List<QuestionPapers> getQuestionPaper(Page page,QuestionPapers paper){
		return questionPaperService.getQuestionPapers(page, paper);
	}
	
	@RequestMapping(value = "delQuestionPaper")
	public void delQuestionPaper(String ids){
		Integer[] idss = CommonUtil.getIntegers(ids);
		for(int id : idss){
			questionPaperService.delQuestionPapers(id);
		}
	}
	
	@RequestMapping(value = "/getQuestionPaperById")
	public String getQuestionPaperById(Model model,int paperId){
		model.addAttribute("paper", questionPaperService.getQuestionPaperById(paperId));
		model.addAttribute("paperTypes",questionPaperService.getPaperType());
		return "/broker/WenJuan";
	}
	
	@RequestMapping(value="/updateQuestionTestByTestNum")
	public void updateQuestionTestByTestNum(QuestionTest questionTest){
	    questionTestService.updateQuestionTestByTestNum(questionTest);
	}
	
	/*@RequestMapping(value="/delQuestionTestByTestNum")
	public void delQuestionTestByTestNum(int testId){
		questionTestService.delQuestionTestByTestNum(testId);
		
	}*/
	//问卷管理页面
	@RequestMapping(value = "/wjManagePage")
	public String wjManagePage(int paperId,Model model){
		model.addAttribute("paperId", paperId);
		model.addAttribute("types", CommonUtil.toJson(questionLibraryService.findQuestionType()));
		model.addAttribute("date",new Date());
		return "/broker/WJManage";
	}
	
	//自定也添加问题页面
	@RequestMapping(value = "/customAddTopicPage")
	public String customAddTopicPage(Model model,int paperId){
		model.addAttribute("questionNum",questionLibraryService.getQuestionLibraryNo());
		model.addAttribute("types", questionLibraryService.findQuestionType());
		model.addAttribute("paperId",paperId);
		return "/broker/CustomAddTopic";
	}
	
	@RequestMapping(value = "/StorageAddTopicPage")
	public String StorageAddTopicPage(Model model,int paperId){
		model.addAttribute("types", CommonUtil.toJson(questionLibraryService.findQuestionType()));
		model.addAttribute("paperId",paperId);
		return "/broker/StorageAddTopic";
	}
	
	@RequestMapping(value = "/findQuestionLibrary")
	@ModelAttribute("rows")
	public List<QuestionLibrary> findQuestionLibrary(QuestionLibrary library,Page page){
		return questionLibraryService.findQuestionLibrary(library, page);
	}

	
	@RequestMapping(value = "/saveQuestionLibrary")
	public void saveQuestionLibrary(QuestionLibrary library,int paperId){
		questionLibraryService.saveQuestion(library);
		if(paperId > 0){
			QuestionPapersDetail detail = new QuestionPapersDetail();
			detail.setCreateTime(new Date());
			detail.setCreateUser(1);
			detail.setLastUpdateTime(new Date());
			detail.setPaperId(paperId);
			detail.setQuestionId(library.getQuestionId());
			detail.setQuestionOrder(library.getQuestionId());
			detail.setQuestionPoints(library.getQuestionPoints());
			questionLibraryService.savePaperDetail(detail);
		}
		int count = questionPaperService.findQuestionPaperDetailCount(paperId);
		questionPaperService.updatePaperQuestions(paperId, count);
	}
	
	@RequestMapping(value = "/updateLibrary")
	public void updateLibrary(QuestionLibrary library){
		questionLibraryService.updateLibrary(library);
	}
	
	@RequestMapping(value = "/saveQuestionLibraryFromStorage")
	public void saveQuestionLibraryFromStorage(String ids,int paperId){
		Integer idss[] = CommonUtil.getIntegers(ids);
		List<QuestionLibrary> list = questionLibraryService.findQuestionLibByPaperId(null, paperId); 
		a:for(int id : idss){
			for(QuestionLibrary ql : list){
				if(ql.getQuestionId() == id){
					continue a;
				}
			}
			QuestionLibrary library = questionLibraryService.findQuestionLibraryById(id);
			QuestionPapersDetail detail = new QuestionPapersDetail();
			detail.setCreateTime(new Date());
			detail.setCreateUser(1);
			detail.setLastUpdateTime(new Date());
			detail.setPaperId(paperId);
			detail.setQuestionId(library.getQuestionId());
			detail.setQuestionOrder(library.getQuestionId());
			detail.setQuestionPoints(library.getQuestionPoints());
			questionLibraryService.savePaperDetail(detail);
			
		}
		int count = questionPaperService.findQuestionPaperDetailCount(paperId);
		questionPaperService.updatePaperQuestions(paperId, count);
	}
	
	@RequestMapping(value = "/findQuestionLibraryByPaperId")
	@ModelAttribute("rows")
	public List<QuestionLibrary> findQuestionLibraryByPaperId(int paperId,Page page){
		return questionLibraryService.findQuestionLibByPaperId(page, paperId);
	}
	
	@RequestMapping(value = "/editQuestionPoint")
	@ResponseBody
	public QuestionLibrary editQuestionPoint(QuestionLibrary library) throws IOException{
		questionLibraryService.updateQuestionPoint(library.getDetailId(), library.getQuestionPoints());
		return library;
	}
	
	@RequestMapping(value = "delQuestionPapersDetail")
	public void delQuestionPapersDetail(String ids,int paperId){
		Integer[] idss = CommonUtil.getIntegers(ids);
		for(int id : idss){
			questionLibraryService.delQuestionPapersDetail(id);
		}
		int count = questionPaperService.findQuestionPaperDetailCount(paperId);
		questionPaperService.updatePaperQuestions(paperId, count);
	}
	
	@RequestMapping(value = "/updateQuestionOrder")
	public void updateQuestionOrder(int id,int order,int id_,int order_){
		questionLibraryService.updateQuestionOrder(id, order_);
		questionLibraryService.updateQuestionOrder(id_, order);
	}
	
	@RequestMapping(value = "/updateLibraryState")
	public void updateLibraryState(String ids){
		Integer[] idss = CommonUtil.getIntegers(ids);
		for(int id : idss){
			questionLibraryService.updateLibraryState(id);
		}
	}
	
	@RequestMapping(value = "/updateQuestionLibrary")
	public String updateQuestionLibrary(int id,Model model,String v){
		model.addAttribute("library",questionLibraryService.findQuestionLibraryById(id));
		model.addAttribute("types", questionLibraryService.findQuestionType());
		model.addAttribute("view", v);
		return "/broker/CustomAddTopic";
	}
	
	@RequestMapping(value = "/findQuestionTestType")
	@ModelAttribute("rows")
	public List<QuestionTestType> findQuestionTestType(){
		return questionTestService.getQuestionTestType();
	}
	
	@RequestMapping(value = "/findQuestionType")
	@ModelAttribute("rows")
	public List<QuestionType> findQuestionType(){
		return questionLibraryService.findQuestionType();
	}
	
	@RequestMapping(value = "/findQuestionPaperType")
	@ModelAttribute("rows")
	public List<QuestionPaperType> findQuestionPaperType(){
		return questionPaperService.getPaperType();
	}
	
	@RequestMapping(value="/saveQuestionTestType")
	public void saveQuestionTestType(QuestionTestType type){
		questionTestService.saveQuestionTestType(type);
	}
	
	@RequestMapping(value = "/findQuestionTestTypeById")
	public String findQuestionTestTypeById(int id,Model model){
		model.addAttribute("type",questionTestService.findQuestionTestTypeById(id));
		return "/broker/ActivityType";
	}
	
	@RequestMapping(value = "/updateQuestionTestType")
	public void updateQuestionTestType(QuestionTestType type){
		questionTestService.updateQuestionTestType(type);
	}
	
	
//	@RequestMapping(value = "/findQuestionTestTypeById")
//	public String findQuestionTestTypeById(int id,Model model){
//		model.addAttribute("type",questionTestService.findQuestionTestTypeById(id));
//		return "/broker/ActivityType";
//	}
	
	@RequestMapping(value="/saveQuestionPaperType")
	public void saveQuestionPaperType(QuestionPaperType type){
		questionPaperService.saveQuestionPaperType(type);
	}
	
	@RequestMapping(value = "/updateQuestionPaperType")
	public void updateQuestionPaperType(QuestionPaperType type){
		questionPaperService.updateQuestionPaperType(type);
	}
	
	@RequestMapping(value = "/findQuestionPaperTypeById")
	public String findQuestionPaperTypeById(int id,Model model){
		model.addAttribute("type",questionPaperService.findQuestionPaperTypeById(id));
		return "/broker/PaperType";
	}
	
	@RequestMapping(value="/saveQuestionType")
	public void saveQuestionType(QuestionType type){
		questionLibraryService.saveQuestionType(type);
	}
	
	@RequestMapping(value = "/updateQuestionType")
	public void updateQuestionType(QuestionType type){
		questionLibraryService.updateQuestionType(type);
	}
	
	@RequestMapping(value = "/findQuestionTypeById")
	public String findQuestionTypeById(int id,Model model){
		model.addAttribute("type",questionLibraryService.findQuestionTypeById(id));
		return "/broker/LibraryType";
	}
	
	@RequestMapping(value = "/delQuestionTestType")
	public void delQuestionTestType(String ids){
		Integer idss[] = CommonUtil.getIntegers(ids);
		for(int id : idss){
			questionTestService.delQuestionTestType(id);
		}
	}
	
	@RequestMapping(value = "/delQuestionPaperType")
	public void delQuestionPaperType(String ids){
		Integer idss[] = CommonUtil.getIntegers(ids);
		for(int id : idss){
			questionPaperService.delQuestionPaperType(id);
		}
	}
	
	@RequestMapping(value = "/delQuestionType")
	public void delQuestionType(String ids){
		Integer idss[] = CommonUtil.getIntegers(ids);
		for(int id : idss){
			questionLibraryService.delQuestionType(id);
		}
	}
	/**
	 * 问卷相关的活动
	 * @return
	 */
	@RequestMapping(value = "/PaperyActivity")
	public String PaperyActivity(int paperId,Model model){
		model.addAttribute("paper", questionPaperService.getQuestionPaperById(paperId));
		model.addAttribute("librarys",questionLibraryService.findQuestionLibByPaperId(null, paperId));
		return "/broker/WjActivtiy";
	}
	
	@RequestMapping(value = "/findQuestionTestByPaperId")
	@ModelAttribute("rows")
	public List<QuestionTest> findQuestionTestByPaperId(Page page,int paperId){
		return questionTestService.findQuestionTestByPaperId(page,paperId);
	}
}
