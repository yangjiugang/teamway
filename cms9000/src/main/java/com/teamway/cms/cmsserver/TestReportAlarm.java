package com.teamway.cms.cmsserver;

import java.util.List;

import org.fastquery.service.FQuery;

import com.teamway.cms.cmsserver.TYProtoBean.AlarmInfoReport;
import com.teamway.cms.cmsserver.TYProtoBean.LinkedCameraInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspLoginInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspStartVideoInfo;
import com.teamway.cms.dao.AlarmDBService;
import com.teamway.cms.dbentity.Cms_res_alarm_cfg_infoEntity;
import com.teamway.cms.model.AlarmCfgModel;
import com.teamway.cms.model.AlarmLinkagePresetModel;

public class TestReportAlarm implements Runnable {

	@Override
	public void run() {
		test();
	}

	public void test()
	{
		 for(;;)
		 {
			try {
				Thread.sleep(1000*10); //10秒钟上报一次
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			AlarmDBService dbs =  FQuery.getRepository(AlarmDBService.class);
			List<AlarmCfgModel> cfgs = dbs.getCameraCfgAll();  
			System.out.println("报警上报");
			for(AlarmCfgModel cfg : cfgs)
			{
				AlarmInfoReport.Builder builder = AlarmInfoReport.newBuilder();
				builder.setResCode(cfg.getCode());
				builder.setAlarmType(cfg.getAlarm_type());
				builder.setAlarmState(1);
				builder.setResName(cfg.getName());
			
				List<AlarmLinkagePresetModel> presets = dbs.get_camera_linkage_preset(cfg.getId().intValue());
				if(presets==null ||presets.size()==0 ){
					
				}else{
					for(AlarmLinkagePresetModel preset : presets){
						LinkedCameraInfo.Builder link_builder = LinkedCameraInfo.newBuilder();
						link_builder.setPresetIndex(preset.getPreset_index());
						link_builder.setResCode(preset.getResCode());
						builder.addLinkedCameraItems(link_builder.build());
					}
				}
				AlarmInfoReport alarm = builder.build();
				
				System.out.println(alarm.toString());
				RspObjectModel msg = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.ALARM_INFO_REPORT_VALUE,alarm);
				ClientList.getInstance().report(msg);
			}
		 }
	}
	
	
}
