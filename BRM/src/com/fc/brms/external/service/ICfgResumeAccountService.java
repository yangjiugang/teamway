package com.fc.brms.external.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.CfgResumeAccount;

/**
 * 
 * @author 邓祥
 * 简历账号关联配置服务类
 * @version 2012-3-30
 */

public interface ICfgResumeAccountService {
	
	/**
	 * 简历账号关联 列表
	 * @return
	 */
	public List<CfgResumeAccount> cfgResumeAccountList(int companyId, int accountStatus);

	/**
	 * 根据ID查询简历账号关联
	 * @param accountId
	 * @return
	 */
	public CfgResumeAccount cfgResumeAccountById(int accountId);
	
	/**
	 * 保存
	 * @param recruitTask
	 */
	public void insertCfgResumeAccount(CfgResumeAccount cfgResumeAccount);
	
	/**
	 * 更新
	 * @param recruitTask
	 */
	public void updateCfgResumeAccount(CfgResumeAccount cfgResumeAccount);
	
	/**
	 * 是否关联 简历账号
	 * @param accountId
	 * @param accountStatus
	 */
	public void closeCfgResumeAccount(Map strMap);
}
