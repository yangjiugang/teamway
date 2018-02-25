package com.fc.flf.eagent.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.mapper.IUserStudySaleHouseMapper;
import com.fc.flf.eagent.service.IUserStudySaleHouseService;

@Service
public class UserStudySaleHouseServiceimpl implements
		IUserStudySaleHouseService {

	@Resource
	private IUserStudySaleHouseMapper userStudyMapper;

	/**
	 * 查找经纪人认售的房子信息
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> saleHouseInfo(Page page, UserInfo userInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userInfo.getUserId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list = userStudyMapper.saleHousesList(map);
		return list;
	}

	/**
	 * 查找经纪人认售房子信息de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getSaleHouseInfoCount(UserInfo userInfo) {
		return userStudyMapper.saleHousesCount(userInfo.getUserId());
	}

	/**
	 * 查找经纪人学习过的房子信息
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> studyHouseInfo(Page page, UserInfo userInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userInfo.getUserId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list = userStudyMapper.studyHousesList(map);
		return list;
	}

	/**
	 * 查找经纪人学习过的房子信息de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getStudyHouseInfoCount(UserInfo userInfo) {
		return userStudyMapper.studyHousesCount(userInfo.getUserId());
	}
	
	/**
	 * 经纪人的客户关注的房源
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> customerSkimHouseInfo(Page page, UserInfo userInfo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userInfo.getUserId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list=userStudyMapper.customerSkimHousesList(map);
		return list;
	}

	/**
	 * 经纪人的客户关注的房源de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getCustomerSkimHouseInfoCount(UserInfo userInfo){
		return userStudyMapper.customerSkimHousesCount(userInfo.getUserId());
	}
	
	/**
	 * 经纪人的客户收藏的房源
	 * 
	 * @param page
	 *            页数
	 * @param userInfo
	 *            经纪人
	 * @return list的房子的集合
	 */
	public List<HouseInfo> customerCollectHouseInfo(Page page, UserInfo userInfo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userInfo.getUserId());
		map.put("limit", page.getLimit());
		List<HouseInfo> list=userStudyMapper.customerCollectHousesList(map);
		return list;
	}

	/**
	 * 经纪人的客户收藏的房源de总条数
	 * 
	 * @param userId
	 *            经纪人id
	 * @return int
	 */
	public int getCustomerCollectHouseInfoCount(UserInfo userInfo){
		return userStudyMapper.customerCollectHousesCount(userInfo.getUserId());
	}
	
	/**
	 * 查找经纪人认售的房子信息
	 * 
	 * @param map 参数集合
	 * @param page 页数
	 * @return list的房子的集合
	 * @author 覃启轩 add 2012-02-07
	 */
	public List<HouseInfo> getSaleHousesList(Map<String, Object> map){
		return userStudyMapper.getSaleHousesList(map);
	}

	/**
	 * 查找经纪人认售房子信息的总条数
	 * 
	 * @param map 参数集合
	 * @return int
	 * @author 覃启轩 add 2012-02-07
	 */
	public int getSaleHousesCount(Map<String, Object> map){
		return userStudyMapper.getSaleHousesCount(map);
	}
	
	/**
	 * 删除购房订单
	 * 
	 * @param orderId 订单ID
	 * @return int
	 * @author 覃启轩 add 2012-02-10
	 */
	public int deleteBuyHouseOrder(int orderId){
		return userStudyMapper.deleteBuyHouseOrder(orderId);
	}

	/**
	 * 经纪人关注楼盘集合
	 * @param map{ int userId,String limit }
	 * @return HouseInfo集合List
	 * @author Zhenglh
	 * 返回结果集中实体bean的created_at , wharf对象其原始数据来源于其他表，该字段与houseInfo表 没有直接关系
	 */
	@Transactional(readOnly=true)
	public List<HouseInfo> getUserSkimHouse(Page page,int userId) {
		int count = userStudyMapper.getUserSkimHouseCount(userId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<HouseInfo> houseInfos = userStudyMapper.getUserSkimHouse(map);
		return houseInfos;
	}

	/**
	 * 经纪人关注楼盘总记录数
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly=true)
	public int getUserSkimHouseCount(int userId) {
		return userStudyMapper.getUserSkimHouseCount(userId);
	}

	@Transactional(readOnly=true)
	public List<HouseInfo> getUserSaleHouses(Page page,int userId)  {
		int count = userStudyMapper.getUserSaleHousesCount(userId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<HouseInfo> houseInfos = userStudyMapper.getUserSaleHouses(map);
		return houseInfos;
	}

	@Transactional(readOnly=true)
	public int getUserSaleHousesCount(int userId) {
		return userStudyMapper.getUserSaleHousesCount(userId);
	}

	@Transactional(readOnly=true)
	public List<HouseInfo> getUserPriceHouse(Page page, int userId) {
		int count = userStudyMapper.getUserPriceHouseCount(userId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<HouseInfo> houseInfos = userStudyMapper.getUserPriceHouse(map);
		return houseInfos;
	}

	@Transactional(readOnly=true)
	public int getUserPriceHouseCount(int userId) {
		return userStudyMapper.getUserPriceHouseCount(userId);
	}

	@Transactional(readOnly=true)
	public List<HouseInfo> getUserFriendHouse(Page page, int userId) {
		int count = userStudyMapper.getUserFriendHouseCount(userId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<HouseInfo> houseInfos = userStudyMapper.getUserFriendHouse(map);
		return houseInfos;
	}

	@Transactional(readOnly=true)
	public int getUserFriendHouseCount(int userId) {
		return userStudyMapper.getUserFriendHouseCount(userId);
	}

	@Transactional(readOnly=true)
	public List<HouseInfo> getUserCustomerHouse(Page page, int userId) {
		int count = userStudyMapper.getUserCustomerHouseCount(userId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<HouseInfo> houseInfos = userStudyMapper.getUserCustomerHouse(map);
		return houseInfos;
	}

	@Transactional(readOnly=true)
	public int getUserCustomerHouseCount(int userId) {
		return userStudyMapper.getUserCustomerHouseCount(userId);
	}

	@Transactional(readOnly=true)
	public List<HouseGroupInfo> getUserCustomerHouseGroup(Page page, int userId) {
		int count = userStudyMapper.getUserCustomerHouseGroupCount(userId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<HouseGroupInfo> houseGroupInfos = userStudyMapper.getUserCustomerHouseGroup(map);
		return houseGroupInfos;
	}

	@Transactional(readOnly=true)
	public int getUserCustomerHouseGroupCount(int userId) {
		return userStudyMapper.getUserCustomerHouseGroupCount(userId);
	}

}
