package com.teamway.cms.webcontroller;

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

import com.teamway.cms.dao.RegionInfoDBService;
import com.teamway.cms.dao.RoleDBService;
import com.teamway.cms.dao.ServerDBService;
import com.teamway.cms.dao.StreamDBService;
import com.teamway.cms.dao.UserDBService;
import com.teamway.cms.dao.ViewInfoDBService;
import com.teamway.cms.dbentity.Cms_config_roleEntity;
import com.teamway.cms.dbentity.Cms_config_userEntity;
import com.teamway.cms.dbentity.Cms_config_user_roleEntity;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;
import com.teamway.cms.dbentity.Cms_res_stream_infoEntity;
import com.teamway.cms.dbentity.Cms_res_view_camera_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_view_infoEntity;
import com.teamway.cms.model.CameraPresetModel;
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
@RequestMapping("/stream") 
public class StreamCtl {

	protected Logger log = Logger.getLogger(StreamCtl.class);
	@RequestMapping("/page")
	public String page(){
		return "stream";
	}
	
	
	
	@RequestMapping("/getAllStream")
	@ResponseBody
	public DataGridModel getStreamAll(){	
		StreamDBService DBService = FQuery.getRepository(StreamDBService.class);
		Pageable pageable = new PageableImpl(1, 50);
		Page<Cms_res_stream_infoEntity> pages = DBService.getStreamAll(pageable);
		DataGridModel model = new DataGridModel();
		model.setRows(pages.getContent());
		model.setTotal(pages.getTotalElements());
		return model;
	}
	
	@RequestMapping("/getStreamById")
	@ResponseBody
	public Cms_res_stream_infoEntity getStreamById(int id){	
		StreamDBService DBService = FQuery.getRepository(StreamDBService.class);
		Cms_res_stream_infoEntity info = DBService.findStreamById(id);
		return info;
	}
	
	
	@RequestMapping("/addStreamInfo")
	@ResponseBody
	public ResultMessageModel addStreamInfo(String name,String ip,String port,String username,String password,String remark){	
		StreamDBService DBService = FQuery.getRepository(StreamDBService.class);
		int ret = DBService.addStreamInfo( name, ip, port, username, password, remark);
		if(ret > 0){
			return new ResultMessageModel(0,"添加流媒体服务器成功！");
		}else{
			return new ResultMessageModel(-1,"添加流媒体服务器错误！");
		}
	}
	
	
	
	@RequestMapping("/updateStreamInfo")
	@ResponseBody
	public ResultMessageModel updateStreamInfo(int id ,String name,String ip,String port,String username,String password,String remark){	
		StreamDBService DBService = FQuery.getRepository(StreamDBService.class);
		int ret = DBService.updateStreamInfo( name, ip, port, username, password, remark,id);
		if(ret > 0){
			return new ResultMessageModel(0,"添加流媒体服务器成功！");
		}else{
			return new ResultMessageModel(-1,"添加流媒体服务器错误！");
		}
	}
	
	@RequestMapping("/deleteStreamById")
	@ResponseBody
	public ResultMessageModel deleteStreamById(String ids){	
		StreamDBService DBService = FQuery.getRepository(StreamDBService.class);
		String[] id_array = ids.split(",");
		List<String> list = java.util.Arrays.asList(id_array);
		
		int ret = DBService.deleteStreamByIds(list);
		if(ret > 0){
			return new ResultMessageModel(0,"添加流媒体服务器成功！");
		}else{
			return new ResultMessageModel(-1,"添加流媒体服务器错误！");
		}
	}
	
}
