package com.fc.brms.external.mapper;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.CfgSalaryLevel;
import com.fc.brms.common.domain.EmployeeCheckingIn;
import com.fc.brms.common.domain.EmployeeContrack;
import com.fc.brms.common.domain.EmployeeFamilyInfo;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.domain.SalarySocialSecurity;
import com.fc.brms.common.domain.SalarySocialSecuritySusbmit;
import com.fc.brms.common.domain.TrainingTask;

public interface IUserInfoMapper {

	/**
	 * 查询用户的家庭成员
	 * @param empId
	 * @return
	 */
	public List<EmployeeFamilyInfo> getUserFamilyById(int empId);
	
	/**
	 * 新增家庭成员
	 * @param employeeFamilyInfo
	 * @return
	 */
	public int addNewFamilyById(EmployeeFamilyInfo employeeFamilyInfo);
	
	/**
	 * 查看入职信息
	 * @param empId
	 * @return
	 */
	public EmployeeInfo findUserInfoById(int empId);
	
	/**
	 *  查看岗位 
	 * @param empId
	 * @return
	 */
	public CfgPost getUserPostById(int poseId);
	
	/**
	 * 查看职系
	 * @param jobGradeId
	 * @return
	 */
	public CfgJobGrade getJobGradeById(int jobGradeId);
	
	/**
	 * 查询职等
	 * @param jobLevelId
	 * @return
	 */
	public CfgJobLevel getJobLevelById(int jobLevelId);
	
	/**
	 * 查询薪酬
	 * @param salaryLevelId
	 * @return
	 */
	public CfgSalaryLevel getSalaryById(int salaryLevelId);
	
	/**
	 * 社保基本信息
	 * @param socialSecurityId
	 * @return
	 */
	public SalarySocialSecurity getSocialById(int socialSecurityId);
	
	/**
	 * 根据ID获得面试约谈列表
	 * @param map
	 * @return
	 */
	public List<EmployeeTalkRecord> getTalkRecordListById(Map<String, Object> map);
	
	/**
	 * 根据ID获得面试约谈列表 总记录
	 * @param map
	 * @return
	 */
	public int getTalkRecordListCountById(Map<String, Object> map);
	
	/**
	 * 获得面试/约谈详细
	 * @param talkId
	 * @return
	 */
	public EmployeeTalkRecord getTalkRecordInfoById(int talkId);
	
	/**
	 * 查询考核记录 列表
	 * @param map
	 * @return
	 */
	public List<EmployeeCheckingIn> getCheckingListById(Map<String, Object> map );
	
	/**
	 * 查询考核记录 列表 总记录
	 * @param map
	 * @return
	 */
	public int getCheckingListCountById(Map<String, Object> map);
	
	/**
	 * 查询考核记录详细
	 * @param map
	 * @return
	 */
	public EmployeeCheckingIn getCheckingById(Map<String, Object> map);
	
	/**
	 * 查询培训记录 列表 
	 * @param map
	 * @return
	 */
	public List<TrainingTask> getTrainingTaskListById(Map<String, Object> map);
	
	/**
	 * 查询培训记录 列表 总记录数 
	 * @param map
	 * @return
	 */
	public int getTrainingTaskListCountById(Map<String, Object> map);
	
	/**
	 * 所得税
	 * @param userId
	 * @return
	 */
	public SalarySocialSecuritySusbmit getUserSubmitBuId(int userId);
	
	/**
	 * 根据用户ID获得合同信息 列表
	 * @param map
	 * @return
	 */
	public List<EmployeeContrack> getUserContrackById(Map<String, Object> map);
	
	/**
	 * 根据用户ID获得合同信息 列表  总记录数 
	 * @param map
	 * @return
	 */
	public int getUserContrackCountById(int userId);
}
