package com.fc.flf.fparty.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.UserRecommendShare;


public interface IUserRecommendShareMapper {
	public List<UserRecommendShare> selectRecommendByUserId(@Param("userId") int userId,@Param("limit") String limit );
	public int selectCountRecommendByUserId(int userId);
	public UserRecommendShare selectRecommendById(int recommendId);
	public void deleteRecomById(int recommendId);
	
	/**
	 * 根据经纪人的id号 查找经纪人的所有推荐分享
	 * @param map
	 * @return
	 */
	public List<UserRecommendShare> findAllRecommendByUserId(Map<String, Object> map);
	
	/**
	 * 根据经纪人的id号 查找经纪人的所有推荐分享总条数
	 * @param userId
	 * @return
	 */
	public int findAllRecommendByUserIdCount(int userId);
   
}
