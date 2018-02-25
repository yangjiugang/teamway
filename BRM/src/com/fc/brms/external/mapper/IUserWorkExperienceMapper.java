package com.fc.brms.external.mapper;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserWorkExperience;

public interface IUserWorkExperienceMapper {
	
	/**
	 * 根据ID获得经纪人工作经历 列表 
	 * @param map{userId,limit}
	 * @return
	 */
	public List<UserWorkExperience> getUserWorkByUserId(Map<String, Object> map);
	
	/**
	 * 根据ID获得经纪人工作经历 列表 总记录数
	 * @param map{userId,limit}
	 * @return
	 */
	public int getUserWorkCountByUserId(int userId);
}
