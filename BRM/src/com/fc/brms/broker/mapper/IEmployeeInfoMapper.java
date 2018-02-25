package com.fc.brms.broker.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.EmployeeInfo;

/**
 * 员工信息管理 mapper
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-27
 */
public interface IEmployeeInfoMapper {
	
	/**
	 * 异动后更新员工信息
	 * 
	 * @return 更新成功
	 */
	int postUpdateInfo(Map<String, Object> map);
	
	/**
	 * 查询约谈记录总记录数
	 * 
	 * @return 总记录数
	 */
	int getEmployeeCommInfoCount(Map<String, Object> map);
	
	/**
	 * 查询约谈记录列表
	 * 
	 * @return 信息集合
	 */
	List<EmployeeInfo> getEmployeeCommInfoList(Map<String, Object> map);
	
	/**
	 * 查询约谈提醒总记录数
	 * 
	 * @return 总记录数
	 */
	int queryCommunicationManageCount(Map<String, Object> map);
	
	/**
	 * 删除约谈提醒记录
	 * 
	 * @return 
	 */
	int deleteCommunicationRemind(@Param("msgId") int msgId);

	/**
	 * 查询约谈提醒记录列表
	 * 
	 * @return 沟通人员信息集合
	 */
	List<EmployeeInfo> queryCommunicationManageList(Map<String, Object> map);
	
	
	public EmployeeInfo getUserInfoById(int userId);
	
	/**
	 * 关键字搜索
	 * @param param
	 * @return
	 */
	int getEmployeeInfoCountByKeyword(Map<String, Object> param);
	List<EmployeeInfo> getEmployeeInfoByKeyword(Map<String, Object> param);
	
	/**
	 * 通过员工编号查询员工
	 * @param param
	 * @return
	 */
	EmployeeInfo getEmployeeInfoById(@Param("employeeId")int employeeId);
	
	/**
	 * 通过公司部门职位查询员工
	 * @param param
	 * @return
	 */
	List<EmployeeInfo> getEmployeeInfoByPostId(@Param("postId")int postId);
	
	/**
	 * 通过部门查询员工
	 * @param param
	 * @return
	 */
	List<EmployeeInfo> getEmployeeInfoByOrgId(@Param("organizationId")int organizationId);
	
	/**
	 * 通过公司查询员工
	 * @param param
	 * @return
	 */
	List<EmployeeInfo> getEmployeeInfoByCompanyId(@Param("companyId")int companyId);
	
	/**
	 * 查询employee信息及相应角色
	 * @param param
	 * @return
	 */
	public List<EmployeeInfo> selectEmployeeInfoWithRoleInfo(@Param("companyId")int companyId,
			@Param("limit")String limit,@Param("orgId")int orgId,@Param("keyWord")String keyWord);
	
	/**
	 * 查询employee信息及相应角色
	 * @param param
	 * @return
	 */
	public int selectEmployeeInfoWithRoleInfoCount(@Param("companyId")int companyId,
			@Param("orgId")int orgId,@Param("keyWord")String keyWord);
	
	/**
	 * 查询employee姓名
	 * @param param
	 * @return
	 */
	public List<EmployeeInfo> selectEmployeeName(@Param("companyId")int companyId,
			@Param("employeeIdes")int [] employeeIdes);
	
	/**
	 * 查询停用经纪人列表
	 * @param companyId
	 * @return
	 */
	public List<EmployeeInfo> selectDimissionEmployeeList(@Param("companyId")int companyId,@Param("limit")String limit,@Param("black")int [] black);
	
	/**
	 * 查询停用经纪人数
	 * @param companyId
	 * @return
	 */
	public int selectDimissionEmployeeCount(@Param("companyId")int companyId,@Param("black")int [] black);
	
	/**
	 * 根据条件查询停用经纪人 列表(非黑名单成员)
	 * @return List
	 */
	public List<EmployeeInfo> selectDimissionEmployeeWithFactor(@Param("limit")String limit, @Param("startDate")Date startDate,
																	@Param("endDate")Date endDate,@Param("education")int education,
																	@Param("keyWord")String keyWord,@Param("companyId")int companyId,
																	@Param("talkNum")int talkNum,@Param("black")int[] black);
	
	/**
	 * 根据条件查查询停用经纪人数(非黑名单成员)
	 * @return int
	 */
	public int selectDimissionEmployeeCountWithFactor(@Param("startDate")Date startDate, @Param("endDate")Date endDate,
														@Param("education")int education,@Param("keyWord")String keyWord,
														@Param("companyId")int companyId,@Param("talkNum")int talkNum,
														@Param("black")int[] black);
	
	
	/**
	 * 根据employeeId查询经纪人邮箱、姓名等
	 * @return employeeId
	 */
	public EmployeeInfo selectEmployeeById(int employeeId);
	
	/**
	 * 多条件查询内部经纪人:  涉及页面 内部经纪人 首页初始化数据
	 * @param map
	 * @return
	 */
	public List<EmployeeInfo> getUserInfoByIdAndNotTurnover(Map<String, Object> map);
	
	
	/**
	 * 多条件查询内部经纪人 总记录数:  涉及页面 内部经纪人 首页初始化数据
	 * @param map
	 * @return
	 */
	public int getUserInfoCountByIdAndNotTurnover(Map<String, Object> map);
}
