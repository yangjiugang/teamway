package com.fc.brms.external.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.util.Page;

public interface IUserResumeService {
	
	/**
	 * 查询外部外部经纪人 列表
	 * @return
	 */
	public List<UserResume> getUserResumeList(Page page,Map<String, Object> map);

	/**
	 * 根据ID查询经纪人基础数据 
	 * @param userId
	 * @return
	 */
	public UserResume getUserResumeById(int userId);
}
