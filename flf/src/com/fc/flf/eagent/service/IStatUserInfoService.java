package com.fc.flf.eagent.service;

import java.util.List;

import com.fc.flf.common.domain.StatUserInfo;
import com.fc.flf.common.domain.UserDynamic;
import com.fc.flf.common.domain.UserRecommendShare;
import com.fc.flf.common.util.Page;

public interface IStatUserInfoService {
	public StatUserInfo selectStatUserInfo(int userId);
	
	/**
	 * 我的推荐分享
	 * @param map{int userId, String limit}
	 * @return
	 */
	public List<UserRecommendShare> selectStatUserInfoByUserId(Page page,int userId);
	
	/**
	 * 好友的推荐分享
	 * @param map{int userId, String limit}
	 * @return
	 */
	public List<UserRecommendShare> selectStatUserInfoByFriendId(Page page,int userId);
	
	/**
	 * 我的动态
	 * @param userId
	 * @return
	 */
	public List<UserDynamic> getUserDynamic(int userId);
	
	/**
	 * 好友的动态
	 * @param userId
	 * @return
	 */
	public List<UserDynamic> getFriendDynamic(int userId);
	
	/**
	 * 删除分享中的认售/学习楼盘
	 * @param userId
	 * @return
	 */
	public int delSaleHouseById(int userId);
	
	/**
	 * 删除分享中的收藏房源
	 * @param userId
	 * @return
	 */
	public int delCollectHouseById(int userId);
	
	/**
	 * 删除分享中的收藏房团
	 * @param userId
	 * @return
	 */
	public int delCollectHouseGroupById(int userId);
	
	/**
	 * 客户约会记录 删除
	 * @param userId
	 * @return
	 */
	public int delContactRecordById(int userId);
	
	/**
	 * 删除分享中的
	 * @param userId
	 * @return
	 */
	public int delRecommendShareById(int userId);
}
