package com.fc.flf.portal.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.mapper.UserInfoMapper;
import com.fc.flf.portal.service.IUserInfoService;

@Service
public class UserInfoServiceImpl implements IUserInfoService{

	@Resource
	private UserInfoMapper userInfoMapper;
	
	@Transactional(readOnly=true)
	public List<UserInfo> userInfoListOnPage(Page page) {
		int count = userInfoMapper.getUserInfoCount();
		page.setRowCount(count);
		List<UserInfo> userInfos = userInfoMapper.userInfoListOnPage(page.getLimit());
		return userInfos;
	}

	@Transactional(readOnly=true)
	public List<UserInfo> getSkimUserListByUserId(int userId) {
		List<UserInfo> userInfos = userInfoMapper.getSkimUserListByUserId(userId);
		return userInfos;
	}

	@Transactional(readOnly=true)
	public List<UserInfo> getSkimUserListOnTop() {
		List<UserInfo> userInfos = userInfoMapper.getSkimUserListOnTop();
		return userInfos;
	}

	@Transactional(readOnly=true)
	public List<UserInfo> getSkimUserListOnOldTop() {
		List<UserInfo> userInfos = userInfoMapper.getSkimUserListOnOldTop();
		return userInfos;
	}
	/**
	 * 根据客户id查找对应经纪人信息
	 * */
	@Transactional(readOnly=true)
	public UserInfo findUserInfoWithDetail(int customerId) {
		UserInfo userinfo = userInfoMapper.selectUserInfoWithDetail(customerId);
		return userinfo;
	}

	@Transactional(readOnly=true)
	public List<UserInfo> findUserInfoByLike(Map<String, Object> map) {
		List<UserInfo> userInfos = userInfoMapper.findUserInfoByLike(map);
		return userInfos;
	}
	@Transactional(readOnly=true)
	public int findUserInfoCountByLike(Map<String, Object> map) {
		return userInfoMapper.findUserInfoCountByLike(map);
		
	}
	@Transactional(readOnly=true)
	public UserInfo getUserInfoById(int userId) {
		UserInfo userinfo = userInfoMapper.getUserInfoById(userId);
		return userinfo;
	}
	
	@Transactional(readOnly = true)
	public List<UserInfo> findRecentVisitUser() throws Exception {
		return userInfoMapper.findRecentVisitUser(SessionInfo.getVisitorId(CommonUtil.getRequest()));
	}

}
