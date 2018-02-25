package com.fc.brms.external.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.mapper.IUserResumeMapper;
import com.fc.brms.external.service.IUserResumeService;

@Service
public class UserResumeServiceImpl implements IUserResumeService {

	@Resource
	private IUserResumeMapper iUserResumeMapper;
	
	@Transactional(readOnly=true)
	public List<UserResume> getUserResumeList(Page page,Map<String, Object> map) {
		// TODO Auto-generated method stub
		int count = iUserResumeMapper.getUserResumeListCount(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		List<UserResume> userResumes = iUserResumeMapper.getUserResumeList(map);
		return userResumes;
	}

	@Transactional(readOnly=true)
	public UserResume getUserResumeById(int userId) {
		UserResume resume = iUserResumeMapper.getUserResumeById(userId);
		return resume;
	}

}
