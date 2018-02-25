package com.fc.flf.account.service;

import com.fc.flf.common.domain.FcSysVisitor;

/**
 * 登录接口
 * 
 * @author eddy song
 * @version 1.0 2012-01-11
 */

public interface ILoginService {

	/**
	 * 通过登录名查询用户信息
	 * @param loginId
	 * @return
	 */
	 FcSysVisitor getVisitorById(String loginId);
	 
	 /**
	  * 检查用户email是否存在
	  * @param email
	  * @return
	  */
	 FcSysVisitor checkEmail(String email);
	 
	 /**
	  * 更新用户登录信息
	  * @param visitor
	  */
	 void updateVisitorLoginInfo(FcSysVisitor visitor);
	 
	 /**
	  * 更新用户在线状态
	  */
	 void updateLoginStatus(FcSysVisitor visitor);
	 
	 /**
	  * 更新用户密码
	  */
	 void updateUserPassword(FcSysVisitor visitor);
}
