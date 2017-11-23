package com.teamway.cms.env;

import java.util.List;


import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.MessageLite;
import com.teamway.cms.cmsserver.RspObjectModel;
import com.teamway.cms.env.TYProtoBeanEnv.ReqLoginInfo;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

public class EnvProtobufDecoder extends ByteToMessageDecoder {

	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
		
		short hdrlen = 5;
		try {
			
			while( in.readableBytes() >= hdrlen)
			{
				in.markReaderIndex();
				
				byte ver = in.readByte();
				byte code = in.readByte();
				short s0 = in.readByte();
				short s1 = in.readByte();
				byte reserve = in.readByte();
				
				short len = (short) (s1<<8|s0);
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
				ProtoObjectModel model = new ProtoObjectModel(code,array,offset,readableLen);
				out.add(model);
			}
		
		}
		catch(Exception e)
		{
			in.discardReadBytes();
		}
		
		
	}

	private MessageLite decodeBody(byte dataType, byte[] array, int offset, int readableLen) throws Exception {

    	return ReqLoginInfo.getDefaultInstance().getParserForType().parseFrom(array,offset,readableLen);

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
