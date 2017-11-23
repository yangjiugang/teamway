package com.teamway.cms.webcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.teamway.cms.dao.TourDBService;
import com.teamway.cms.dao.WatchDBService;

import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_camera_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_infoEntity;
import com.teamway.cms.model.DataGridModel;
import com.teamway.cms.model.ResultMessageModel;
import com.teamway.cms.model.TourCfgModel;
import com.teamway.cms.model.ZTreeNodeModel;


/*
 * 轮巡预案配置控制器
 */
@Controller
@RequestMapping("/tour") 
public class TourCtl {

	protected Logger log = Logger.getLogger(TourCtl.class);
	@RequestMapping("/page")
	public String page(){
		return "tour";
	}
	@RequestMapping("/saveCameraList")
	@ResponseBody
	public ResultMessageModel saveCameraList(String resCodes,String tour_id){
		ResultMessageModel ret = null;
		WatchDBService DBService = FQuery.getRepository(WatchDBService.class);
		String[]  arr =  resCodes.split(",");
		for(String rescode : arr)
		{
			Cms_res_tour_camera_cfg_infoEntity  info =	DBService.getTourCfgByIdCode(tour_id,rescode);
			if(info == null){
				DBService.addTourCamreaCfg(tour_id, rescode, "");
			}
		}
		ret = new ResultMessageModel(0,"添加摄像机配置完成！");
		return ret;
	}
	
	@RequestMapping("/updateIndexById")
	@ResponseBody
	public ResultMessageModel updateIndexById(String tour_cfg_id,String index){
		ResultMessageModel ret = null;
		WatchDBService DBService = FQuery.getRepository(WatchDBService.class);
		
		Cms_res_tour_camera_cfg_infoEntity info =	DBService.updateTourCfgIndex(Integer.parseInt(index), Integer.parseInt(tour_cfg_id));
		ret = new ResultMessageModel(0,"添加预置位成功！");
		return ret;
	}
	
	
	
	@RequestMapping("/getAllTourCdfById")
	@ResponseBody
	public List<TourCfgModel> getAllTourCdfById(HttpServletRequest request){	
		String tour_id= request.getParameter("queryMap[tour_id]");
		List<TourCfgModel>  list = new ArrayList<TourCfgModel>();
		if(tour_id.equals("-1")){
			return list;
		}
		WatchDBService DBService = FQuery.getRepository(WatchDBService.class);
		List<Cms_res_tour_camera_cfg_infoEntity>  cfgs = DBService.getAllTourCdfById(tour_id);
		
		if(cfgs.size() == 0){
			return list;
		}
		
		List<String> codes =new ArrayList<String>();
		for(Cms_res_tour_camera_cfg_infoEntity cfg :  cfgs){
			codes.add(cfg.getCode());
		}
		List<Cms_res_camera_preset_infoEntity>  presets = DBService.getPresetInfoByCode(codes );
		
		RoleDBService dbs = FQuery.getRepository(RoleDBService.class);
		List<Cms_res_region_infoEntity> regions = dbs.findAllRegion();
		List<Cms_res_camera_infoEntity> cameras = dbs.findAllCameraByCode(codes);
		Map<String,String> maps_reg = new HashMap<String,String>();
		
		Map<String,String> maps_name = new HashMap<String,String>();
		
		for(Cms_res_camera_infoEntity cam :  cameras){
			for(Cms_res_region_infoEntity reg :regions){
				if(reg.getId().equals(cam.getRegion_id())){
					maps_reg.put(cam.getCode(),reg.getName());
				}
			} 
			maps_name.put(cam.getCode(), cam.getName());
		}
		
		for(Cms_res_tour_camera_cfg_infoEntity cfg :  cfgs){
			TourCfgModel model = new TourCfgModel();
			model.setId(cfg.getId());
			model.setGmt_modifield(cfg.getGmt_modifield());
			model.setIndex(cfg.getIndex());
			model.setCode(cfg.getCode());
			
			for(Cms_res_camera_preset_infoEntity pre :presets){
				if(pre.getCamera_code().equals(cfg.getCode()) && pre.getPreset_index().equals(cfg.getIndex()) ){
					model.setIndexName(pre.getName());
				}
			}
			
			model.setName(maps_name.get(cfg.getCode()));
			model.setRegion(maps_reg.get(cfg.getCode()));
			list.add(model);
		}
		return list;
	}
	
	@RequestMapping("/getPresetIndexByCode")
	@ResponseBody
	public List<TourCfgModel> getPresetIndexByCode(HttpServletRequest request){
		String code= request.getParameter("queryMap[code]");
		String id= request.getParameter("queryMap[tour_cfg_id]");
		List<TourCfgModel>  list = new ArrayList<TourCfgModel>();
		
		if(code.equals("") || code.equals("null") || code==null)
			return list;
		
		WatchDBService DBService = FQuery.getRepository(WatchDBService.class);
		List<String> codes = new ArrayList<String>();
		codes.add(code);
		List<Cms_res_camera_preset_infoEntity>  presets = DBService.getPresetInfoByCode(codes  );
		for(Cms_res_camera_preset_infoEntity pre : presets ){
			TourCfgModel model = new TourCfgModel();
			model.setIndex(pre.getPreset_index());
			model.setIndexName(pre.getName());
			model.setId(Long.parseLong(id));
			list.add(model);
		}
		return list;
	}
	
	
	
	
	
	@RequestMapping("/camera_tree")
	@ResponseBody
	public List<ZTreeNodeModel> getCameraTree(HttpServletRequest request,String ids){
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		List<Cms_res_region_infoEntity> regions = DBService.findAllRegion();
		List<Cms_res_camera_infoEntity> cameras = DBService.findAllCamera();
		
		//String str_cameras = DBService.findRoleCameras(role_id);
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
			cameraTree.add(proj);
		}
		return cameraTree;
	}

	@RequestMapping("/getAllTour")
	@ResponseBody
	public DataGridModel getAllTour(String	 page,String rows){	
		TourDBService DBService = FQuery.getRepository(TourDBService.class);
		Pageable pageable = new PageableImpl(1,999);
		Page<Cms_res_tour_infoEntity> pages = DBService.findAllTour(pageable);
		DataGridModel model = new DataGridModel();
		model.setRows(pages.getContent());
		model.setTotal(pages.getTotalElements());
		return model;
	}


	@RequestMapping("/getTourById")
	@ResponseBody
	public Cms_res_tour_infoEntity getTourById(String id){
		TourDBService DBService = FQuery.getRepository(TourDBService.class);
		Cms_res_tour_infoEntity info = DBService.getTourById(id);
		return info;
	}


	@RequestMapping("/addTour")
	@ResponseBody
	public ResultMessageModel addTour(String id,String name,String remark,int interval){
		ResultMessageModel ret = null;
		TourDBService DBService = FQuery.getRepository(TourDBService.class);
		Cms_res_tour_infoEntity info = DBService.addTour(name, interval ,remark);
		if(info != null){
			ret = new ResultMessageModel(0,"添加轮巡预案成功！");
		}else{
			ret = new ResultMessageModel(-1,"添加轮巡预案失败！");
		}
		return ret;
	}

	@RequestMapping("/updateTour")
	@ResponseBody
	public ResultMessageModel updateTour(String id,String name,String remark,int interval){
		ResultMessageModel ret = null;
		TourDBService DBService = FQuery.getRepository(TourDBService.class);
		Cms_res_tour_infoEntity info = DBService.updateTour(name, interval ,remark,id);
		if(info != null){
			ret = new ResultMessageModel(0,"修改轮巡预案成功！");
		}else{
			ret = new ResultMessageModel(-1,"修改轮巡预案失败！");
		}
		return ret;
	}

	@RequestMapping("/delTour")
	@ResponseBody
	public ResultMessageModel delTour(String ids){
		ResultMessageModel ret = null;
		String strs[] = ids.split(",");
		List<Integer> list_id = new ArrayList<Integer>();
		for(int i=0;i<strs.length;i++){
			list_id.add(Integer.parseInt(strs[i]));
		}
		//预案表删除
		TourDBService DBService = FQuery.getRepository(TourDBService.class);
		int flag = DBService.delTour(list_id);
		if(flag>0){
			ret = new ResultMessageModel(0,"删除轮巡预案成功!");
		}else{
			ret = new ResultMessageModel(-1,"删除轮巡预案失败");
		}
		//删除摄像机表
		WatchDBService DBS = FQuery.getRepository(WatchDBService.class);
		flag =   DBS.delTourCfgByTourIds(list_id);
		if(flag>0){
			ret = new ResultMessageModel(0,"删除轮巡预案成功!");
		}else{
			ret = new ResultMessageModel(-1,"删除轮巡预案失败");
		}

		
		
		return ret;
	}
	@RequestMapping("/delTourCfg")
	@ResponseBody
	public ResultMessageModel delTourCfg(String ids){
		ResultMessageModel ret = null;
		String strs[] = ids.split(",");
		List<Integer> list_id = new ArrayList<Integer>();
		for(int i=0;i<strs.length;i++){
			list_id.add(Integer.parseInt(strs[i]));
		}
		WatchDBService DBService = FQuery.getRepository(WatchDBService.class);
		int flag = DBService.delTourCfgByIds(list_id);
		if(flag>0){
			ret = new ResultMessageModel(0,"删除轮巡预案摄像机信息成功!");
		}else{
			ret = new ResultMessageModel(-1,"删除轮巡预案摄像机信息失败");
		}
		return ret;
	}
	

}
