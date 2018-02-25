package com.fc.flf.fparty.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.mapper.IVisitorHouseMapper;
import com.fc.flf.fparty.service.IVisitorHouseService;

@Service
public class VisitorHouseServiceImpl implements IVisitorHouseService {

	@Autowired
	private IVisitorHouseMapper visitorHouseMapper;

	/**
	 * 我关注的楼盘
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseInfo> skimHouses(Page page, CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list = visitorHouseMapper.skimHouseList(map);
		return list;
	}	
	
	/**
	 * 我关注的楼盘数量
	 * 
	 * @param customer
	 * @return
	 */
	public int skimHousesCount( CustomerInfo customer) {
		return visitorHouseMapper.getSkimCount(customer.getCustomerId());
	}

	/**
	 * 我收藏的楼盘
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseInfo> collectHouse(Page page, CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list = visitorHouseMapper.collectHouse(map);
		return list;
	}

	/**
	 * 我收藏的楼盘数量
	 * 
	 * @param customer
	 * @return
	 */
	public int collectHousesCount(CustomerInfo customer) {
		return visitorHouseMapper.getCollectCount(customer.getCustomerId());
	}

	/**
	 * 经纪人推荐的楼盘
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseInfo> recommendHouse(Page page, CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list = visitorHouseMapper.recommendHouse(map);
		return list;
	}
	
	/**
	 * 蜂蜜给客户推介的最新的10条楼盘 
	 * @param customer
	 * @return
	 */
	public List<HouseInfo> recommendHouse(CustomerInfoDetail customer){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusid", customer.getCusId());
		map.put("limit", "0,10");
		List<HouseInfo> list = visitorHouseMapper.recommendHouse(map);
		return list;
	}

	/**
	 * 经纪人推荐的楼盘数量
	 * 
	 * @param customer
	 * @return
	 */
	public int recommendHousesCount(CustomerInfo customer) {
		return visitorHouseMapper.getRecommendCount(customer.getCustomerId());
	}

	/**
	 * 客户喊过价的楼盘
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseInfo> priceHouse(Page page, CustomerInfo customer){		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list = visitorHouseMapper.priceHouse(map);
		return list;
	}

	/**
	 * 客户喊过价的楼盘数量
	 * 
	 * @param customer
	 * @return
	 */
	public int priceHousesCount(CustomerInfo customer){		
		return visitorHouseMapper.getPriceCount(customer.getCustomerId());
	}
	
	/**
	 * 客户实地看过的楼盘
	 * @param page
	 * @param customer
	 * @return
	 */
    public List<HouseInfo> lookHouse(Page page , CustomerInfo customer){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list = visitorHouseMapper.lookHouse(map);
		return list;
    }
    
    /**
     * 客户实地看过的楼盘数量
     * @param customer
     * @return
     */
    public int lookHousesCount(CustomerInfo customer){
    	return visitorHouseMapper.getLookCount(customer.getCustomerId());
    }
}
