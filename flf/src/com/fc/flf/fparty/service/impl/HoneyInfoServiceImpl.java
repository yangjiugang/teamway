package com.fc.flf.fparty.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserEduInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserTrainingExperience;
import com.fc.flf.common.domain.UserWorkExperience;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.fparty.mapper.IHoneyInfoMapper;
import com.fc.flf.fparty.service.IHoneyInfoService;

@Service
public class HoneyInfoServiceImpl implements IHoneyInfoService{
	
	@Resource
	private IHoneyInfoMapper him;
	/**
	 * 根据用户ID得到蜂蜜UserInfo
	 * @param customerId
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserInfo getUserInfo() {
		int customerId;
		try {
			customerId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			customerId = 0;
		}
		return him.getUserInfo(customerId);
	}	

	/**
	 * 根据用户ID得到蜂蜜UserInfoDetail
	 * @param customerId
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserInfoDetail getUserInfoDetail() {
		int customerId;
		try {
			customerId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			customerId = 0;
		}
		return him.getUserInfoDetail(customerId);
	}

	/**
	 * 根据用户id得到蜂蜜UserEduInfo
	 * @param customerId
	 * @return
	 */
	public UserEduInfo getUserEduInfo() {
		int customerId;
		try {
			customerId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			customerId = 0;
		}
		return him.getUserEduInfo(customerId);
	}

	/**
	 * 得到蜂蜜邮箱
	 * @param customerId
	 * @return
	 */
	public String getEmail() {
		int customerId;
		try {
			customerId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			customerId = 0;
		}
		return him.getEmail(customerId);
	}
	
	/**
	 * 根据用户id得到蜂蜜UserTrainingExperience
	 * @param customerId
	 * @return
	 */
	public UserTrainingExperience getUserTrainingExperience(){	
		int customerId;
		try {
			customerId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			customerId = 0;
		}
		return him.getUserTrainingExperience(customerId);
	}
	
	/**
	 * 根据用户id得到蜂蜜UserWorkExperience
	 * @return
	 */
	public UserWorkExperience getUserWorkExperience(){
		int customerId;
		try {
			customerId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			customerId = 0;
		}
		return him.getUserWorkExperience(customerId);
	}
}
