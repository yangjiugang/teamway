package com.fc.flf.portal.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseInfoPriceByStat;
import com.fc.flf.common.domain.HouseInfoPriceTotal;
import com.fc.flf.common.domain.HousePrice;

public interface IHousePriceService {
	public List<HousePrice> findHousePriceById(int houseId);
	public int saveHousePrice(HousePrice housePrice);
	public List<HouseInfoPriceByStat> groupByDate(Map<String, Object> map);
	public List<HouseInfoPriceByStat> getDateStatCount(Map<String, Object> map);
	public HouseInfoPriceByStat avgPriceByVisitorType(Map<String, Object> map);
	public HouseInfoPriceByStat avgPriceByNowMonth(int houseId);
	public List<HouseInfoPriceTotal> getPriceTotal(int houseId);
	public int findCusPriceCountByUserId(int userId);
	public List<HousePrice> findCusPriceByUserId(int userId, String limit);
	public HousePrice findHousePriceByPriceId(int cusHousePriceId);
	public int findFriPriceCountByUserId(int userId);
	public List<HousePrice> findFriPriceByUserId(int userId, String limit);
}
