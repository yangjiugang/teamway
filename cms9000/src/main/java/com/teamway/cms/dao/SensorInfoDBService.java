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
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;



public interface SensorInfoDBService extends QueryRepository {
   
	
   @Query("insert into cms_res_sensor_info (id, type_id, region_id, server_id, name, maxRange, minRange, limit_4, limit_3, limit_2, limit_1, limit_type, code, gmt_create, gmt_motified, remark,channel) values (NULL,?1,NULL,?2,?3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,?4,now(),now(),NULL,?5)")
   @Modifying(table="cms_res_sensor_info",id="id")
   Cms_res_sensor_infoEntity addsensor(Integer type_id,Integer server_id,String name,String code,int channel);
    
   
   @Modifying
   @Query("delete from cms_res_sensor_info where server_id=?1")
   boolean deleteSensorByServerId(Integer server_id);
	
   
   @Modifying
   @Query("delete from cms_res_sensor_info where code=?1")
   boolean deleteSersorByCode(String  code);
   
   
   
   
   @Query("select * from cms_res_sensor_info where type_id in (?1)")
   List<Cms_res_sensor_infoEntity> findAllByTypeId(List<Integer> type_ids);
   

   @Query("select * from cms_res_sensor_info where server_id =?1")
   List<Cms_res_sensor_infoEntity> findAllByServerId(Integer server_id);
   
   @Modifying
   @Query("update cms_res_sensor_info  set type_id=?1, channel=?4 ,name=?2 , gmt_motified=now() where code=?3")
   boolean updateSersor(Integer type_id,String name,String code,int channel);
   
	 
}

