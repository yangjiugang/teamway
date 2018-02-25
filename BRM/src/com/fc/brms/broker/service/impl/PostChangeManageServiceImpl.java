package com.fc.brms.broker.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.broker.mapper.IEmployeeInfoMapper;
import com.fc.brms.broker.mapper.IPostChangeManageMapper;
import com.fc.brms.broker.service.IPostChangeManageService;
import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgSalaryLevel;
import com.fc.brms.common.domain.EmployeeTransactionInfo;
import com.fc.brms.common.mapper.IOrgStructureMapper;


/**
 * 异动管理 Impl
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-21
 */
@Service
public class PostChangeManageServiceImpl implements IPostChangeManageService  {

	@Resource
	private IPostChangeManageMapper postChangeMappeer;
	
	@Resource
	private IEmployeeInfoMapper employeeInfoMapper;
	
	@Resource
	private IOrgStructureMapper orgStructureMapper;
	
	/**
	 * 查询员工异动总记录数
	 * 
	 * @return 总记录数
	 */
	@Transactional
	public int queryEmployeePostChangeCount(Map<String, Object> map) {
		return postChangeMappeer.queryEmployeePostChangeCount(map);
	}

	/**
	 * 查询员工异动列表
	 * 
	 * @return 异动信息集合
	 */
	@Transactional
	public List<EmployeeTransactionInfo> queryEmployeePostChangeList(Map<String, Object> map) {
		return postChangeMappeer.queryEmployeePostChangeList(map);
	}

	/**
	 * 根据ID查找人员异动信息
	 * 
	 * @return 异动信息集合
	 */
	public EmployeeTransactionInfo getEmployeePostChangeById(int infoId) {
		return postChangeMappeer.getEmployeePostChangeById(infoId);
	}
	
	/**
	 * 查询员工异动前的所有信息
	 * 
	 * @return 员工异动前的信息
	 */
	public EmployeeTransactionInfo queryEmployeeAllInfo(int employeeId) {
		return postChangeMappeer.queryEmployeeAllInfo(employeeId);
	}
	
	/**
	 * 添加员工异动信息
	 * 
	 * @return 
	 */
	public int addPostChangeInfo(EmployeeTransactionInfo employeeTransactionInfo, EmployeeTransactionInfo employeeTransInfo) {
		updateEmployeeInfo(employeeTransInfo);
		// 添加异动
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyId", employeeTransInfo.getBeforCompanyId());
		map.put("employeeId", employeeTransInfo.getEmployeeId());
		map.put("transactionDate", employeeTransInfo.getTransactionDate());
		map.put("transactionType", employeeTransInfo.getTransactionType());
		map.put("transactionDesc", employeeTransInfo.getTransactionDesc());
		map.put("beforOrganizationId", employeeTransInfo.getBeforOrganizationId());
		map.put("beforOrganizationName", employeeTransInfo.getBeforOrganizationName());
		map.put("postId", employeeTransInfo.getBeforPostId());
		map.put("postName", employeeTransInfo.getBeforPostName());
		map.put("beforJobGradeId", employeeTransInfo.getBeforJobGradeId());
		map.put("beforJobGradeName", employeeTransInfo.getBeforJobGradeName());
		map.put("beforJobLevelId", employeeTransInfo.getBeforJobLevelId());
		map.put("beforJobLevelName", employeeTransInfo.getBeforJobLevelName());
		map.put("structureType", employeeTransactionInfo.getStructureType());
		map.put("beforSalaryLevelOrder", employeeTransInfo.getBeforSalaryLevelOrder());
		map.put("beforSalaryTotal", employeeTransInfo.getBeforSalaryTotal());
		map.put("beforCompanyId", employeeTransInfo.getBeforCompanyId());
		map.put("beforAreaId", employeeTransInfo.getBeforAreaId());
		map.put("beforSocialSecurityBase", employeeTransInfo.getBeforSocialSecurityBase());
		map.put("beforSsName", employeeTransInfo.getBeforSsName());
		map.put("transactionStatus", employeeTransInfo.getTransactionStatus());
		map.put("salaryLevelId", employeeTransactionInfo.getSalaryLevelId());
		
		// 异动前数据插入到EmployeeTransactionInfo中
		return postChangeMappeer.addPostChangeInfo(map);
	}
	
	/**
	 * 异动后数据更新到employeeInfo中
	 * 
	 * @param employeeTransInfo
	 */
	public void updateEmployeeInfo(EmployeeTransactionInfo employeeTransInfo){
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("organizationId", employeeTransInfo.getOrganizationId());
		maps.put("organizationName", employeeTransInfo.getOrganizationName());
		maps.put("postId", employeeTransInfo.getPostId());
		maps.put("postName", employeeTransInfo.getPostName());
		maps.put("jobGradeId", employeeTransInfo.getJobGradeId());
		maps.put("jobGradeName", employeeTransInfo.getJobGradeName());
		maps.put("jobLevelId", employeeTransInfo.getJobLevelId());
		maps.put("jobLevelName", employeeTransInfo.getJobLevelName());
		maps.put("salaryLevelId", employeeTransInfo.getEmployeeInfo().getSalaryLevelId());
		maps.put("salaryLevelOrder", employeeTransInfo.getEmployeeInfo().getSalaryLevelOrder());
		maps.put("salaryTotal", employeeTransInfo.getEmployeeInfo().getSalaryTotal());
		maps.put("structureType", employeeTransInfo.getEmployeeInfo().getStructureType());
		// 添加社保标识
		maps.put("companyId", employeeTransInfo.getSalarySocialSecuritySusbmit().getCompanyId());
		maps.put("companyName", employeeTransInfo.getSalarySocialSecuritySusbmit().getCompanyName());
		// 社保标识
		maps.put("submitId", employeeTransInfo.getSalarySocialSecuritySusbmit().getSubmitId());
		// 社保基数
		maps.put("socialSecurityBase", employeeTransInfo.getSalarySocialSecuritySusbmit().getSocialSecurityBase());
		// 社保缴纳地
		maps.put("submitPlace", employeeTransInfo.getSalarySocialSecuritySusbmit().getSubmitPlace());
		// 社保缴纳类型
		maps.put("socialSecurityId", employeeTransInfo.getSalarySocialSecurity().getSocialSecurityId());
		// 是否异动  1：异动
		maps.put("isChange", 1);
		maps.put("employeeId", employeeTransInfo.getEmployeeId());
		employeeInfoMapper.postUpdateInfo(maps);
	}

	/**
	 * 根据infoId查询需要删除的异动信息
	 * 
	 * @return int
	 */
	public int getPostChangeByInfoId(Map<String, Object> map) {
		List<EmployeeTransactionInfo> lstEmployeeTraInfo = postChangeMappeer.getPostChangeByInfoId(map);
		for(EmployeeTransactionInfo employeeInfo : lstEmployeeTraInfo){
			employeeInfo.getEmployeeInfo().setSalaryTotal(employeeInfo.getTotalSalary());
			updateEmployeeInfo(employeeInfo);
		}
		return postChangeMappeer.deletePostChange(map);
	}
	
	/**
	 * 社保表示信息      (下拉框)
	 * 
	 * @return List<EmployeeTransactionInfo>
	 */
	public List<EmployeeTransactionInfo> getSalarySocialSecuritySubmit(int companyId){
		return postChangeMappeer.getSalarySocialSecuritySubmit(companyId);
	}
	
	/**
	 * 社保类型查询   (下拉框)
	 * 
	 * @return List<EmployeeTransactionInfo>
	 */
	public List<EmployeeTransactionInfo> getSalarySocialSecurity(int companyId){
		return postChangeMappeer.getSalarySocialSecurity(companyId);
	}
	
	/**
	 * 查询职系
	 * 
	 * @return List<CfgJobGrade>
	 */
	public List<CfgJobGrade> findJobGradeInfo(){
		return orgStructureMapper.findJobGrade();
	}
	
	/**
	 * 查询职系
	 * 
	 * @return List<CfgJobLevel>
	 */
	public List<CfgJobLevel> findJobLevelForGrade(String jobGradeId){
		return orgStructureMapper.findJobLevelForGrade(Integer.parseInt(jobGradeId));
	}
	
	/**
	 * 薪酬等级   (下拉框)
	 * 
	 * @return List<CfgSalaryLevel>
	 */
	public List<CfgSalaryLevel> getSalaryLevel(){
		return postChangeMappeer.getSalaryLevel();
	}
	
}
