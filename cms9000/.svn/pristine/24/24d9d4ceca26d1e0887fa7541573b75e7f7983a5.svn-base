package com.teamway.cms.env;

import java.util.List;

import org.apache.log4j.Logger;
import org.fastquery.service.FQuery;

import com.teamway.cms.cmsserver.ClientList;
import com.teamway.cms.cmsserver.RspObjectModel;
import com.teamway.cms.cmsserver.TYProtoBean;
import com.teamway.cms.cmsserver.TYProtoSerilizer;
import com.teamway.cms.env.TYProtoBeanEnv.AlarmTypeEnum;
import com.teamway.cms.env.TYProtoBeanEnv.ReportAlarmInfo;
import com.teamway.cms.env.TYProtoBeanEnv.ReportRealDataInfo;
import com.teamway.cms.env.TYProtoBeanEnv.ResDevNameTypeEnum;
import com.teamway.cms.env.TYProtoBeanEnv.RspResInfo;
import com.teamway.cms.env.TYProtoBeanEnv.ServerResInfo;
import com.teamway.cms.env.TYProtoBeanEnv.SubDevResInfo;
import com.teamway.cms.model.AlarmCfgModel;
import com.teamway.cms.model.AlarmLinkagePresetModel;
import com.teamway.cms.webcontroller.ServerCtl;
import com.teamway.cms.cmsserver.TYProtoBean.AlarmInfoReport;
import com.teamway.cms.cmsserver.TYProtoBean.LinkedCameraInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqLoginInfo;
import com.teamway.cms.cmsserver.TYProtoBean.RspLoginInfo;
import com.teamway.cms.dao.AlarmDBService;
import com.teamway.cms.dao.CameraInfoDBService;
import com.teamway.cms.dao.SensorDBService;
import com.teamway.cms.dao.ServerDBService;
import com.teamway.cms.dbentity.Cms_res_camera_infoEntity;
import com.teamway.cms.dbentity.Cms_res_sensor_infoEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class EnvProtoHandler  extends ChannelInboundHandlerAdapter{
	protected Logger log = Logger.getLogger(EnvProtoHandler.class);

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {

		ProtoObjectModel model = (ProtoObjectModel) msg;

		switch(model.getType())
		{
		case TYProtoBeanEnv.ProtoMsgTypeEnum.LOGIN_REQ_ENUM_VALUE:
		{
			ReqLoginInfo info =ReqLoginInfo.getDefaultInstance().getParserForType().parseFrom(model.getMsgData(),model.getOffset(),model.getLength());
			if(info.getUsername().equals("admin") &&  info.getPassword().equals("12345")){

			}else{

			}
			RspObjectModel out = new RspObjectModel(TYProtoBeanEnv.ProtoMsgTypeEnum.LOGIN_RSP_ENUM_VALUE,RspLoginInfo.newBuilder().setMsgCode(1).build());
			ctx.writeAndFlush(out);
			break;
		}
		case TYProtoBeanEnv.ProtoMsgTypeEnum.RES_INFO_REQ_ENUM_VALUE:
		{
			RspObjectModel out = new RspObjectModel(TYProtoBeanEnv.ProtoMsgTypeEnum.RES_INFO_RSP_ENUM_VALUE,getEnvResTree(0));
			ctx.writeAndFlush(out);
			break;
		}
		case TYProtoBeanEnv.ProtoMsgTypeEnum.ALARM_INFO_REPORT_ENUM_VALUE:
		{
			ReportAlarmInfo info =ReportAlarmInfo.getDefaultInstance().getParserForType().parseFrom(model.getMsgData(),model.getOffset(),model.getLength());
			log.info(info.toString());

			reportAlarm(info);


			break;
		}
		case TYProtoBeanEnv.ProtoMsgTypeEnum.REAL_DATA_INFO_REPORT_ENUM_VALUE:
		{
			ReportRealDataInfo info =ReportRealDataInfo.getDefaultInstance().getParserForType().parseFrom(model.getMsgData(),model.getOffset(),model.getLength());
			log.info(info.toString());


			//
			break;
		}
		default:
			break;

		}		
	}


	private void  reportAlarm(ReportAlarmInfo info)
	{
		AlarmDBService dbs =  FQuery.getRepository(AlarmDBService.class);

		List<AlarmCfgModel> cfgs =  dbs.getIoEnvAlarmCfgByCode(info.getResCode());
		System.out.println("报警上报");

		if(info.getAlarmType()==AlarmTypeEnum.ALM_TYPE_GPIN){ //告警输入
			for(AlarmCfgModel cfg : cfgs)
			{
				if(cfg.getAlarm_type()==255)
					continue;

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

				RspObjectModel msg = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.ALARM_INFO_REPORT_VALUE,alarm);
				ClientList.getInstance().report(msg);
			}
		}else if(info.getAlarmType()==AlarmTypeEnum.ALM_TYPE_ANALOG){ //告警输出
			for(AlarmCfgModel cfg : cfgs)
			{
				if(cfg.getAlarm_type()==1)
					continue;

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

				RspObjectModel msg = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.ALARM_INFO_REPORT_VALUE,alarm);
				ClientList.getInstance().report(msg);
			}
		}else if(info.getAlarmType()==AlarmTypeEnum.ALM_TYPE_NONE || info.getAlarmType()==AlarmTypeEnum.ALM_TYPE_LOSS_DETECT || info.getAlarmType()==AlarmTypeEnum.ALM_TYPE_HIDE_DETECT || info.getAlarmType()==AlarmTypeEnum.ALM_TYPE_MOTION_DETECT ){

			for(AlarmCfgModel cfg : cfgs)
			{
				if(cfg.getAlarm_type()== (info.getAlarmTypeValue()+1 ))
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

					RspObjectModel msg = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.ALARM_INFO_REPORT_VALUE,alarm);
					ClientList.getInstance().report(msg);
				}
			}

		}
	}


	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {

		super.exceptionCaught(ctx, cause);
		cause.printStackTrace();
		ctx.close();
	}


	private RspResInfo  getEnvResTree(int type)
	{
		ServerDBService dbserver = FQuery.getRepository(ServerDBService.class);
		List<Cms_res_server_infoEntity> servers = dbserver.findByType(1);  //南网

		SensorDBService  dbseneor =  FQuery.getRepository(SensorDBService.class);
		List<Cms_res_sensor_infoEntity> sensors = dbseneor.findAll(); 

		RspResInfo.Builder  serversBuilder = RspResInfo.newBuilder();

		for(Cms_res_server_infoEntity server : servers)
		{
			ServerResInfo.Builder  serverBuilder= ServerResInfo.newBuilder();
			serverBuilder.setName(server.getName());
			serverBuilder.setResCode(server.getCode());

			serverBuilder.setIp(server.getIp());
			serverBuilder.setPort(server.getPort());
			serverBuilder.setUsername(server.getUsername());
			serverBuilder.setPassword(server.getPassword());


			for(Cms_res_sensor_infoEntity sensor : sensors){
				if(sensor.getServer_id() == server.getId())
				{
					SubDevResInfo.Builder subBuilder =  SubDevResInfo.newBuilder();
					int channel =  Integer.parseInt(sensor.getCode().substring(13, 16));
					System.out.println(channel);
					subBuilder.setChannel(channel);
					subBuilder.setName(sensor.getName());
					subBuilder.setResCode(sensor.getCode());
					//subBuilder.setType(  ResDevNameTypeEnum.values()[sensor.getType_id()+50]);
					serverBuilder.addSubs(subBuilder.build());
				}
			}
			serversBuilder.addServers(serverBuilder.build());
		}

		System.out.println( serversBuilder.build() );
		return serversBuilder.build();
	}


}
