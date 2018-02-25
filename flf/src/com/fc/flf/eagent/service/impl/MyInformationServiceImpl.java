package com.fc.flf.eagent.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserEduInfo;
import com.fc.flf.common.domain.UserFamilyInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserTrainingExperience;
import com.fc.flf.common.domain.UserWorkExperience;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.mapper.IMyInformationMapper;
import com.fc.flf.eagent.service.IMyInformationService;

@Service
public class MyInformationServiceImpl implements IMyInformationService{

	@Resource
	private IMyInformationMapper mim;	

	
	/**
	 * 查看数据库是否有记录
	 */
	public int countUserInfoById() {
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = -1;
		}		
		return mim.countUserInfoById(id);
	}
	
	/**
	 * 查看数据库是否有记录
	 */
	public int countUserInfoDetailById(){
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = -1;
		}
		return mim.countUserInfoDetailById(id);
	}
	
	/**
	 * 查看数据库是否有UserEduInfo记录
	 * @param id
	 * @return
	 */
	public int countUserEduInfoById(){
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = -1;
		}
		return mim.countUserEduInfoById(id);
	}
	
	/**
	 * 查看数据库是否有UserTrainingExperience记录
	 * @param id
	 * @return
	 */
	public int countUserTrainingExperience(){
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = -1;
		}		
		return mim.countUserTrainingExperience(id);
	}
	
	/**
	 * 查看数据库是否有UserWorkExperience记录
	 * @param id
	 * @return
	 */
	public int countUserWorkExperience(){
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = -1;
		}
		return mim.countUserWorkExperience(id);
	}
	
	/**
	 * 查看数据库是否有UserFamilyInfo记录
	 * @param userId
	 * @param id
	 * @return
	 */
	public int countUserFamilyInfo(UserFamilyInfo userFamilyInfo){
		try {
			userFamilyInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		return mim.countUserFamilyInfo(userFamilyInfo);
	}
	
	/**
	 * 新增一条UserInfo记录
	 */
	public void insertUserInfo(UserInfo userInfo){
		try {
			userInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		mim.insertUserInfo(userInfo);
	}

	/**
	 * 新增一条UserInfoDetail记录
	 */
	public void insertUserInfoDetail(UserInfoDetail userInfoDetail){
		try {
			userInfoDetail.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		mim.insertUserInfoDetail(userInfoDetail);
	}
	
	/**
	 * 新增一条UserEduInfo记录
	 * @param userEduInfo
	 */
	public void insertUserEduInfo(UserEduInfo userEduInfo){
		try {
			userEduInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		mim.insertUserEduInfo(userEduInfo);
	}
	
	/**
	 * 新增一条UserTrainingExperience记录
	 * @param userTrainingExperience
	 */
	public void insertUserTrainingExperience(UserTrainingExperience userTrainingExperience){
		try {
			userTrainingExperience.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		mim.insertUserTrainingExperience(userTrainingExperience);
	}
	
	/**
	 * 新增一条UserWorkExperience记录
	 * @param userWorkExperience
	 */
	public void insertUserWorkExperience(UserWorkExperience userWorkExperience){
		try {
			userWorkExperience.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		mim.insertUserWorkExperience(userWorkExperience);
	}
	
	/**
	 * 根据登陆ID得到UserInfo
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserInfo getUserInfo() {
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = 0;
		}
		return mim.getUserInfo(id);
	}

	/**
	 * 根据登陆ID得到UserInfoDetail
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserInfoDetail getUserInfoDetail() {
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = 0;
		}
		return mim.getUserInfoDetail(id);
	}
	
	/**
	 * 根据登陆ID得到UserEduInfo
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserEduInfo getUserEduInfo() {
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = 0;
		}
		return mim.getUserEduInfo(id);
	}

	/**
	 * 根据登陆ID得到Email
	 * @return
	 */
	@Transactional(readOnly = true)
	public String getEmail() {
		int id;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			id = 0;
		}
		return mim.getEmail(id);
	}
	/**
	 * 根据登陆ID得到 UserTrainingExperience
	 */
	public UserTrainingExperience getUserTrainingExperience() {
		int id = -1;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
		}
		return mim.getUserTrainingExperience(id);
	}
	
	/**
	 * 根据登陆ID得到 UserWorkExperience
	 */
	public UserWorkExperience getUserWorkExperience() {
		int id = -1;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
		}
		return mim.getUserWorkExperience(id);
	}
	
	/**
	 * 根据登陆id得到 UserFamilyInfo
	 */
	public List<UserFamilyInfo> getUserFamilyInfo() {
		int id = -1;
		try {
			id = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
		}
		return mim.getUserFamilyInfo(id);
	}

	/**
	 * 基本资料 userInfoDetail资料
	 * @param userInfoDetail
	 */
	public void updateUserInfoPartOneUserInfoDetail(
			UserInfoDetail userInfoDetail) {
		try {
			userInfoDetail.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserInfoDetailById(userInfoDetail.getUserId());
		if(temp<=0){
			mim.insertUserInfoDetail(userInfoDetail);
		}else{
			mim.updateUserInfoPartOneUserInfoDetail(userInfoDetail);			
		}
	}

	/**
	 * 基本资料 userInfo资料
	 * @param userInfo
	 */
	public void updateUserInfoPartOneUserInfo(UserInfo userInfo) {
		try {
			userInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserInfoById(userInfo.getUserId());
		if(temp<=0){
			mim.insertUserInfo(userInfo);
		}else{
			mim.updateUserInfoPartOneUserInfo(userInfo);			
		}
	}

	/**
	 * 证件 userInfoDetail资料
	 * @param userInfoDetail
	 */
	public void updateUserInfoPartTwoUserInfoDetail(
			UserInfoDetail userInfoDetail) {
		try {
			userInfoDetail.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserInfoDetailById(userInfoDetail.getUserId());
		if(temp<=0){
			mim.insertUserInfoDetail(userInfoDetail);
		}else{
			mim.updateUserInfoPartTwoUserInfoDetail(userInfoDetail);			
		}
	}
	
	/**
	 * 联系方式 userInfoDetail资料
	 */
	public void updateUserInfoPartThreeUserInfoDetail(UserInfoDetail userInfoDetail){
		try {
			userInfoDetail.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserInfoDetailById(userInfoDetail.getUserId());
		if(temp<=0){
			mim.insertUserInfoDetail(userInfoDetail);
		}else{
			mim.updateUserInfoPartThreeUserInfoDetail(userInfoDetail);			
		}
	}
	
	/**
	 * 联系方式 userInfo
	 */
	public void updateUserInfoPartThreeUserInfo(UserInfo userInfo) {
		try {
			userInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserInfoById(userInfo.getUserId());
		if(temp<=0){
			mim.insertUserInfo(userInfo);
		}else{
			mim.updateUserInfoPartThreeUserInfo(userInfo);			
		}
	}	


	/**
	 * 教育 userEduInfo
	 */
	public void updateUserInfoPartFourUserEduInfo(UserEduInfo userEduInfo) {
		try {
			userEduInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserEduInfoById(userEduInfo.getUserId());
		if(temp<=0){
			mim.insertUserEduInfo(userEduInfo);
		}else{
			mim.updateUserInfoPartFourUserEduInfo(userEduInfo);			
		}
	}

	/**
	 * 培训经历 UserTrainingExperience
	 */
	public void updateUserInfoPartFiveUserTrainingExperience(
			UserTrainingExperience userTrainingExperience) {
		try {
			userTrainingExperience.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserTrainingExperience(userTrainingExperience.getUserId());
		if(temp<=0){
			mim.insertUserTrainingExperience(userTrainingExperience);
		}else{
			mim.updateUserInfoPartFiveUserTrainingExperience(userTrainingExperience);			
		}
	}
	
	/**
	 * 工作经历 UserWorkExperience
	 */
	public void updateUserInfoPartSixUserWorkExperience(
			UserWorkExperience userWorkExperience) {
		try {
			userWorkExperience.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserWorkExperience(userWorkExperience.getUserId());
		if(temp<=0){
			mim.insertUserWorkExperience(userWorkExperience);
		}else{
			mim.updateUserInfoPartSixUserWorkExperience(userWorkExperience);			
		}
	}

	/**
	 * 新增家庭信息
	 */
	public void insertUserFamilyInfo(UserFamilyInfo userFamilyInfo) {
		try {
			userFamilyInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		int temp = mim.countUserFamilyInfo(userFamilyInfo);
		if(temp<=0){
			mim.insertUserFamilyInfo(userFamilyInfo);			
		}else{
			mim.updateUserFamilyInfo(userFamilyInfo);
		}
	}
	
	/**
	 * 更新家庭信息
	 */
	public void updateUserFamilyInfo(UserFamilyInfo userFamilyInfo){
		try {
			userFamilyInfo.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		mim.updateUserFamilyInfo(userFamilyInfo);
	}
	
	/**
	 * 更新兴趣爱好
	 * @param obbies
	 */
	public void updateHobbies(UserInfoDetail userInfoDetail){
		try {
			userInfoDetail.setUserId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		} catch (Exception e) {
		}
		mim.updateHobbies(userInfoDetail);
	}
}
