package com.teamway.cms.pgcleint;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.fastquery.page.Page;
import org.fastquery.service.FQuery;

import com.teamway.cms.dao.CameraInfoDBService;
import com.teamway.cms.dao.SensorInfoDBService;
import com.teamway.cms.dao.ServerDBService;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;
import com.teamway.cms.pgserver.PgRecvQueue;
import com.teamway.cms.pgserver.PgSendQueue;
import com.teamway.cms.pgserver.TaskBean;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;
import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PG.DEVINFO;
import com.teamway.cms.pgutils.PG.RPUCLI_RPUNAME;
import com.teamway.cms.pgutils.PG.RPUCLI_SVCADDR;

public class RecvProcessThread  implements Runnable{
	protected Logger log = Logger.getLogger(RecvProcessThread.class);
	
	@Override
	public void run() {
		while(true){
			try {
				TaskBean bean = PgRecvQueue.getInstance().get();
				if(bean.getPg().getHeader().getCode()==PG.GET_RPUSYS_CFG_RES){
					//processPgPackage(bean);
					ReturnVector.getInstance().put(bean);
				}else if(bean.getPg().getHeader().getCode()==PG.REPORT_ALARM_REQ ||
						bean.getPg().getHeader().getCode()==PG.REPORT_ENV  ||
						bean.getPg().getHeader().getCode()==PG.REPORT_BANDWIDTH ){
					
					
					
				}else{
					ReturnVector.getInstance().put(bean);
				}

			} catch (InterruptedException e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}
		}
	}
	
	
	private int processPgPackage(TaskBean bean)
	{
		String[] keys = bean.getKey().split(":");
		String ip = keys[0];
		int port = Integer.parseInt(keys[1]);
		
		ServerDBService DBService = FQuery.getRepository(ServerDBService.class);
		Cms_res_server_infoEntity server= DBService.findOneByIpAndPort(ip, port);
		if(server != null)
		{
			PGPojo obj = bean.getPg();
			int code = obj.getHeader().getCode();
			switch(code)
			{
			case PG.GET_RPUSYS_CFG_RES:
				procRPUinfo(server,obj);
				break;
			default:
				break;

			}
			
		}
		return 0;
	}
	

	private int  procRPUinfo(Cms_res_server_infoEntity server,PGPojo pg)
	{
		RPUCLI_RPUNAME rpu_info = (RPUCLI_RPUNAME) pg.getAttrs().get(0).getAttrDataObject(RPUCLI_RPUNAME.class);
	
		System.out.println(rpu_info.iSubDevIdNum);
		
		byte[] data= pg.getAttrs().get(0).getData();
		List<DEVINFO> subs = new ArrayList<DEVINFO>();
		for(int i=0; i < rpu_info.iSubDevIdNum;i++)
		{
			DEVINFO info = (DEVINFO)PGUtil.byteArrayToObject(data, 308+40*i, DEVINFO.class);
			subs.add(info);
		} 
		

		SensorInfoDBService sensorService = FQuery.getRepository(SensorInfoDBService.class);
		sensorService.deleteSensorByServerId(server.getId());
		
		CameraInfoDBService cameraService = FQuery.getRepository(CameraInfoDBService.class);
		cameraService.deleteCameraByServerId(server.getId());
		
		for(DEVINFO sub:subs){
			String indexcode = String.format("%x", sub.iSubDevId);
			String name ="";
			try {
				 name = new String(sub.szSubDevDesc, "gbk").replaceAll("\0", "");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			int main_type= indexcode.length()==16? Integer.parseInt(indexcode.substring(9, 11)):0;
			int sub_type= indexcode.length()==16? Integer.parseInt(indexcode.substring(11, 13)):0;
			int channel = indexcode.length()==16? Integer.parseInt(indexcode.substring(13, 16)):0;
			
			if(main_type==2)//环境量设备
			{
				Cms_res_sensor_infoEntity sensor= sensorService.addsensor(sub_type, server.getId(),name,indexcode,channel);
			}else if(main_type==1){//视频设备
				Cms_res_camera_infoEntity camera= cameraService.addCamera(sub_type, server.getId(),name,indexcode,channel);
			}
		}
		RPUCLI_SVCADDR addr_info = (RPUCLI_SVCADDR) pg.getAttrs().get(1).getAttrDataObject(RPUCLI_SVCADDR.class);
		return 0;
	}

//	try {
//	System.out.println(String.format("%x", info.iSubDevId)+"  "+ new String(info.szSubDevDesc, "gbk").replaceAll("\0", ""));
//} catch (UnsupportedEncodingException e) {
//	e.printStackTrace();
//}
}
