package com.fc.flf.eagent.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.Page;

/**
 * 经纪人的房源信息
 * 
 * @author gonghongjun
 * 
 */
public interface IUserStudySaleHouseService {

	/**
	 * 查找经纪人认售的房子信息
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> saleHouseInfo(Page page, UserInfo userInfo);

	/**
	 * 查找经纪人认售房子信息de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getSaleHouseInfoCount(UserInfo userInfo);

	/**
	 * 查找经纪人学习过的房子信息
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> studyHouseInfo(Page page, UserInfo userInfo);

	/**
	 * 查找经纪人学习过的房子信息de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getStudyHouseInfoCount(UserInfo userInfo);
	
	/**
	 * 经纪人的客户关注的房源
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> customerSkimHouseInfo(Page page, UserInfo userInfo);

	/**
	 * 经纪人的客户关注的房源de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getCustomerSkimHouseInfoCount(UserInfo userInfo);
	
	/**
	 * 经纪人的客户收藏的房源
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> customerCollectHouseInfo(Page page, UserInfo userInfo);

	/**
	 * 经纪人的客户收藏的房源de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getCustomerCollectHouseInfoCount(UserInfo userInfo);
	
	/**
	 * 查找经纪人认售的房子信息
	 * 
	 * @param map 参数集合
	 * @param page 页数
	 * @return list的房子的集合
	 * @author 覃启轩 add 2012-02-07
	 */
	List<HouseInfo> getSaleHousesList(Map<String, Object> map);

	/**
	 * 查找经纪人认售房子信息的总条数
	 * 
	 * @param map 参数集合
	 * @return int
	 * @author 覃启轩 add 2012-02-07
	 */
	int getSaleHousesCount(Map<String, Object> map);
	
	/**
	 * 删除购房订单
	 * 
	 * @param orderId 订单ID
	 * @return int
	 * @author 覃启轩 add 2012-02-07
	 */
	int deleteBuyHouseOrder(int orderId);

	/**
	 * 经纪人关注楼盘集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	public List<HouseInfo> getUserSkimHouse(Page page,int userId);
	
	/**
	 * 经纪人关注楼盘总记录数
	 * @param userId
	 * @return
	 */
	public int getUserSkimHouseCount(int userId);
	
	/**
	 * 经纪人认售楼盘集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	public List<HouseInfo> getUserSaleHouses(Page page,int userId) ;
	
	/**
	 * 经纪人认售楼盘总记录数
	 * @param userId
	 * @return
	 */
	public int getUserSaleHousesCount(int userId);
	
	/**
	 * 经纪人喊价楼盘集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	public List<HouseInfo> getUserPriceHouse(Page page,int userId);
	
	/**
	 * 经纪人喊价楼盘总记录数
	 * @param userId
	 * @return
	 */
	public int getUserPriceHouseCount(int userId);
	
	/**
	 * 经纪人向好友推荐的楼盘集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	public List<HouseInfo> getUserFriendHouse(Page page,int userId);
	
	/**
	 * 经纪人向好友推荐的楼盘总记录数
	 * @param userId
	 * @return
	 */
	public int getUserFriendHouseCount(int userId);
	
	/**
	 * 经纪人向客户推荐的楼盘集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	public List<HouseInfo> getUserCustomerHouse(Page page,int userId);
	
	/**
	 * 经纪人向客户推荐的楼盘总记录数
	 * @param userId
	 * @return
	 */
	public int getUserCustomerHouseCount(int userId);
	

	/**
	 * 经纪人向客户推荐的购房团集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	public List<HouseGroupInfo> getUserCustomerHouseGroup(Page page,int userId);
	
	/**
	 * 经纪人向客户推荐的购房团总记录数
	 * @param userId
	 * @return
	 */
	public int getUserCustomerHouseGroupCount(int userId);
}
