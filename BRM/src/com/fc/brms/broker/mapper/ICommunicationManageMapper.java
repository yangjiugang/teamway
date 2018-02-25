package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.EmployeeTalkRecord;



/**
 * 沟通管理Mapper
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-28
 */
public interface ICommunicationManageMapper {
	
	/**
	 * 查询人员约谈记录
	 * 
	 * @return 约谈信息集合
	 */
	List<EmployeeTalkRecord> queryCommHistory(@Param("employeeId") int employeeId);
	
	/**
	 * 根据ID查询约谈记录
	 * 
	 * @return 约谈信息集合
	 */
	EmployeeTalkRecord getTalkRecordById(@Param("talkId") int talkId);
	
	/**
	 * 根据ID查询约谈内容
	 * 
	 * @return 约谈信息集合
	 */
	List<EmployeeTalkRecord> queryTalkContent(@Param("talkId") int talkId);
	
	/**
	 * 添加约谈记录
	 * 
	 * @return 
	 */
	int addCommunicationRecord(Map<String, Object> map);
	
	/**
	 * 添加约谈记录
	 * 
	 * @return 
	 */
	int addEmployeeTalkContent(Map<String, Object> map);
	
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
