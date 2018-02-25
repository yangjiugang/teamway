package com.fc.flf.account.mapper;

import com.fc.flf.common.domain.FcSysVisitor;

/**
 * 登录mapper
 * 
 * @author eddy song
 * @version 1.0 2012-01-11
 */
public interface LoginMapper {
	
	FcSysVisitor getVisitorById(String loginId);
	
	FcSysVisitor checkEmail(String email);
	
	void updateVisitorLoginInfo(FcSysVisitor visitor);
	
	void updateLoginStatus(FcSysVisitor visitor);
	
	void updateUserPassword(FcSysVisitor visitor);
}
