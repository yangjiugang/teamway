package com.fc.flf.fparty.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.EventInfoCustomer;
import com.fc.flf.fparty.mapper.IEventInfoCustomerMapper;
import com.fc.flf.fparty.mapper.IEventInfoMapper;
import com.fc.flf.fparty.service.IEventInfoCustomerService;

@Service
public class EventInfoCustomerServiceImpl implements IEventInfoCustomerService {

	@Resource
	private IEventInfoCustomerMapper eventInfoCustomerMapper;
	@Resource
	private IEventInfoMapper eventInfoMapper;
	
	@Transactional(readOnly=true)
	public List<EventInfoCustomer> findEventRemarkByIdToPage(
			Map<String, Object> map) {
		List<EventInfoCustomer> eICustomerList = eventInfoCustomerMapper.findEventRemarkByIdToPage(map);
		for (int i = 0; i < eICustomerList.size(); i++) {
			if(eICustomerList.get(i)!=null){
				List<EventInfo> eventInfo = eICustomerList.get(i).getEventInfo();
				if(eventInfo==null)
					eventInfo=new ArrayList<EventInfo>();
				
				int id=eICustomerList.get(i).getEventId();
				EventInfo entity=eventInfoMapper.getEventInfoById(id);
				eventInfo.add(entity);
				eICustomerList.get(i).setEventInfo(eventInfo);
			}
		}
		return eICustomerList;
	}

	@Transactional(readOnly=true)
	public int findEventRemarkCountById(int cusId) {
		// TODO Auto-generated method stub
		return eventInfoCustomerMapper.findEventRemarkCountById(cusId);
	}

}
