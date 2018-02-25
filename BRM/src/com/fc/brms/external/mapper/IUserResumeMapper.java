package com.fc.brms.external.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.UserResume;

public interface IUserResumeMapper {

	/**
	 * 查询外部外部经纪人 列表
	 * @return
	 */
	public List<UserResume> getUserResumeList(Map<String, Object> map);
	
	/**
	 * 查询外部外部经纪人 总记录行数
	 * @return
	 */
	public int getUserResumeListCount(Map<String, Object> map);
		
	/**
	 * 根据ID查询经纪人基础数据 
	 * @param userId
	 * @return
	 */
	public UserResume getUserResumeById(int userId);

	/**
	 * 根据条件查查询停用经纪人数(黑名单成员)
	 * @return int
	 */
	public int selectBlackDimissionUserResumeCount(int companyId);

	/**
	 * 根据条件查查询停用经纪人(黑名单成员)
	 * @return list
	 */
	public List<UserResume> selectBlackDimissionUserResumeList(@Param("limit")String limit,@Param("companyId")int companyId);
	
}
