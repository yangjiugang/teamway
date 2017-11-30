package com.teamway.cms.streamclient;

import org.apache.log4j.Logger;

import com.teamway.cms.pgutils.PGPojo;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.util.ReferenceCountUtil;


public class TcpClientHandler extends ChannelInboundHandlerAdapter {
	private static final Logger logger = Logger.getLogger(TcpClientHandler.class);

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception 
	{
	    PGPojo  pg = (PGPojo) msg;
	    if(pg.getHeader().getCode() == Protocol.RSP_START_REAL_VIDEO){
	    	logger.info("开始实时视频返回");
	    }else if( pg.getHeader().getCode() == Protocol.RSP_STOP_REAL_VIDEO ){
	    	logger.info("停止实时视频返回");
	    }
	    ctx.channel().close();
	    ctx.close();
		ReferenceCountUtil.release(msg);
	}


}