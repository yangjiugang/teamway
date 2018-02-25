package com.fc.flf.portal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.CustomerSkimUser;
import com.fc.flf.portal.mapper.ICustomerSkimUserMapper;
import com.fc.flf.portal.service.ICustomerSkimUserService;

@Service
public class CustomerSkimUserServiceImpl implements ICustomerSkimUserService {

	@Resource
	private ICustomerSkimUserMapper skimUserMapper;
	
	@Transactional(readOnly=true)
	public List<CustomerSkimUser> getSkimUserListByUserId(int userId) {
		List<CustomerSkimUser> skimUsers = skimUserMapper.getSkimUserListByUserId(userId);
		return skimUsers;
	}

}
