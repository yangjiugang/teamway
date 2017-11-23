package com.teamway.cms.webcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.fastquery.core.Query;
import org.fastquery.service.FQuery;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamway.cms.dao.AlarmDBService;
import com.teamway.cms.dao.CameraInfoDBService;
import com.teamway.cms.dao.RegionInfoDBService;
import com.teamway.cms.dao.RoleDBService;
import com.teamway.cms.dao.SensorInfoDBService;
import com.teamway.cms.dbentity.Cms_res_alarm_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.model.AlarmCfgModel;
import com.teamway.cms.model.AlarmLinkagePresetModel;
import com.teamway.cms.model.ResultMessageModel;
import com.teamway.cms.model.ZTreeNodeModel;


/*
 * 告警管理
 */
@Controller
@RequestMapping("/alarm") 
public class AlarmCtl {

	protected Logger log = Logger.getLogger(AlarmCtl.class);

	@RequestMapping("/page")
	public String page(){
		return "alarm";
	}

	@ResponseBody
	@RequestMapping("/camera_tree")
	public List<ZTreeNodeModel> camera_tree(String region_id){

		//获取ROOT区域
		RegionInfoDBService dbr =  FQuery.getRepository(RegionInfoDBService.class);
		Cms_res_region_infoEntity  root = dbr.findRootRegion();

		//获取摄像机
		CameraInfoDBService dbc =  FQuery.getRepository(CameraInfoDBService.class);
		List<Cms_res_camera_infoEntity>  cams =  dbc.findAll();

		//获取已配置
		AlarmDBService dba = FQuery.getRepository(AlarmDBService.class);
		List<Cms_res_alarm_cfg_infoEntity> cfgs = dba.findAllCfgByType(1);//1-摄像机

		//组合
		Map<String,Integer>  cfg_map = new HashMap<String,Integer>();
		for(Cms_res_alarm_cfg_infoEntity cfg : cfgs){
			String key = cfg.getCode()+"_"+cfg.getAlarm_type();
			cfg_map.put(key , 1);
		}

		List<ZTreeNodeModel>  result = new ArrayList<ZTreeNodeModel>();

		ZTreeNodeModel zroot = new ZTreeNodeModel();
		zroot.setIcon(root.getIcon());
		zroot.setId(root.getId());
		zroot.setName(root.getName());
		zroot.setOpen(1);
		result.add(zroot);

		String [] alarmStr = {" ","设备失效","视频遮挡告警","视频丢失告警","视频移动侦测告警"};

		for(Cms_res_camera_infoEntity cam : cams){
			String k1 = cam.getCode()+"_"+1;
			String k2 = cam.getCode()+"_"+2;
			String k3 = cam.getCode()+"_"+3;
			String k4 = cam.getCode()+"_"+4;
			if(cfg_map.get(k1) != null && 
					cfg_map.get(k2) != null &&
					cfg_map.get(k3) != null &&
					cfg_map.get(k4) != null)
			{
				continue;
			}

			ZTreeNodeModel node = new ZTreeNodeModel();
			Long id= 1000+cam.getId();
			node.setId(id);
			node.setPid(root.getId());
			node.setName(cam.getName());
			node.setOpen(0);
			result.add(node);
			for(int i=1;i <=4 ;i++)
			{
				String key = cam.getCode()+"_"+i;
				if(cfg_map.get(key) != null)
					continue;

				ZTreeNodeModel sub = new ZTreeNodeModel();
				sub.setId(999999+cam.getId()+i);
				sub.setPid(id);
				sub.setName(alarmStr[i]);
				sub.setOpen(1);
				sub.setResCode(cam.getCode());
				sub.setRealId(i);//用于展示告警类型
				result.add(sub);
			}
		}
		return result;
	}





	@ResponseBody
	@RequestMapping("/add_camera_alarm_cfg")
	public ResultMessageModel add_camera_alarm_cfg(String params,String region_id){
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = params.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		for(String data : list){
			String [] tmps = data.split("_");
			String code = tmps[0];
			String alarm_type = tmps[1];
			String   alarm_level = "0";
			DBService.addCameraAlarmCfg(code, alarm_type, alarm_level,region_id,1);
		}
		return new ResultMessageModel(0,"添加告警配置成功");
	}


	@ResponseBody
	@RequestMapping("/add_io_alarm_cfg")
	public ResultMessageModel add_io_alarm_cfg(String params,String region_id){
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = params.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		for(String data : list){
			String [] tmps = data.split("_");
			String code = tmps[0];
			String alarm_type = tmps[1];
			String   alarm_level = "0";
			DBService.addCameraAlarmCfg(code, alarm_type, alarm_level,region_id,2);
		}
		return new ResultMessageModel(0,"添加告警配置成功");
	}
	
	

	@ResponseBody
	@RequestMapping("/add_env_alarm_cfg")
	public ResultMessageModel add_env_alarm_cfg(String params,String region_id){
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = params.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		for(String data : list){
			String [] tmps = data.split("_");
			String code = tmps[0];
			String alarm_type = tmps[1];
			String   alarm_level = "0";
			DBService.addCameraAlarmCfg(code, alarm_type, alarm_level,region_id,3);
		}
		return new ResultMessageModel(0,"添加告警配置成功");
	}

	
	
	@ResponseBody
	@RequestMapping("/changeAlarmLevel")
	public ResultMessageModel changeAlarmLevel(String level,String ids){
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = ids.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		List<Integer> list_ids = new ArrayList<Integer>(); 
		for(String tmp : list){
			list_ids.add(Integer.parseInt(tmp));
		}
		DBService.changeAlarmLevel(level,list_ids);

		return new ResultMessageModel(0,"修改告警级别成功");
	}

	@ResponseBody
	@RequestMapping("/delAlarmCfg")
	public ResultMessageModel delAlarmCfg(String ids){
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = ids.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		List<Integer> list_ids = new ArrayList<Integer>(); 
		for(String tmp : list){
			list_ids.add(Integer.parseInt(tmp));
		}
		DBService.delAlarmCfg(list_ids);

		return new ResultMessageModel(0,"修改告警级别成功");
	}


	@ResponseBody
	@RequestMapping("/delIoAlarmCfg")
	public ResultMessageModel delIoAlarmCfg(String ids){
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = ids.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		List<Integer> list_ids = new ArrayList<Integer>(); 
		for(String tmp : list){
			list_ids.add(Integer.parseInt(tmp));
		}
		DBService.delAlarmCfg(list_ids);

		return new ResultMessageModel(0,"修改告警级别成功");
	}




	@ResponseBody
	@RequestMapping("/getCameraCfg")
	public List<AlarmCfgModel> getCameraCfg(HttpServletRequest request)
	{	
		String region_id = request.getParameter("queryMap[region_id]");
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		List<AlarmCfgModel>  list =  DBService.getCameraCfgByRegionId(Integer.parseInt(region_id));
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/getIoCfg")
	public List<AlarmCfgModel> getIoCfg(HttpServletRequest request)
	{	
		String region_id = request.getParameter("queryMap[region_id]");
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		List<AlarmCfgModel>  list =  DBService.getIoCfgByRegionId(Integer.parseInt(region_id));
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/getEnvCfg")
	public List<AlarmCfgModel> getEnvCfg(HttpServletRequest request)
	{	
		String region_id = request.getParameter("queryMap[region_id]");
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		List<AlarmCfgModel>  list =  DBService.getEnvCfgByRegionId(Integer.parseInt(region_id));
		return list;
	}


	@ResponseBody
	@RequestMapping("/getAlarmCfgById")
	public AlarmCfgModel getAlarmCfgById(String id,String type)
	{	
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		AlarmCfgModel  list = new AlarmCfgModel();
		if(type.equals("1")){
			  list =  DBService.getCameraAlarmCfgById(Integer.parseInt(id));	
		}else if(type.equals("2")){
			  list =  DBService.getIoAlarmCfgById(Integer.parseInt(id));	
		}else if(type.equals("3")){
			  list =  DBService.getEnvAlarmCfgById(Integer.parseInt(id));	
		}
		return list;
	}

	
	@RequestMapping("/camera_preset_tree")
	@ResponseBody
	public List<ZTreeNodeModel> getCameraPresetTree(HttpServletRequest request,String ids){
		RoleDBService DBService = FQuery.getRepository(RoleDBService.class);
		List<Cms_res_region_infoEntity> regions = DBService.findAllRegion();
		List<Cms_res_camera_infoEntity> cameras = DBService.findAllCamera();

		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

		List<String> codes = new ArrayList<String>();

		for(Cms_res_camera_infoEntity cam : cameras ){
			codes.add(cam.getCode());
		}

		Map<String,List<Cms_res_camera_preset_infoEntity>>  preset_map = new HashMap<String,List<Cms_res_camera_preset_infoEntity>>();
		List<Cms_res_camera_preset_infoEntity> presets = DBService.findAllPresetByCodes(codes);
		for(Cms_res_camera_preset_infoEntity preset:presets){
			List<Cms_res_camera_preset_infoEntity> tmp =  preset_map.get(preset.getCamera_code());
			if(tmp !=null){
				tmp.add(preset);
			}else{
				tmp = new LinkedList<Cms_res_camera_preset_infoEntity>();
			}
			preset_map.put(preset.getCamera_code(), tmp);
		}


		List<ZTreeNodeModel> cameraTree = new ArrayList<ZTreeNodeModel>();
		for(Cms_res_region_infoEntity region:regions)
		{
			ZTreeNodeModel proj = new ZTreeNodeModel();
			proj.setId(region.getId());
			proj.setPid(region.getPid());
			proj.setName(region.getName());
			proj.setIcon(basePath+"images/region_icon/"+region.getIcon());
			proj.setOpen(1);
			cameraTree.add(proj);
		}
		Long index = 999999L;
		for(Cms_res_camera_infoEntity camera:cameras)
		{
			ZTreeNodeModel proj = new ZTreeNodeModel();
			proj.setResCode(camera.getCode());
			proj.setId(camera.getId());
			proj.setPid(camera.getRegion_id());
			proj.setName(camera.getName());
			proj.setOpen(1);
			cameraTree.add(proj);

			List<Cms_res_camera_preset_infoEntity> tmp =  preset_map.get(camera.getCode());
			if(tmp !=null){
				for(Cms_res_camera_preset_infoEntity  preset : tmp){
					ZTreeNodeModel proj1 = new ZTreeNodeModel();
					proj1.setResCode(camera.getCode());
					proj1.setId((Long)index);
					proj1.setPid(camera.getId());
					proj1.setName(preset.getPreset_index()+"# "+preset.getName()); // preset index
					proj1.setRealId(preset.getId().intValue()); 
					proj1.setOpen(1);
					cameraTree.add(proj1);
				}
			}

		}
		return cameraTree;
	}



	@RequestMapping("/get_camera_linkage_preset")
	@ResponseBody
	public List<AlarmLinkagePresetModel> get_camera_linkage_preset(HttpServletRequest request)
	{
		String cfg_id = request.getParameter("queryMap[cfg_id]");

		System.out.println("cfg_id = "+ cfg_id);

		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		List<AlarmLinkagePresetModel> list =  DBService.get_camera_linkage_preset(Integer.parseInt(cfg_id));
		return list;
	}

	@ResponseBody
	@RequestMapping("/save_camera_preset_linkage")
	public ResultMessageModel save_camera_preset_linkage(String ids,String cfg_id){
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = ids.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		List<Integer> list_ids = new ArrayList<Integer>(); 
		for(String tmp : list){
			list_ids.add(Integer.parseInt(tmp));
		}
		for(Integer id : list_ids){
			DBService.save_camera_preset_linkage(Integer.parseInt(cfg_id),id);	
		}
		return new ResultMessageModel(0,"添加告警联动摄像机预置位信息成功");
	}


	@ResponseBody
	@RequestMapping("/del_camera_preset_linkage")
	public ResultMessageModel del_camera_preset_linkage(String ids)
	{
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = ids.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		List<Integer> list_ids = new ArrayList<Integer>(); 
		for(String tmp : list){
			list_ids.add(Integer.parseInt(tmp));
		}
		DBService.del_camera_preset_linkage(list_ids);
		return new ResultMessageModel(0,"删除告警联动预置位成功！");
	}


	@ResponseBody
	@RequestMapping("/changeRecordLinkage")
	public ResultMessageModel changeRecordLinkage(String ids,String is_record)
	{
		AlarmDBService DBService = FQuery.getRepository(AlarmDBService.class);
		String[] _array = ids.split(",");
		List<String> list = java.util.Arrays.asList(_array);
		List<Integer> list_ids = new ArrayList<Integer>(); 
		for(String tmp : list){
			list_ids.add(Integer.parseInt(tmp));
		}
		DBService.changeRecordLinkage(list_ids,Integer.parseInt(is_record));
		return new ResultMessageModel(0,"删除告警联动预置位成功！");
	}



	@ResponseBody
	@RequestMapping("/io_tree")
	public List<ZTreeNodeModel> io_tree(String region_id){

		//获取ROOT区域
		RegionInfoDBService dbr =  FQuery.getRepository(RegionInfoDBService.class);
		Cms_res_region_infoEntity  root = dbr.findRootRegion();

		//获取环境量设备
		SensorInfoDBService dbc =  FQuery.getRepository(SensorInfoDBService.class);
		List<Integer> type_ids = new ArrayList<Integer>();
		type_ids.add(4); //水浸探头
		type_ids.add(5);//红外探测
		type_ids.add(7);//新增设备
		type_ids.add(8);//烟雾报警
		type_ids.add(10);//通风设备
		type_ids.add(14);//电子围栏
		type_ids.add(15);//火灾报警

		List<Cms_res_sensor_infoEntity>  cams =  dbc.findAllByTypeId(type_ids);

		//获取已配置
		AlarmDBService dba = FQuery.getRepository(AlarmDBService.class);
		List<Cms_res_alarm_cfg_infoEntity> cfgs = dba.findAllCfgByType(2);//IO设备

		//组合
		Map<String,Integer>  cfg_map = new HashMap<String,Integer>();
		for(Cms_res_alarm_cfg_infoEntity cfg : cfgs){
			String key = cfg.getCode()+"_"+cfg.getAlarm_type();
			cfg_map.put(key , 1);
		}

		List<ZTreeNodeModel>  result = new ArrayList<ZTreeNodeModel>();

		ZTreeNodeModel zroot = new ZTreeNodeModel();
		zroot.setIcon(root.getIcon());
		zroot.setId(root.getId());
		zroot.setName(root.getName());
		zroot.setOpen(1);
		result.add(zroot);

		String [] alarmStr = {" ","设备失效","视频遮挡告警","视频丢失告警","视频移动侦测告警"};


		Map<Integer,String>  name_map = new HashMap<Integer,String>();
		name_map.put(4, "水浸探头告警");
		name_map.put(5, "红外报警器告警");
		name_map.put(7, "新增设备告警");
		name_map.put(8, "烟雾报警器告警");
		name_map.put(10, "通风设备告警");
		name_map.put(14, "电子围栏告警");
		name_map.put(15, "火灾报警系统告警");


		for(Cms_res_sensor_infoEntity cam : cams){
			String k1 = cam.getCode()+"_"+255;
			String k2 = cam.getCode()+"_"+cam.getType_id();
			if(cfg_map.get(k1) != null && 
					cfg_map.get(k2) != null )
			{
				continue;
			}

			ZTreeNodeModel node = new ZTreeNodeModel();
			Long id= 1000+cam.getId();
			node.setId(id);
			node.setPid(root.getId());
			node.setName(cam.getName());
			node.setOpen(0);
			result.add(node);

			String key = cam.getCode()+"_"+255;
			if(cfg_map.get(key) != null){

			}else{
				ZTreeNodeModel sub = new ZTreeNodeModel();
				sub.setId(999999+cam.getId());
				sub.setPid(id);

				sub.setName("设备失效");

				sub.setOpen(1);
				sub.setResCode(cam.getCode());

				sub.setRealId(255); //设备失效

				result.add(sub);
			}
			key = cam.getCode()+"_"+cam.getType_id();

			if(cfg_map.get(key) != null){

			}else{
				ZTreeNodeModel sub = new ZTreeNodeModel();
				sub.setId(999999+cam.getId());
				sub.setPid(id);
				sub.setName(name_map.get(cam.getType_id()));
				sub.setOpen(1);
				sub.setResCode(cam.getCode());
				sub.setRealId(cam.getType_id());
				result.add(sub);
			}
		}	

		return result;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/env_tree")
	public List<ZTreeNodeModel> env_tree(String region_id){

		//获取ROOT区域
		RegionInfoDBService dbr =  FQuery.getRepository(RegionInfoDBService.class);
		Cms_res_region_infoEntity  root = dbr.findRootRegion();

		//获取环境量设备
		SensorInfoDBService dbc =  FQuery.getRepository(SensorInfoDBService.class);
		List<Integer> type_ids = new ArrayList<Integer>();
		type_ids.add(0);//温度
		type_ids.add(1);//湿度
		type_ids.add(3);//风速

		List<Cms_res_sensor_infoEntity>  cams =  dbc.findAllByTypeId(type_ids);

		//获取已配置
		AlarmDBService dba = FQuery.getRepository(AlarmDBService.class);
		List<Cms_res_alarm_cfg_infoEntity> cfgs = dba.findAllCfgByType(3);

		//组合
		Map<String,Integer>  cfg_map = new HashMap<String,Integer>();
		for(Cms_res_alarm_cfg_infoEntity cfg : cfgs){
			String key = cfg.getCode()+"_"+cfg.getAlarm_type();
			cfg_map.put(key , 1);
		}

		List<ZTreeNodeModel>  result = new ArrayList<ZTreeNodeModel>();

		ZTreeNodeModel zroot = new ZTreeNodeModel();
		zroot.setIcon(root.getIcon());
		zroot.setId(root.getId());
		zroot.setName(root.getName());
		zroot.setOpen(1);
		result.add(zroot);

		Map<Integer,String>  name_map = new HashMap<Integer,String>();
		name_map.put(0, "温度传感器告警");
		name_map.put(1, "湿度传感器告警");
		name_map.put(3, "风速传感器告警");

		for(Cms_res_sensor_infoEntity cam : cams){
			String k1 = cam.getCode()+"_"+255;
			String k2 = cam.getCode()+"_"+cam.getType_id();
			if(cfg_map.get(k1) != null && 
					cfg_map.get(k2) != null )
			{
				continue;
			}

			ZTreeNodeModel node = new ZTreeNodeModel();
			Long id= 1000+cam.getId();
			node.setId(id);
			node.setPid(root.getId());
			node.setName(cam.getName());
			node.setOpen(0);
			result.add(node);

			String key = cam.getCode()+"_"+255;
			if(cfg_map.get(key) != null){

			}else{
				ZTreeNodeModel sub = new ZTreeNodeModel();
				sub.setId(999999+cam.getId());
				sub.setPid(id);

				sub.setName("设备失效");

				sub.setOpen(1);
				sub.setResCode(cam.getCode());

				sub.setRealId(255); //设备失效

				result.add(sub);
			}
			key = cam.getCode()+"_"+cam.getType_id();

			if(cfg_map.get(key) != null){

			}else{
				ZTreeNodeModel sub = new ZTreeNodeModel();
				sub.setId(999999+cam.getId());
				sub.setPid(id);
				sub.setName(name_map.get(cam.getType_id()));
				sub.setOpen(1);
				sub.setResCode(cam.getCode());
				sub.setRealId(cam.getType_id());
				result.add(sub);
			}
		}	

		return result;
	}

}
