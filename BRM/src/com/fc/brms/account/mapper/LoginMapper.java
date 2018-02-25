package com.fc.brms.account.mapper;

import java.util.List;

import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysVisitor;

public interface LoginMapper {
	FcSysVisitor getVisitorById(String loginName);

	List<FcSysFunc> getVisitorFunctionsbyId(String loginName);
	
}
