package com.fc.brms.common.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.CfgCompany;
import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.CfgPost;

public interface IOrgStructureMapper {
	
	/**
	 * 查询公司简单信息 
	 * @return CfgCompany
	 */
	public CfgCompany selectCompanyInfoById(int companyId);
	
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
	 * 查询部门信息
	 * @return List<CfgOrganization>
	 */
	public List<CfgOrganization> findOrganization();

	/**
	 * 根据部门查询岗位信息
	 * @param organizationId
	 * @return List<CfgPost>
	 */
	public List<CfgPost> findPostForOrganization(int organizationId);
	
	/**
	 * 通过id获取岗位信息
	 * @param organizationId
	 * @return
	 */
	public CfgPost getPostById(@Param("postId")int postId);
	
	/**
	 * 通过部门获取岗位信息
	 * @param organizationId
	 * @return
	 */
	public List<CfgPost> getPostByOrgId(@Param("organizationId")int organizationId);
	
	/**
	 * 通过公司获取岗位信息
	 * @param organizationId
	 * @return
	 */
	public List<CfgPost> getPostByCompanyId(@Param("companyId")int companyId);
	
	/**
	 * 通过关键字查询岗位
	 * @param keyword
	 * @return
	 */
	public List<CfgPost> getPostByKeyword(@Param("keyword")String keyword);
	
	/**
	 * 获取第一级部门
	 * @param companyId
	 * @return
	 */
	public List<CfgOrganization> getOrgLever1ByCompanyId(@Param("companyId") int companyId);
	
	/**
	 * 获取子部门
	 * @param companyId
	 * @return
	 */
	public List<CfgOrganization> getChildOrg(Map<String, Object> param);
	
	/**
	 * 获取公司下的最终子部门（再没有子部门的部门）
	 * @param organizationId
	 * @return
	 */
	public List<CfgOrganization> getFinalChildOrgByCompanyId(@Param("companyId") int companyId);
	
	/**
	 * 获取部门下的最终子部门（再没有子部门的部门）
	 * @param organizationId
	 * @return
	 */
	public List<CfgOrganization> getFinalChildOrgById(@Param("organizationId") int organizationId);

	/**
	 * 查询公司部门
	 * @param companyId
	 * @return List<CfgOrganization>
	 */
	public List<CfgOrganization> selectOrganizationByCompanyId(@Param("companyId")int companyId);
	
	/**
	 * 查看公司邮箱信息
	 * @param companyId
	 * @return List<CfgOrganization>
	 */
	public CfgCompany selectCompanyEmailById(int companyId);
	
}
