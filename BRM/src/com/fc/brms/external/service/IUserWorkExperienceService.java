package com.fc.brms.external.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserWorkExperience;
import com.fc.brms.common.util.Page;

public interface IUserWorkExperienceService {
	
	/**
	 * 根据ID获得经纪人工作经历 列表 
	 * @param map{userId,limit}
	 * @return
	 */
	public List<UserWorkExperience> getUserWorkByUserId(int userId,Page page);
	
}
