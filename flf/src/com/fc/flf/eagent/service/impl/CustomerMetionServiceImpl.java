package com.fc.flf.eagent.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.CustomerMention;
import com.fc.flf.eagent.mapper.ICustomerMentionMapper;
import com.fc.flf.eagent.service.ICustomerMetionService;

@Service
public class CustomerMetionServiceImpl implements ICustomerMetionService {
	@Resource
	private ICustomerMentionMapper customerMentionMapper;

	
	public List<CustomerMention> findCustomerMentionByUserId(int userId,
			String limit) {
		return customerMentionMapper.selectCustomerMentionByUserId(userId, limit);
	}


	public int findCustomerMentionCountByUserId(int userId) {
		return customerMentionMapper.selectCustomerMentionCountByUserId(userId);
	}


	public void delCusMetionByMetionId(int mentionId) {
		customerMentionMapper.deletCusMentionById(mentionId);
	}


	@Override
	public CustomerMention findCustomerMetionById(int mentionId) {
		return customerMentionMapper.selectCustomerMetionById(mentionId);
	}

}
