package com.fc.flf.fparty.service;

import com.fc.flf.common.domain.UserEduInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserTrainingExperience;
import com.fc.flf.common.domain.UserWorkExperience;

public interface IHoneyInfoService {
	
	/**
	 * 根据用户ID得到蜂蜜UserInfo
	 * @param customerId
	 * @return
	 */
	public UserInfo getUserInfo();
	
	/**
	 * 根据用户ID的到蜂蜜UserInfoDetail
	 * @param customerId
	 * @return
	 */
	public UserInfoDetail getUserInfoDetail();
	
	
	/**
	 * 根据用户id得到蜂蜜UserEduInfo
	 * @param customerId
	 * @return
	 */
	public UserEduInfo getUserEduInfo();
	
	
	/**
	 * 得到蜂蜜邮箱
	 * @param customerId
	 * @return
	 */
	public String getEmail();
	
	/**
	 * 根据用户id得到蜂蜜UserTrainingExperience
	 * @param customerId
	 * @return
	 */
	public UserTrainingExperience getUserTrainingExperience();
	
	/**
	 * 根据用户id得到蜂蜜UserWorkExperience
	 * @return
	 */
	public UserWorkExperience getUserWorkExperience();
	
}
