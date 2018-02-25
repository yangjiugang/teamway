package com.fc.brms.sys.service;

import java.util.List;

import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.domain.FcSysRoleFunc;
import com.fc.brms.common.util.Page;

public interface ISystemRoleAndFuncService {
	public List<FcSysFunc> findAllFunc();
	
	public int setTheSon(FcSysFunc fcSysFunc);
	
	public List<FcSysRole> findCompanySysRole(Page page,int companyId,String keyWord);

	public void addCompanyRole(FcSysRole role);

	public void modifyCompanyRole(FcSysRole role);

	public void deleteCompanyRole(int[] roleIds,int companyId);

	public FcSysRole findCompanySysRoleWithFunc(int roleId,int companyId);
	
	public List<FcSysRole> findFcSysRoleByRoleId(int[] roleIds);
	
	public void changeRoleFunc(List<FcSysRoleFunc> fcSysRoleFunc,FcSysRole fcSysRole);
}
