package com.fc.brms.external.mapper;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.UserEduInfo;

public interface IUserEduInfoMapper {

	/**
	 * 根据ID,type 查看教育/培训 数据 列表
	 * @param map{userId,type,limit}
	 * @return
	 */
	public List<UserEduInfo> getUserEduByIdBeforeType(Map<String, Object> map);
	
	/**
	 * 根据ID,type 查看教育/培训 数据 列表 总记录数
	 * @param map{userId,type}
	 * @return
	 */
	public int getUserEduCountByIdBeforeType(Map<String, Object> map);
}
