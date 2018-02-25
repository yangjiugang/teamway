package com.fc.brms.broker.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.IQuestionTestMapper;
import com.fc.brms.broker.service.IQuestionTestService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.QuestionPapers;
import com.fc.brms.common.domain.QuestionPapersEmployees;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.QuestionTestType;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;

@Service
public class QuestionTestServiceImpl implements IQuestionTestService {
	
	@Resource
	private IQuestionTestMapper questionTestMapper;

	public void insertQuestionTest(QuestionTest questionTest) {
		if(questionTest.getTestId() == 0){
		questionTest.setTestNum(getQuestionTestNextNo());
		questionTestMapper.insertQuestionTest(questionTest);
		}
		else
		{
			questionTestMapper.updateQuestionTestByTestNum(questionTest);
		}
	}

	@Override
	public List<QuestionTest> getQuestionTest(Page page, QuestionTest test) {
		page.setRecords(getQuestionTestCount(test));
		test.setLimit(page.getLimit());
		return questionTestMapper.getQuestionTest(test);
	}
	
	@Override
	public int getQuestionTestCount(QuestionTest test) {
		return questionTestMapper.getQuestionTestCount(test);
	}
	
	@Override
	public String getQuestionTestNextNo() {
		String ts = DateTools.getTodays().substring(2,8);
		String HD = "HD";
		String no = HD + ts;
		String result = questionTestMapper.getQuestionTestNextNo(no);
		if(result == null){
			no += "0001";
		}else{
			String maxno = result.substring(2, result.length());
			maxno = String.valueOf((Integer.parseInt(maxno) + 1));
			no = HD + ts + maxno.substring(6,maxno.length());
		}
		return no;
	}

	@Override
	public QuestionTest getQuestionTestByTestNum(int testId) {
		return questionTestMapper.getQuestionTestByTestNum(testId);
	}
	@Override
	public void updateQuestionTestByTestNum(QuestionTest questionTest) {
		 questionTestMapper.updateQuestionTestByTestNum(questionTest);
	}
	/**
	@Override
	public void delQuestionTestByTestNum(int testId) {
		questionTestMapper.delQuestionTestByTestNum(testId);
	}
	*/
	@Override
	public List<QuestionTestType> getQuestionTestType() {
		
		return questionTestMapper.getQuestionTestType();
	}
	@Override
	public void updateTestStatusByTestNum(int testId,int testStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("testId", testId);
		map.put("testStatus", testStatus);
		questionTestMapper.updateTestStatusByTestNum(map);
	}
	@Override
	public int getTestStatusCount(int testStatus) {
		return questionTestMapper.getTestStatusCount(testStatus);
	}
	
	@Override
	public List<QuestionTest> getTestStatus(int testStatus) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 调查活动的参与人
	 * @param testId
	 * @param page
	 * @return
	 */
	public List<EmployeeInfo> findEmployeeInfo(int testId,Page page,EmployeeInfo employeeInfo){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("testId",testId);
		map.put("userName",employeeInfo.getUserName());
		map.put("organizationName", employeeInfo.getOrganizationName());
		map.put("bigScore", employeeInfo.getBigScore());
		map.put("smallScore", employeeInfo.getSmallScore());
		map.put("smallTime", employeeInfo.getSmallTime());
		map.put("bigTime", employeeInfo.getBigTime());
		map.put("limit", page.getLimit());
		List<EmployeeInfo> list=questionTestMapper.findEmployee(map);
		return list;
	}
	/**
	 * 调查活动参与人的总数
	 * @param testId
	 * @return
	 */
	public int findEmployeeInfoCount(int testId,EmployeeInfo employeeInfo){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("testId", testId);
		map.put("userName",employeeInfo.getUserName());
		map.put("organizationName", employeeInfo.getOrganizationName());
		map.put("bigScore", employeeInfo.getBigScore());
		map.put("smallScore", employeeInfo.getSmallScore());
		map.put("smallTime", employeeInfo.getSmallTime());
		map.put("bigTime", employeeInfo.getBigTime());
		return questionTestMapper.findEmployeeCount(map);
	}
	
	@Override
	public void saveQuestionTestType(QuestionTestType type) {
		type.setCreateTime(new Date());
		type.setCreateUser(1);
		type.setLastUpdateTime(new Date());
		type.setLastUpdateUser(1);
		questionTestMapper.saveQuestionTestType(type);
	}
	
	@Override
	public QuestionTestType findQuestionTestTypeById(int id) {
		return questionTestMapper.findQuestionTestTypeById(id);
	}
	
	@Override
	public void updateQuestionTestType(QuestionTestType type) {
		type.setLastUpdateTime(new Date());
		type.setLastUpdateUser(1);
		questionTestMapper.updateQuestionTestType(type);
	}
	
	@Override
	public void delQuestionTestType(int typeId) {
		questionTestMapper.delQuestionTestType(typeId);
	}
	
	@Override
	public List<QuestionTest> findQuestionTestByPaperId(Page page,int paperId) {
		page.setRecords(findQuestionTestCountByPaperId(paperId));
		return questionTestMapper.findQuestionTestByPaperId(page.getLimit(),paperId);
	}
	
	@Override
	public int findQuestionTestCountByPaperId(int paperId) {
		return questionTestMapper.findQuestionTestCountByPaperId(paperId);
	}
	
	/**
	 * 根据id号查询活动的详细
	 * @param testId
	 * @return
	 */
	public QuestionTest getQuestionTestByTestId(int testId){
		return questionTestMapper.getQuestionTestByTestId(testId);
	}
	/**
	 * 发布调查活动
	 */
	@Override
	public void updateQuestionTest(int testId,int testStatus,Date testStartTime,Date testEndTime,Date publishTime){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("testId", testId);
		map.put("testStatus", testStatus);
		map.put("testStartTime", testStartTime);
		map.put("testEndTime", testEndTime);
		map.put("publishTime", publishTime);
		questionTestMapper.updateQuestionTest(map);
	}
	/**
	 * 根据id号查询试卷详情
	 * @param paperId
	 * @return
	 * 龚红军
	 */
	public QuestionPapers findQuertionpapers(int paperId){
		return questionTestMapper.findQuertionpapers(paperId);
	}
	
	/**
	 * 员工参加调查活动，发送通知
	 * 
	 * @return
	 */
	public int insertQuestionPaperEmployee(QuestionPapersEmployees paper, String employeeId){
		Map<String,Object> map = new HashMap<String, Object>();
		int iCount = -1;
		String[] strEmployeeId = employeeId.split(",");
		for(int i = 0; i < strEmployeeId.length; i++){
			map.put("companyId", paper.getCompanyId());
			map.put("testId", paper.getTestId());
			map.put("employeeId", strEmployeeId[i]);
			iCount = questionTestMapper.insertQuestionPaperEmployee(map);
		}
		return iCount;
	}
}
