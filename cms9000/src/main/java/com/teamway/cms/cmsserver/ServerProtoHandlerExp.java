package com.teamway.cms.cmsserver;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.fastquery.service.FQuery;

import com.teamway.cms.cmsserver.TYProtoBean.PresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RecordFileInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqGetAllTourInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqGetPresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqGetPtzHomeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqPtzInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqRecordFileInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqSearchRecordInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqSetPresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqSetPtzHomeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqStartVideoInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqStopVideoInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspGetAllTourInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspGetAllViewInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspGetPresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspGetPtzHomeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspPtzInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspRecordFileInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspResTreeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspSearchRecordInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspSetPresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspSetPtzHomeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspStartVideoInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspStopVideoInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspTreeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.TourCfgCameraInfo;
import com.teamway.cms.cmsserver.TYProtoBean.TourInfo;
import com.teamway.cms.cmsserver.TYProtoBean.VideoViewInfo;
import com.teamway.cms.cmsserver.TYProtoBean.VideoViewIpcInfo;
import com.teamway.cms.cmsserver.TYProtoBean.reqRecordStartPlayInfo;
import com.teamway.cms.cmsserver.TYProtoBean.reqRecordStopPlayInfo;
import com.teamway.cms.cmsserver.TYProtoBean.rspRecordStartPlayInfo;
import com.teamway.cms.cmsserver.TYProtoBean.rspRecordStopPlayInfo;
import com.teamway.cms.dao.CameraInfoDBService;
import com.teamway.cms.dao.RegionInfoDBService;
import com.teamway.cms.dao.RoleDBService;
import com.teamway.cms.dao.ServerDBService;
import com.teamway.cms.dao.StreamDBService;
import com.teamway.cms.dao.TourDBService;
import com.teamway.cms.dao.ViewInfoDBService;
import com.teamway.cms.dao.WatchDBService;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;
import com.teamway.cms.dbentity.Cms_res_stream_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_camera_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_infoEntity;
import com.teamway.cms.dbentity.Cms_res_view_infoEntity;
import com.teamway.cms.model.CameraPresetModel;
import com.teamway.cms.model.TourCfgModel;
import com.teamway.cms.pgcleint.ReturnVector;
import com.teamway.cms.pgcleint.RpuConnectMap;
import com.teamway.cms.pgserver.PgSendQueue;
import com.teamway.cms.pgserver.TaskBean;
import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PG.CPTYPE_CTLPTZ;
import com.teamway.cms.pgutils.PG.CPTYPE_PRESET_SEARCH;
import com.teamway.cms.pgutils.PG.CPTYPE_PTZPRESET;
import com.teamway.cms.pgutils.PG.CPTYPE_STORAGEFILE;
import com.teamway.cms.pgutils.PG.CPTYPE_STORAGEFILE_DATA;
import com.teamway.cms.pgutils.PG.CPTYPE_STORAGEFILE_SEARCH;
import com.teamway.cms.pgutils.PG.GET_PTZ_HOME_INFO;
import com.teamway.cms.pgutils.PG.PTZ_HOME_INFO;
import com.teamway.cms.pgutils.PGAttr;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;
import com.teamway.cms.streamclient.Protocol;

import com.teamway.cms.streamclient.Protocol.REQ_RECORD_START_PLAY_INFO;
import com.teamway.cms.streamclient.Protocol.REQ_RECORD_STOP_PLAY_INFO;
import com.teamway.cms.streamclient.Protocol.REQ_START_VIDEO_INFO;
import com.teamway.cms.streamclient.Protocol.REQ_STOP_VIDEO_INFO;
import com.teamway.cms.streamclient.TcpClient;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;

public class ServerProtoHandlerExp {

	private static final Logger logger = Logger.getLogger(ServerProtoHandlerExp.class);

	public RspResTreeInfo getVideoResTree(int role)
	{
		RegionInfoDBService regionDB = FQuery.getRepository(RegionInfoDBService.class);
		List<Cms_res_region_infoEntity> regionList = regionDB.findAll();

		Map<Long , List<Cms_res_camera_infoEntity> >  treeMap = new HashMap<Long , List<Cms_res_camera_infoEntity> >();
		CameraInfoDBService cameraDB= FQuery.getRepository(CameraInfoDBService.class);
		List<Cms_res_camera_infoEntity> cameraList = cameraDB.findAll();

		for(Cms_res_camera_infoEntity camera : cameraList){
			Long regionId = camera.getRegion_id();
			if(treeMap.containsKey(regionId)){
				List<Cms_res_camera_infoEntity> camList = treeMap.get(regionId);
				camList.add(camera);
			}else{
				List<Cms_res_camera_infoEntity> camList = new LinkedList<Cms_res_camera_infoEntity>();
				camList.add(camera);
				treeMap.put(regionId, camList);
			}
		}

		RspResTreeInfo.Builder builder =	RspResTreeInfo.newBuilder();
		int offsetId = 100000;
		for(Cms_res_region_infoEntity item : regionList){
			RspTreeInfo.Builder itemBuilder = RspTreeInfo.newBuilder();
			itemBuilder.setChecked(0);
			itemBuilder.setExpand(1);
			itemBuilder.setIcon(item.getIcon());
			itemBuilder.setId(item.getId().intValue());
			itemBuilder.setPid(item.getPid().intValue());

			itemBuilder.setName(item.getName());
			itemBuilder.setResState(1);
			itemBuilder.setType(1);
			itemBuilder.setResType(0);
			RspTreeInfo value = itemBuilder.build();
			builder.addInfos(value);

			List<Cms_res_camera_infoEntity> camList = treeMap.get(item.getId());
			if(camList != null)
			{
				for(Cms_res_camera_infoEntity camera : camList){
					RspTreeInfo.Builder camBuilder = RspTreeInfo.newBuilder();
					camBuilder.setChecked(0);
					camBuilder.setExpand(0);
					camBuilder.setIcon("ipc.png");
					camBuilder.setId(offsetId);
					camBuilder.setPid(item.getId().intValue());
					camBuilder.setName(camera.getName());
					camBuilder.setResCode(camera.getCode());
					camBuilder.setResState(1);
					camBuilder.setResType(1);
					camBuilder.setType(2);
					RspTreeInfo camerNode = camBuilder.build();
					builder.addInfos(camerNode);
					offsetId++;
				}
			}
		}
		System.out.println(builder.build().toString());
		return builder.build();
	}

	public RspGetAllViewInfo getViewInfo(int role)
	{
		ViewInfoDBService DBService = FQuery.getRepository(ViewInfoDBService.class);
		List<Cms_res_view_infoEntity> views = DBService.getViewByRoleId(null);

		RspGetAllViewInfo.Builder  result_builder =  RspGetAllViewInfo.newBuilder();
		result_builder.setType(0);
		for(Cms_res_view_infoEntity view : views)
		{	
			VideoViewInfo.Builder builder =	VideoViewInfo.newBuilder();
			builder.setRegionId(view.getRegion_id().intValue());
			builder.setViewId(view.getId().intValue());
			builder.setViewName(view.getName());

			List<CameraPresetModel> cameras = DBService.getCameraByViewId(view.getId().toString());

			for(CameraPresetModel camera : cameras ){
				VideoViewIpcInfo.Builder camBuilder = VideoViewIpcInfo.newBuilder();
				camBuilder.setResCode(camera.getCamera_code());
				camBuilder.setPresetIndex(camera.getPreset_index());
				camBuilder.setResName(camera.getName());
				builder.addItems(camBuilder.build());
			}
			result_builder.addItems(builder.build());
		}
		//System.out.println(result_builder.build().toString());
		return result_builder.build();
	}


	public RspStartVideoInfo RspStartVideo(ReqStartVideoInfo info)
	{
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());

		REQ_START_VIDEO_INFO real_info = new REQ_START_VIDEO_INFO(
				camera.getIpc_channel(),
				info.getVideoFlagValue(),info.getVideoCodecValue(),
				server.getIp().getBytes(),
				server.getPort(),
				server.getUsername().getBytes(),
				server.getPassword().getBytes(),
				info.getDestIp().getBytes(),
				info.getDestPort());

		PGPojo pg = PGUtil.newInstancePGObject(Protocol.REQ_START_REAL_VIDEO,0,0, new byte[]{Protocol.TYPE_REAL_VIDEO_INFO}, new Object[]{ real_info});

		StreamDBService DBStream = FQuery.getRepository(StreamDBService.class);
		Cms_res_stream_infoEntity stream_server =  DBStream.findStreamById(server.getStream_id());


		RspStartVideoInfo.Builder builder = RspStartVideoInfo.newBuilder();
		Channel stream = TcpClient.getChannel(stream_server.getIp(), stream_server.getPort());
		if(stream != null){
			try {
				TcpClient.sendMsg(stream, pg);
			} catch (Exception e) {
				logger.error(e);
			}
		}else{
			logger.error("connect to stream server error ["+stream_server.getIp()+"]  ["+stream_server.getPort()+"]!");
			builder.setMsgCode(-1);
			builder.setMsg("connect to stream server error ["+stream_server.getIp()+"]  ["+stream_server.getPort()+"]!");
		}


		builder.setDestIp(info.getDestIp());
		builder.setDestPort(info.getDestPort());
		builder.setResCode(info.getResCode());
		builder.setVideoCodec(info.getVideoCodec());
		builder.setVideoFlag(info.getVideoFlag());		
		System.out.println(builder.build().toString());
		return builder.build();
	}


	public RspStopVideoInfo RspStopVideo(ReqStopVideoInfo info)
	{
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());

		REQ_STOP_VIDEO_INFO real_info = new REQ_STOP_VIDEO_INFO(
				camera.getIpc_channel(),
				info.getVideoFlag(),info.getVideoFlag(),
				server.getIp().getBytes(),
				server.getPort(),
				server.getUsername().getBytes(),
				server.getPassword().getBytes(),
				info.getDestIp().getBytes(),
				info.getDestPort());

		PGPojo pg = PGUtil.newInstancePGObject(Protocol.REQ_STOP_REAL_VIDEO,0,0, new byte[]{Protocol.TYPE_REAL_VIDEO_INFO}, new Object[]{ real_info});

		StreamDBService DBStream = FQuery.getRepository(StreamDBService.class);
		Cms_res_stream_infoEntity stream_server =  DBStream.findStreamById(server.getStream_id());

		Channel stream = TcpClient.getChannel(stream_server.getIp(), stream_server.getPort());

		RspStopVideoInfo.Builder builder = RspStopVideoInfo.newBuilder();
		if(stream != null){
			try {
				TcpClient.sendMsg(stream, pg);
			} catch (Exception e) {
				logger.error(e);
			}
			builder.setMsg("success!");
			builder.setMsgCode(0);
		}else{
			logger.error("connect to stream server error [stream_server.getIp()]  [stream_server.getPort()]!");
			builder.setMsg("connect to stream server error!");
			builder.setMsgCode(-1);
		}
		builder.setDestIp(info.getDestIp());
		builder.setDestPort(info.getDestPort());
		builder.setResCode(info.getResCode());
		builder.setVideoCodec(info.getVideoCodec());
		builder.setVideoFlag(info.getVideoFlag());
		
		
		System.out.println(builder.build().toString());
		return builder.build();
	}




	public rspRecordStartPlayInfo  OnStartPlayRecord(reqRecordStartPlayInfo info)
	{
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());

		REQ_RECORD_START_PLAY_INFO real_info = new REQ_RECORD_START_PLAY_INFO(
				server.getIp().getBytes(),
				server.getPort(),
				server.getUsername().getBytes(),
				server.getPassword().getBytes(),
				info.getSzDestIp().getBytes(),
				info.getIDestPort(),
				info.getSzfileName().getBytes(),
				info.getSzUrl().getBytes(),
				info.getOption(),
				info.getSzStartTime().getBytes());

		PGPojo pg = PGUtil.newInstancePGObject(Protocol.REQ_START_RECORD_PLAY_VIDEO,0,0, new byte[]{Protocol.TYPE_RECORD_VIDEO_INFO}, new Object[]{ real_info});

		StreamDBService DBStream = FQuery.getRepository(StreamDBService.class);
		Cms_res_stream_infoEntity stream_server =  DBStream.findStreamById(server.getStream_id());


		rspRecordStartPlayInfo.Builder builder = rspRecordStartPlayInfo.newBuilder();
		Channel stream = TcpClient.getChannel(stream_server.getIp(), stream_server.getPort());
		if(stream != null){
			try {
				TcpClient.sendMsg(stream, pg);
			} catch (Exception e) {
				logger.error(e);
			}
		}else{
			logger.error("connect to stream server error ["+stream_server.getIp()+"]  ["+stream_server.getPort()+"]!");
			builder.setMsgCode(-1);
			builder.setMsg("connect to stream server error ["+stream_server.getIp()+"]  ["+stream_server.getPort()+"]!");
		}


		builder.setSzDestIp(info.getSzDestIp());
		builder.setIDestPort(info.getIDestPort());
		builder.setResCode(info.getResCode());
		builder.setOption(info.getOption());
		builder.setSzfileName(info.getSzfileName());
		builder.setSzStartTime(info.getSzStartTime());
		builder.setSzUrl(info.getSzUrl());

		System.out.println(builder.build().toString());
		return builder.build();
	}

	public rspRecordStopPlayInfo  OnStopPlayRecord(reqRecordStopPlayInfo info)
	{
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());

		REQ_RECORD_STOP_PLAY_INFO real_info = new REQ_RECORD_STOP_PLAY_INFO(
				server.getIp().getBytes(),
				server.getPort(),
				server.getUsername().getBytes(),
				server.getPassword().getBytes(),
				info.getSzDestIp().getBytes(),
				info.getIDestPort(),
				info.getSzfileName().getBytes(),
				info.getSzUrl().getBytes());

		PGPojo pg = PGUtil.newInstancePGObject(Protocol.REQ_STOP_RECORD_PLAY_VIDEO,0,0, new byte[]{Protocol.TYPE_RECORD_VIDEO_INFO}, new Object[]{ real_info});

		StreamDBService DBStream = FQuery.getRepository(StreamDBService.class);
		Cms_res_stream_infoEntity stream_server =  DBStream.findStreamById(server.getStream_id());


		rspRecordStopPlayInfo.Builder builder = rspRecordStopPlayInfo.newBuilder();
		Channel stream = TcpClient.getChannel(stream_server.getIp(), stream_server.getPort());
		if(stream != null){
			try {
				TcpClient.sendMsg(stream, pg);
			} catch (Exception e) {
				logger.error(e);
			}
		}else{
			logger.error("connect to stream server error ["+stream_server.getIp()+"]  ["+stream_server.getPort()+"]!");
			builder.setMsgCode(-1);
			builder.setMsg("connect to stream server error ["+stream_server.getIp()+"]  ["+stream_server.getPort()+"]!");
		}


		builder.setSzDestIp(info.getSzDestIp());
		builder.setIDestPort(info.getIDestPort());
		builder.setResCode(info.getResCode());
		builder.setSzfileName(info.getSzfileName());

		builder.setSzUrl(info.getSzUrl());

		System.out.println(builder.build().toString());
		return builder.build();

	}


	public  RspPtzInfo OnPtzCmd(ReqPtzInfo info)
	{
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());


		int[] params = new int[4];

		for(int i=0;i<info.getParamCount();i++)
		{
			params[i] = info.getParam(i);			
		}

		System.out.println(info.toString());

		String key = server.getIp()+":"+server.getPort();
		CPTYPE_CTLPTZ cmd = new CPTYPE_CTLPTZ(camera.getIpc_channel(),info.getPtzCmdValue(),params);
		PGPojo pg = PGUtil.newInstancePGObject(PG.CTL_PTZ_REQ,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{PG.CPTYPE_CTLPTZ},  new Object[]{cmd});

		TaskBean bean = new TaskBean(key,pg);
		try {
			PgSendQueue.getInstance().put(bean );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		RspPtzInfo.Builder builder = RspPtzInfo.newBuilder();
		try {
			TaskBean obj = ReturnVector.getInstance().check(bean, 1000);
			if(obj != null){
				System.out.println("返回对象="+obj.getPg().toString());
				builder.setMsg("success!");
				builder.setMsgCode(0);
			}else{
				builder.setMsg("error!");
				builder.setMsgCode(-1);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return builder.build();

	}




	public RspGetPresetInfo OnGetPresetInfo(ReqGetPresetInfo info) {
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());

		String key = server.getIp()+":"+server.getPort();
		CPTYPE_PRESET_SEARCH preset = new CPTYPE_PRESET_SEARCH(camera.getIpc_channel(),info.getPresetIndex());
		PGPojo pg = PGUtil.newInstancePGObject(PG.GET_PTZPRESET_REQ,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{16},  new Object[]{preset});

		TaskBean bean = new TaskBean(key,pg);
		try {
			PgSendQueue.getInstance().put(bean );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		RspGetPresetInfo.Builder builder = RspGetPresetInfo.newBuilder();
		try {
			TaskBean obj = ReturnVector.getInstance().check(bean, 1000);
			if(obj != null){
				System.out.println("返回对象="+obj.getPg().toString());

				PGPojo ret = obj.getPg();
				List<PGAttr> list = ret.getAttrs();
				for(int i=0; i < list.size() ;i++){
					CPTYPE_PTZPRESET pre = (CPTYPE_PTZPRESET) list.get(i).getAttrDataObject(CPTYPE_PTZPRESET.class);
					PresetInfo.Builder  pb = PresetInfo.newBuilder();
					pb.setResCode(resCode);
					pb.setPresetIndex(pre.iPresetIndex);
					String name =  getGBKString(pre.szPresetName);
					System.out.println("获取预置位名称="+name);
					pb.setPresetName(name);
					builder.addItems(pb.build());
				}
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.println(builder.build().toString());
		return builder.build();
	}

	public RspSetPresetInfo OnSetPresetInfo(ReqSetPresetInfo info) {
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());

		String key = server.getIp()+":"+server.getPort();
		CPTYPE_PTZPRESET preset=null;
		try {
			
			System.out.println("预置位名称="+info.getPresetName());
			
			byte[] names = info.getPresetName().getBytes("GBK");
			preset = new CPTYPE_PTZPRESET(camera.getIpc_channel(),info.getPresetIndex(),names  );
			System.out.println(" ----------------------");
			for(int i=0; i < names.length ;i++ ){
				System.out.format("%x ",names[i]);
			}
			System.out.println(" ");
		
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		PGPojo pg = PGUtil.newInstancePGObject(PG.SET_PTZPRESET_REQ,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{PG.CPTYPE_PTZPRESET},  new Object[]{preset});

		TaskBean bean = new TaskBean(key,pg);
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
			e.printStackTrace();
		}
		RspSetPresetInfo.Builder builder = RspSetPresetInfo.newBuilder();
		builder.setMsg("success!");
		builder.setMsgCode(0);
		return builder.build();
	}


	public RspSearchRecordInfo OnSearchRecordInfo(ReqSearchRecordInfo info) {
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);
		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());


		String key = server.getIp()+":"+server.getPort();
		CPTYPE_STORAGEFILE_SEARCH search=null;
		search = new CPTYPE_STORAGEFILE_SEARCH(camera.getIpc_channel(),0,info.getStartTime().getBytes(),info.getStopTime().getBytes());
		PGPojo pg = PGUtil.newInstancePGObject(PG.CTL_FINDFILE_REQ,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{PG.CPTYPE_STORAGESEARCH},  new Object[]{search});

		TaskBean bean = new TaskBean(key,pg);
		try {
			PgSendQueue.getInstance().put(bean );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		RspSearchRecordInfo.Builder builder = RspSearchRecordInfo.newBuilder();
		try {
			TaskBean obj = ReturnVector.getInstance().check(bean, 2000);
			if(obj != null){
				System.out.println("返回对象="+obj.getPg().toString());

				PGPojo ret = obj.getPg();
				List<PGAttr> list = ret.getAttrs();
				for(int i=0; i < list.size() ;i++){
					CPTYPE_STORAGEFILE pre = (CPTYPE_STORAGEFILE) list.get(i).getAttrDataObject(CPTYPE_STORAGEFILE.class);
					RecordFileInfo.Builder  pb = RecordFileInfo.newBuilder();

					pb.setFileName(getGBKString(pre.szFileName));
					pb.setFileSize(pre.iSize);
					pb.setFileType(pre.iFileType);
					pb.setStartTime(getGBKString(pre.szStartTime));
					pb.setStopTime(getGBKString(pre.szStopTime));
					builder.addFiles(pb.build());
				}
			}else{
				logger.error("查询录像列表失败");

			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		System.out.println(builder.build().toString());
		return builder.build();
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

	public RspRecordFileInfo OnRecordFileInfo(ReqRecordFileInfo info) {
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);
		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());


		String key = server.getIp()+":"+server.getPort();
		CPTYPE_STORAGEFILE_DATA search=null;
		search = new CPTYPE_STORAGEFILE_DATA(camera.getIpc_channel(),0,info.getStartTime().getBytes(),info.getStopTime().getBytes(),info.getFileName().getBytes(),info.getUrl().getBytes(),16);
		PGPojo pg = PGUtil.newInstancePGObject(PG.GET_FILE_REQ,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{PG.CPTYPE_STORAGEDATA},  new Object[]{search});

		TaskBean bean = new TaskBean(key,pg);
		try {
			PgSendQueue.getInstance().put(bean );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}		
		RspRecordFileInfo.Builder builder = RspRecordFileInfo.newBuilder();

		try {
			TaskBean obj = ReturnVector.getInstance().check(bean, 2000);
			if(obj != null){
				System.out.println("返回对象="+obj.getPg().toString());

				PGPojo ret = obj.getPg();
				List<PGAttr> list = ret.getAttrs();
				CPTYPE_STORAGEFILE_DATA pre = (CPTYPE_STORAGEFILE_DATA) list.get(0).getAttrDataObject(CPTYPE_STORAGEFILE_DATA.class);
				System.out.println(pre.toString());

				builder.setResCode(info.getResCode());
				builder.setFileName(getGBKString(pre.szFileName));
				builder.setFileType(pre.iFileType);
				builder.setStartTime(getGBKString(pre.szStartTime));
				builder.setStopTime(getGBKString(pre.szStopTime));
				builder.setUrl(getGBKString(pre.playURL));
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(builder.build().toString());
		return builder.build();
	}


	public RspGetAllTourInfo OnGetTourInfo(ReqGetAllTourInfo data)
	{
		TourDBService dbt = FQuery.getRepository(TourDBService.class);
		RoleDBService dbs = FQuery.getRepository(RoleDBService.class);
		WatchDBService DBService = FQuery.getRepository(WatchDBService.class);
		
		List<Cms_res_tour_infoEntity> tours = dbt.findAllTourList();

		RspGetAllTourInfo.Builder  tourBuilder = RspGetAllTourInfo.newBuilder();
		tourBuilder.setType(0);
		for(Cms_res_tour_infoEntity tour : tours)
		{
			TourInfo.Builder  infoBuilder = TourInfo.newBuilder();
			
			infoBuilder.setTourId(tour.getId().intValue());
			infoBuilder.setTourInterval(tour.getInterval());
			infoBuilder.setTourName(tour.getName());
			
			String tour_id=  tour.getId().toString();
			List<TourCfgModel>  list = new ArrayList<TourCfgModel>();

			List<Cms_res_tour_camera_cfg_infoEntity>  cfgs = DBService.getAllTourCdfById(tour_id);

			if(cfgs.size() == 0){

			}else{
				
				List<String> codes =new ArrayList<String>();
				for(Cms_res_tour_camera_cfg_infoEntity cfg :  cfgs){
					codes.add(cfg.getCode());
				}
				List<Cms_res_camera_preset_infoEntity>  presets = DBService.getPresetInfoByCode(codes );

				List<Cms_res_camera_infoEntity> cameras = dbs.findAllCameraByCode(codes);	
				Map<String,String> maps_name = new HashMap<String,String>();

				for(Cms_res_camera_infoEntity cam :  cameras){
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
					list.add(model);
				}
				
				for(TourCfgModel model : list){
					TourCfgCameraInfo.Builder  camBuilder = TourCfgCameraInfo.newBuilder();
					camBuilder.setResCode(model.getCode());
					camBuilder.setCameraName(model.getName());
					if(model.getIndex()==null)
						camBuilder.setPresetIndex(-1);
					else
						camBuilder.setPresetIndex(model.getIndex());
					
					if(model.getIndexName()==null)
						camBuilder.setPresetIndexName("");
					else
						camBuilder.setPresetIndexName(model.getIndexName());
					
					
					
					
					camBuilder.setResType(0);
					infoBuilder.addItems(camBuilder.build());
				}
				
			}
			tourBuilder.addItems(infoBuilder.build());
		
		}
		System.out.println(tourBuilder.build().toString());
		
		return tourBuilder.build();
	}

	
	public RspSetPtzHomeInfo OnSetPtzHomeInfo(ReqSetPtzHomeInfo info)
	{
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());
		String key = server.getIp()+":"+server.getPort();
		PTZ_HOME_INFO ptz_info = new PTZ_HOME_INFO(camera.getIpc_channel(),info.getIPresetIndex(),info.getIHometime(),info.getIHomeEnable());

		PGPojo pg = PGUtil.newInstancePGObject(1106,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{93},  new Object[]{ptz_info});

		TaskBean bean = new TaskBean(key,pg);
		try {
			PgSendQueue.getInstance().put(bean );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		RspSetPtzHomeInfo.Builder builder = RspSetPtzHomeInfo.newBuilder();
		try {
			TaskBean obj = ReturnVector.getInstance().check(bean, 1000);
			if(obj != null){
				System.out.println("返回对象="+obj.getPg().toString());
				builder.setMsg("success!");
				builder.setMsgCode(0);
			}else{
				builder.setMsg("error!");
				builder.setMsgCode(-1);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return builder.build();
	}

	public RspGetPtzHomeInfo OnGetPtzHomeInfo(ReqGetPtzHomeInfo info)
	{
		String resCode = info.getResCode();
		CameraInfoDBService DB = FQuery.getRepository(CameraInfoDBService.class);
		Cms_res_camera_infoEntity camera = DB.findCameraInfoByCode(resCode);

		ServerDBService DBS = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server = DBS.getServerById(camera.getServer_id());
		String key = server.getIp()+":"+server.getPort();
		
		GET_PTZ_HOME_INFO ptz_info = new GET_PTZ_HOME_INFO(camera.getIpc_channel());
		PGPojo pg = PGUtil.newInstancePGObject(1108,RpuConnectMap.getInstance().getSessionId(key),RpuConnectMap.getInstance().getSeqNum(key), new byte[]{1},  new Object[]{ptz_info});

		TaskBean bean = new TaskBean(key,pg);
		try {
			PgSendQueue.getInstance().put(bean );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		RspGetPtzHomeInfo.Builder builder = RspGetPtzHomeInfo.newBuilder();
		try {
			TaskBean obj = ReturnVector.getInstance().check(bean, 1000);
			if(obj != null){
				System.out.println("返回对象="+obj.getPg().toString());
				PGPojo ret = obj.getPg();
				List<PGAttr> list = ret.getAttrs();
				PTZ_HOME_INFO pre = (PTZ_HOME_INFO) list.get(0).getAttrDataObject(PTZ_HOME_INFO.class);
				builder.setResCode(info.getResCode());
				builder.setIPresetIndex(pre.iPresetIndex);
				builder.setIHometime(pre.iHometime);
				builder.setIHomeEnable(pre.iHomeEnable);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return builder.build();
	}
	

	
}
