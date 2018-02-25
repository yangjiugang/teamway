package com.fc.flf.fparty.service;

import java.util.List;

import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventBuyHouseOrderExchange;
import com.fc.flf.common.domain.HouseGroupScheduleHouse;
import com.fc.flf.common.util.Page;

public interface IEventBuyHouseOrderExchangeService {

    
	public List<EventBuyHouseOrderExchange> eventBuyHouseOrderExchange();
	
	public List<EventBuyHouseOrderExchange> eventBuyHouse(Page page ,EventBuyHouseOrder eventBuy);
	public int getEventBuyHouse(EventBuyHouseOrder eventBuy);

    
	public List<HouseGroupScheduleHouse> houseGroup(Page page ,EventBuyHouseOrder eventBuy);
}
