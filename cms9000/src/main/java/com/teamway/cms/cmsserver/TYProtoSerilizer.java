package com.teamway.cms.cmsserver;



import com.google.protobuf.MessageLite;
import com.teamway.cms.cmsserver.TYProtoBean.ReqGetAllTourInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqGetAllViewInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqGetPresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqGetPtzHomeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqLoginInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqPtzInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqRecordFileInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqResTreeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqSearchRecordInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqSetPresetInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqSetPtzHomeInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqStartVideoInfo;
import com.teamway.cms.cmsserver.TYProtoBean.ReqStopVideoInfo;
import com.teamway.cms.cmsserver.TYProtoBean.reqRecordStartPlayInfo;
import com.teamway.cms.cmsserver.TYProtoBean.reqRecordStopPlayInfo;

import io.netty.channel.ChannelHandlerContext;


public class TYProtoSerilizer {
	
	public interface TYProtoFunc 
	{	
		void OnLogin(ChannelHandlerContext ctx,ReqLoginInfo user);
		void OnResTree(ChannelHandlerContext ctx,ReqResTreeInfo data);
		void OnGetView(ChannelHandlerContext ctx, ReqGetAllViewInfo data);
		void OnStartVideo(ChannelHandlerContext ctx, ReqStartVideoInfo data);
		void OnStopVideo(ChannelHandlerContext ctx, ReqStopVideoInfo data);
		
		
		void OnPtzCmd(ChannelHandlerContext ctx, ReqPtzInfo data);
		void OnGetPresetInfo(ChannelHandlerContext ctx, ReqGetPresetInfo data);
		void OnSetPresetInfo(ChannelHandlerContext ctx, ReqSetPresetInfo data);
		void OnSearchRecordInfo(ChannelHandlerContext ctx, ReqSearchRecordInfo data);
		void OnRecordFileInfo(ChannelHandlerContext ctx, ReqRecordFileInfo data);
		void OnStartPlayRecord(ChannelHandlerContext ctx, reqRecordStartPlayInfo data);
		
		void OnStopPlayRecord(ChannelHandlerContext ctx, reqRecordStopPlayInfo data);
		
		
		void OnGetTourInfo(ChannelHandlerContext ctx, ReqGetAllTourInfo data);
		
		
		void OnSetPtzHomeInfo(ChannelHandlerContext ctx, ReqSetPtzHomeInfo data);
		void OnGetPtzHomeInfo(ChannelHandlerContext ctx, ReqGetPtzHomeInfo data);
		
		
		
	}
	
	private byte codec;
	private MessageLite body;
	
	
	static final int hdrlen = 5;
	static final byte version = 1;
	static final byte reserve = 0;
	
	
	public TYProtoSerilizer()
	{
		codec = 0;
		body = null;
	}
	public boolean Handler(ChannelHandlerContext ctx, TYProtoFunc  proto)
	{
		if( body == null ) return false;
		
		System.out.println("codec="+codec);
		
		switch( codec )
		{
		case TYProtoBean.ProtoMsgTypeEnum.LOGIN_REQ_ENUM_VALUE:
		{	
			ReqLoginInfo user = (ReqLoginInfo) body;
			proto.OnLogin(ctx, user);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.RES_TREE_REQ_ENUM_VALUE:
		{
			ReqResTreeInfo data = (ReqResTreeInfo) body;
			proto.OnResTree(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.GET_VIDEO_VIEWS_REQ_ENUM_VALUE:
		{
			ReqGetAllViewInfo data = (ReqGetAllViewInfo) body;
			proto.OnGetView(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.START_VIDEO_REQ_ENUM_VALUE:
		{
			ReqStartVideoInfo data = (ReqStartVideoInfo) body;
			proto.OnStartVideo(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.STOP_VIDEO_REQ_ENUM_VALUE:
		{
			ReqStopVideoInfo data = (ReqStopVideoInfo) body;
			proto.OnStopVideo(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.CALL_PTZ_REQ_ENUM_VALUE:
		{
			ReqPtzInfo data = (ReqPtzInfo) body;
			proto.OnPtzCmd(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.GET_PRESET_REQ_ENUM_VALUE:
		{
			ReqGetPresetInfo data = (ReqGetPresetInfo) body;
			proto.OnGetPresetInfo(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.SET_PRESET_REQ_ENUM_VALUE:
		{
			ReqSetPresetInfo data = (ReqSetPresetInfo) body;
			proto.OnSetPresetInfo(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.SEARCH_RECORD_REQ_ENUM_VALUE:
		{
			ReqSearchRecordInfo data = (ReqSearchRecordInfo) body;
			proto.OnSearchRecordInfo(ctx, data);
			break;	
		}
		case TYProtoBean.ProtoMsgTypeEnum.RECORD_FILE_REQ_ENUM_VALUE:
		{
			ReqRecordFileInfo data = (ReqRecordFileInfo) body;
			proto.OnRecordFileInfo(ctx, data);
			break;	
		}
		case TYProtoBean.ProtoMsgTypeEnum.REQ_START_RECORD_PLAY_VIDEO_VALUE:
		{
			reqRecordStartPlayInfo data = (reqRecordStartPlayInfo) body;
			proto.OnStartPlayRecord(ctx, data);
			break;	
		}
		case TYProtoBean.ProtoMsgTypeEnum.REQ_STOP_RECORD_PLAY_VIDEO_VALUE:
		{
			reqRecordStopPlayInfo data = (reqRecordStopPlayInfo) body;
			proto.OnStopPlayRecord(ctx, data);
			break;	
		}
		case TYProtoBean.ProtoMsgTypeEnum.REQ_GET_TOUR_LIST_VALUE:
		{
			ReqGetAllTourInfo data = (ReqGetAllTourInfo) body;
			proto.OnGetTourInfo(ctx, data);
			break;	
		}
		case TYProtoBean.ProtoMsgTypeEnum.REQ_SET_PTZHOME_INFO_VALUE:
		{
			ReqSetPtzHomeInfo data = (ReqSetPtzHomeInfo) body;
			proto.OnSetPtzHomeInfo(ctx, data);
			break;
		}
		case TYProtoBean.ProtoMsgTypeEnum.REQ_GET_PTZHOME_INFO_VALUE:
		{
			ReqGetPtzHomeInfo data = (ReqGetPtzHomeInfo) body;
			proto.OnGetPtzHomeInfo(ctx, data);
			break;
		}
		default:
			return false;
		}

		

		return true;
	}
	
	public boolean BytesDecode(byte dataType, byte[] array, int offset, int readableLen)
	{
		codec = dataType;		
		try{
			switch( codec )
			{
			case TYProtoBean.ProtoMsgTypeEnum.LOGIN_REQ_ENUM_VALUE:{
				body = ReqLoginInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen); 
				
				break;
			}	
			case TYProtoBean.ProtoMsgTypeEnum.RES_TREE_REQ_ENUM_VALUE:
			{
				body = ReqResTreeInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.GET_VIDEO_VIEWS_REQ_ENUM_VALUE:
			{
				body = ReqGetAllViewInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.START_VIDEO_REQ_ENUM_VALUE:
			{
				body = ReqStartVideoInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.STOP_VIDEO_REQ_ENUM_VALUE:
			{
				body = ReqStopVideoInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.CALL_PTZ_REQ_ENUM_VALUE:
			{
				body = ReqPtzInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.GET_PRESET_REQ_ENUM_VALUE:
			{
				body = ReqGetPresetInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}			
			case TYProtoBean.ProtoMsgTypeEnum.SET_PRESET_REQ_ENUM_VALUE:
			{
				body = ReqSetPresetInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.SEARCH_RECORD_REQ_ENUM_VALUE:
			{
				body = ReqSearchRecordInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.RECORD_FILE_REQ_ENUM_VALUE:
			{
				body = ReqRecordFileInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;	
			}
			case TYProtoBean.ProtoMsgTypeEnum.REQ_START_RECORD_PLAY_VIDEO_VALUE:
			{
				body = reqRecordStartPlayInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;	
			}
			case TYProtoBean.ProtoMsgTypeEnum.REQ_STOP_RECORD_PLAY_VIDEO_VALUE:
			{
				body = reqRecordStopPlayInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;	
			}
			case TYProtoBean.ProtoMsgTypeEnum.REQ_GET_TOUR_LIST_VALUE:
			{
				body = ReqGetAllTourInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.REQ_SET_PTZHOME_INFO_VALUE:
			{
				body = ReqSetPtzHomeInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			case TYProtoBean.ProtoMsgTypeEnum.REQ_GET_PTZHOME_INFO_VALUE:
			{
				body = ReqGetPtzHomeInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
				break;
			}
			
			default:
				return false;
			}
		}
		catch(Exception e){
			
		}
		return true;
	}

	public byte[] Encode( RspObjectModel model )
	{
		byte[] pack = null;
		byte dataType = 0;
		if(model == null)
			return pack;
				
		dataType = (byte) model.getType();
		
		byte[] body =model.getMsg().toByteArray();
		
		int blen = body.length;
		int require = hdrlen + blen;
		assert(require >= hdrlen );
		pack = new byte [ require ];
		
		pack[0] = version;
		pack[1] = dataType;
		pack[2] = (byte)( require&0xff);
		pack[3] = (byte)( (require>>8) & 0xff );
		pack[4] = reserve;
		
		System.arraycopy(body, 0, pack, hdrlen,  blen);
		return pack;
	}
	
	
	protected void finalize()
	{
		System.out.println("run finalize");
	}
	
	
	

}
