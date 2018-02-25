package com.fc.flf.eagent.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.FcSysMsg;
import com.fc.flf.eagent.mapper.IFcSysMsgMapper;
import com.fc.flf.eagent.service.IFcSysMsgService;

@Service
public class FcSysMsgServiceImpl implements IFcSysMsgService {
	@Resource
	private IFcSysMsgMapper fcSysMsgMapper;
	
	public int findMsgCountByMsgType(int msgSendType) {
		return fcSysMsgMapper.selectMsgCountByMsgType(msgSendType);
	}

	public List<FcSysMsg> findMsgByMsgType(int msgSendType, String limit) {
		return fcSysMsgMapper.selectMsgByMsgType(msgSendType, limit);
	}

	@Transactional(readOnly=true)
	public FcSysMsg findSysMsgById(int sysMsgId) {
		return fcSysMsgMapper.selectMsgById(sysMsgId);
	}

}
