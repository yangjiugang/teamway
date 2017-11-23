package com.teamway.cms.dao;



import java.util.List;

import org.fastquery.core.Id;
import org.fastquery.core.Modifying;
import org.fastquery.core.Query;
import org.fastquery.core.QueryRepository;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;

import com.teamway.cms.dbentity.Cms_res_camera_preset_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_camera_cfg_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_infoEntity;

public interface WatchDBService extends QueryRepository {

	@Query("select * from cms_res_tour_camera_cfg_info")
	Page<Cms_res_tour_camera_cfg_infoEntity> findAllTourCfg(Pageable pageable);

	
	@Query("select * from cms_res_tour_camera_cfg_info where tour_id=?1")
	List<Cms_res_tour_camera_cfg_infoEntity> getAllTourCdfById(String id);
	
	@Query("select * from cms_res_camera_preset_info where camera_code in (?1)")
	List<Cms_res_camera_preset_infoEntity> getPresetInfoByCode(List<String> codes);
	

	
	@Query("delete from cms_res_tour_camera_cfg_info where id in (?1)")
	@Modifying(table="cms_res_tour_camera_cfg_info",id="id")
	int delTourCfgByIds(List<Integer> ids);
	
	

	@Query("delete from cms_res_tour_camera_cfg_info where tour_id in (?1)")
	@Modifying(table="cms_res_tour_camera_cfg_info",id="id")
	int delTourCfgByTourIds(List<Integer> ids);
	
	
	@Query("select * from cms_res_tour_camera_cfg_info where tour_id = ?1 and code=?2 limit 1")
	Cms_res_tour_camera_cfg_infoEntity getTourCfgByIdCode(String id,String code);
	
	@Query("insert into cms_res_tour_camera_cfg_info (id, tour_id,code, gmt_create, gmt_modifield, remark) values ( NULL,?1,?2,now(),now(),?3 ) ")
	@Modifying(table="cms_res_tour_camera_cfg_info",id="id")
	Cms_res_tour_camera_cfg_infoEntity addTourCamreaCfg(String tour_id , String code, String remark);

	@Query("update cms_res_tour_camera_cfg_info set  `index`=?1 , gmt_modifield=now() where id=?2")
	@Modifying(table="cms_res_tour_camera_cfg_info",id="id")
	Cms_res_tour_camera_cfg_infoEntity updateTourCfgIndex(Integer index,@Id Integer id);

	@Query("delete from cms_res_tour_camera_cfg_info where tour_id = ?1 and code=?2")
	@Modifying(table="cms_res_tour_camera_cfg_info",id="id")
	int delTourCfg(String id,String code);

}
