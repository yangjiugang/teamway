package com.fc.flf.fparty.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.EventInfoCustomer;

public interface IEventInfoCustomerService {
	public List<EventInfoCustomer> findEventRemarkByIdToPage(Map<String, Object> map);
	public int findEventRemarkCountById(int cusId);
}
