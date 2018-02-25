package com.fc.brms.broker.service;

import java.util.Map;

public interface ISendMsgMangeService {

	/**
	 * 添加约谈提醒信息
	 * 
	 * @param map
	 * @return
	 */
	int addCommRemindMsg(Map<String, Object> map);
}
