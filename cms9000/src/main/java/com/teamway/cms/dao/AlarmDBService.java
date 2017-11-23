package com.teamway.cms.dao;



import java.util.List;

import org.fastquery.core.Id;
import org.fastquery.core.Modifying;
import org.fastquery.core.Query;
import org.fastquery.core.QueryRepository;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;

import com.teamway.cms.dbentity.Cms_res_alarm_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_camera_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_infoEntity;
import com.teamway.cms.model.AlarmCfgModel;
import com.teamway.cms.model.AlarmLinkagePresetModel;

public interface AlarmDBService extends QueryRepository {

	@Query("select * from cms_res_alarm_cfg_info where type=?1")
	List<Cms_res_alarm_cfg_infoEntity> findAllCfgByType(int type);
	
	@Modifying
	@Query("insert into  cms_res_alarm_cfg_info (code,alarm_type,alarm_level,type,region_id,gmt_create,gmt_modified) values (?1,?2,?3,?5,?4, now(),now())")
	boolean  addCameraAlarmCfg(String code,String alarm_type,String alarm_level,String region_id,int type);
	
	@Modifying
	@Query("replace into cms_res_alarm_cfg_linkage_preset (id,cfg_id,preset_id,is_record ,gmt_create,gmt_modified) values (NULL,?1,?2,0,now(),now())")
	boolean  save_camera_preset_linkage(Integer cfg_id,Integer preset_id);
	
	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,cam.name as name from cms_res_alarm_cfg_info as cfg,cms_res_camera_info as cam where  cfg.type=1 and cfg.region_id=?1 and cfg.code = cam.code")
	List<AlarmCfgModel> getCameraCfgByRegionId(int region_id);
	
	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,env.name as name from cms_res_alarm_cfg_info as cfg,cms_res_sensor_info as env where  cfg.type=2 and  cfg.region_id=?1 and cfg.code = env.code")
	List<AlarmCfgModel> getIoCfgByRegionId(int region_id);
	
	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,env.name as name from cms_res_alarm_cfg_info as cfg,cms_res_sensor_info as env where  cfg.type=3 and  cfg.region_id=?1 and cfg.code = env.code")
	List<AlarmCfgModel> getEnvCfgByRegionId(int region_id);
	
	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,cam.name as name from cms_res_alarm_cfg_info as cfg,cms_res_camera_info as cam where  cfg.code = cam.code")
	List<AlarmCfgModel> getCameraCfgAll();
	
	@Query("select cfg.id as id , cfg.is_record as is_record, preset.preset_index as preset_index , preset.name as index_name , cam.`name` as `name`,cam.code as resCode from cms_res_alarm_cfg_linkage_preset  as cfg,cms_res_camera_preset_info as preset ,cms_res_camera_info as cam  where cfg.cfg_id=?1 and cfg.preset_id = preset.id AND cam.`code` = preset.camera_code")
	List<AlarmLinkagePresetModel> get_camera_linkage_preset(int cfg_id);
	
	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,cam.name as name from cms_res_alarm_cfg_info as cfg,cms_res_camera_info as cam where cfg.type=1 and cfg.id=?1 and cfg.code = cam.code")
	AlarmCfgModel getCameraAlarmCfgById(int id);

	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,env.name as name from cms_res_alarm_cfg_info as cfg,cms_res_sensor_info as env where cfg.type=2 and cfg.id=?1 and cfg.code = env.code")
	AlarmCfgModel getIoAlarmCfgById(int id);
	
	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,env.name as name from cms_res_alarm_cfg_info as cfg,cms_res_sensor_info as env where cfg.type=3 and cfg.id=?1 and cfg.code = env.code")
	AlarmCfgModel getEnvAlarmCfgById(int id);
	
	@Query("update   cms_res_alarm_cfg_info set alarm_level =?1 where id in (?2)")
	@Modifying(table="cms_res_alarm_cfg_info",id="id")
	boolean  changeAlarmLevel(String level,List<Integer> ids);
	
	@Query("delete from cms_res_alarm_cfg_info where id in (?1)")
	@Modifying(table="cms_res_alarm_cfg_info",id="id")
	boolean  delAlarmCfg(List<Integer> ids);
	
	@Query("delete from cms_res_alarm_cfg_linkage_preset where id in (?1)")
	@Modifying(table="cms_res_alarm_cfg_linkage_preset",id="id")
	boolean  del_camera_preset_linkage(List<Integer> ids);
	
	@Query("update cms_res_alarm_cfg_linkage_preset set is_record=?2 where id in (?1)")
	@Modifying(table="cms_res_alarm_cfg_linkage_preset",id="id")
	boolean  changeRecordLinkage(List<Integer> ids,Integer is_record);
	
	@Query("select cfg.id as id ,cfg.code as code, cfg.alarm_type as alarm_type, cfg.alarm_level as alarm_level,env.name as name from cms_res_alarm_cfg_info as cfg,cms_res_sensor_info as env where cfg.type in (2,3) and cfg.code=?1 and cfg.code = env.code")
	List<AlarmCfgModel> getIoEnvAlarmCfgByCode(String code);
	
	
	
}
