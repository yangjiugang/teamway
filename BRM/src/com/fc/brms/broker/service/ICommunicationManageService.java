package com.fc.brms.broker.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeTalkRecord;


/**
 * 沟通管理Service
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-28
 */
public interface ICommunicationManageService {

	/**
	 * 查询约谈提醒总记录数
	 * 
	 * @return 总记录数
	 */
	int queryCommunicationManageCount(Map<String, Object> map);

	/**
	 * 查询约谈提醒记录列表
	 * 
	 * @return 沟通人员信息集合
	 */
	List<EmployeeInfo> queryCommunicationManageList(Map<String, Object> map);
	
	/**
	 * 删除约谈提醒记录
	 * 
	 * @return 
	 */
	int deleteCommunicationRemind(String msgId);
	
	/**
	 * 查询人员约谈记录
	 * 
	 * @return 沟通人员信息集合
	 */
	List<EmployeeTalkRecord> queryCommHistory(int employeeId);
	
	/**
	 * 根据ID查询约谈记录
	 * 
	 * @return 约谈信息集合
	 */
	EmployeeTalkRecord getTalkRecordById(int talkId);
	
	/**
	 * 根据ID查询约谈内容
	 * 
	 * @return 约谈信息集合
	 */
	List<EmployeeTalkRecord> queryTalkContent(int talkId);
	
	/**
	 * 添加约谈记录
	 * 
	 * @return 
	 */
	int addCommunicationRecord(EmployeeTalkRecord employeeTalkRecord, int companyId, String contentType);
	
	/**
	 * 查询约谈信息总记录数
	 * 
	 * @return 
	 */
	int queryCommunicationActivtyCount(Map<String, Object> map);
	
	/**
	 * 查询约谈信息列表
	 * 
	 * @return 
	 */
	List<EmployeeTalkRecord> queryCommunicationActivtyList(Map<String, Object> map);
}
