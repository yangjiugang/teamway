package com.fc.brms.broker.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.ISendMsgMangeMappeer;
import com.fc.brms.broker.service.ISendMsgMangeService;

@Service
public class ISendMsgMangeServiceImpl implements ISendMsgMangeService {

	@Resource
	private ISendMsgMangeMappeer sendMsgMangeMappeer;

	/**
	 * 添加约谈提醒信息
	 * 
	 * @param map
	 * @return
	 */
	public int addCommRemindMsg(Map<String, Object> map) {
		return sendMsgMangeMappeer.addCommRemindMsg(map);
	}

}
