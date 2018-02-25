package com.fc.brms.external.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.UserProjectExperience;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.mapper.IUserProjectExperienceMapper;
import com.fc.brms.external.service.IUserProjectExperienceService;

@Service
public class UserProjectExperienceServiceImpl implements
		IUserProjectExperienceService {
	
	@Resource
	private IUserProjectExperienceMapper experienceMapper;
	
	@Transactional(readOnly=true)
	public List<UserProjectExperience> getUserProjectById(int userId, Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		int count = experienceMapper.getUserProjectCountById(userId);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		
		List<UserProjectExperience> projectExperiences = experienceMapper.getUserProjectById(map);
		return projectExperiences;
	}

}
