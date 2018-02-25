package com.fc.brms.external.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.UserSkills;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.mapper.IUserSkillsMapper;
import com.fc.brms.external.service.IUserSkillsService;

@Service
public class UserSkillsServiceImpl implements IUserSkillsService {

	@Resource
	private IUserSkillsMapper userSkillsMapper;
	
	@Transactional(readOnly=true)
	public List<UserSkills> getUseSkillsById(int userId,Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		int count = userSkillsMapper.getUseSkillsCountById(userId);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		
		List<UserSkills> skills = userSkillsMapper.getUseSkillsById(map);
		return skills;
	}

}
