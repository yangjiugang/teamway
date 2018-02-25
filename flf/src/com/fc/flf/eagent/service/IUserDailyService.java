package com.fc.flf.eagent.service;

import java.util.List;

import com.fc.flf.common.domain.UserDaily;
import com.fc.flf.common.util.Page;

public interface IUserDailyService {

	/**
	 * 保存日志
	 * @param daily
	 * @throws Exception
	 */
	public void saveDaily(UserDaily daily) throws Exception;
	/**
	 * 查询用户日志
	 * @return
	 */
	public List<UserDaily> findDailyByUserId(Page page)throws Exception;
	
	public int getCount()throws Exception;
	/**
	 * 查询好友日志
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<UserDaily> findFriendDaily(Page page)throws Exception;
	/**
	 * 查找好友日志记录
	 * @return
	 * @throws Exception
	 */
	public int getFriendDailyCount()throws Exception;
	/**
	 * 房乐会客户查询蜂蜜日志
	 */
	public List<UserDaily> findDailyByCusId(Page page)throws Exception;
	/**
	 * 房乐会客户查询蜂蜜日志记录
	 */
	public int findDailyCountByCusId()throws Exception;
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
