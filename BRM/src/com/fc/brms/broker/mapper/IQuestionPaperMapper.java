package com.fc.brms.broker.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.QuestionPaperType;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.util.Page;

/**
 * 调查活动增、删、改、查Mapper
 * 
 * @author yangjg
 * @version 1.0 2012-03-12
 */

public interface IQuestionPaperMapper {

	/**
	 * 查询问卷类型
	 * @return List
	 */
	public List<QuestionPaperType> getPaperType();
	/**
	 * 查询问卷编号
	 * @return
	 */
	public String getQuestionPaperNo(@Param("today")String today);
	/**
	 * 保存问卷
	 */
	public void saveQuestionPaper(QuestionPapers paper);
	/**
	 * 查询问卷
	 * @param limit
	 * @param paper
	 * @return
	 */
	public List<QuestionPapers> getQuestionPapers(@Param("page")Page page,@Param("paper")QuestionPapers paper);
	/**
	 * 查询问卷总记录
	 * @param paper
	 * @return
	 */
	public int getQuestionPapersCount(QuestionPapers paper);
	
	public void delQuestionPapers(int id);
	
	public QuestionPapers getQuestionPaperById(int id);
	
	public void updateQuestionPaper(QuestionPapers paper);
	
	public int findQuestionPaperDetailCount(int paperId);
	
	public void updatePaperQuestions(@Param("paperId")int paperId,@Param("count")int count);
	
	public void saveQuestionPaperType(QuestionPaperType type);
	
	public QuestionPaperType findQuestionPaperTypeById(int id);
	
	public void updateQuestionPaperType(QuestionPaperType type);
	
	public void delQuestionPaperType(int typeId);
	/**
	 * 查询问卷表中查询状态不为0的问卷Id和名称
	 * @return
	 */
	public List<QuestionPapers> getPaperName();
}
