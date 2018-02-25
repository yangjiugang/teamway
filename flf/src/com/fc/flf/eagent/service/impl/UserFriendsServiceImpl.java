package com.fc.flf.eagent.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserFriends;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.mapper.IUserFriendsMapper;
import com.fc.flf.eagent.service.IUserFriendsService;

@Service
public class UserFriendsServiceImpl implements IUserFriendsService {

	@Resource
	private IUserFriendsMapper userFriendMapper;
	
	@Transactional(readOnly=true)
	public List<UserFriends> selectFriendsByUserIdToPage(Page page,Map<String, Object> map) {
		int count = userFriendMapper.selectFriendsCountByUserId(map);
		page.setRowCount(count);
		map.put("limit", page.getLimit());
		List<UserFriends> friends = userFriendMapper.selectFriendsByUserIdToPage(map);
		return friends;
	}

	@Transactional(readOnly=true)
	public List<UserFriends> selectFriendsByFriendIdToPage(Page page,Map<String, Object> map) {
		int count = userFriendMapper.selectFriendsCountByFriendId(map);
		page.setRowCount(count);
		map.put("limit", page.getLimit());
		List<UserFriends> friends = userFriendMapper.selectFriendsByFriendIdToPage(map);
		return friends;
	}

	@Transactional(readOnly=true)
	public int selectFriendsCountByUserId(Map<String, Object> map) {
		int count = userFriendMapper.selectFriendsCountByUserId(map);
		return count;
	}

	@Transactional(readOnly=true)
	public int selectFriendsCountByFriendId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int count = userFriendMapper.selectFriendsCountByFriendId(map);
		return count;
	}

	@Transactional(readOnly=true)
	public List<UserFriends> selectFriendsByUserIdBeforeSum(Page page,Map<String, Object> map) {
		int count = userFriendMapper.selectFriendsCountByUserIdBeforeSum(map);
		page.setRowCount(count);
		map.put("limit", page.getLimit());
		List<UserFriends> friends = userFriendMapper.selectFriendsByUserIdBeforeSum(map);
		return friends;
	}

	@Transactional(readOnly=true)
	public int selectFriendsCountByUserIdBeforeSum(Map<String, Object> map) {
		int count = userFriendMapper.selectFriendsCountByUserIdBeforeSum(map);
		return count;
	}

	@Transactional(readOnly=true)
	public List<UserFriends> findUserFriends(Page page,Map<String, Object> map) {
		int count = userFriendMapper.findUserFriendsCount(map);
		page.setRowCount(count);
		map.put("limit", page.getLimit());
		List<UserFriends> friends = userFriendMapper.findUserFriends(map);
		return friends;
	}

	@Transactional(readOnly=true)
	public int findUserFriendsCount(Map<String, Object> map) {
		int count = userFriendMapper.findUserFriendsCount(map);
		return count;
	}

}
