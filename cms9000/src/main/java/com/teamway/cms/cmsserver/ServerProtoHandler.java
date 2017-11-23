package com.teamway.cms.cmsserver;



import com.teamway.cms.cmsserver.TYProtoBean.*;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class ServerProtoHandler extends ChannelInboundHandlerAdapter implements TYProtoSerilizer.TYProtoFunc {
	
	
	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		assert( msg != null );
		try
		{
			TYProtoSerilizer serial = (TYProtoSerilizer) msg;
			serial.Handler(ctx, this);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {

		super.exceptionCaught(ctx, cause);
		cause.printStackTrace();
		//出现异常，关闭链路
		ctx.close();
	}

	@Override
	public void OnLogin(ChannelHandlerContext ctx, ReqLoginInfo user) {
		
		//int port = user.getReportPort();
		//if(port!=0){
		//	String addr = user.getReportIp()+":"+user.getReportPort();
			//ClientList.getInstance().put(addr);
		//}
		// 验证用户名和密码  用户验证模块
		if( user.getPassword().equals("12345") &&  user.getUsername().equals("admin") ){
			RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.LOGIN_RSP_ENUM_VALUE,RspLoginInfo.newBuilder().setMsgCode(1).build());
			ctx.writeAndFlush(model);
			ClientList.getInstance().put(ctx);
		}else{
			RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.LOGIN_RSP_ENUM_VALUE,RspLoginInfo.newBuilder().setMsgCode(-1).setMsg("username or password error !") .build());
			ctx.writeAndFlush(model);
		}
	}

	@Override
	public void OnResTree(ChannelHandlerContext ctx, ReqResTreeInfo data) {
		if(data.getResTreeType()== ResTreeTypeEnum.VIDEO_TYPE_ENUM){
			//获取视频界面资源列表
			ServerProtoHandlerExp resTree = new ServerProtoHandlerExp();
			RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.RES_TREE_RSP_ENUM_VALUE, resTree.getVideoResTree(0));
			ctx.writeAndFlush(model);
		}		
	}

	@Override
	public void OnGetView(ChannelHandlerContext ctx, ReqGetAllViewInfo data) {
	
		ServerProtoHandlerExp resTree = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.GET_VIDEO_VIEWS_RSP_ENUM_VALUE, resTree.getViewInfo(0));
		ctx.writeAndFlush(model);
		
	}

	@Override
	public void OnStartVideo(ChannelHandlerContext ctx, ReqStartVideoInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.START_VIDEO_RSP_ENUM_VALUE, exp.RspStartVideo(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnStopVideo(ChannelHandlerContext ctx, ReqStopVideoInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.STOP_VIDEO_RSP_ENUM_VALUE, exp.RspStopVideo(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnPtzCmd(ChannelHandlerContext ctx, ReqPtzInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.CALL_PTZ_RSP_ENUM_VALUE, exp.OnPtzCmd(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnGetPresetInfo(ChannelHandlerContext ctx, ReqGetPresetInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.GET_PRESET_RSP_ENUM_VALUE, exp.OnGetPresetInfo(data));
		ctx.writeAndFlush(model);         
	}

	@Override
	public void OnSetPresetInfo(ChannelHandlerContext ctx, ReqSetPresetInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.SET_PRESET_RSP_ENUM_VALUE, exp.OnSetPresetInfo(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnSearchRecordInfo(ChannelHandlerContext ctx, ReqSearchRecordInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.SEARCH_RECORD_RSP_ENUM_VALUE, exp.OnSearchRecordInfo(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnRecordFileInfo(ChannelHandlerContext ctx, ReqRecordFileInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.RECORD_FILE_RSP_ENUM_VALUE, exp.OnRecordFileInfo(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnStartPlayRecord(ChannelHandlerContext ctx, reqRecordStartPlayInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.RSP_START_RECORD_PLAY_VIDEO_VALUE, exp.OnStartPlayRecord(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnStopPlayRecord(ChannelHandlerContext ctx, reqRecordStopPlayInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.RSP_STOP_RECORD_PLAY_VIDEO_VALUE, exp.OnStopPlayRecord(data));
		ctx.writeAndFlush(model);
	}

	@Override
	public void OnGetTourInfo(ChannelHandlerContext ctx, ReqGetAllTourInfo data) {
		
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
	
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.RSP_GET_TOUR_LIST_VALUE,	exp.OnGetTourInfo(data));
		ctx.writeAndFlush(model);
		
	}

	@Override
	public void OnSetPtzHomeInfo(ChannelHandlerContext ctx, ReqSetPtzHomeInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.RSP_SET_PTZHOME_INFO_VALUE,	exp.OnSetPtzHomeInfo(data));
		ctx.writeAndFlush(model);
		
	}

	@Override
	public void OnGetPtzHomeInfo(ChannelHandlerContext ctx, ReqGetPtzHomeInfo data) {
		ServerProtoHandlerExp exp = new ServerProtoHandlerExp();
		RspObjectModel model = new RspObjectModel(TYProtoBean.ProtoMsgTypeEnum.RSP_GET_PTZHOME_INFO_VALUE,	exp.OnGetPtzHomeInfo(data));
		ctx.writeAndFlush(model);
	}

}
