package com.fc.flf.portal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.HouseInfoPriceByStat;
import com.fc.flf.common.domain.HouseInfoPriceTotal;
import com.fc.flf.common.domain.HousePrice;

public interface HousePriceMapper {
	public List<HousePrice> findHousePriceById(int houseId);
	public int saveHousePrice(HousePrice housePrice);
	public List<HouseInfoPriceByStat> groupByDate(Map<String, Object> map);
	public List<HouseInfoPriceByStat> getDateStatCount(Map<String, Object> map);
	public HouseInfoPriceByStat avgPriceByVisitorType(Map<String, Object> map);
	public HouseInfoPriceByStat avgPriceByNowMonth(int houseId);
	public List<HouseInfoPriceTotal> getPriceTotal(int houseId);
	public int selectUserIsSaveHouseInfo(HousePrice housePrice);
	public int selectCusPriceCountByUserId(int userId);
	public List<HousePrice> selectCusPriceByUserId(@Param("userId") int userId,@Param("limit") String limit);
	public HousePrice selectCusPriceByPriceId(int housePriceId);
	public int selectFriPriceCountByUserId(int userId);
	public List<HousePrice> selectFriPriceByUserId(@Param("userId") int userId,@Param("limit") String limit);
}
