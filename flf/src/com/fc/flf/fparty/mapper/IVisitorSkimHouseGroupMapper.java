package com.fc.flf.fparty.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseGroupInfo;

public interface IVisitorSkimHouseGroupMapper {
  	
  	public  List<HouseGroupInfo> listHouseGroups(Map<String, Object> map);  	
  	
  	public int getCount(int customerId);
}
