package com.fc.flf.eagent.service;

import java.util.List;

import com.fc.flf.common.domain.UserMsg;

public interface IUserMsgService {
	/**
	 * 根据customer ID相应user发给他的消息数
	 * 
	 * @param customerId
	 * @return 消息数
	 */
	public int findMsgCount(int customerId);
	
	/**
	 * 根据customer ID和消息类型查找消息
	 * @param customerId
	 * @param msgType
	 * @param limit
	 * @return list
	 */
	public List<UserMsg> findMsgByMsgType(int customerId,int msgType,String limit);
	
	/**
	 * 根据customer ID和消息类型查找消息总数
	 * @param customerId
	 * @param msgType
	 * @return int
	 */
	public int findMsgCountByMsgType(int customerId,int msgType);
	
	/**
	 * 根据customer ID查找蜂密发送的消息
	 * @param customerId
	 * @param limit
	 * @return list
	 */
	public List<UserMsg> findMsgSendByFeng(int customerId,String limit);
	
	/**
	 * 根据ID删除消息
	 * @param id
	 * @return 
	 */
	public void delMsg(int id);
	
	/**
	 * 添加消息
	 * @param userMsg
	 * @return 
	 */
	public void addUserMsg(UserMsg userMsg);
	
	
	/**
	 * Code By Zhenglh
	 * 新增消息
	 * @param UserMsg msgObj
	 * @return int id
	 */
	public int saveUserMsg(UserMsg msgObj);

	/**
	 * 根据id查找消息
	 * @param userMsgId
	 * @return UserMsg
	 */
	public UserMsg findUserMsgByID(int userMsgId);
	
	/**
	 * 根据userId,msgType,senderType查找消息
	 * @param userId
	 * @param msgType
	 * @param senderType
	 * @return int
	 */
	public int findMsgCountByMsgTypeAndSenderType(int userId, int msgType, int senderType);
	
	/**
	 * 根据userId,msgType,senderType查找消息
	 * @param userId
	 * @param msgType
	 * @param senderType
	 * @param limit
	 * @return List
	 */
	public List<UserMsg> findMsgByMsgTypeAndSenderType(int userId, int msgType, int senderType, String limit);
	
	/**
	 * 根据userId查找客户点名，客户投诉，客户消息数
	 * @param userId
	 * @return int
	 */
	public int findMsgMetionComplaintCount(int userId);
	
	/**
	 * 根据userId查找客户点名，客户投诉，客户消息
	 * @param userId
	 * @param limit
	 * @return List
	 */
	public List<UserMsg> findMsgMetionComplaint(int userId, String limit);

	/**
	 * 根据userMsgId更改阅读情况
	 * @param userMsgId
	 * @param 
	 * @return 
	 */
	public void updateUserMsgReadById(int userMsgId,int read);
}
