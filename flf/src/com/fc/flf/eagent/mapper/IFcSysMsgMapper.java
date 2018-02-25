package com.fc.flf.eagent.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.FcSysMsg;

public interface IFcSysMsgMapper {
	public int selectMsgCountByMsgType(int msgSendType);
	public List<FcSysMsg> selectMsgByMsgType(@Param("msgSendType")int msgSendType,@Param("limit") String limit);
	public FcSysMsg selectMsgById(int sysMsgId);
}
