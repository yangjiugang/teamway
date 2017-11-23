package com.teamway.cms.webcontroller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;
import org.fastquery.page.PageableImpl;
import org.fastquery.service.FQuery;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamway.cms.dao.RoleDBService;
import com.teamway.cms.dbentity.Cms_config_rightEntity;
import com.teamway.cms.dbentity.Cms_config_roleEntity;
import com.teamway.cms.dbentity.Cms_config_role_rightEntity;
import com.teamway.cms.dbentity.Cms_config_role_viewsEntity;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.model.DataGridModel;
import com.teamway.cms.model.ResultMessageModel;
import com.teamway.cms.model.ZTreeNodeModel;

@Controller
@RequestMapping("/role") 
public class RoleCtl {

	protected Logger log = Logger.getLogger(RoleCtl.class);
	@RequestMapping("/page")
	public String page(){
		return "role";
	}
	
	@RequestMapping("/getAllRole")
	@ResponseBody
	public DataGridModel getRoleAll(int page,int rows){	
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		Pageable pageable = new PageableImpl(page, rows);
		Page<Cms_config_roleEntity> pages = DBService.findAllRole(pageable);
		DataGridModel model = new DataGridModel();
		model.setRows(pages.getContent());
		model.setTotal(pages.getTotalElements());
		return model;
	}
	
	@RequestMapping("/getRoleLikeRoleName")
	@ResponseBody
	public List<Cms_config_roleEntity> getRoleLikeRoleName(String role_name){
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		role_name = "%"+role_name+"%";
		List<Cms_config_roleEntity> roles = DBService.findRoleLikeRoleName(role_name);
		return roles;
	}
	
	@RequestMapping("/getRoleById")
	@ResponseBody
	public Cms_config_roleEntity getRoleById(String id){
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		Cms_config_roleEntity role = DBService.findRoleById(id);
		return role;
	}
	
	@RequestMapping("/newRole")
	@ResponseBody
	public ResultMessageModel newRole(String role_name,String remark){
		ResultMessageModel ret =  null;
		Date now = new Date(); 
        DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
        String time=format.format(now);
        
        RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
        Cms_config_roleEntity existed_role = DBService.findRoleByRoleName(role_name);
        if(existed_role != null){
			return new ResultMessageModel(-1,role_name +" 账户已存在!");
		}
        
        Cms_config_roleEntity role = DBService.newRole(role_name, time, time, remark);
        if(role != null){
			ret =  new ResultMessageModel(0,"新建角色，成功");
		}else{
			ret =  new ResultMessageModel(-1,"新建角色，不成功");
		}
	
		return ret;
	}
	
	@RequestMapping("/editRole")
	@ResponseBody
	public ResultMessageModel editRole(String id,String role_name,String remark){
		ResultMessageModel ret = null;
		Date now = new Date();
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String time = format.format(now);
		
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		Cms_config_roleEntity existed_role = DBService.findRoleByRoleNameAndId(role_name, id);
		if(existed_role != null){
			return new ResultMessageModel(-1,role_name +"用户已存在!");
		}
		
		Cms_config_roleEntity role = DBService.editRole(role_name, time, remark, id);
		if(role != null){
			ret = new ResultMessageModel(0,"修改角色，成功");
		}else{
			ret = new ResultMessageModel(-1,"修改角色，不成功");
		}
		return ret;
	}
	
	@RequestMapping("/delRole")
	@ResponseBody
	public ResultMessageModel delRole(String ids){
		ResultMessageModel ret = null;
		String strs[] = ids.split(",");
		List<Integer> list_id = new ArrayList<Integer>();
		for(int i=0;i<strs.length;i++){
			list_id.add(Integer.parseInt(strs[i]));
		}
		
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		int flag = DBService.delRole(list_id);
		if(flag>0){
			ret = new ResultMessageModel(0,"删除角色，成功");
		}else{
			ret = new ResultMessageModel(-1,"删除角色，不成功");
		}
		
		return ret;
	}
	
	@RequestMapping("/control_tree")
	@ResponseBody
	public List<ZTreeNodeModel> getControlTree(String role_id){
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		List<Cms_config_rightEntity> rights = DBService.findAllRight();
		
		List<Cms_config_role_rightEntity> roleRights = DBService.findRoleRight(role_id);
		
		List<ZTreeNodeModel> controlTree = new ArrayList<ZTreeNodeModel>();
		ZTreeNodeModel pProj = new ZTreeNodeModel();
		pProj.setId(new Long(0));
		pProj.setPid(new Long(-1));
		pProj.setName("控制权限");
		controlTree.add(pProj);
		Long pid = new Long(0);
		for(Cms_config_rightEntity item:rights){
			ZTreeNodeModel proj = new ZTreeNodeModel();
			proj.setId(item.getId());
			proj.setPid(pid);
			proj.setName(item.getRight_name());
			for(Cms_config_role_rightEntity roleRight:roleRights){
				if(roleRight.getRight_id()==item.getId())
				{
					proj.setChecked(1);
					break;
				}
			}
			controlTree.add(proj);
		}
		return controlTree;
	}
	
	@RequestMapping("/camera_tree")
	@ResponseBody
	public List<ZTreeNodeModel> getCameraTree(HttpServletRequest request,String role_id){
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		List<Cms_res_region_infoEntity> regions = DBService.findAllRegion();
		List<Cms_res_camera_infoEntity> cameras = DBService.findAllCamera();
		
		String str_cameras = DBService.findRoleCameras(role_id);
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		
		
		List<ZTreeNodeModel> cameraTree = new ArrayList<ZTreeNodeModel>();
		for(Cms_res_region_infoEntity region:regions)
		{
			ZTreeNodeModel proj = new ZTreeNodeModel();
			proj.setId(region.getId());
			proj.setPid(region.getPid());
			proj.setName(region.getName());
			proj.setIcon(basePath+"images/region_icon/"+region.getIcon());
			cameraTree.add(proj);
		}
		
		for(Cms_res_camera_infoEntity camera:cameras)
		{
			ZTreeNodeModel proj = new ZTreeNodeModel();
			proj.setResCode(camera.getCode());
			proj.setId(camera.getId());
			proj.setPid(camera.getRegion_id());
			proj.setName(camera.getName());
			if(str_cameras!=null && str_cameras.contains(camera.getCode()+"")){
				proj.setChecked(1);
			}
			cameraTree.add(proj);
		}
		return cameraTree;
	}
	
	@RequestMapping("/save_permission")
	@ResponseBody
	public ResultMessageModel savePermission(String roleId,String rolePermissionIds,String roleResourceorgIds)
	{
		ResultMessageModel ret = null;
		
		Date now = new Date();
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String time = format.format(now);
		
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		
		int role_id = 0;
		if(roleId != null){
			role_id = Integer.parseInt(roleId);
		}
		String str_controls[] = rolePermissionIds.split(",");
		List<Integer> list_control = new ArrayList<Integer>();
		for(int i=0;i<str_controls.length;i++){
			list_control.add(Integer.parseInt(str_controls[i]));
		}
		
		for(Integer i:list_control){
			Cms_config_role_rightEntity node = DBService.findRoleRightByRoleRight(role_id, i);
			if(node==null){
				node = DBService.newRoleRight(role_id, i, time, time);
			}
		}
		
		DBService.delRoleRight(role_id, list_control);
		
		Cms_config_role_viewsEntity roleView = DBService.findRoleViews(role_id);
		if(roleView==null){
			roleView = DBService.newRoleViews(role_id, roleResourceorgIds, time, time);
			if(roleView==null){
				ret = new ResultMessageModel(-1,"权限配置，不成功");
			}else{
				ret = new ResultMessageModel(0,"权限配置，成功");
			}
		}else{
			int result = DBService.editRoleViews(roleResourceorgIds, time, role_id);
			if(result<1){
				ret = new ResultMessageModel(-1,"权限配置，不成功");
			}else{
				ret = new ResultMessageModel(0,"权限配置，成功");
			}
		}
		
		return ret;
	}
}
