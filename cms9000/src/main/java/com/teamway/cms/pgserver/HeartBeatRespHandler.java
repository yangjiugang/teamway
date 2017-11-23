package com.teamway.cms.pgserver;



import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;


import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class HeartBeatRespHandler  extends ChannelInboundHandlerAdapter  
{

	@Override  
	public void channelRead(ChannelHandlerContext ctx, Object msg) { 
		PGPojo pojo = (PGPojo) msg; 
		if(pojo.getHeader().getCode() == PG.HEARTBEAT_REQ){
			ctx.writeAndFlush(PGUtil.newInstancePGObject(PG.HEARTBEAT_RES,pojo.getHeader().getSessionId(), pojo.getHeader().getSeqNum(), new byte[]{},  new Object[]{}));
		}else{
			ctx.fireChannelRead(msg);
		}
	}  

	@Override  
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {  
		cause.printStackTrace();  
		ctx.close(); 
	}  

}
