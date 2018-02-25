package com.fc.brms.external.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserSkills;
import com.fc.brms.common.util.Page;

public interface IUserSkillsService {
	/**
	 * 根据ID查找用户专长信息 列表
	 * @param map
	 * @return
	 */
	public List<UserSkills> getUseSkillsById(int userId,Page page);
}
