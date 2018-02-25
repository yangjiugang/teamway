package com.fc.flf.portal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.UserInfo;

public interface UserInfoMapper {
	public List<UserInfo> userInfoListOnPage(@Param("pageStr") String pageStr);
	public int getUserInfoCount();
	public List<UserInfo> getSkimUserListByUserId(int userId);
	public List<UserInfo> getSkimUserListOnTop();
	public List<UserInfo> getSkimUserListOnOldTop();
	public List<UserInfo> findUserInfoByLike(Map<String, Object> map);
	public int findUserInfoCountByLike(Map<String, Object> map);
	public UserInfo selectUserInfoWithDetail(int customerId);
	public UserInfo getUserInfoById(int userId);
	public List<UserInfo> findRecentVisitUser(int userId);
}
