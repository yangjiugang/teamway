package com.fc.flf.eagent.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.UserFriends;

public interface IUserFriendsMapper {
	/**
	 * Code By Zhenglh
	 * 根据userId查询自己的好友-分页
	 * @param map-param: int userID,int start,int end,int sex,String city
	 * @return UserFriends List
	 */
	public List<UserFriends> selectFriendsByUserIdToPage(Map<String, Object> map);
	
	/**
	 * Code By Zhenglh
	 * 根据friendId查询关注自己的好友-分页
	 * @param map-param: int userID,int start,int end,int sex,String city
	 * @return UserFriends List
	 */
	public List<UserFriends> selectFriendsByFriendIdToPage(Map<String, Object> map);
	
	/**
	 * Code By Zhenglh
	 * 根据id查询所有好友(关注,好友关注自己)
	 * @param map-param: int userID,int start,int end,int sex,String city
	 * @return UserFriends List
	 */
	public List<UserFriends> selectFriendsByUserIdBeforeSum(Map<String, Object> map);
	
	/**
	 * Code By Zhenglh
	 * 条件查询好友list
	 * @param map
	 * @return UserFriends List
	 */
	public List<UserFriends> findUserFriends(Map<String, Object> map);
	
	public int selectFriendsCountByUserId(Map<String, Object> map);	//自己的好友总条数
	public int selectFriendsCountByFriendId(Map<String, Object> map);	//关注自己的好友总条数
	public int selectFriendsCountByUserIdBeforeSum(Map<String, Object> map);	//全部好友总条数
	public int findUserFriendsCount(Map<String, Object> map); //条件查询总记录
}
