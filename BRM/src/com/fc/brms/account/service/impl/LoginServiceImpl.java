package com.fc.brms.account.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.account.mapper.LoginMapper;
import com.fc.brms.account.service.ILoginService;
import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysVisitor;

/**
 * 登录service实现类
 * 
 * @author eddy song
 * @version 1.0 2012-03-27
 */
@Service
public class LoginServiceImpl implements ILoginService {

	@Resource
	private LoginMapper loginMapper;
	
	@Transactional(readOnly = true)
	public FcSysVisitor getVisitorById(String loginName) {
		return loginMapper.getVisitorById(loginName);
	}
	
	@Transactional(readOnly = true)
	public List<FcSysFunc> getVisitorFunctionsbyId(String loginName){
		return loginMapper.getVisitorFunctionsbyId(loginName);
	}
}
