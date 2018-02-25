package com.fc.flf.eagent.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.eagent.mapper.IYjbRegisterMapper;
import com.fc.flf.eagent.service.IYjbRegisterService;

@Service
public class YjbRegisterServiceImpl implements IYjbRegisterService{
	@Resource
	private IYjbRegisterMapper yjbrm;
	
	public int insert(FcSysVisitor fcSysVisitor) {
		try{
			yjbrm.insert(fcSysVisitor);
			return 1;
		}catch(Exception e){
			return 0;			
		}
	}
	@Transactional(readOnly = true)
	public int verify(String visitorName) {		
		return yjbrm.verify(visitorName);
	}
	@Transactional(readOnly = true)
	public int verifyEmail(String visitorEmail) {
		return yjbrm.verifyEmail(visitorEmail);
	}
	@Transactional(readOnly = true)
	public int verifyPhone(String visitorPhone) {
		return yjbrm.verifyPhone(visitorPhone);
	}
	
	public void updateVisitorStatus(String mail) {
		yjbrm.updateVisitorStatus(mail);
	}


}
