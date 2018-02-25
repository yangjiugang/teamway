package com.fc.flf.fparty.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.fparty.mapper.IRegisterMapper;
import com.fc.flf.fparty.service.IRegisterService;

@Service
public class RegisterServiceImpl implements IRegisterService{
	@Resource
	private IRegisterMapper rm;
	
	public int insert(FcSysVisitor fcSysVisitor) {
		try{
			rm.insert(fcSysVisitor);
			return 1;
		}catch(Exception e){
			return 0;			
		}
	}
	@Transactional(readOnly = true)
	public int verify(String visitorName) {		
		return rm.verify(visitorName);
	}
	@Transactional(readOnly = true)
	public int verifyEmail(String visitorEmail) {
		return rm.verifyEmail(visitorEmail);
	}
	@Transactional(readOnly = true)
	public int verifyPhone(String visitorPhone) {
		return rm.verifyPhone(visitorPhone);
	}
	
	public void updateVisitorStatus(String mail) {
		rm.updateVisitorStatus(mail);
	}


}
