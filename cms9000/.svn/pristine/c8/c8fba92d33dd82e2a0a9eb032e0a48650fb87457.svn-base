package com.teamway.cms.dao;

import java.util.List;

import org.fastquery.core.Id;
import org.fastquery.core.Modifying;
import org.fastquery.core.Query;
import org.fastquery.core.QueryRepository;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;

import com.teamway.cms.dbentity.Cms_config_rightEntity;
import com.teamway.cms.dbentity.Cms_config_roleEntity;
import com.teamway.cms.dbentity.Cms_config_role_rightEntity;
import com.teamway.cms.dbentity.Cms_config_role_viewsEntity;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_region_infoEntity;
import com.teamway.cms.dbentity.Cms_res_tour_infoEntity;

public interface TourDBService extends QueryRepository {

	@Query("select * from cms_res_tour_info")
	Page<Cms_res_tour_infoEntity> findAllTour(Pageable pageable);
	

	@Query("select * from cms_res_tour_info")
	List<Cms_res_tour_infoEntity> findAllTourList();
	

	@Query("select * from cms_res_tour_info where id = ?1")
	Cms_res_tour_infoEntity getTourById(String id);

	@Query("insert into cms_res_tour_info (id, name,`interval`, gmt_create, gmt_modifield, remark) values ( NULL,?1,?2,now(),now(),?3 ) ")
	@Modifying(table="cms_res_tour_info",id="id")
	Cms_res_tour_infoEntity addTour(String name , int interval, String remark);

	@Query("update cms_res_tour_info set  name=?1, `interval`=?2,gmt_modifield=now(), remark=?3 where id=?4")
	@Modifying(table="cms_res_tour_info",id="id")
	Cms_res_tour_infoEntity updateTour(String name , int interval, String remark,@Id String id);

	@Query("delete from cms_res_tour_info where id in (?1)")
	@Modifying(table="cms_res_tour_info",id="id")
	int delTour(List<Integer> list_id);

}
