package com.teamway.cms.env;

import com.google.protobuf.MessageLite;
import com.teamway.cms.cmsserver.RspObjectModel;

//import com.netty.protobuf.SubscriberReqProto;
//import com.netty.protobuf.SubscriberRespProto;


import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;


public  class EnvProtobufEncoder extends MessageToByteEncoder<RspObjectModel>{

	static final int hdrlen = 5;
	static final byte version = 1;
	static final byte reserve = 0;
	
	@Override
	protected void encode(ChannelHandlerContext ctx, RspObjectModel model, ByteBuf out) throws Exception {	

		
		byte[] pack = null;
		byte dataType = 0;
		if(model == null)
			return ;
				
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

		out.writeBytes(pack);
	}
}
