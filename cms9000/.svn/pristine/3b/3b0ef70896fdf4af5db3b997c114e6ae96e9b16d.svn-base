package com.teamway.cms.cmsserver;

import java.util.List;


import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.MessageLite;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

public class CustomProtobufDecoder extends ByteToMessageDecoder {
	
	//static final short hdrlen = 5;
	

	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
		// TODO Auto-generated method stub
		
		short hdrlen = 5;
		try {
			
			while( in.readableBytes() >= hdrlen)
			{
				in.markReaderIndex();
				
				byte ver = in.readByte();
				byte code = in.readByte();
				
				short len = in.readShortLE();
				//short s0 = in.readByte();
				//short s1 = in.readByte();
				
				
				byte reserve = in.readByte();
				
				//short len = (short) (s1<<8|s0);
				if( !checkValidHeader(ver,code,len,reserve) )
				{
					in.discardReadBytes();
					break;
					
				}
	
				in.resetReaderIndex();
				
				if( in.readableBytes() < len)
					break;
				in.readBytes(hdrlen);
				
				len -= hdrlen;
	
				ByteBuf bodyByteBuf = in.readBytes(len);
				
				byte[] array;
				int offset;
				
				int readableLen = bodyByteBuf.readableBytes();
				if(bodyByteBuf.hasArray()){
					array = bodyByteBuf.array();
					offset = bodyByteBuf.arrayOffset();
				}else{
					array = new byte[readableLen];
					bodyByteBuf.getBytes(bodyByteBuf.readerIndex(), array,0,readableLen);
					offset = 0;
				}
				
				/*
				MessageLite msg = decodeBody(code,array,offset,readableLen);
				if(msg != null)
					out.add(msg);
				*/
				
				TYProtoSerilizer seri = new TYProtoSerilizer();
				if( seri.BytesDecode(code, array, offset, readableLen) )
					out.add(seri);
			}
		
		}
		catch(Exception e)
		{
			in.discardReadBytes();
		}
		
		
	}

	private MessageLite decodeBody(byte dataType, byte[] array, int offset, int readableLen) throws Exception {
//		// TODO Auto-generated method stub
//		//数据类型：dataType的修改
//		if(dataType == 0x00){
//			//return SubscriberReqProto.SubscriberReq.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
//		}else if(dataType == 0x01){
//			return UserLoginProto.UserLogin.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
//		}else if(dataType == 2)
//		{
//			return UserLoginProto.TYSensorRequest.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
//		}
//		else if(dataType == 3)
//		{
//			return UserLoginProto.TYSEnvDataRequest.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);
//		}
		
		
		
		return null;//异常返回null
	}
	
	private boolean checkValidHeader(byte ver,byte code,short len,byte reserve)
	{
		short hdrlen = 5;
		return (ver == 0x1 ) && (reserve == 0) && (len >= hdrlen) ;
	}

	/* (non-Javadoc)
	 * @see io.netty.channel.ChannelInboundHandlerAdapter#exceptionCaught(io.netty.channel.ChannelHandlerContext, java.lang.Throwable)
	 */
	
	/*
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		// TODO Auto-generated method stub
		super.exceptionCaught(ctx, cause);
	}
	*/
	

}
