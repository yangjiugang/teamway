package com.fc.brms.broker.mapper;

import java.util.Map;

public interface ISendMsgMangeMappeer {

	/**
	 * 添加约谈提醒信息
	 * 
	 * @param map
	 * @return
	 */
	int addCommRemindMsg(Map<String, Object> map);
}
