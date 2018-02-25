package com.fc.brms.external.mapper;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserSkills;

public interface IUserSkillsMapper {

	/**
	 * 根据ID查找用户专长信息 列表
	 * @param map
	 * @return
	 */
	public List<UserSkills> getUseSkillsById(Map<String, Object> map);
	
	/**
	 * 根据ID查找用户专长信息 列表 总记录数
	 * @param userId
	 * @return
	 */
	public int getUseSkillsCountById(int userId);
}
