package com.fc.brms.broker.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.IQuestionLibraryService;
import com.fc.brms.broker.service.IQuestionPaperService;
import com.fc.brms.broker.service.IQuestionTestService;
import com.fc.brms.common.domain.QuestionPaperType;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.util.CommonUtil;

@Controller
public class brokerManagementController {

	@Resource
	private IQuestionPaperService questionPaperService;
	@Resource
	private IQuestionTestService questionTestService;
	@Resource
	private IQuestionLibraryService questionLibraryService;
	
	@RequestMapping(value = {"/investigationManagement"})
	public String investigationManagement(){
		return "/broker/InvestigationManagement";
	}
	
	@RequestMapping(value = {"/investigationLeft"})
	public String recruitManagement(Model model,HttpServletRequest request) throws Exception{
		model.addAttribute("StatusCount0",questionTestService.getTestStatusCount(0));
		model.addAttribute("StatusCount1",questionTestService.getTestStatusCount(1));
		model.addAttribute("StatusCount2",questionTestService.getTestStatusCount(2));
		model.addAttribute("StatusCount3",questionTestService.getTestStatusCount(3));
		model.addAttribute("StatusCount4",questionTestService.getTestStatusCount(4));
		
		List<QuestionPaperType> paperTypes = questionPaperService.getPaperType();
		QuestionPapers paper = new QuestionPapers();
		List<QuestionPaperType> paperTypes_ = new ArrayList<QuestionPaperType>();
		for(QuestionPaperType type : paperTypes){
			paper.setTypeId(type.getTypeId());
			type.setCount(questionPaperService.getQuestionPapersCount(paper));
			paperTypes_.add(type);
		}
		model.addAttribute("paperTypes",paperTypes_);
		return "/broker/InvestigationLeft";
	}
	
	@RequestMapping(value = {"/activityManagement"})
	public String activityManagement(Model model,HttpServletRequest request,int testStatus) throws Exception{
		model.addAttribute("questionType", CommonUtil.toJson(questionTestService.getQuestionTestType()));
		model.addAttribute("testStatus", testStatus);
		return "/broker/ActivityManagement";
	}
	/**
	 * 问卷列表
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/wjManageList"})
	public String wjManageList(Model model,int typeId) throws Exception{
		model.addAttribute("types", CommonUtil.toJson(questionPaperService.getPaperType()));
		model.addAttribute("typeId", typeId);
		return "/broker/WjManageList";
	}
	
	@RequestMapping(value = {"/QuestionLibraryList"})
	public String QuestionLibraryList(Model model) throws Exception{
		model.addAttribute("types", CommonUtil.toJson(questionLibraryService.findQuestionType()));
		return "/broker/QuestionLibraryList";
	}
	
	@RequestMapping(value = {"/brokerPage"})
	public String redirectPage(Model model,String page) throws Exception{
		model.addAttribute("paperTypes",questionPaperService.getPaperType());
//		model.addAttribute("paperNum",questionPaperService.getQuestionPaperNo());
		return "/broker/"+page;
	}
	
	@RequestMapping(value = "/findUsers")
	public void findUsers(HttpServletResponse response) throws IOException{
		String tree ="[{ id:1, pId:0, name:\"技术部\", open:true},"+
					"{ id:11, pId:1, name:\"张三\", open:true},"+
					"{ id:12, pId:1, name:\"李四\", open:true},"+
					"{ id:13, pId:1, name:\"王五\", open:true},"+
					"{ id:14, pId:1, name:\"小子\", open:true},"+
					"{ id:15, pId:1, name:\"小屋\", open:true},"+
					"{ id:16, pId:1, name:\"小文\", open:true},"+
					"{ id:2, pId:0, name:\"销售部\", open:true},"+
					"{ id:21, pId:2, name:\"张三\", open:true},"+
					"{ id:22, pId:2, name:\"李四\", open:true},"+
					"{ id:23, pId:2, name:\"王五\", open:true},"+
					"{ id:24, pId:2, name:\"小子\", open:true},"+
					"{ id:25, pId:2, name:\"小屋\", open:true},"+
					"{ id:26, pId:2, name:\"小文\", open:true}]";
		response.getWriter().print(tree);
	}
}
