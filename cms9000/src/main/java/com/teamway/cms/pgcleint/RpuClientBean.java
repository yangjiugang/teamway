package com.teamway.cms.pgcleint;

import io.netty.channel.ChannelHandlerContext;

public class RpuClientBean 
{	
    private	ChannelHandlerContext ctx;
    private	int sessionId;
    private	int seqNum;
    
	public RpuClientBean(ChannelHandlerContext ctx, int sessionId, int seqNum) {
		this.ctx = ctx;
		this.sessionId = sessionId;
		this.seqNum = seqNum;
	}
	public ChannelHandlerContext getCtx() {
		return ctx;
	}
	public void setCtx(ChannelHandlerContext ctx) {
		this.ctx = ctx;
	}
	public int getSessionId() {
		return sessionId;
	}
	public void setSessionId(int sessionId) {
		this.sessionId = sessionId;
	}
	public int getSeqNum() {
		return seqNum;
	}
	public void setSeqNum(int seqNum) {
		this.seqNum = seqNum;
	}

}
