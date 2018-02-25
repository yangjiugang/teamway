package com.fc.flf.eagent.mapper;


import com.fc.flf.common.domain.FcSysVisitor;

public interface IYjbRegisterMapper {
	
	
   /**
    * 注册用户
    * @param fcSysVisitor
    */
	public void insert (FcSysVisitor fcSysVisitor);
	
	/**
	 * 验证用户名是否重复
	 * @param visitorName
	 * @return
	 */
	public int verify(String visitorName);
	
	/**
	 * 验证EMail是否重复
	 * @param email
	 * @return
	 */
	public int verifyEmail(String email);
	
	
	/**
	 * 验证电话是否重复
	 * @param phone
	 * @return
	 */
	public int verifyPhone(String phone);
	
	
	/**
	 * 根据用户邮箱激活用户状态
	 * @param mail
	 */
	public void updateVisitorStatus(String mail);
}
