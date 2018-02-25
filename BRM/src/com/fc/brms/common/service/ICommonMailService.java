package com.fc.brms.common.service;

import com.fc.brms.common.domain.CfgCompany;

public interface ICommonMailService {

	CfgCompany selectCompanyEmailById(int companyId);
}
