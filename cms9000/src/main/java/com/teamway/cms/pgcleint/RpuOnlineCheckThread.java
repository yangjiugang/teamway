package com.teamway.cms.pgcleint;

import java.util.List;

import org.apache.log4j.Logger;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;
import org.fastquery.service.FQuery;

import com.teamway.cms.dao.RegionInfoDBService;
import com.teamway.cms.dao.ServerDBService;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;

public class RpuOnlineCheckThread  implements Runnable  {
	protected Logger log = Logger.getLogger(RpuOnlineCheckThread.class);
	
	@Override
	public void run() {

		for(;;)
		{
			try {
				Thread.sleep(1000*10);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			ServerDBService DB =FQuery.getRepository(ServerDBService.class);		
			List<Cms_res_server_infoEntity> servers =  DB.findByType(1);
			for(Cms_res_server_infoEntity info : servers)
			{
				String key = info.getIp()+":"+info.getPort();
				RpuClientBean bean = RpuConnectMap.getInstance().get(key);
				if(bean == null){
					RpuClient client = new RpuClient(info.getIp(),info.getPort());
					if(client.getSocketChannel()==null || !client.getSocketChannel().isOpen()){
						log.error("connect to rpu ["+info.getIp()+"] ["+info.getPort()+"] error !");
					}
				}else if(!bean.getCtx().channel().isOpen()){
					
					System.out.println("关闭");
					bean.getCtx().channel().close();
					RpuConnectMap.getInstance().remove(key);
				}	
			}			
		}
	}
}