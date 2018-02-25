package com.fc.flf.eagent.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.UserDaily;


public interface IUserDailyMapper {

	/**
	 * 保存日志
	 * @param daily
	 */
	public void saveDaily(UserDaily daily);
	/**
	 * 查询User的日志
	 * @param userId
	 * @param limitValue
	 * @return
	 */
	public List<UserDaily> findDailyByUserId(@Param("userId")int userId,@Param("limitValue")String limitValue);
	
	public int getCount(int userId);
	
	public List<UserDaily> findFriendDaily(@Param("userId")int userId,@Param("limitValue")String limitValue);
	
	public int getFriendDailyCount(int userId);
	/**
	 * 房乐会客户查询蜂蜜日志
	 * @param cusId
	 * @param limitValue
	 * @return
	 */
	public List<UserDaily> findDailyByCusId(@Param("cusId")int cusId,@Param("limitValue")String limitValue);
	/**
	 * 房乐会客户查询蜂蜜日志记录
	 */
	public int findDailyCountByCusId(int cusId);
	/**
	 * 删除日志
	 * @param id
	 */
	public void delDaily(int id);
	/**
	 * 更新日志
	 * @param id
	 */
	public void updateDaily(UserDaily daily);
}
