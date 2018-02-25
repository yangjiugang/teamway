package com.fc.flf.eagent.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.StatUserInfo;
import com.fc.flf.common.domain.UserDynamic;
import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.common.domain.UserRecommendShare;

public interface IStatUserInfoMapper {
	public StatUserInfo selectStatUserInfo(int userId);
	
	/**
	 * 我的推荐分享
	 * @param map int userId, String limit
	 * @return
	 */
	public List<UserRecommendShare> selectStatUserInfoByUserId(Map<String, Object> map);
	
	/**
	 * 好友的推荐分享
	 * @param map int userId, String limit
	 * @return
	 */
	public List<UserRecommendShare> selectStatUserInfoByFriendId(Map<String, Object> map);
	
	/**
	 * 我的推荐分享 总记录数
	 * @param map int userId
	 * @return
	 */
	public int selectStatUserInfoCountByUserId(int userId);
	
	/**
	 * 好友的推荐分享 总记录数
	 * @param map int userId
	 * @return
	 */
	public int selectStatUserInfoCountByFriendId(int userId);
	
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
	
	/**
	 * 我的留言
	 * @param userId
	 * @return
	 */
	public List<UserMsg> getMySendMsg(int userId);
	
	/**
	 * 好友的留言
	 * @param userId
	 * @return
	 */
	public List<UserMsg> getMyFriendsSendMsg(int userId);
	
}
