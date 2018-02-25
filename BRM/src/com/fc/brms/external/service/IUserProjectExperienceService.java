package com.fc.brms.external.service;

import java.util.List;

import com.fc.brms.common.domain.UserProjectExperience;
import com.fc.brms.common.util.Page;

public interface IUserProjectExperienceService {
	/**
	 * 根据ID查看用户项目经验列表
	 * @param map
	 * @return
	 */
	public List<UserProjectExperience> getUserProjectById(int userId, Page page);
}
