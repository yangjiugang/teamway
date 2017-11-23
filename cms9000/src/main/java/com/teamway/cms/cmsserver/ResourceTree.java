package com.teamway.cms.cmsserver;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.fastquery.service.FQuery;

import com.teamway.cms.cmsserver.TYProtoBean.RspGetAllViewInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspResTreeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspTreeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.VideoViewInfo;
import com.teamway.cms.cmsserver.TYProtoBean.VideoViewIpcInfo;
import com.teamway.cms.dao.CameraInfoDBService;
import com.teamway.cms.dao.RegionInfoDBService;
import com.teamway.cms.dao.ViewInfoDBService;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_view_infoEntity;
import com.teamway.cms.model.CameraPresetModel;

public class ResourceTree {

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
			itemBuilder.setIcon("file.png");
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
				for(Cms_res_camera_infoEntity camera : cameraList){
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
		System.out.println(result_builder.build().toString());
		return result_builder.build();
	}

}
