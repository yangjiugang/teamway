package com.fc.brms.external.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserEduInfo;
import com.fc.brms.common.util.Page;

public interface IUserEduInfoService {
	/**
	 * 根据ID,type 查看教育/培训 数据 列表
	 * @param map{userId,type,limit}
	 * @return
	 */
	public List<UserEduInfo> getUserEduByIdBeforeType(int userId,int type,Page page);
}
