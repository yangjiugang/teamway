package com.fc.flf.eagent.service;

import java.util.List;

import com.fc.flf.common.domain.FcSysMsg;

public interface IFcSysMsgService {
	/**
	 * 根据msgSendType查询系统消息总数
	 * 
	 * @param msgSendType
	 * @return int
	 */
	public int findMsgCountByMsgType(int msgSendType);
	
	/**
	 * 根据msg_send_type查找消息
	 * 
	 * @param msgSendType
	 * @return int
	 */
	public List<FcSysMsg> findMsgByMsgType(int msgSendType,String limit);

	/**
	 * 根据msgId查找系统消息
	 * 
	 * @param sysMsgId
	 * @return FcSysMsg
	 */
	public FcSysMsg findSysMsgById(int sysMsgId);
}
