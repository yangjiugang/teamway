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
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;



public interface RegionInfoDBService extends QueryRepository {


//	@Query("insert into cms_res_camera_info (id, type_id, region_id, server_id, name, username, password, ip, port, state, code, ipc_channel, rtsp_url, ptz_url, gmt_create, gmt_motified, remark) values (NULL,?1,NULL,?2,?3,NULL,NULL,NULL,NULL,NULL,?4,?5,NULL,NULL,now(),now(),NULL)")
//	@Modifying(table="cms_res_camera_info",id="id")
//	Cms_res_camera_infoEntity addCamera(Integer type_id,Integer server_id,String name,String code,Integer ipc_channel);
//
//
//	@Modifying
//	@Query("delete from cms_res_camera_info where server_id=?1")
//	boolean deleteCameraByServerId(Integer server_id);

	@Query("select  * from cms_res_region_info")
	List<Cms_res_region_infoEntity> findAll();
	
	
	@Query("select * from cms_res_region_info order by id asc limit 1")
	Cms_res_region_infoEntity findRootRegion();

	

	@Query("select  * from cms_res_region_info where pid=?1")
	List<Cms_res_region_infoEntity> findByPid(Long id);
	
	@Query("select * from cms_res_region_info where id=?1")
	Cms_res_region_infoEntity findById(Integer id);

	
	@Query("select  * from cms_res_server_info")
	List<Cms_res_server_infoEntity> findAllServer();
	
	
	@Query("SELECT  * FROM cms_res_camera_info WHERE  region_id IS  NULL")
	List<Cms_res_camera_infoEntity> findAllUnRegCamera();
	
	
	@Modifying
	@Query("delete from cms_res_region_info where id=?1")
	boolean deleteById(Integer id);
	
	@Modifying
	@Query("insert into cms_res_region_info (id, pid, type_id, name, state, code, icon,gmt_create, gmt_modifield, remark ) values (NULL,?1,0,?2,0,NULL,?4,now(),now(),?3)")
	boolean add(Integer pid,String name,String remark,String icon);

	@Modifying
	@Query("update cms_res_region_info set name=?1,gmt_modifield=now(), remark=?2,icon=?4 where id=?3")
	boolean region_update(String name,String remark,Integer id,String icon);
	

	@Query("update cms_res_camera_info as ipc set ipc.region_id=?1,ipc.gmt_modified=now() where ipc.code in (?2)")
	@Modifying(table="cms_res_camera_info",id="id")
	boolean updateCameraRegion(int region_id,List<String> list);
	
	@Query("update cms_res_camera_info as ipc set ipc.region_id=NULL,ipc.gmt_modified=now() where ipc.code in (?1)")
	@Modifying(table="cms_res_camera_info",id="id")
	boolean updateUnCameraRegion(List<String> list);
	
	@Query("SELECT  * FROM cms_res_camera_info WHERE  region_id = ?1")
	Page<Cms_res_camera_infoEntity> getCameraByRegionId(String region_id,Pageable  pageable);
	
}
