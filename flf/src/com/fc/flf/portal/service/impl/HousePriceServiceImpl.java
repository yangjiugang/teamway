package com.fc.flf.portal.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseInfoPriceByStat;
import com.fc.flf.common.domain.HouseInfoPriceTotal;
import com.fc.flf.common.domain.HousePrice;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.portal.mapper.HousePriceMapper;
import com.fc.flf.portal.service.IHousePriceService;

@Service
public class HousePriceServiceImpl implements IHousePriceService {

	@Resource
	private HousePriceMapper housePriceMapper;
	
	@Transactional(readOnly=true)
	public List<HousePrice> findHousePriceById(int newsId) {
		List<HousePrice> housePrice=housePriceMapper.findHousePriceById(newsId);
		return housePrice;
	}

	/*
	 * throw Exception "你已对该楼盘评论过"
	 * (non-Javadoc)
	 * @see com.fc.flf.portal.service.IHousePriceService#saveHousePrice(com.fc.flf.common.domain.HousePrice)
	 */
	@Transactional
	public int saveHousePrice(HousePrice housePrice) {
		housePrice.setSaleDate(DateTools.dateToHour());
		int isSave = housePriceMapper.saveHousePrice(housePrice);
		return isSave;
	}

	@Transactional(readOnly=true)
	public List<HouseInfoPriceByStat> groupByDate(Map<String, Object> map) {
		List<HouseInfoPriceByStat> priceByStatList = housePriceMapper.groupByDate(map);
		return priceByStatList;
	}

	@Transactional(readOnly=true)
	public List<HouseInfoPriceByStat> getDateStatCount(Map<String, Object> map) {
		List<HouseInfoPriceByStat> countList = housePriceMapper.getDateStatCount(map);
		return countList;
	}

	@Transactional(readOnly=true)
	public HouseInfoPriceByStat avgPriceByVisitorType(Map<String, Object> map) {
		HouseInfoPriceByStat avgPrice = housePriceMapper.avgPriceByVisitorType(map);
		return avgPrice;
	}

	@Transactional(readOnly=true)
	public HouseInfoPriceByStat avgPriceByNowMonth(int houseId) {
		HouseInfoPriceByStat avgPrice = housePriceMapper.avgPriceByNowMonth(houseId);
		return avgPrice;
	}

	@Transactional(readOnly=true)
	public List<HouseInfoPriceTotal> getPriceTotal(int houseId) {
		List<HouseInfoPriceTotal> priceTotal = housePriceMapper.getPriceTotal(houseId);
		return priceTotal;
	}

	@Transactional(readOnly=true)
	public int findCusPriceCountByUserId(int userId) {
		return housePriceMapper.selectCusPriceCountByUserId(userId);
	}

	@Transactional(readOnly=true)
	public List<HousePrice> findCusPriceByUserId(int userId, String limit) {
		return housePriceMapper.selectCusPriceByUserId(userId, limit);
	}

	@Transactional(readOnly=true)
	public HousePrice findHousePriceByPriceId(int cusHousePriceId) {
		return housePriceMapper.selectCusPriceByPriceId(cusHousePriceId);
	}

	@Transactional(readOnly=true)
	public int findFriPriceCountByUserId(int userId) {
		return housePriceMapper.selectFriPriceCountByUserId(userId);
	}

	@Transactional(readOnly=true)
	public List<HousePrice> findFriPriceByUserId(int userId, String limit) {
		return housePriceMapper.selectFriPriceByUserId(userId, limit);
	}
}
