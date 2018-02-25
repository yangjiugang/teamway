package com.fc.brms.account.service;

import java.util.List;

import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysVisitor;

/**
 * 登录service
 * 
 * @author eddy song
 * @version 1.0 2012-03-27
 */
public interface ILoginService {

	/** 
	 * 查询用户信息
	 * @param loginName
	 * @return
	 */
	FcSysVisitor getVisitorById(String loginName);

	/** 
	 * 查询用户功能码
	 * @param loginName
	 * @return
	 */
	List<FcSysFunc> getVisitorFunctionsbyId(String loginName);
}
