package com.fc.brms.broker.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.IQuestionPaperMapper;
import com.fc.brms.broker.service.IQuestionPaperService;
import com.fc.brms.common.domain.QuestionPaperType;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;

@Service
public class QuestionPaperServiceImpl implements IQuestionPaperService {
	
	@Resource
	private IQuestionPaperMapper questionPaperMapper;

	@Override
	public List<QuestionPaperType> getPaperType() {
		return questionPaperMapper.getPaperType();
	}
	
	@Override
	public String getQuestionPaperNo() {
		String ts = DateTools.getTodays().substring(2,8);
		String WJ = "WJ";
		String no = WJ + ts;
		String result = questionPaperMapper.getQuestionPaperNo(no);
		if(result == null){
			no += "0001";
		}else{
			String maxno = result.substring(2, result.length());
			maxno = String.valueOf((Integer.parseInt(maxno) + 1));
			no = WJ + ts + maxno.substring(6,maxno.length());
		}
		return no;
	}
	
	@Override
	public void saveQuestionPaper(QuestionPapers paper) {
		if(paper.getPaperId() == 0){
			paper.setPaperNum(getQuestionPaperNo());
			questionPaperMapper.saveQuestionPaper(paper);
		}else{
			paper.setLastUpdateTime(new Date());
			paper.setLastUpdateUser(1);
			questionPaperMapper.updateQuestionPaper(paper);
		}
		
	}
	
	@Override
	public List<QuestionPapers> getQuestionPapers(Page page,QuestionPapers paper) {
		page.setRecords(getQuestionPapersCount(paper));
		page.setSidx(CommonUtil.changeDBColName(page.getSidx()));
		return questionPaperMapper.getQuestionPapers(page, paper);
	}
	
	@Override
	public int getQuestionPapersCount(QuestionPapers paper) {
		return questionPaperMapper.getQuestionPapersCount(paper);
	}
	
	@Override
	public void delQuestionPapers(int id) {
		questionPaperMapper.delQuestionPapers(id);
	}
	
	@Override
	public QuestionPapers getQuestionPaperById(int id) {
		return questionPaperMapper.getQuestionPaperById(id);
	}
	
	@Override
	public void updateQuestionPaper(QuestionPapers paper) {
		questionPaperMapper.updateQuestionPaper(paper);
	}
	
	@Override
	public int findQuestionPaperDetailCount(int paperId) {
		return questionPaperMapper.findQuestionPaperDetailCount(paperId);
	}
	
	@Override
	public void updatePaperQuestions(int paperId, int count) {
		questionPaperMapper.updatePaperQuestions(paperId, count);
	}
	
	@Override
	public QuestionPaperType findQuestionPaperTypeById(int id) {
		return questionPaperMapper.findQuestionPaperTypeById(id);
	}
	
	@Override
	public void saveQuestionPaperType(QuestionPaperType type) {
		questionPaperMapper.saveQuestionPaperType(type);
	}
	
	@Override
	public void updateQuestionPaperType(QuestionPaperType type) {
		questionPaperMapper.updateQuestionPaperType(type);
	}
	
	@Override
	public void delQuestionPaperType(int typeId) {
		questionPaperMapper.delQuestionPaperType(typeId);
	}
	@Override
	public List<QuestionPapers> getPaperName() {
		return questionPaperMapper.getPaperName();
	}
}
