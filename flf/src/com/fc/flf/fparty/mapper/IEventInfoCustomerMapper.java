package com.fc.flf.fparty.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.EventInfoCustomer;

public interface IEventInfoCustomerMapper {
	public List<EventInfoCustomer> findEventRemarkByIdToPage(Map<String, Object> map);
	public int findEventRemarkCountById(int cusId);
}
