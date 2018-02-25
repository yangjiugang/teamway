package com.fc.brms.common.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.common.domain.CfgCompany;
import com.fc.brms.common.mapper.IOrgStructureMapper;
import com.fc.brms.common.service.ICommonMailService;

@Service
public class CommonMailServiceImpl implements ICommonMailService {

	@Resource
	private IOrgStructureMapper companyMapper;
	
	public CfgCompany selectCompanyEmailById(int companyId){
		return companyMapper.selectCompanyEmailById(companyId);
	}
}
