package com.fc.brms.sys.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.CfgPostJoblevel;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.sys.service.ISystemRoleAndFuncService;
import com.fc.brms.sys.service.ISystemSetService;

@Controller
public class SystemSettingsController {
	@Resource
	private ISystemRoleAndFuncService sysRoleAndFuncService;
	@Resource
	private ISystemSetService systemSetService;
	@RequestMapping(value = "/system_settings")
	public String systemSettings(Model model,HttpServletRequest request) throws Exception {
		return "/systemsetting/SystemSettingsLeft";
	}
	
	@RequestMapping(value = "/systemSettingsDefaultRight")
	public String systemSettingsDefaultRight(Model model,HttpServletRequest request) throws Exception {
		return "/systemsetting/SystemSettingsDefaultRight";
	}
	@RequestMapping(value = "/rightsSetting")
	public String rightsSetting(){
		return "/systemsetting/RightsSettingDefaultPage";
	}
	/*@RequestMapping(value = "/rysz")
	public String rysz(Model model,HttpServletRequest request) throws Exception {
		return "/homepage/rysz";
	}*/
	
	@RequestMapping(value = "/rolesList")
	public String rolesList(Model model,String roleIds){
		String[] ids = roleIds.split(",");
		int [] ids1=new int[ids.length];
		for (int i=0; i<ids.length ; i++) {
			ids1[i]=Integer.parseInt(ids[i]);
		}
		/*List<FcSysRole> roles=fcSysRoleService.findCompanySysRoleWithFunc(ids1,companyId);
		List<FcSysFunc> allFunces = fcSysFuncService.findAllFunc();
		model.addAttribute("roles", roles);
		model.addAttribute("allFunces", allFunces);*/
		List<FcSysRole> roles = sysRoleAndFuncService.findFcSysRoleByRoleId(ids1);
		model.addAttribute("roles", roles);
		return "/systemsetting/RolesList";
	}
	/*-------------职系设置--------------------*/
	@RequestMapping(value="/systemGradeSet")
	public String systemGradeSet(){
		return"/systemsetting/SystemGradeSet";
	}
	/*查询职系信息*/
	@RequestMapping(value="/selectJobGrade")
	@ModelAttribute("rows")
	public List<CfgPost> selectJobGrade(CfgPost cjg,Page page){
		List<CfgPost> list = systemSetService.selectJobGrade(cjg, page);
		return list;
	}
	/*添加职系*/
	@RequestMapping(value="/addSysGrade")
	public String addSysGrade(){
		return"/systemsetting/AddSysGrade";
	}
	/*保存职系信息*/
	@RequestMapping(value="/saveSysGrade")
	public void insertJobGrade(CfgJobGrade cjg,HttpServletRequest request) throws Exception{
		cjg.setJobGradeNo("ZX1204010001");
		cjg.setCreateTime(new Date());
		cjg.setCreateUser(SessionInfo.getVisitorId(request));
		cjg.setLastUpdateTime(new Date());
		cjg.setLastUpdateUser(SessionInfo.getVisitorId(request));
		cjg.setCompanyId(SessionInfo.getCompanyId(request));
		systemSetService.insertJobGrade(cjg);
	}
	/*根据id查找相应职系*/
	@RequestMapping(value="/updataGrade")
	public String updataGrade(Model model,int gradeId){
		model.addAttribute("grade", systemSetService.selectJobGradeById(gradeId));
		return "/systemsetting/UpdataSysGrade";
	}
	/*修改并保存职系*/
	@RequestMapping(value="/updataSysGrade")
	public void updataSysGrade(CfgJobGrade cjg,HttpServletRequest request) throws Exception{
		cjg.setLastUpdateTime(new Date());
		cjg.setLastUpdateUser(SessionInfo.getVisitorId(request));
		systemSetService.updataJobGrade(cjg);
	}
	/*根据id删除职系*/
	@RequestMapping(value="/deleteJobGrade")
	public void deleteJobGrade(String gradeId){
		Integer[]ids = CommonUtil.getIntegers(gradeId);
		for(int id:ids){
			systemSetService.deleteJobGrade(id);
		}
	}
	/*--------职等职级设置------------*/
	@RequestMapping(value="/SystemJobLevelSet")
	public String SystemJobLevelSet(){
		return"/systemsetting/SystemJobLevelSet";
	}
	@ModelAttribute("rows")
	@RequestMapping(value="/selectJobLevel")
	public List<CfgPost> selectJobLevel(CfgPost cjg,Page page){
		List<CfgPost> list =systemSetService.selectJobLevel(cjg, page);
		return list;
	}
	/*---添加职等职级--*/
	@RequestMapping(value="/addJobLevel")
	public String addJobLevel(Model model){
		model.addAttribute("jobGrade",systemSetService.selectJobGradeName());
		return "/systemsetting/AddSysJobLevel";
	}
	/*----保存职等职级信息------*/
	@RequestMapping(value="/saveSysJobLevel")
	public void insertJobLevel(CfgJobLevel cjl, String postId,HttpServletRequest request) throws Exception{
		cjl.setCreateTime(new Date());
		cjl.setCreateUser(SessionInfo.getVisitorId(request));
		cjl.setLastUpdateTime(new Date());
		cjl.setLastUpdateUser(SessionInfo.getVisitorId(request));
		cjl.setCompanyId(SessionInfo.getCompanyId(request));
		systemSetService.insertJobLevel(cjl);
		
		//保存职级对应的岗位到cfg_post_joblevel岗位与职级关系表中
		CfgPostJoblevel cpj = new CfgPostJoblevel();
		cpj.setJobLevelId(cjl.getJobLevelId());
		cpj.setCompanyId(SessionInfo.getCompanyId(request));
		Integer[] ids = CommonUtil.getIntegers(postId);
		for(int pId:ids){
			cpj.setPostId(pId);
			systemSetService.insertPostJoblevel(cpj);
		}
		
	}
	/*----根据id查询职级信息----*/
	@RequestMapping(value="/updataJobLevel")
	public String updataJobLevel(Model model,int jobLevelId){
		model.addAttribute("jobGrade",systemSetService.selectJobGradeName());
		model.addAttribute("jodLevel", systemSetService.selectJobLevelById(jobLevelId));
		return"/systemsetting/UpdataSysJobLevel";
	}
	/*修改并保存职等职级*/
	@RequestMapping(value="/updataSysJobLevel")
	public void updataSysGrade(CfgJobLevel cjl ,String postId,HttpServletRequest request) throws Exception{
		cjl.setLastUpdateTime(new Date());
		cjl.setLastUpdateUser(SessionInfo.getVisitorId(request));
		systemSetService.updataJobLevel(cjl);
		
		//修改职级对应的岗位到cfg_post_joblevel岗位与职级关系表中
		CfgPostJoblevel cpj = new CfgPostJoblevel();
		cpj.setJobLevelId(cjl.getJobLevelId());
		Integer[] ids = CommonUtil.getIntegers(postId);
		for(int pId:ids){
			cpj.setPostId(pId);
			systemSetService.updataPostJoblevel(cpj);
		}
	}
	/*根据id删除职等职级*/
	@RequestMapping(value="/deleteJobLevel")
	public void deleteJobLevel(String jobLevelId){
		Integer []ids = CommonUtil.getIntegers(jobLevelId);
		for(int id:ids){
		systemSetService.deleteJobLevel(id);
		}
	}
}
