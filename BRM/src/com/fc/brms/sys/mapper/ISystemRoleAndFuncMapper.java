package com.fc.brms.sys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.domain.FcSysRoleFunc;
import com.fc.brms.common.domain.FcSysVisitorRole;

public interface ISystemRoleAndFuncMapper {
	/**
	 * 查询所有角色功能
	 * @return FcSysFunc
	 */
	public List<FcSysFunc> selectFcSysFunc();
	
	/**
	 * 查询公司所有角色信息
	 * @return FcSysRole
	 */
	public List<FcSysRole> selectFcSysRole(@Param("companyId")int companyId,@Param("limit")String limit,@Param("keyWord")String keyWord);
	
	/**
	 * 查询公司所有角色信息数
	 * @return int
	 */
	public int selectFcSysRoleCount(@Param("companyId")int companyId,@Param("keyWord")String keyWord);
	
	/**
	 * 新添加公司角色
	 * @return 
	 */
	public void insertNewRole(FcSysRole fcSysRole);
	
	/**
	 * 修改公司角色roleCode
	 * @return 
	 */
	public void updateCompanyRoleRoleCode(@Param("roleId")int roleId,@Param("roleCode")String roleCode);
	

	/**
	 * 修改公司角色
	 * @return 
	 */
	public void updateCompanyRole(FcSysRole role);

	/**
	 * 删除公司角色
	 * @return 
	 */
	public void deleteFcSysRoles(@Param("roleIds")int[] roleIds);

	/**
	 * 查询公司角色信息及相关功能模块
	 * @return FcSysRole
	 */
	public FcSysRole selectFcSysRoleWithFunc(@Param("roleId")int roleId,@Param("companyId")int companyId);
	
	/**
	 * 查询公司角色信息
	 * @return FcSysRole
	 */
	public List<FcSysRole> selectFcSysRoleByRoleId(@Param("roleIds")int[] roleIds);
	
	/**
	 * 删除角色所有功能
	 * @return 
	 */
	public void deleteFcSysRoleFuncByRoleId(@Param("roleId")int roleId,@Param("companyId")int companyId);
	
	/**
	 * 增加角色功能模块
	 * @return 
	 */
	public void insertFcSysRoleFunc(@Param("fcSysRoleFunc")List<FcSysRoleFunc> fcSysRoleFunc);
	
	/**
	 * 查询公司所有角色名
	 * @return List
	 */
	public List<FcSysRole> selectFcSysRoleName(int companyId);
	
	/**
	 * 查询公司员工所拥有角色
	 * @return List
	 */
	public List<FcSysVisitorRole> selectFcSysVisitorRole(@Param("employeeId")int employeeId,@Param("companyId")int companyId);

	/**
	 * 删除公司员工所拥有角色
	 * @return 
	 */
	public void deleteCompanyEmpRoleByEmpId(@Param("companyId") int companyId,@Param("employeeIdes")int [] employeeId);

	/**
	 * 增加公司员工所拥有角色
	 * @return 
	 */
	public void insertFcSysVisitorRole(@Param("fcSysVisitorRoles")List<FcSysVisitorRole> fcSysVisitorRoles);

	/**
	 * 删除公司员工部分角色
	 * @return 
	 */
	public void deleteCompanyEmpRoleByRoleId(@Param("companyId")int companyId, @Param("roleIds") int[] roleIds);
}
