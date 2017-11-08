package com.teamway.netty.helloworld;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class HelloClientHandel extends ChannelInboundHandlerAdapter {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		// Send the message to Server
		String msg = "hello from client:";
		logger.info("client send message{}",msg);
		ctx.writeAndFlush(msg);
	}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		String body = (String)msg;
		logger.info("client read msg:{}",body);
	}
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		logger.error("client caught exception", cause);
		ctx.close();
	}
	
	
}
