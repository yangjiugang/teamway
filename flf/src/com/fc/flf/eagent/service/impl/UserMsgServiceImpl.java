package com.fc.flf.eagent.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.eagent.mapper.IUserMsgMapper;
import com.fc.flf.eagent.service.IUserMsgService;

@Service
public class UserMsgServiceImpl implements IUserMsgService {
	@Resource
	private IUserMsgMapper userMsgMapper;

	@Transactional(readOnly=true)
	public int findMsgCount(int customerId) {
		return userMsgMapper.selectMsgCount(customerId);
	}

	@Transactional(readOnly=true)
	public List<UserMsg> findMsgByMsgType(int customerId, int msgType,String limit) {
		return userMsgMapper.selectMsgByMsgType(customerId, msgType, limit);
	}

	@Transactional(readOnly=true)
	public int findMsgCountByMsgType(int customerId, int msgType) {
		return userMsgMapper.selectMsgCountByMsgType(customerId, msgType);
	}

	@Transactional(readOnly=true)
	public List<UserMsg> findMsgSendByFeng(int customerId, String limit) {
		return userMsgMapper.selectMsgSendByFeng(customerId, limit);
	}

	@Transactional
	public void delMsg(int id) {
		userMsgMapper.deleteMsg(id);
	}

	@Transactional
	public void addUserMsg(UserMsg userMsg) {
		userMsgMapper.inertUserMsg(userMsg);
	}

	@Transactional
	public int saveUserMsg(UserMsg msgObj) {
		int row=userMsgMapper.saveUserMsg(msgObj);
		return row;
	}

	@Transactional(readOnly=true)
	public UserMsg findUserMsgByID(int id) {
		return userMsgMapper.selectMsgById(id);
	}

	@Transactional(readOnly=true)
	public int findMsgCountByMsgTypeAndSenderType(int userId, int msgType,
			int senderType) {
		return userMsgMapper.selectMsgCountByMsgTypeAndSenderType(userId, msgType,
				senderType);
	}

	@Transactional(readOnly=true)
	public List<UserMsg> findMsgByMsgTypeAndSenderType(int userId, int msgType,
			int senderType, String limit) {
		return userMsgMapper.selectMsgByMsgTypeAndSenderType(userId,msgType,
				senderType, limit);
	}

	@Transactional(readOnly=true)
	public int findMsgMetionComplaintCount(int userId) {
		return userMsgMapper.selectMsgMetionComplaintCount(userId);
	}

	@Transactional(readOnly=true)
	public List<UserMsg> findMsgMetionComplaint(int userId, String limit) {
		return userMsgMapper.selectMsgMetionComplaint(userId, limit);
	}

	@Transactional(readOnly=true)
	public void updateUserMsgReadById(int userMsgId,int read) {
		userMsgMapper.updateUserMsgReadById(userMsgId,read);
	}

}
