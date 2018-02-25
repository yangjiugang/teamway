package com.fc.flf.eagent.service;

import java.util.List;

import com.fc.flf.common.domain.UserEduInfo;
import com.fc.flf.common.domain.UserFamilyInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserTrainingExperience;
import com.fc.flf.common.domain.UserWorkExperience;

public interface IMyInformationService {
	
	/**
	 * 查看数据库是否有UserInfo记录
	 * @return
	 */
	public int countUserInfoById();	
	
	/**
	 * 查看数据库是否有UserInfoDetail记录
	 * @param id
	 * @return
	 */
	public int countUserInfoDetailById();
	
	/**
	 * 查看数据库是否有UserEduInfo记录
	 * @param id
	 * @return
	 */
	public int countUserEduInfoById();
	
	/**
	 * 查看数据库是否有UserTrainingExperience记录
	 * @param id
	 * @return
	 */
	public int countUserTrainingExperience();	
	
	/**
	 * 查看数据库是否有UserWorkExperience记录
	 * @param id
	 * @return
	 */
	public int countUserWorkExperience();
	
	/**
	 * 查看数据库是否有UserFamilyInfo记录
	 * @param userId
	 * @param id
	 * @return
	 */
	public int countUserFamilyInfo(UserFamilyInfo userFamilyInfo);
	
	/**
	 * 新增一条UserInfo记录
	 * @return
	 */
	public void insertUserInfo(UserInfo userInfo);
	
	/**
	 * 新增一条userInfoDetail 记录
	 * @param userInfoDetail
	 */
	public void insertUserInfoDetail(UserInfoDetail userInfoDetail);
	
	/**
	 * 新增一条UserEduInfo记录
	 * @param userEduInfo
	 */
	public void insertUserEduInfo(UserEduInfo userEduInfo);
	
	/**
	 * 新增一条UserTrainingExperience记录
	 * @param userTrainingExperience
	 */
	public void insertUserTrainingExperience(UserTrainingExperience userTrainingExperience);
	
	/**
	 * 新增一条UserWorkExperience记录
	 * @param userWorkExperience
	 */
	public void insertUserWorkExperience(UserWorkExperience userWorkExperience);
	
	/**
	 * 根据登陆id查找UserInfo
	 * @param id
	 * @return
	 */
	public UserInfo getUserInfo();
	
	
	/**
	 * 根据登陆id查找UserInfoDetail
	 * @param id
	 * @return
	 */
	public UserInfoDetail getUserInfoDetail();
	
	/**
	 * 根据登陆id查找UserEduInfo
	 * @param customerId
	 * @return
	 */
	public UserEduInfo getUserEduInfo();
	
	/**
	 * 根据登陆id得到邮箱
	 * @param customerId
	 * @return
	 */
	public String getEmail();
	
	/**
	 * 根据登陆id得到培训经历
	 * @return
	 */
	public UserTrainingExperience getUserTrainingExperience();
	
	/**
	 * 根据登陆id得到工作经历
	 * @param id
	 * @return
	 */
	public UserWorkExperience getUserWorkExperience();
	
	/**
	 * 根据登陆id的到家庭信息
	 * @param id
	 * @return
	 */
	public List<UserFamilyInfo> getUserFamilyInfo();
	
	/**
	 * 基本资料 userInfoDetail资料
	 * @param userInfoDetail
	 */
	public void updateUserInfoPartOneUserInfoDetail(UserInfoDetail userInfoDetail);
	
	/**
	 * 基本资料 userInfo资料
	 * @param userInfo
	 */
	public void updateUserInfoPartOneUserInfo(UserInfo userInfo);
	
	/**
	 * 证件及照片 userInfoDetail资料
	 * @param userInfoDetail
	 */
	public void updateUserInfoPartTwoUserInfoDetail(UserInfoDetail userInfoDetail);
	
	/**
	 * 联系方式 userInfoDetail资料
	 * @param userInfoDetail
	 */
	public void updateUserInfoPartThreeUserInfoDetail(UserInfoDetail userInfoDetail);
	
	/**
	 * 联系方式 userInfoDetail资料
	 */
	public void updateUserInfoPartThreeUserInfo(UserInfo userInfo);
	
	/**
	 * 教育 UserEduInfo资料
	 * @param userEduInfo
	 */
	public void updateUserInfoPartFourUserEduInfo(UserEduInfo userEduInfo);
	
	/**
	 * 培训经历 UserTrainingExperience 资料
	 * @param userTrainingExperience
	 */
	public void updateUserInfoPartFiveUserTrainingExperience(UserTrainingExperience userTrainingExperience);
	
	/**
	 * 工作经历 UserWorkExperience 资料
	 * @param UserWorkExperience
	 */
	public void updateUserInfoPartSixUserWorkExperience(UserWorkExperience userWorkExperience);
	
	/**
	 * 新增家庭信息
	 * @param serFamilyInfo
	 */
	public void insertUserFamilyInfo(UserFamilyInfo userFamilyInfo);
	
	/**
	 * 更新家庭信息
	 * @param userFamilyInfo
	 */
	public void updateUserFamilyInfo(UserFamilyInfo userFamilyInfo);
	
	/**
	 * 更新兴趣爱好
	 * @param obbies
	 */
	public void updateHobbies(UserInfoDetail userInfoDetail);
}
