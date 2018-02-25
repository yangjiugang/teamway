package com.fc.flf.eagent.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.UserMsg;

public interface IUserMsgMapper {
	public int selectMsgCount(int customerId);
	public List<UserMsg> selectMsgByMsgType(@Param("customerId")int customerId,@Param("msgType")int msgType,@Param("limit") String limit);
	public int selectMsgCountByMsgType(@Param("customerId")int customerId,@Param("msgType")int msgType);
	public List<UserMsg> selectMsgSendByFeng(@Param("customerId")int customerId,@Param("limit") String limit);
	public void deleteMsg(int id);
	public void inertUserMsg(UserMsg userMsg);
	public int saveUserMsg(UserMsg msgObj);
	public UserMsg selectMsgById(int id);
	public int selectMsgCountByMsgTypeAndSenderType(@Param("userId")int userId, @Param("msgType")int msgType,@Param("senderType")int senderType);
	public List<UserMsg> selectMsgByMsgTypeAndSenderType(@Param("userId")int userId, @Param("msgType")int msgType,@Param("senderType")int senderType, @Param("limit")String limit);
	public int selectMsgMetionComplaintCount(@Param("userId")int userId);
	public List<UserMsg> selectMsgMetionComplaint(@Param("userId")int userId, @Param("limit")String limit);
	public void updateUserMsgReadById(@Param("userMsgId")int userMsgId,@Param("read") int read);
	
}
