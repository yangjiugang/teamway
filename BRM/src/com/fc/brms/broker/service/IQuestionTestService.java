package com.fc.brms.broker.service;

import java.util.Date;
import java.util.List;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.domain.QuestionPapersEmployees;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.QuestionTestType;
import com.fc.brms.common.util.Page;

public interface IQuestionTestService {
	/**
	 * 在活动类型表(question_test_type)中查询活动类型
	 * @return
	 */
	public List<QuestionTestType> getQuestionTestType();
	
	public void insertQuestionTest(QuestionTest questionTest);
	/**
	 * 查询调查活动列表
	 * @param page
	 * @param test
	 * @return
	 */
	public List<QuestionTest> getQuestionTest(Page page,QuestionTest test);
	/**
	 * 根据调查编号查询活动详细
	 * @param TestNum
	 */
	public QuestionTest getQuestionTestByTestNum(int testId); 
	/**
	 * 根据调查id修改活动详细
	 * @param testId
	 * @return
	 */
	public void updateQuestionTestByTestNum(QuestionTest questionTest);
	/**
	 * 根据调查id删除调查活动
	 * @param testId
	 * @return
	 */
	/*
	 * public void delQuestionTestByTestNum(int testId);
	*/
	/**
	 * 查询调查活动列表总记录
	 * @param test
	 * @return
	 */
	public int getQuestionTestCount(QuestionTest test);
	/**
	 * 查询活动编号
	 */
	public String getQuestionTestNextNo();
	
	/**
	 * 更新活动状态
	 * @param testStatus
	 */
	public void updateTestStatusByTestNum(int testId,int testStatus);
	
	/**
	 * 查询活动状态
	 * @param testStatus
	 * @return
	 */
	public List<QuestionTest> getTestStatus(int testStatus);
	
	public int getTestStatusCount(int testStatus);
	
	/**
	 * 调查活动的参与人
	 * @param testId
	 * @param page
	 * @return
	 */
	public List<EmployeeInfo> findEmployeeInfo(int testId,Page page,EmployeeInfo employeeInfo);
	/**
	 * 调查活动参与人的总数
	 * @param testId
	 * @return
	 */
	public int findEmployeeInfoCount(int testId,EmployeeInfo employeeInfo);
	/**
	 * 保存活动类型
	 * @param type
	 */
	public void saveQuestionTestType(QuestionTestType type);
 	/**
 	 * 保存活动类别
 	 * @param id
 	 * @return
 	 */
	public QuestionTestType findQuestionTestTypeById(int id);
	/**
	 * 更新活动类别
	 * @param type
	 */
	public void updateQuestionTestType(QuestionTestType type);
	/**
	 *  逻辑删除活动类别
	 * @param typeId
	 */
	public void delQuestionTestType(int typeId);
	/**
	 * 根据问卷ID查询相关的活动
	 * @param paperId
	 */
	public List<QuestionTest> findQuestionTestByPaperId(Page page,int paperId);
	
	public int findQuestionTestCountByPaperId(int paperId);
	
	/**
	 * 根据id号查询活动的详细
	 * @param testId
	 * @return
	 */
	public QuestionTest getQuestionTestByTestId(int testId);
	public void updateQuestionTest(int testId,int testStatus,Date testStartTime,Date testEndTime,Date publishTime);
	
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
	int insertQuestionPaperEmployee(QuestionPapersEmployees paper, String employeeId);
}
