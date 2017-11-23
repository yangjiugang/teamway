package com.teamway.cms.pgserver;

import java.util.List;


import com.teamway.cms.pgutils.PGPojo;

import io.netty.buffer.ByteBuf;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;
import io.netty.handler.codec.MessageToByteEncoder;

public class PGEncoder extends MessageToByteEncoder<PGPojo>  {


	@Override
	protected void encode(ChannelHandlerContext ctx, PGPojo msg, ByteBuf sendBuf) throws Exception {
		byte[] buffer = com.teamway.cms.pgutils.PGUtil.pgObjectToByteArray(msg);
		
		System.out.println("pg_send ..."+msg.getHeader().getCode());
		sendBuf.writeBytes(buffer);
	}

}