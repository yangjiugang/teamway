package com.teamway.cms.cmsserver;

import org.apache.log4j.Logger;

import com.teamway.cms.streamclient.TcpClientHandler;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.util.ReferenceCountUtil;



public class SendClientProtoHander extends ChannelInboundHandlerAdapter {
	private static final Logger logger = Logger.getLogger(TcpClientHandler.class);

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception 
	{
	    ctx.close();
		ReferenceCountUtil.release(msg);
	}


}