package com.fc.brms.external.mapper;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserProjectExperience;

public interface IUserProjectExperienceMapper {

	/**
	 * 根据ID查看用户项目经验列表
	 * @param map
	 * @return
	 */
	public List<UserProjectExperience> getUserProjectById(Map<String, Object> map);
	
	/**
	 * 根据ID查看用户项目经验列表 总记录数
	 * @param map
	 * @return
	 */
	public int getUserProjectCountById(int userId);
}
