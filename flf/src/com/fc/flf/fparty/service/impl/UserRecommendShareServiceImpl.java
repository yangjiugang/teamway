package com.fc.flf.fparty.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserRecommendShare;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.mapper.IUserRecommendShareMapper;
import com.fc.flf.fparty.service.IUserRecommendShareService;

@Service
public class UserRecommendShareServiceImpl implements IUserRecommendShareService {
	@Resource
	private IUserRecommendShareMapper userRecommendShareMapper;

	@Transactional(readOnly = true)
	public List<UserRecommendShare> findRecommendByUserId(int userId,String limit) {
		return userRecommendShareMapper.selectRecommendByUserId(userId, limit);
	}

	@Transactional(readOnly = true)
	public int findCountRecommendByUserId(int userId) {
		return userRecommendShareMapper.selectCountRecommendByUserId(userId);
	}

	@Transactional(readOnly = true)
	public UserRecommendShare findRecommendById(int recommendId) {
		return userRecommendShareMapper.selectRecommendById(recommendId);
	}

	@Transactional
	public void delRecommendShareById(int recommendId) {
		userRecommendShareMapper.deleteRecomById(recommendId);
	}
	
	/**
	 * 根据经纪人的id号 查找经纪人的所有推荐分享
	 * @param map
	 * @return
	 */
	public List<UserRecommendShare> findAllRecommendByUserId(Page page,UserInfo userInfo){
		Map<String, Object> map=new HashMap<String, Object>();
		int recommendCount=this.findAllRecommendByUserIdCount(userInfo);
		page.setRowCount(recommendCount);
		map.put("userId", userInfo.getUserId());
		map.put("limit", page.getLimit());
        return userRecommendShareMapper.findAllRecommendByUserId(map);
	}
	
	/**
	 * 根据经纪人的id号 查找经纪人的所有推荐分享总条数
	 * @param userId
	 * @return
	 */
	public int findAllRecommendByUserIdCount(UserInfo userInfo){
		return userRecommendShareMapper.findAllRecommendByUserIdCount(userInfo.getUserId());
	}

}
