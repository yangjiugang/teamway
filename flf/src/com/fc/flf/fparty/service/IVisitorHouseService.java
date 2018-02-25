package com.fc.flf.fparty.service;

import java.util.List;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;

/**
 * 我的楼盘
 * @author gonghongjun
 *
 */
public interface IVisitorHouseService {
    
	/**
	 * 我关注的楼盘
	 * @param page
	 * @param customer
	 * @return
	 */
    public List<HouseInfo> skimHouses(Page page , CustomerInfo customer);
    
    /**
     * 我关注的楼盘数量
     * @param customer
     * @return
     */
    public int skimHousesCount(CustomerInfo customer);
   
    
    /**
	 * 我收藏的楼盘
	 * @param page
     * @param customerc
	 * @return
	 */
    public List<HouseInfo> collectHouse(Page page , CustomerInfo customer);
    
    /**
     * 我收藏的楼盘数量
     * @param customer
     * @return
     */
    public int collectHousesCount(CustomerInfo customer);
    
    /**
	 * 经纪人推荐的楼盘
	 * @param page
	 * @param customer
	 * @return
	 */
    public List<HouseInfo> recommendHouse(Page page , CustomerInfo customer);
    
    /**
	 * 蜂蜜给客户推介的最新的10条楼盘 
	 * @param customer
	 * @return
	 */
	public List<HouseInfo> recommendHouse(CustomerInfoDetail customer);
    
    /**
     * 经纪人推荐的楼盘数量
     * @param customer
     * @return
     */
    public int recommendHousesCount(CustomerInfo customer);
    
    /**
	 * 客户喊过价的楼盘
	 * @param page
	 * @param customer
	 * @return
	 */
    public List<HouseInfo> priceHouse(Page page , CustomerInfo customer);
    
    /**
     * 客户喊过价的楼盘数量
     * @param customer
     * @return
     */
    public int priceHousesCount(CustomerInfo customer);
    
    /**
	 * 客户实地看过的楼盘
	 * @param page
	 * @param customer
	 * @return
	 */
    public List<HouseInfo> lookHouse(Page page , CustomerInfo customer);
    
    /**
     * 客户实地看过的楼盘数量
     * @param customer
     * @return
     */
    public int lookHousesCount(CustomerInfo customer);


}
