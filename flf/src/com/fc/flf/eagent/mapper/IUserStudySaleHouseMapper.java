package com.fc.flf.eagent.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;

public interface IUserStudySaleHouseMapper {

	/**
	 * 根据经纪人的id号和分页，查经纪人认售的房子
	 * 
	 * @param map
	 * @return
	 */
	public List<HouseInfo> saleHousesList(Map<String, Object> map);

	/**
	 * 查经纪人认售房子的总条数
	 * 
	 * @param userId
	 *            经纪人的id
	 * @return int
	 */
	public int saleHousesCount(int userId);

	/**
	 * 根据经纪人的id号和分页，查经纪人学习过的房子
	 * 
	 * @param map
	 * @return
	 */
	public List<HouseInfo> studyHousesList(Map<String, Object> map);

	/**
	 * 查经纪人学习过的房子的总条数
	 * 
	 * @param userId
	 *            经纪人的id
	 * @return int
	 */
	public int studyHousesCount(int userId);
	
	/**
	 *  经纪人的客户关注的房源
	 * 
	 * @param map
	 * @return
	 */
	public List<HouseInfo> customerSkimHousesList(Map<String, Object> map);

	/**
	 *  经纪人的客户收藏的房源的总条数
	 * 
	 * @param userId
	 *            经纪人的id
	 * @return int
	 */
	public int customerSkimHousesCount(int userId);
	
	/**
	 *  经纪人的客户关注的房源
	 * 
	 * @param map
	 * @return
	 */
	public List<HouseInfo> customerCollectHousesList(Map<String, Object> map);

	/**
	 *  经纪人的客户收藏的房源的总条数
	 * 
	 * @param userId
	 *            经纪人的id
	 * @return int
	 */
	public int customerCollectHousesCount(int userId);
	
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
	 * @author 覃启轩 add 2012-02-10
	 */
	int deleteBuyHouseOrder(@Param("orderId") int orderId);
	
	/**
	 * 经纪人关注楼盘集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	public List<HouseInfo> getUserSkimHouse(Map<String, Object> map);
	
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
	public List<HouseInfo> getUserSaleHouses(Map<String, Object> map);
	
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
	public List<HouseInfo> getUserPriceHouse(Map<String, Object> map);
	
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
	public List<HouseInfo> getUserFriendHouse(Map<String, Object> map);
	
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
	public List<HouseInfo> getUserCustomerHouse(Map<String, Object> map);
	
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
	public List<HouseGroupInfo> getUserCustomerHouseGroup(Map<String, Object> map);
	
	/**
	 * 经纪人向客户推荐的购房团总记录数
	 * @param userId
	 * @return
	 */
	public int getUserCustomerHouseGroupCount(int userId);
}
