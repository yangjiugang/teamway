package com.teamway.cms.pgserver;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;

import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PG.CPTYPE_MESSAGECODE;
import com.teamway.cms.pgutils.PG.CPTYPE_PERFORMANCE;
import com.teamway.cms.pgutils.PG.CPTYPE_STORAGEFILE_DATA;
import com.teamway.cms.pgutils.PG.CPTYPE_STORAGEFILE_SEARCH;
import com.teamway.cms.pgutils.PG.CPTYPE_VIDEOTRANCFG;
import com.teamway.cms.pgutils.PGHeader;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class PGServerInHandler extends ChannelInboundHandlerAdapter {  
	private static Logger logger = Logger.getLogger(PGServerInHandler.class);  

	@Override  
	public void channelRead(ChannelHandlerContext ctx, Object msg)  
			throws Exception {  
		PGPojo pojo = (PGPojo) msg; 
		PGHeader head = pojo.getHeader();
		
		TaskBean bean = new TaskBean(ctx.channel().remoteAddress().toString().replaceAll("/",""),pojo);
		PgRecvQueue.getInstance().put(bean);
		
		ctx.fireChannelRead(msg);
	}  

	@Override  
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {  
		ctx.flush();  
	}  
}  

