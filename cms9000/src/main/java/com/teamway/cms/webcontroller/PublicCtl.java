package com.teamway.cms.webcontroller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.fastquery.core.QueryRepository;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;
import org.fastquery.page.PageableImpl;
import org.fastquery.service.FQuery;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamway.cms.cmsserver.TYProtoBean.PresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspGetPresetInfo;
import com.teamway.cms.dao.CameraInfoDBService;
import com.teamway.cms.dao.RegionInfoDBService;
import com.teamway.cms.dao.SensorInfoDBService;
import com.teamway.cms.dao.ServerDBService;
import com.teamway.cms.dao.UserDBService;
import com.teamway.cms.dbentity.Cms_config_userEntity;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;
import com.teamway.cms.model.DataGridModel;
import com.teamway.cms.model.ResultMessageModel;
import com.teamway.cms.model.ZTreeNodeModel;
import com.teamway.cms.pgcleint.ReturnVector;
import com.teamway.cms.pgcleint.RpuConnectMap;
import com.teamway.cms.pgserver.PgSendQueue;
import com.teamway.cms.pgserver.TaskBean;
import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PGAttr;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;
import com.teamway.cms.pgutils.PG.CPTYPE_PRESET_SEARCH;
import com.teamway.cms.pgutils.PG.CPTYPE_PTZPRESET;
import com.teamway.cms.pgutils.PG.DEVINFO;
import com.teamway.cms.pgutils.PG.RPUCLI_RPUNAME;
import com.teamway.cms.pgutils.PG.RPUCLI_SVCADDR;
import com.teamway.cms.utils.PropertiesUtils;

@Controller

public class PublicCtl {
	protected Logger log = Logger.getLogger(PublicCtl.class);
	@RequestMapping("/index")
	@AuthPassport
	public String index(){
		return "index";
	}

	@RequestMapping("/region")
	public String region(){
		return "region";
	}

	@RequestMapping("/login")
	public String login(){
		return "login";
	}

	@RequestMapping("/device")
	public String device(){
		return "device";
	}
	@ResponseBody
	@RequestMapping("/loginAuth")
	public ResultMessageModel loginAuth(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String user_str = PropertiesUtils.GetStringByKey("username");

		Properties  pss = System.getProperties();

		System.out.println(user_str);
		System.out.println("**********************");



		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		Cms_config_userEntity user = DBService.loginAuth(username, password);
		ResultMessageModel model = null;
		if(user != null)
		{
			request.getSession().setAttribute("USER_NAME",user.getLogin_name());
			model = new ResultMessageModel(0,"success!");

			//connectTest();
		}else{
			model = new ResultMessageModel(-1,"用户名或密码错误!");
		}
		return model;
	}
	@RequestMapping("/signout")
	public String signout(HttpServletRequest request){
		request.getSession().setAttribute("USER_NAME",null);
		return "login";
	}



	@ResponseBody
	@RequestMapping("/connect_test")
	public String connectTest(){

		System.out.println("connect_test");
		PGPojo pg = PGUtil.newInstancePGObject(PG.GET_RPUSYS_CFG_REQ,0,1, new byte[]{},  new Object[]{});
		TaskBean bean = new TaskBean("192.168.12.201:9000",pg);
		try {
			PgSendQueue.getInstance().put(bean );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {
			TaskBean obj = ReturnVector.getInstance().check(bean, 1000);
			if(obj != null){
				System.out.println("返回对象="+obj.getPg().toString());
			}


		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "connect_test ok";
	}

	
	//同步摄像机列表
	@ResponseBody
	@RequestMapping("/syncRpuToTVS9000")
	public ResultMessageModel syncRpuToTVS9000(){

		ServerDBService dbs = FQuery.getRepository(ServerDBService.class);
		List<Cms_res_server_infoEntity> servers =  dbs.findByType(1);//南网设备

		for(Cms_res_server_infoEntity rpu : servers)
		{
			String key = rpu.getIp()+":"+rpu.getPort();
			PGPojo pg = PGUtil.newInstancePGObject(PG.GET_RPUSYS_CFG_REQ,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{},  new Object[]{});
			TaskBean bean = new TaskBean(key,pg);
			try {
				PgSendQueue.getInstance().put(bean );
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			try {
				TaskBean obj = ReturnVector.getInstance().check(bean, 2000);
				if(obj != null){
					System.out.println("返回对象="+obj.getPg().toString());
					procRPUinfo(rpu,obj.getPg());
				}
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}
		return new ResultMessageModel(0,"摄像机和环境量列表更新完成");
	}

	
	 //同步预置位列表
	@ResponseBody
	@RequestMapping("/syncPreset")
	public ResultMessageModel syncPreset()
	{	
		getCameraPreset(0);
		return new ResultMessageModel(0,"同步预置位信息");
	}



	private int  procRPUinfo(Cms_res_server_infoEntity server,PGPojo pg)
	{
		RPUCLI_RPUNAME rpu_info = (RPUCLI_RPUNAME) pg.getAttrs().get(0).getAttrDataObject(RPUCLI_RPUNAME.class);

		String rpu_code =  String.format("%x",rpu_info.iRPUId); 

		System.out.println("RPU Code = "+rpu_code );
		System.out.println("子设备数量="+rpu_info.iSubDevIdNum);

		byte[] data= pg.getAttrs().get(0).getData();
		List<DEVINFO> subs = new ArrayList<DEVINFO>();
		for(int i=0; i < rpu_info.iSubDevIdNum;i++)
		{
			DEVINFO info = (DEVINFO)PGUtil.byteArrayToObject(data, 308+40*i, DEVINFO.class);
			subs.add(info);
		} 

		updateCameraInfo( server.getId(),subs );
		updateSensorInfo( server.getId(),subs );
		//RPUCLI_SVCADDR addr_info = (RPUCLI_SVCADDR) pg.getAttrs().get(1).getAttrDataObject(RPUCLI_SVCADDR.class);
		return 0;
	}


	private int  updateCameraInfo(int server_id, List<DEVINFO> subs)
	{
		CameraInfoDBService cameraService = FQuery.getRepository(CameraInfoDBService.class);
		List<Cms_res_camera_infoEntity>  cams =  cameraService.findCameraByServerId(server_id);
		for(DEVINFO sub:subs){
			String indexcode = String.format("%x", sub.iSubDevId);
			String name ="";
			try {
				name = new String(sub.szSubDevDesc, "gbk").replaceAll("\0", "");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			int main_type= indexcode.length()==16? Integer.parseInt(indexcode.substring(9, 11)):0;
			int sub_type= indexcode.length()==16? Integer.parseInt(indexcode.substring(11, 13)):0;
			int channel = indexcode.length()==16? Integer.parseInt(indexcode.substring(13, 16)):0;
			if(main_type==1)
			{
				int find = 0;
				for(Cms_res_camera_infoEntity cam : cams)
				{
					if(cam.getCode().equals(indexcode)){
						find=1;
						cam.setId(0L);
						break;
					}
				}
				if(find==1){//更新
					cameraService.updateCamera(sub_type,channel,name,indexcode);
				}else{ //插入
					Cms_res_camera_infoEntity camera= cameraService.addCamera(sub_type,server_id,name,indexcode,channel);
				}
			}
		}
		for(Cms_res_camera_infoEntity cam : cams)
		{
			if(cam.getId() != 0L){//删除记录
				cameraService.deleteCameraByCode(cam.getCode());	
				//cameraService.deleteCameraBatch(cam.getCode());
			}
		}
		return 0;
	}


	private int  updateSensorInfo(int server_id, List<DEVINFO> subs)
	{
		SensorInfoDBService sensorService = FQuery.getRepository(SensorInfoDBService.class);
		List<Cms_res_sensor_infoEntity>  cams =  sensorService.findAllByServerId(server_id);
		for(DEVINFO sub:subs){
			String indexcode = String.format("%x", sub.iSubDevId);
			String name ="";
			try {
				name = new String(sub.szSubDevDesc, "gbk").replaceAll("\0", "");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			int main_type= indexcode.length()==16? Integer.parseInt(indexcode.substring(9, 11)):0;
			int sub_type= indexcode.length()==16? Integer.parseInt(indexcode.substring(11, 13)):0;
			int channel = indexcode.length()==16? Integer.parseInt(indexcode.substring(13, 16)):0;
			if(main_type==2)
			{
				int find = 0;
				for(Cms_res_sensor_infoEntity cam : cams)
				{
					if(cam.getCode().equals(indexcode)){
						find=1;
						cam.setId(0L);
						break;
					}
				}
				if(find==1){//更新
					sensorService.updateSersor(sub_type,name,indexcode,channel);
				}else{ //插入
					sensorService.addsensor(sub_type, server_id,name,indexcode,channel);
				}
			}
		}
		for(Cms_res_sensor_infoEntity cam : cams)
		{
			if(cam.getId() != 0L){//删除记录
				sensorService.deleteSersorByCode(cam.getCode());		
			}
		}
		return 0;
	}

	public String  getGBKString(byte[] data)
	{
		String name="";
		try {
			name = new String(data,"GBK");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		name = name.substring(0, name.indexOf(0));
		return name;
	}


	private int  updateCameraPreset(String code,List<String> list)
	{
		CameraInfoDBService dbc = FQuery.getRepository(CameraInfoDBService.class);
		List<Cms_res_camera_preset_infoEntity> presets = dbc.findCameraPresetByCode(code);


		for(String pre : list)
		{
			String[] pre_arr = pre.split("-");
			Integer index = Integer.parseInt(pre_arr[0]);
			String name = pre_arr[1];
			int flag = 0;
			for(Cms_res_camera_preset_infoEntity  info : presets){
				if(info.getPreset_index().equals(index) && info.getName().equals(name)){
					flag=1;
					info.setId(0L);
					break;
				}
			}

			if(flag==0){//插入
				dbc.addCameraPreset(index, name, code);
			}else{ //更新
				dbc.updateCameraPreset(index, name, code);
			}
		}

		for(Cms_res_camera_preset_infoEntity  info : presets){
			if(info.getId().longValue() != 0L){
				//删除
				dbc.delCameraPreset(info.getPreset_index(), info.getCamera_code());
				//dbc.deletePresetIdBatch(info.getId().intValue(), info.getCamera_code(), info.getPreset_index());
			}
		}
		return 0;
	}


	private  void getCameraPreset(int  server_id)
	{
		ServerDBService dbs = FQuery.getRepository(ServerDBService.class);
		List<Cms_res_server_infoEntity> servers =  dbs.findByType(1);

		CameraInfoDBService dbc = FQuery.getRepository(CameraInfoDBService.class);

		for(Cms_res_server_infoEntity server:servers)
		{
			List<Cms_res_camera_infoEntity>  cams =   dbc.findCameraByServerId(server.getId());
			String key = server.getIp()+":"+server.getPort();
			for(Cms_res_camera_infoEntity cam :cams)
			{
				String resCode = cam.getCode();

				CPTYPE_PRESET_SEARCH preset = new CPTYPE_PRESET_SEARCH(cam.getIpc_channel(),0);
				PGPojo pg = PGUtil.newInstancePGObject(PG.GET_PTZPRESET_REQ,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{16},  new Object[]{preset});

				TaskBean bean = new TaskBean(key,pg);
				try {
					PgSendQueue.getInstance().put(bean );
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

				try {
					TaskBean obj = ReturnVector.getInstance().check(bean, 2000);
					if(obj != null)
					{
						System.out.println("返回对象="+obj.getPg().toString());
						PGPojo ret = obj.getPg();
						List<PGAttr> list = ret.getAttrs();
						List<String> list_index = new ArrayList<String>();
						for(int i=0; i < list.size() ;i++){
							
							if(list.get(i).header.getType()!=54){
								CPTYPE_PTZPRESET pre = (CPTYPE_PTZPRESET) list.get(i).getAttrDataObject(CPTYPE_PTZPRESET.class);
								int index  = pre.iPresetIndex;
								String name = getGBKString(pre.szPresetName);
								list_index.add(index+"-"+name);
							}
						
						}
						updateCameraPreset(resCode,list_index);
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

			}

		}

	}



}
