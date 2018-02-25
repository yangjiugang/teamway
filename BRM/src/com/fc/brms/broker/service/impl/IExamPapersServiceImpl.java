package com.fc.brms.broker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.IExamPapersMapper;
import com.fc.brms.broker.service.IExamPapersService;
import com.fc.brms.common.domain.QuestionPaperEmployeeAnswer;
import com.fc.brms.common.domain.QuestionPapersDetail;
import com.fc.brms.common.domain.QuestionPapersEmployees;
@Service
public class IExamPapersServiceImpl implements IExamPapersService {
	@Resource
	private IExamPapersMapper examPapersMapper;
	/**
	 * 增加
	 * @param questionPaperEmployeeAnswer
	 */
	public void saveQuestionPaperEmployeeAnswer(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer){
		examPapersMapper.saveQuestionPaperEmployeeAnswer(questionPaperEmployeeAnswer);
	}
	/**
	 * 修改
	 * @param questionPaperEmployeeAnswer
	 */
	public void updateQuestionPaperEmployeeAnswer(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer){
		examPapersMapper.updateQuestionPaperEmployeeAnswer(questionPaperEmployeeAnswer);
	}
	/**
	 * 查看
	 * @param questionPaperEmployeeAnswer
	 * @return
	 */
	public QuestionPaperEmployeeAnswer findQuestionPaperEmployeeAnswer(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer){
		return examPapersMapper.findQuestionPaperEmployeeAnswer(questionPaperEmployeeAnswer);
	}
	
	/**
	 * 查询调查活动的人员
	 * @param questionPapersEmployees
	 * @return
	 */
	public QuestionPapersEmployees findQuestionPapersEmployees(int testId,int visitorId){
		QuestionPapersEmployees qpe=new QuestionPapersEmployees();
		qpe.setTestId(testId);
		qpe.setVisitorId(visitorId);
		qpe=examPapersMapper.findQuestionPapersEmployees(qpe);
		return qpe;
	}
	
	/**
	 * 查看
	 * @param questionPaperEmployeeAnswer
	 * @return
	 */
	public List<QuestionPaperEmployeeAnswer> findQuestionPaperEmployeeAnswerCon(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer){
		return examPapersMapper.findQuestionPaperEmployeeAnswerCon(questionPaperEmployeeAnswer);
	}
	
	/**
	 * 查看试卷的题目的分数
	 * @param qpd
	 * @return
	 */
	public QuestionPapersDetail findQuestionPapersDetail(QuestionPapersDetail qpd){
		return examPapersMapper.findQuestionPapersDetail(qpd).get(0);
	}
	
	/**
	 *  提交试卷
	 * @param qpe
	 */
	public void updateQuestionPapersEmployees(QuestionPapersEmployees qpe){
		examPapersMapper.updateQuestionPapersEmployees(qpe);
	}
	
	/**
	 * 根据qeustiongtype取总题数
	 * @param paperId
	 * @param questionType
	 * @return
	 */
	public int findQuestionTypeCount(int paperId,int questionType){
		return examPapersMapper.findQuestionTypeCount(paperId, questionType);
		
	}
	
	/**
	 * 根据qeustiongtype取总分数
	 * @param paperId
	 * @param questionType
	 * @return
	 */
	public int findQuestionPointsCount(int paperId,int questionType){
		return examPapersMapper.findQuestionPointsCount(paperId, questionType);
	}
}
