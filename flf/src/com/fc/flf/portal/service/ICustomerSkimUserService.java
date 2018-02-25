package com.fc.flf.portal.service;

import java.util.List;

import com.fc.flf.common.domain.CustomerSkimUser;

public interface ICustomerSkimUserService {
	public List<CustomerSkimUser> getSkimUserListByUserId(int userId);
}
