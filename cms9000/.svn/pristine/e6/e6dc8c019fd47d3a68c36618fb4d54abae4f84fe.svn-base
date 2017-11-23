package com.teamway.cms.cmsserver;

import com.google.protobuf.MessageLite;

//import com.netty.protobuf.SubscriberReqProto;
//import com.netty.protobuf.SubscriberRespProto;


import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;


public class CustomProtobufEncoder extends MessageToByteEncoder<RspObjectModel>{


	public CustomProtobufEncoder() {	

	}

	@Override
	protected void encode(ChannelHandlerContext ctx, RspObjectModel msg, ByteBuf out) throws Exception {	
		TYProtoSerilizer seri = new TYProtoSerilizer();
		byte[] data = seri.Encode(msg);
		if(data != null)
			out.writeBytes(data);
		return;
	}
}
