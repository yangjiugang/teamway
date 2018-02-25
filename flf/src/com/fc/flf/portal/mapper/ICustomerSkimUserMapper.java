package com.fc.flf.portal.mapper;

import java.util.List;

import com.fc.flf.common.domain.CustomerSkimUser;

public interface ICustomerSkimUserMapper {
	public List<CustomerSkimUser> getSkimUserListByUserId(int userId);
}
