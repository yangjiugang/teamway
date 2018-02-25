package com.fc.flf.account.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.account.mapper.LoginMapper;
import com.fc.flf.account.service.ILoginService;
import com.fc.flf.common.domain.FcSysVisitor;

/**
 * 登录service
 * 
 * @author eddy song
 * @version 1.0 2012-01-11
 */

@Service
public class LoginServiceImpl implements ILoginService {

	@Resource
	private LoginMapper loginMapper;
	
	@Transactional(readOnly = true)
	public FcSysVisitor getVisitorById(String loginId) {
		return loginMapper.getVisitorById(loginId);
	}
	
	@Transactional(readOnly = true)
	public FcSysVisitor checkEmail(String email){
		return loginMapper.checkEmail(email);
	}
	
	public void updateVisitorLoginInfo(FcSysVisitor visitor){
		loginMapper.updateVisitorLoginInfo(visitor);
	}
	
	public void updateLoginStatus(FcSysVisitor visitor){
		loginMapper.updateLoginStatus(visitor);
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateUserPassword(FcSysVisitor visitor){
		loginMapper.updateUserPassword(visitor);
	}
}
