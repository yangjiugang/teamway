package com.fc.flf.eagent.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.CustomerEduInfo;
import com.fc.flf.common.domain.CustomerFamilyInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.CustomerInterests;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.mapper.ICustomerFunMapper;
import com.fc.flf.eagent.service.ICustomerFunService;

@Service
public class CustomerFunServiceimpl implements ICustomerFunService {

	@Resource
	private ICustomerFunMapper funMapper;

	public List<CustomerInfoDetail> queryCusInDe() {
		List<CustomerInfoDetail> list = funMapper.queryCusInDe();
		return list;
	}

	@Override
	public List<CustomerInfoDetail> queryCusInDeAll() {
		List<CustomerInfoDetail> list = funMapper.queryCusInDeAll();
		return list;
	}

	/**
	 * 查询客户列表
	 * 
	 * @param cusInfo
	 * @return 客户信息
	 */
	public List<CustomerInfoDetail> getCusTomerList(Map<String, Object> map,Page page) {
		try {
			if (map.get("cusTomerName") != null) {
				String customerName = (String) map.get("cusTomerName");
				map.put("cusTomerName",
						new String(customerName.getBytes("iso8859-1"), "UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		page.setRowCount(funMapper.getCusTomerListCount(map));
		map.put("limitValue", page.getLimit());
		return funMapper.getCusTomerList(map);
	}

	@Override
	public void insertCusInfo(CustomerInfoDetail customerInfoDetail) {
		funMapper.insertCusInfo(customerInfoDetail);
	}

	@Override
	public void insertFamInfo(CustomerFamilyInfo customerFamilyInfo) {
		funMapper.insertFamInfo(customerFamilyInfo);
	}

	@Override
	public void insertEduInfo(CustomerEduInfo customerEduInfo) {
		funMapper.insertEduInfo(customerEduInfo);
	}

	@Override
	public void insertCusIntere(CustomerInterests customerInterests) {
		funMapper.insertCusIntere(customerInterests);

	}

	@Override
	public int queryCusId(CustomerInfoDetail customerInfoDetail) {
		return funMapper.queryCusId(customerInfoDetail);
	}

	@Transactional
	public void updateCusInfoDetailIsExchange(int isExchange, int customerId,
			int createdUser) {
		funMapper.updateCusInfoDetailIsExchange(isExchange, customerId, createdUser);
		
	}

}
