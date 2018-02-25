package com.fc.flf.portal.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.Page;

public interface IUserInfoService {
	public List<UserInfo> userInfoListOnPage(Page page);
	public List<UserInfo> getSkimUserListByUserId(int userId);
	public List<UserInfo> getSkimUserListOnTop();
	public List<UserInfo> getSkimUserListOnOldTop();
	public List<UserInfo> findUserInfoByLike(Map<String, Object> map);
	public UserInfo findUserInfoWithDetail(int customerId);
	public int findUserInfoCountByLike(Map<String, Object> map);
	public UserInfo getUserInfoById(int userId);
	/**
	 * 易介宝首页(最近到访的同行)
	 * @param userId
	 * @return
	 */
	public List<UserInfo> findRecentVisitUser()throws Exception;
}
