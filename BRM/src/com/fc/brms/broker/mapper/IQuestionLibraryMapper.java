package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.QuestionLibrary;
import com.fc.brms.common.domain.QuestionPapersDetail;
import com.fc.brms.common.domain.QuestionType;


public interface IQuestionLibraryMapper {

	public List<QuestionType> findQuestionType();
	
	public void saveQuestion(QuestionLibrary questionLibrary);
	
	public String getQuestionLibraryNo(@Param("today")String today);
	
	public List<QuestionLibrary> findQuestionLibByPaperId(@Param("paperId")int paperId,
														  @Param("limit")String limit);
	
	public void savePaperDetail(QuestionPapersDetail detail);
	
	public void updateQuestionPoint(@Param("id")int id,@Param("point")int point);
	
	public void delQuestionPapersDetail(int id);
	
	public void updateQuestionOrder(@Param("id")int id,@Param("order")int order);
	
	public List<QuestionLibrary> findQuestionLibrary(@Param("library")QuestionLibrary library,@Param("limit")String limit);
	
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
	public List<QuestionLibrary> findQuestionLibraryByPaperId(Map<String,Object> map);
	/**
	 * 查看问卷的所有的题目总条数
	 * @param int
	 * @return 所有题目的总条数
	 * code gonghj
	 */
	public int findQuestionLibraryByPaperIdCount(int paperId);
	
	/**
	 * 调查活动参与情况的统计
	 * @param maps
	 * @return
	 */
	public int findSurveyStatistics(Map<String,Object> map);
	/**
	 * 调查活动统计
	 * @param maps
	 * @return
	 */
	public int findScoreStatistice(Map<String,Object> map);
	/**
	 * 查看问卷的所有的题目
	 * @param map （问卷的id号，分页）
	 * @return 所有题目
	 * code gonghj
	 */
	public List<QuestionLibrary> findQuestionLibraryByPapersId(Map<String,Object> map);
	
	/**
	 * 查看问卷的所有的题目总条数
	 * @param int
	 * @return 所有题目的总条数
	 * code gonghj
	 */
	public int findQuestionLibraryByPapersIdCount(int paperId);
}
