package com.fc.brms.common.service;

import java.util.List;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.CfgPost;

public interface IOrgStructureService {
	
	/**
	 * 根据部门查询岗位信息
	 * @param organizationId
	 * @return List<CfgPost>
	 */
	public List<CfgPost> findPostForOrganization(int organizationId);
	
	/**
	 * 获取一级部门
	 * @param companyId
	 * @return
	 */
	public List<CfgOrganization> getOrgLever1ByCompanyId(int companyId);
	
	/**
	 * 获取子部门
	 * @param companyId
	 * @return
	 */
	public List<CfgOrganization> getChildOrg(int companyId, int higherOrganizationId);
	
	/**
	 * 获取公司下的最终子部门（再没有子部门的部门）
	 * @param organizationId
	 * @return
	 */
	public List<CfgOrganization> getFinalChildOrgByCompanyId(int companyId);
	
	/**
	 * 获取部门下的最终子部门（再没有子部门的部门）
	 * @param organizationId
	 * @return
	 */
	public List<CfgOrganization> getFinalChildOrgById(int organizationId);
	
	/**
	 * 查询部门信息
	 * @return List<CfgOrganization>
	 */
	public List<CfgOrganization> findOrganization();
	

	/**
	 * 查询职系
	 * @return List<CfgJobGrade>
	 */
	public List<CfgJobGrade> findJobGrade();
	
	/**
	 * 根据职系查询职级信息
	 * @param jobGradeId
	 * @return List<CfgJobGrade>
	 */
	public List<CfgJobLevel> findJobLevelForGrade(int jobGradeId);
	


	
	/**
	 * 通过id获取岗位信息
	 * @param postId
	 * @return
	 */
	public CfgPost getPostById(int postId);
	
	/**
	 * 通过部门获取岗位信息
	 * @param organizationId
	 * @return
	 */
	public List<CfgPost> getPostByOrgId(int organizationId);
	
	/**
	 * 通过公司获取岗位信息
	 * @param companyId
	 * @return
	 */
	public List<CfgPost> getPostByCompanyId(int companyId);
	
	/**
	 * 通过关键字查询岗位
	 * @param keyword
	 * @return
	 */
	public List<CfgPost> getPostByKeyword(String keyword);
}
