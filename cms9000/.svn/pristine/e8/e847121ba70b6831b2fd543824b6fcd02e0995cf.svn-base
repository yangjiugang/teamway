package com.teamway.cms.dao;

import java.util.List;
import java.util.Map;

import org.fastquery.core.Id;
import org.fastquery.core.Modifying;
import org.fastquery.core.Param;
import org.fastquery.core.Primarykey;
import org.fastquery.core.Query;
import org.fastquery.core.QueryByNamed;
import org.fastquery.core.QueryRepository;
import org.fastquery.core.Transactional;
import org.fastquery.filter.After;
import org.fastquery.filter.Before;

import org.fastquery.filter.SkipFilter;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;
import org.fastquery.where.Condition;

import com.alibaba.fastjson.JSONArray;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;



public interface CameraInfoDBService extends QueryRepository {
   
	
   @Query("insert into cms_res_camera_info (id, type_id, region_id, server_id, name, username, password, ip, port, state, code, ipc_channel, rtsp_url, ptz_url, gmt_create, gmt_modified, remark) values (NULL,?1,NULL,?2,?3,NULL,NULL,NULL,NULL,NULL,?4,?5,NULL,NULL,now(),now(),NULL)")
   @Modifying(table="cms_res_camera_info",id="id")
   Cms_res_camera_infoEntity addCamera(Integer type_id,Integer server_id,String name,String code,Integer ipc_channel);
    
   
   @Modifying
   @Query("delete from cms_res_camera_info where server_id=?1")
   boolean deleteCameraByServerId(Integer server_id);
   
   @Modifying
   @Query("delete from cms_res_camera_info where code=?1")
   boolean deleteCameraByCode(String server_id);
   
   
   
   @Query("select * from cms_res_camera_info where server_id=?1")
   List< Cms_res_camera_infoEntity> findCameraByServerId(Integer id);
   
   @Query("select * from cms_res_camera_info")
   List< Cms_res_camera_infoEntity> findAll();
   
   @Query("select *  from cms_res_camera_info  where code = ?1")
   Cms_res_camera_infoEntity findCameraInfoByCode(String code);
   
   
   
   @Query("update cms_res_camera_info set type_id=?1, ipc_channel=?2 ,name=?3 , gmt_modified=now() where code=?4")
   @Modifying(table="cms_res_camera_info",id="id")
   boolean updateCamera(Integer type_id,Integer channel,String name,String code);
   
   
   @Query("update cms_res_camera_preset_info set name=?2, gmt_modified=now(),enable=1 where camera_code=?3 and preset_index=?1")
   @Modifying(table="cms_res_camera_preset_info",id="id")
   boolean updateCameraPreset(Integer index,String name,String code);
   
   
   @Query("insert into cms_res_camera_preset_info (id,preset_index,name,camera_code,enable,gmt_create,gmt_modified) values (NULL,?1,?2,?3,1,now(),now() )")
   @Modifying(table="cms_res_camera_preset_info",id="id")
   boolean addCameraPreset(Integer index,String name,String code);
  
   @Query("delete from cms_res_camera_preset_info where camera_code=?2 and preset_index=?1")
   @Modifying(table="cms_res_camera_preset_info",id="id")
   boolean delCameraPreset(Integer index,String code);
    
   @Query("select * from cms_res_camera_preset_info where camera_code=?1")
   List<Cms_res_camera_preset_infoEntity> findCameraPresetByCode(String code);
   
   @Transactional
   @Modifying
   @Query("delete from cms_res_view_camera_cfg_info  where preset_info_id=?1")
   @Query("delete from cms_res_alarm_cfg_linkage_preset where preset_id=?1")
   @Query("delete from cms_res_tour_camera_cfg_info  where `code`=?2 and index=?3")
   int deletePresetIdBatch(Integer preset_info_id,String code,Integer index);
   
   
   @Transactional
   @Modifying
   @Query("delete from cms_res_alarm_cfg_info  where `code`=?1")
   @Query("delete from cms_res_tour_camera_cfg_info where `code`=?1")
   int deleteCameraBatch(String code);
   

}

