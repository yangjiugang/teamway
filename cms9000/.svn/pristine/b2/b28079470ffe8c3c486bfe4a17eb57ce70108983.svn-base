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
import org.fastquery.filter.After;
import org.fastquery.filter.Before;

import org.fastquery.filter.SkipFilter;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;
import org.fastquery.where.Condition;

import com.alibaba.fastjson.JSONArray;
import com.teamway.cms.dbentity.Cms_config_userEntity;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;
import com.teamway.cms.dbentity.Cms_res_view_camera_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_view_infoEntity;
import com.teamway.cms.model.CameraPresetModel;



public interface ViewInfoDBService extends QueryRepository {

	

	@Query("select  * from cms_res_view_info where region_id=?1")
	List<Cms_res_view_infoEntity> getViewByRegionId(String region_id);
	
	
	@Modifying
	@Query("insert into cms_res_view_info (id, region_id, name,gmt_create, gmt_modified,remark ) values (NULL,?1,?2,now(),now(),?3)")
	boolean addView(String region_id,String name,String remark);
	
	

	@Query("update cms_res_view_info set name =?2, gmt_modified=now(),remark =?3 where id=?1")
	@Modifying(table="cms_res_view_info",id="id")
	boolean editView(@Id String id,String name,String remark);
	
	
	@Query("delete from cms_res_view_info where id in (?1)")
	@Modifying
	boolean delViewByIds(List<String> ids);
	
	
	@Query("select * from cms_res_view_info where id = ?1")
	Cms_res_view_infoEntity getViewById(String id);
	
	@Query("select * from cms_res_view_info #{#where}")
    @Condition("role_id = ?1 ")
	List<Cms_res_view_infoEntity> getViewByRoleId(String role_id);
	
	@Query("select * from cms_res_camera_preset_info where camera_code = ?1")
	List<Cms_res_camera_preset_infoEntity> getPresetByCameraCode(String code);
	
	@Query("SELECT cfg.id as id, camera.name as name,camera.ipc_channel as channel, preset.camera_code as camera_code,preset.name as preset_name, preset.preset_index as preset_index,cfg.gmt_create as gmt_create,cfg.gmt_modified as gmt_modified,cfg.remark  as remark FROM cms_res_camera_preset_info AS preset,cms_res_view_camera_cfg_info AS cfg,cms_res_camera_info AS camera WHERE camera.`code` = preset.camera_code AND cfg.preset_info_id = preset.id and cfg.view_id=?1")
	List<CameraPresetModel> getCameraByViewId(String view_id);
	
	
	@Modifying
	@Query("insert into cms_res_view_camera_cfg_info (id, view_id, preset_info_id,gmt_create, gmt_modified ) values (NULL,?1,?2,now(),now())")
	boolean regCameraView(String region_id,String name);
	
	@Modifying(table="cms_res_view_camera_cfg_info",id="id")
	@Query("update cms_res_view_camera_cfg_info set view_id=?2, preset_info_id=?3 ,gmt_modified=now() where id=?1")
	boolean regUpdateCameraView(@Id int id , String region_id,String name);
	
	@Query("delete from cms_res_view_camera_cfg_info where id = (?1)")
	@Modifying
	boolean regDelCameraView(int id);
	
	@Query("select * from  cms_res_view_camera_cfg_info where view_id = ?1 and preset_info_id=?2 limit 1")
	Cms_res_view_camera_cfg_infoEntity getCfgByViewPreset(String view_id,String index);
	
	
	
	
}

