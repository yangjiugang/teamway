package com.fc.brms.broker.service;

import java.util.List;

import com.fc.brms.common.domain.QuestionPaperType;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.util.Page;

public interface IQuestionPaperService {
	/**
	 * 查询问卷类型
	 * @return
	 */
	public List<QuestionPaperType> getPaperType();
	/**
	 * 查询问卷编号
	 */
	public String getQuestionPaperNo();
	/**
	 * 保存问卷
	 * @param paper
	 */
	public void saveQuestionPaper(QuestionPapers paper);
	/**
	 * 查询问卷
	 * @param page
	 * @param paper
	 * @return
	 */
	public List<QuestionPapers> getQuestionPapers(Page page,QuestionPapers paper);
	/**
	 * 查询问卷总记录
	 * @param paper
	 * @return
	 */
	public int getQuestionPapersCount(QuestionPapers paper);
	/**
	 * 删除
	 * @param id
	 */
	public void delQuestionPapers(int id);
	/**
	 * 根据ID查找
	 * @param id
	 * @return
	 */
	public QuestionPapers getQuestionPaperById(int id);
	/**
	 * 更新
	 * @param paper
	 */
	public void updateQuestionPaper(QuestionPapers paper);
	/**
	 * 查询问卷问题数量
	 * @param paperId
	 * @return
	 */
	public int findQuestionPaperDetailCount(int paperId);
	/**
	 * 更新问卷问题数量
	 * @param paperId
	 * @param count
	 */
	public void updatePaperQuestions(int paperId,int count);
	/**
	 * 保存问卷类型
	 * @param type
	 */
	public void saveQuestionPaperType(QuestionPaperType type);
	/**
	 * 根据ID查询问题类型
	 * @param id
	 * @return
	 */
	public QuestionPaperType findQuestionPaperTypeById(int id);
	/**
	 * 更新问题类型
	 * @param type
	 */
	public void updateQuestionPaperType(QuestionPaperType type);
	/**
	 * 逻辑删除问卷类型
	 * @param typeId
	 */
	public void delQuestionPaperType(int typeId);
	
	/**
	 * 查询问卷表中查询状态不为0的问卷Id和名称
	 * @return
	 */
	public List<QuestionPapers> getPaperName();
}
