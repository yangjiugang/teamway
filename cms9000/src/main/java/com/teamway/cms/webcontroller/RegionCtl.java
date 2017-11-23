package com.teamway.cms.webcontroller;

import java.util.ArrayList;
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

import com.teamway.cms.dao.RegionInfoDBService;
import com.teamway.cms.dao.ServerDBService;
import com.teamway.cms.dao.UserDBService;
import com.teamway.cms.dbentity.Cms_config_roleEntity;
import com.teamway.cms.dbentity.Cms_config_userEntity;
import com.teamway.cms.dbentity.Cms_config_user_roleEntity;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;
import com.teamway.cms.model.DataGridModel;
import com.teamway.cms.model.ResultMessageModel;
import com.teamway.cms.model.UserModel;
import com.teamway.cms.model.ZTreeNodeModel;
import com.teamway.cms.pgcleint.ReturnVector;
import com.teamway.cms.pgserver.PgSendQueue;
import com.teamway.cms.pgserver.TaskBean;
import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;


@Controller
@RequestMapping("/region") 
public class RegionCtl {

	protected Logger log = Logger.getLogger(RegionCtl.class);
	@RequestMapping("/page")
	public String page(){
		return "region";
	}
		
	
	@ResponseBody
	@RequestMapping("/region_tree")
	public List<ZTreeNodeModel> region_tree(HttpServletRequest request){
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);
		List<Cms_res_region_infoEntity> list = DBService.findAll();
		
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		
		List<ZTreeNodeModel> cameraTree = new ArrayList<ZTreeNodeModel>();
		for(Cms_res_region_infoEntity region:list)
		{
			ZTreeNodeModel proj = new ZTreeNodeModel();
			proj.setId(region.getId());
			proj.setPid(region.getPid());
			proj.setName(region.getName());
			proj.setOpen(1);
			proj.setIcon(basePath+"images/region_icon/"+region.getIcon());
			cameraTree.add(proj);
		}
		return cameraTree;
	}

	
	@ResponseBody
	@RequestMapping("/reg_camera")
	public ResultMessageModel region_add(int region_id,String codes){
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);
		String[] id_array = codes.split(",");
		List<String> list = java.util.Arrays.asList(id_array);

		if(DBService.updateCameraRegion(region_id,list)){
			return new ResultMessageModel();
		}else{
			return new ResultMessageModel(-1,"error");
		}
	}
	
	
	@ResponseBody
	@RequestMapping("/unRegCamera")
	public ResultMessageModel unRegCamera(String codes){
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);
		String[] id_array = codes.split(",");
		List<String> list = java.util.Arrays.asList(id_array);

		if(DBService.updateUnCameraRegion(list)){
			return new ResultMessageModel();
		}else{
			return new ResultMessageModel(-1,"error");
		}
	}	
	
	
	
	
	@ResponseBody
	@RequestMapping("/reg_dev_tree")
	public List<ZTreeNodeModel> reg_dev_tree(){
		
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);
		
		List<Cms_res_server_infoEntity> server_list = DBService.findAllServer();
		
		List<Cms_res_camera_infoEntity> camera_list = DBService.findAllUnRegCamera();

		List<ZTreeNodeModel> cameraTree = new ArrayList<ZTreeNodeModel>();
		long  index = 1;
		ZTreeNodeModel root = new ZTreeNodeModel();
		root.setId(index);
		root.setPid(0L);
		root.setOpen(1);
		root.setName("摄像机列表");
		cameraTree.add(root);
		index++;
		for(Cms_res_server_infoEntity server:server_list)
		{
			ZTreeNodeModel node = new ZTreeNodeModel();
			node.setPid(1L);
			node.setId(index);
			node.setName(server.getName());
			node.setOpen(1);
			node.setRealId(server.getId());
		
			cameraTree.add(node);
	        long   ppid= index;
			for(Cms_res_camera_infoEntity camera : camera_list){
				if(camera.getServer_id().equals(server.getId())){
					ZTreeNodeModel cam_node = new ZTreeNodeModel();
					cam_node.setPid(ppid);
					index ++;
					cam_node.setId(index);
					cam_node.setName(camera.getName());
					cam_node.setOpen(1);
					cam_node.setRealId(camera.getId().intValue());
					cam_node.setResCode(camera.getCode());
					cameraTree.add(cam_node);
				}
			}
		}
		return cameraTree;
	}
	
	
	
	
	@RequestMapping("/get_camera_by_region_id")
	@ResponseBody
	public 	DataGridModel  getCameraByRegionId(HttpServletRequest request,int page,int rows){
		String region_id = request.getParameter("queryMap[region_id]");

		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);
		Pageable pageable = new PageableImpl(page, rows);
		Page<Cms_res_camera_infoEntity> pages = DBService.getCameraByRegionId(region_id,pageable);
		DataGridModel model = new DataGridModel();
		model.setRows(pages.getContent());
		model.setTotal(pages.getTotalElements());
		return model;
	}

	@ResponseBody
	@RequestMapping("/region_add")
	public ResultMessageModel region_add(int id,String name,String remark,String icon){
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);
		if(DBService.add(id,name,remark,icon)){
			return new ResultMessageModel();
		}else{
			return new ResultMessageModel(-1,"error");
		}
	}	

	@ResponseBody
	@RequestMapping("/region_find_by_id")
	public Cms_res_region_infoEntity region_find_by_id(int id){
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);
		return DBService.findById(id);
	}	
	@ResponseBody
	@RequestMapping("/region_del_by_id")
	public ResultMessageModel region_del_by_id(int id){
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);

		region_del(DBService,(long)id);


		return new ResultMessageModel();

	}	

	public boolean region_del(RegionInfoDBService DBService ,Long id){

		List<Cms_res_region_infoEntity> list =  DBService.findByPid(id);
		for(Cms_res_region_infoEntity item : list){
			region_del(DBService,item.getId());
		}
		DBService.deleteById( new Long(id).intValue());
		return true;
	}
	
	@ResponseBody
	@RequestMapping("/region_update")
	public ResultMessageModel region_update(int id,String name,String remark,String icon){
		RegionInfoDBService DBService = FQuery.getRepository(RegionInfoDBService.class);

		if(DBService.region_update(name,remark,id,icon)){
			return new ResultMessageModel();
		}else{
			return new ResultMessageModel(-1,"error");
		}
	}

}
