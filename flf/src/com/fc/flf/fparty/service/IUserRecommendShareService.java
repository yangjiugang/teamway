package com.fc.flf.fparty.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserRecommendShare;
import com.fc.flf.common.util.Page;

public interface IUserRecommendShareService {
	/**
	 * 根据用户ID得到推荐信息
	 * @param userId
	 * @param limit
	 * @return List
	 */
	public List<UserRecommendShare> findRecommendByUserId(int userId,String limit );
	
	/**
	 * 根据用户ID得到推荐信息数
	 * @param userId
	 * @return int
	 */
	public int findCountRecommendByUserId(int userId);

	/**
	 * 根据recommendId查找推荐消息
	 * @param recommendId
	 * @return UserRecommendShare
	 */
	public UserRecommendShare findRecommendById(int recommendId);

	/**
	 * 根据recommendId删除推荐消息
	 * @param recommendId
	 * @return 
	 */
	public void delRecommendShareById(int recommendId);
	
	/**
	 * 根据经纪人的id号 查找经纪人的所有推荐分享
	 * @param map
	 * @return
	 */
	public List<UserRecommendShare> findAllRecommendByUserId(Page page,UserInfo userInfo);
	
	/**
	 * 根据经纪人的id号 查找经纪人的所有推荐分享总条数
	 * @param userId
	 * @return
	 */
	public int findAllRecommendByUserIdCount(UserInfo userInfo);
}
