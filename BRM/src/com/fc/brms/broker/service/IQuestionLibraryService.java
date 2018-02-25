package com.fc.brms.broker.service;

import java.util.List;

import com.fc.brms.common.domain.QuestionLibrary;
import com.fc.brms.common.domain.QuestionPapersDetail;
import com.fc.brms.common.domain.QuestionType;
import com.fc.brms.common.util.Page;


public interface IQuestionLibraryService {
	
	/**
	 *  查询问题类型
	 * @return
	 */
	public List<QuestionType> findQuestionType();
	/**
	 * 保存问题
	 * @param questionLibrary
	 */
	public void saveQuestion(QuestionLibrary questionLibrary);
	/**
	 * 查询问题问编号
	 * @return
	 */
	public String getQuestionLibraryNo();
	/**
	 * 根据问卷编号查询问题
	 * @param page
	 * @param paperId
	 * @return
	 */
	public List<QuestionLibrary> findQuestionLibByPaperId(Page page,int paperId);
	/**
	 * 根据问卷编号查询问题记录
	 * @param paperId
	 * @return
	 */
	public int findQuestionLibCountByPaperId(int paperId);
	
	public void savePaperDetail(QuestionPapersDetail detail);
	
	public void updateQuestionPoint(int id,int point);
	
	public void delQuestionPapersDetail(int id);
	
	public void updateQuestionOrder(int id,int order);
	
	public List<QuestionLibrary> findQuestionLibrary(QuestionLibrary library,Page page);
	
	public int findQuestionLibraryCount(QuestionLibrary library);
	
	public QuestionLibrary findQuestionLibraryById(int id);
	
	public void updateLibraryState(int id);
	
	public void updateLibrary(QuestionLibrary library);
	
	public void saveQuestionType(QuestionType type);
	
	public QuestionType findQuestionTypeById(int id);
	
	public void updateQuestionType(QuestionType type);
	
	public void delQuestionType(int typeId);
	/**
	 * 查看问卷的所有的题目
	 * @param map （问卷的id号，分页）
	 * @return 所有题目
	 * code gonghj
	 */
	public List<QuestionLibrary> findQuestionLibraryByPaperId(int paperId,Page page);
	/**
	 * 查看问卷的所有的题目总条数
	 * @param int
	 * @return 所有题目的总条数
	 * code gonghj
	 */
	public int findQuestionLibraryByPaperIdCount(int paperId);
	
	/**
	 * 调查活动的参与情况的统计
	 * @param testId  如果只传testId就是查总人数
	 * @param isSubmit 如果传了isSubmit 等于0是没参与 等于1就是参与 9是null
	 * @param isAvailabe 如果传isAvailabe 等于0参与无效 等于1参与有效  9是null
	 * @return
	 */
	public int findSurveyStatistics(int testId,int isSubmit,int isAvailabe);
	/**
	 * 调查成绩统计
	 * @param testId
	 * @param bigScore  最大的分数
	 * @param smallScore 最小的分数
	 * @return
	 */
	public int findScoreStatistice(int testId,int smallScore,int bigScore);
	
	/**
	 * 查看问卷的所有的题目
	 * @param map （问卷的id号，分页）
	 * @return 所有题目
	 * code gonghj
	 */
	public List<QuestionLibrary> findPapersId(int paperId,Page paperPage);
	
	/**
	 * 查看问卷的所有的题目总条数
	 * @param int
	 * @return 所有题目的总条数
	 * code gonghj
	 */
	public int findPapersIdCount(int paperId);
}
