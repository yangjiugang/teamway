package com.fc.flf.eagent.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.UserCostFee;
import com.fc.flf.eagent.mapper.ICostFeeMapper;
import com.fc.flf.eagent.service.ICostFeeService;

@Service
public class CostFeeImp implements ICostFeeService {

	@Resource
	private ICostFeeMapper costFeeMapper;

	/**
	 * 开销列表查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public List<UserCostFee> getQueryList(Map<String, Object> map) {
		return costFeeMapper.getQueryList(map);
	}

	/**
	 * 开销列表查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public List<UserCostFee> getQueryCondition(Map<String, Object> map) {
		return costFeeMapper.getQueryCondition(map);
	}

	/**
	 * 添加开销
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public int addCostFee(Map<String, Object> map) {
		return costFeeMapper.addCostFee(map);
	}

	/**
	 * 查询历史开销记录总记录数
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public int getGroupHistoryCount(Map<String, Object> map) {
		if(null != map.get("costRemark")){
			try {
				String strRemark = (String) map.get("costRemark");
				map.put("costRemark", new String(strRemark.getBytes("iso8859-1"),"UTF-8"));
			} 
			catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return costFeeMapper.getGroupHistoryCount(map);
	}
	
	/**
	 * 查询历史开销记录
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 * @throws UnsupportedEncodingException 
	 */
	public List<UserCostFee> getGroupHistory(Map<String, Object> map) {
		return costFeeMapper.getGroupHistory(map);
	}

	/**
	 * 查询历史开销详细记录
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public List<UserCostFee> getDetailHistory(Map<String, Object> map) {
		if(null != map.get("costRemark")){
			try {
				String strRemark = (String) map.get("costRemark");
				map.put("costRemark", new String(strRemark.getBytes("iso8859-1"),"UTF-8"));
			} 
			catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return costFeeMapper.getDetailHistory(map);
	}

	/**
	 * 开销总数查询
	 * 
	 * @param map
	 * @return List<UserCostFee>
	 */
	public int getQueryListCount(Map<String, Object> map) {
		return costFeeMapper.getQueryListCount(map);
	}
	
	/**
	 * 更新开销记录
	 * 
	 * @param map
	 * @return int
	 */
	public int updateCost(Map<String, Object> map) {
		return costFeeMapper.updateCost(map);
	}
}
