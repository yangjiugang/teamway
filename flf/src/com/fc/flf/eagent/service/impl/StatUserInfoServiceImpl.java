package com.fc.flf.eagent.service.impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.StatUserInfo;
import com.fc.flf.common.domain.UserDynamic;
import com.fc.flf.common.domain.UserRecommendShare;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.mapper.IStatUserInfoMapper;
import com.fc.flf.eagent.service.IStatUserInfoService;

@Service
public class StatUserInfoServiceImpl implements IStatUserInfoService {

	@Resource
	private IStatUserInfoMapper statUserInfoMapper;
	
	@Transactional(readOnly=true)
	public StatUserInfo selectStatUserInfo(int userId) {
		StatUserInfo statUserInfo = statUserInfoMapper.selectStatUserInfo(userId);
		return statUserInfo;
	}

	@Transactional(readOnly=true)
	public List<UserRecommendShare> selectStatUserInfoByUserId(Page page,int userId) {
		int count = statUserInfoMapper.selectStatUserInfoCountByUserId(userId);
		Map<String, Object> map = new HashMap<String, Object>();
		page.setRowCount(count);
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<UserRecommendShare> userRecommendShares = statUserInfoMapper.selectStatUserInfoByUserId(map);
		return userRecommendShares;
	}

	@Transactional(readOnly=true)
	public List<UserRecommendShare> selectStatUserInfoByFriendId(Page page,int userId) {
		int count = statUserInfoMapper.selectStatUserInfoCountByFriendId(userId);
		Map<String, Object> map = new HashMap<String, Object>();
		page.setRowCount(count);
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<UserRecommendShare> userRecommendShares = statUserInfoMapper.selectStatUserInfoByFriendId(map);
		return userRecommendShares;
	}

	@Transactional(readOnly=true)
	public List<UserDynamic> getUserDynamic(int userId) {
		List<UserDynamic> userDynamics = statUserInfoMapper.getUserDynamic(userId);
		Collections.shuffle(userDynamics);		//对数组混乱排序
		return userDynamics;
	}

	@Transactional(readOnly=true)
	public List<UserDynamic> getFriendDynamic(int userId) {
		List<UserDynamic> userDynamics = statUserInfoMapper.getFriendDynamic(userId);
		Collections.shuffle(userDynamics);		//对数组混乱排序
		return userDynamics;
	}

	@Override
	public int delSaleHouseById(int userId) {
		// TODO Auto-generated method stub
		return statUserInfoMapper.delSaleHouseById(userId);
	}

	@Override
	public int delCollectHouseById(int userId) {
		// TODO Auto-generated method stub
		return statUserInfoMapper.delCollectHouseById(userId);
	}

	@Override
	public int delCollectHouseGroupById(int userId) {
		// TODO Auto-generated method stub
		return statUserInfoMapper.delCollectHouseGroupById(userId);
	}

	@Override
	public int delContactRecordById(int userId) {
		// TODO Auto-generated method stub
		return statUserInfoMapper.delContactRecordById(userId);
	}

	@Override
	public int delRecommendShareById(int userId) {
		// TODO Auto-generated method stub
		return statUserInfoMapper.delRecommendShareById(userId);
	}

}
