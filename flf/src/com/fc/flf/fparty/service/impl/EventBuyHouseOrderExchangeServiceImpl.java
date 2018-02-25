package com.fc.flf.fparty.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventBuyHouseOrderExchange;
import com.fc.flf.common.domain.HouseGroupScheduleHouse;
import com.fc.flf.common.domain.VisitorSkimHouseGroup;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.mapper.IEventBuyHouseOrderExchangeMapper;
import com.fc.flf.fparty.service.IEventBuyHouseOrderExchangeService;

@Service
public class EventBuyHouseOrderExchangeServiceImpl implements IEventBuyHouseOrderExchangeService {

	@Autowired
	private IEventBuyHouseOrderExchangeMapper iEventBuyHouseOrderExchangeMapper;


	@Transactional(readOnly = true)
	public List<EventBuyHouseOrderExchange> eventBuyHouseOrderExchange() {
		// TODO Auto-generated method stub
		List<EventBuyHouseOrderExchange> list=iEventBuyHouseOrderExchangeMapper.eventBuyHouseOrderExchange();
	
		return list;
	}
	
	
	 public List<EventBuyHouseOrderExchange> eventBuyHouse(Page page ,EventBuyHouseOrder eventBuy){		 
		 Map<String, Object> map=new HashMap<String, Object>();
		 map.put("cusid",eventBuy.getCusId());
		 map.put("limit",page.getLimit());
		 List<EventBuyHouseOrderExchange> list=iEventBuyHouseOrderExchangeMapper.eventBuyHouse(map);
		 return list;
	 }

	@Override
	public int getEventBuyHouse(EventBuyHouseOrder eventBuy) {
		// TODO Auto-generated method stub
		return iEventBuyHouseOrderExchangeMapper.getCus(eventBuy.getCusId());
	}


	@Override
	public List<HouseGroupScheduleHouse> houseGroup(Page page,
			EventBuyHouseOrder eventBuy) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cusid",eventBuy.getCusId());
		map.put("limit",page.getLimit());
		List<HouseGroupScheduleHouse> list=iEventBuyHouseOrderExchangeMapper.houseGroup(map);
		return list;
	}




}










