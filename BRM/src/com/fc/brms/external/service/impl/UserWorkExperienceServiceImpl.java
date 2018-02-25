package com.fc.brms.external.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.UserWorkExperience;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.mapper.IUserWorkExperienceMapper;
import com.fc.brms.external.service.IUserWorkExperienceService;

@Service
public class UserWorkExperienceServiceImpl implements
		IUserWorkExperienceService {

	@Resource
	private IUserWorkExperienceMapper experienceMapper;
	
	@Transactional(readOnly=true)
	public List<UserWorkExperience> getUserWorkByUserId(int userId,Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		int count = experienceMapper.getUserWorkCountByUserId(userId);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		
		List<UserWorkExperience> workExperiences = experienceMapper.getUserWorkByUserId(map);
		return workExperiences;
	}

}
