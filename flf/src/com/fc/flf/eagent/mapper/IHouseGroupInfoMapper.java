package com.fc.flf.eagent.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseGroupInfo;

public interface IHouseGroupInfoMapper {
	
	/**
	 * 分页查找没有过期的旅游房团
	 * @param map  ()
	 * @return
	 */
	public List<HouseGroupInfo> findAllHouseGroupInfo(Map<String,Object> map);
	
	/**
	 * 没有过期的旅游房团总条数
	 * @param now  当前时间
	 * @return
	 */
	public int findAllHouseGroupInfoCount(Date now);
}
