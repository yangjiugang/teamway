package com.fc.brms.external.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.UserEduInfo;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.mapper.IUserEduInfoMapper;
import com.fc.brms.external.service.IUserEduInfoService;

@Service
public class UserEduInfoServiceImpl implements IUserEduInfoService {

	@Resource
	private IUserEduInfoMapper eduInfoMapper;
	
	@Transactional(readOnly=true)
	public List<UserEduInfo> getUserEduByIdBeforeType(int userId,int type,Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("type", type);
		
		int count = eduInfoMapper.getUserEduCountByIdBeforeType(map);
		
		page.setRecords(count);
		map.put("limit", page.getLimit());
		
		List<UserEduInfo> eduInfos = eduInfoMapper.getUserEduByIdBeforeType(map);
		return eduInfos;
	}

}
