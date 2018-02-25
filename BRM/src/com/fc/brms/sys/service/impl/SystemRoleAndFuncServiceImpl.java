package com.fc.brms.sys.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.domain.FcSysRoleFunc;
import com.fc.brms.common.util.Page;
import com.fc.brms.sys.mapper.ISystemRoleAndFuncMapper;
import com.fc.brms.sys.service.ISystemRoleAndFuncService;

@Service
public class SystemRoleAndFuncServiceImpl implements ISystemRoleAndFuncService {
	@Resource
	private ISystemRoleAndFuncMapper systemRoleAndFuncMapper;
	
	
	/*查询所有角色功能*/
	@Transactional(readOnly=true)
	public List<FcSysFunc> findAllFunc() {
		List<FcSysFunc> funces = systemRoleAndFuncMapper.selectFcSysFunc();
		for (FcSysFunc f : funces) {
			f.setSon(setTheSon(f));
		}
		return funces;
	}

	/*计算子功能*/
	@Transactional(readOnly=true)
	public int setTheSon(FcSysFunc fcSysFunc) {
		List<FcSysFunc> funces = systemRoleAndFuncMapper.selectFcSysFunc();
		int size=funces.size();
		String funcCode=fcSysFunc.getFuncCode();
		int son=0;
		if(funcCode.length()==13){
			for(int i = 0;i<size ;i++){
				if(funces.get(i).getFuncCode().length()>13 && 
						funces.get(i).getFuncCode().length()<=16 &&
								funces.get(i).getFuncCode().substring(0, 13).equals(funcCode)){
					son++;
				}
			}
		}
		if(funcCode.length()==16){
			for(int i = 0;i<size ;i++){
				if(funces.get(i).getFuncCode().length()>16 && 
						funces.get(i).getFuncCode().length()<=19 &&
								funces.get(i).getFuncCode().substring(0, 16).equals(funcCode)){
					son++;
				}
			}	
		}
		return son;
	}
	
	/*查找公司角色信息*/
	@Transactional(readOnly=true)
	public List<FcSysRole> findCompanySysRole(Page page, int companyId,String keyWord) {
		page.setRecords(systemRoleAndFuncMapper.selectFcSysRoleCount(companyId,keyWord));
		List<FcSysRole> roles = systemRoleAndFuncMapper.selectFcSysRole(companyId, page.getLimit(),keyWord);
		return roles;
	}

	/*添加公司角色*/
	@Transactional
	public void addCompanyRole(FcSysRole role) {
		role.setRoleCode("default");
		systemRoleAndFuncMapper.insertNewRole(role);
		int roleId=(Integer) role.getRoleId();
		systemRoleAndFuncMapper.updateCompanyRoleRoleCode(roleId, "ROLE_"+roleId);

	}

	/*修改公司角色信息*/
	@Transactional
	public void modifyCompanyRole(FcSysRole role) {
		systemRoleAndFuncMapper.updateCompanyRole(role);
	}

	/*删除公司角色信息*/
	@Transactional
	public void deleteCompanyRole(int[] roleIds,int companyId) {
		systemRoleAndFuncMapper.deleteFcSysRoles(roleIds);
		systemRoleAndFuncMapper.deleteCompanyEmpRoleByRoleId(companyId, roleIds);
		
	}

	/*查询公司角色信息及相关功能模块*/
	@Transactional(readOnly=true)
	public FcSysRole findCompanySysRoleWithFunc(int roleId,int companyId) {
		FcSysRole fcSysRole = systemRoleAndFuncMapper.selectFcSysRoleWithFunc(roleId,companyId);
		if(fcSysRole.getFcSysFunces() != null){
			List<FcSysFunc> fcuns = fcSysRole.getFcSysFunces();
			int size1=fcSysRole.getFcSysFunces().size();
			if(size1>0){
				StringBuffer funcIds=new StringBuffer();
				for (FcSysFunc f : fcuns) {
					f.setSon(setTheSon(f));
					funcIds.append(f.getFuncId()).append(",");
				}
				String str=funcIds.toString();
				if(str.length()>0){
					if(',' == str.charAt(str.length()-1)){
						str=str.substring(0, str.length()-1);
					}	
				}
				fcSysRole.setFuncIds(str);
			}
		}
		return fcSysRole;
	}

	/*查询公司角色信息*/
	@Transactional(readOnly=true)
	public List<FcSysRole> findFcSysRoleByRoleId(int[] roleIds) {
		return systemRoleAndFuncMapper.selectFcSysRoleByRoleId(roleIds);
	}

	/*修改公司角色功能模块*/
	@Transactional
	public void changeRoleFunc(List<FcSysRoleFunc> fcSysRoleFunc,FcSysRole fcSysRole) {
		systemRoleAndFuncMapper.deleteFcSysRoleFuncByRoleId(fcSysRole.getRoleId(), fcSysRole.getCompanyId());
		if(fcSysRoleFunc.size() > 0){
			systemRoleAndFuncMapper.insertFcSysRoleFunc(fcSysRoleFunc);
		}
		
	}
}
