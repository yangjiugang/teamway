package com.fc.flf.fparty.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.EventBuyHouseOrderExchange;
import com.fc.flf.common.domain.HouseGroupScheduleHouse;

public interface IEventBuyHouseOrderExchangeMapper {
	
	public List<EventBuyHouseOrderExchange> eventBuyHouseOrderExchange();
	
	
	public List<EventBuyHouseOrderExchange> eventBuyHouse(Map<String, Object> map);
	public int getCus(int CusId);
	
	public List<HouseGroupScheduleHouse> houseGroup(Map<String, Object> map);


}
