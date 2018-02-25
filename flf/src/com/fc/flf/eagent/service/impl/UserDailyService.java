package com.fc.flf.eagent.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserDaily;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.mapper.IUserDailyMapper;
import com.fc.flf.eagent.service.IUserDailyService;

@Service
public class UserDailyService implements IUserDailyService{

	@Autowired
	private IUserDailyMapper userDailyMapper;
	
	@Transactional
	public void saveDaily(UserDaily daily) throws Exception{
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		daily.setUserId(userId);
		daily.setDailyTime(new Date());
		userDailyMapper.saveDaily(daily);
	}
	
	@Override
	public List<UserDaily> findDailyByUserId(Page page) throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		page.setRowCount(getCount());
		return userDailyMapper.findDailyByUserId(userId,page.getLimit());
	}
	
	@Override
	public int getCount() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return userDailyMapper.getCount(userId);
	}
	
	@Override
	public List<UserDaily> findFriendDaily(Page page) throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		page.setRowCount(getFriendDailyCount());
		return userDailyMapper.findFriendDaily(userId, page.getLimit());
	}
	
	@Override
	public int getFriendDailyCount() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return userDailyMapper.getFriendDailyCount(userId);
	}
	
	@Override
	public List<UserDaily> findDailyByCusId(Page page) throws Exception {
		int cusId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		page.setRowCount(findDailyCountByCusId());
		return userDailyMapper.findDailyByCusId(cusId, page.getLimit());
	}
	
	@Override
	public int findDailyCountByCusId() throws Exception {
		int cusId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return userDailyMapper.findDailyCountByCusId(cusId);
	}
	
	@Transactional
	public void delDaily(int id) {
		userDailyMapper.delDaily(id);
	}
	
	@Transactional
	public void updateDaily(UserDaily daily) {
		daily.setDailyTime(new Date());
		userDailyMapper.updateDaily(daily);
	}
}
