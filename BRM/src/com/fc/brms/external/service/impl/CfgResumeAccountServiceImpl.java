package com.fc.brms.external.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.fc.brms.common.domain.CfgResumeAccount;
import com.fc.brms.external.mapper.ICfgResumeAccountMapper;
import com.fc.brms.external.service.ICfgResumeAccountService;

/**
 * 
 * @author 邓祥
 * 简历账号关联配置
 * @version 2012-3-30
 */
@Service
public class CfgResumeAccountServiceImpl implements ICfgResumeAccountService {
	
	@Resource
	ICfgResumeAccountMapper iCfgResumeAccountMapper ;
	
	@Override
	public CfgResumeAccount cfgResumeAccountById(int accountId) {
		
		return iCfgResumeAccountMapper.cfgResumeAccountById(accountId);
	}
	
	@Override
	public List<CfgResumeAccount> cfgResumeAccountList(int companyId, int accountStatus) {
		
		return iCfgResumeAccountMapper.cfgResumeAccountList(companyId,accountStatus);
	}
	
	@Override
	public void insertCfgResumeAccount(CfgResumeAccount cfgResumeAccount) {
		iCfgResumeAccountMapper.insertCfgResumeAccount(cfgResumeAccount);
		
	}
	
	@Override
	public void updateCfgResumeAccount(CfgResumeAccount cfgResumeAccount) {
		iCfgResumeAccountMapper.updateCfgResumeAccount(cfgResumeAccount);
		
	}
	
	@Override
	public void closeCfgResumeAccount(Map strMap) {

		iCfgResumeAccountMapper.closeCfgResumeAccount(strMap);
		
	}

}
