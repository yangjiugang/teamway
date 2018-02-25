package com.fc.flf.fparty.mapper;

import com.fc.flf.common.domain.UserEduInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserTrainingExperience;
import com.fc.flf.common.domain.UserWorkExperience;

public interface IHoneyInfoMapper {
	
	/**
	 * 根据用户ID得到蜂蜜UserInfo
	 * @param customerId
	 * @return
	 */
	public UserInfo getUserInfo(int customerId);
	
	/**
	 * 根据用户ID的到蜂蜜UserInfoDetail
	 * @param customerId
	 * @return
	 */
	public UserInfoDetail getUserInfoDetail(int customerId);
	
	
	/**
	 * 根据用户id得到蜂蜜UserEduInfo
	 * @param customerId
	 * @return
	 */
	public UserEduInfo getUserEduInfo(int customerId);
	
	
	/**
	 * 得到蜂蜜邮箱
	 * @param customerId
	 * @return
	 */
	public String getEmail(int customerId);
	
	/**
	 * 根据用户id得到蜂蜜UserTrainingExperience
	 * @param customerId
	 * @return
	 */
	public UserTrainingExperience getUserTrainingExperience(int customerId);
	
	/**
	 * 根据用户id得到蜂蜜UserWorkExperience
	 * @return
	 */
	public UserWorkExperience getUserWorkExperience(int customerId);	
	
}
