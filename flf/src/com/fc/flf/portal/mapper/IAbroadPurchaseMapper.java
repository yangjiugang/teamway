package com.fc.flf.portal.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.HouseInfo;

public interface IAbroadPurchaseMapper {

	public List<HouseInfo> getAllAbroad(@Param("limitStr") String limitStr);

	public int getCountAbraod();
	
	public List<HouseInfo> getHotHousesName();
}
