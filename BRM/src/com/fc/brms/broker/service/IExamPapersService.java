package com.fc.brms.broker.service;

import java.util.List;

import com.fc.brms.common.domain.QuestionPaperEmployeeAnswer;
import com.fc.brms.common.domain.QuestionPapersDetail;
import com.fc.brms.common.domain.QuestionPapersEmployees;

public interface IExamPapersService {
	/**
	 * 增加
	 * @param questionPaperEmployeeAnswer
	 */
	public void saveQuestionPaperEmployeeAnswer(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer);
	/**
	 * 修改
	 * @param questionPaperEmployeeAnswer
	 */
	public void updateQuestionPaperEmployeeAnswer(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer);
	/**
	 * 查看
	 * @param questionPaperEmployeeAnswer
	 * @return
	 */
	public QuestionPaperEmployeeAnswer findQuestionPaperEmployeeAnswer(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer);
	
	/**
	 * 查询调查活动的人员
	 * @param questionPapersEmployees
	 * @return
	 */
	public QuestionPapersEmployees findQuestionPapersEmployees(int testId,int visitorId);
	
	/**
	 * 查看
	 * @param questionPaperEmployeeAnswer
	 * @return
	 */
	public List<QuestionPaperEmployeeAnswer> findQuestionPaperEmployeeAnswerCon(QuestionPaperEmployeeAnswer questionPaperEmployeeAnswer);
	
	/**
	 * 查看试卷的题目的分数
	 * @param qpd
	 * @return
	 */
	public QuestionPapersDetail findQuestionPapersDetail(QuestionPapersDetail qpd);
	
	/**
	 *  提交试卷
	 * @param qpe
	 */
	public void updateQuestionPapersEmployees(QuestionPapersEmployees qpe);
	
	/**
	 * 根据qeustiongtype取总题数
	 * @param paperId
	 * @param questionType
	 * @return
	 */
	public int findQuestionTypeCount(int paperId,int questionType);
	
	/**
	 * 根据qeustiongtype取总分数
	 * @param paperId
	 * @param questionType
	 * @return
	 */
	public int findQuestionPointsCount(int paperId,int questionType);
}
