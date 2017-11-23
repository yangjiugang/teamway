package com.teamway.cms.dao;

import java.util.List;

import org.fastquery.core.Id;
import org.fastquery.core.Modifying;
import org.fastquery.core.Query;
import org.fastquery.core.QueryRepository;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;


import com.teamway.cms.dbentity.Cms_res_stream_infoEntity;

public interface StreamDBService extends QueryRepository {
	
	
	@Query("select * from cms_res_stream_info")
	Page<Cms_res_stream_infoEntity> getStreamAll(Pageable pageable);
	

	@Query("select * from cms_res_stream_info where id = ?1")
	Cms_res_stream_infoEntity findStreamById(int id);
	
	
	@Query("insert into cms_res_stream_info (id,name,ip,port,username,password, gmt_create, gmt_modified, remark) values (NULL,?1, ?2,?3, ?4, ?5,now(),now(),?6)")
	@Modifying(table="cms_res_stream_info",id="id")
	int addStreamInfo(String name,String ip,String port,String username,String password,String remark);
	

	@Query("update cms_res_stream_info  set name=?1,ip=?2,port=?3,username=?4,password=?5, gmt_modified=now(), remark=?6 where id=?7")
	@Modifying(table="cms_res_stream_info",id="id")
	int updateStreamInfo(String name,String ip,String port,String username,String password,String remark,@Id int id);

	

	@Query("delete from cms_res_stream_info where id in (?1)")
	@Modifying(table="cms_res_stream_info",id="id")
	int deleteStreamByIds(List<String> list);
	

}
