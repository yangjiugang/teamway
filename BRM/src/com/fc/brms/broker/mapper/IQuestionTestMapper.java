package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.QuestionTestType;

/**
 * 调查活动增、删、改、查Mapper
 * 
 * @author yangjg
 * @version 1.0 2012-03-12
 */

public interface IQuestionTestMapper {
	/**
	 * 在活动类型表(question_test_type)中查询活动类型
	 * @return
	 */
	public List<QuestionTestType> getQuestionTestType();

	public void insertQuestionTest(QuestionTest questionTest);
	/**
	 * QuestionTest的查询方法
	 */
	public List<QuestionTest> getQuestionTest(QuestionTest test);
	
	/**
	 * 根据活动id号查询活动详细
	 * @param testNum
	 * @return
	 */
	public QuestionTest getQuestionTestByTestNum(@Param("testId")int testId);
	/**
	 * 根据活动id号修改活动
	 * @param testNum
	 * @return
	 */
	public void updateQuestionTestByTestNum(QuestionTest questionTest);
	
	
	//public void delQuestionTestByTestNum(@Param("testId")int testId);
	/**
	 * 查询所有记录
	 * @param test
	 * @return
	 */
	public int getQuestionTestCount(QuestionTest test);
	/**
	 * 查询活动最大编号
	 * @return
	 */
	public String getQuestionTestNextNo(@Param("today")String today);
	/**
	 * 更新活动状态
	 * @param testStatus
	 */
	/**
	 * 发布调查活动
	 * @param map
	 */
	public void updateQuestionTest(Map<String,Object> map);
	public void updateTestStatusByTestNum(Map<String, Object> map);
	
	public int getTestStatusCount(int testStatus);
	
	public int findEmployeeCount(Map<String, Object> map);
	
	public List<EmployeeInfo> findEmployee(Map<String, Object> map);
	
	public void saveQuestionTestType(QuestionTestType type);
	
	public QuestionTestType findQuestionTestTypeById(int id);
	
	public void updateQuestionTestType(QuestionTestType type);
	
	public void delQuestionTestType(int typeId);
	
	public List<QuestionTest> findQuestionTestByPaperId(@Param("limit")String limit,@Param("paperId")int paperId);
	
	public int findQuestionTestCountByPaperId(int paperId);
	
	/**
	 * 根据id号查询活动的详细
	 * @param testId
	 * @return
	 */
	public QuestionTest getQuestionTestByTestId(int testId);
	
	/**
	 * 根据id号查询试卷详情
	 * @param paperId
	 * @return
	 * 龚红军
	 */
	public QuestionPapers findQuertionpapers(int paperId);
	
	/**
	 * 员工参加调查活动，发送通知
	 * 
	 * @param test活动ID employeeId 员工ID
	 * @return
	 */
	int insertQuestionPaperEmployee(Map<String,Object> map);
	
}
