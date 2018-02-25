package com.fc.flf.eagent.service;

import com.fc.flf.common.domain.FcSysVisitor;

public interface IYjbRegisterService {
	/**
	 * 注册用户
	 * @param fcSysVisitor
	 */
	public int insert (FcSysVisitor customer);
	
	/**
	 * 验证用户名是否重复
	 * @param visitorName
	 * @return
	 */
	public int verify (String visitorName);
	
	/**
	 * 验证EMail是否重复
	 * @param email
	 * @return
	 */
	public int verifyEmail (String visitorEmail);
	
	/**
	 * 验证电话是否重复
	 * @param phone
	 * @return
	 */
	public int verifyPhone (String visitorPhone);
	
	/**
	 * 根据用户邮箱激活用户状态
	 * @param mail
	 */
	public void updateVisitorStatus(String mail);

}
