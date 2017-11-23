package com.teamway.cms.pgserver;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;

import com.teamway.cms.pgcleint.RpuClient;
import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PG.CPTYPE_MESSAGECODE;
import com.teamway.cms.pgutils.PG.CPTYPE_USERINFOR;
import com.teamway.cms.pgutils.PG.DEVINFO;
import com.teamway.cms.pgutils.PG.RPUCLI_CONNPASS;
import com.teamway.cms.pgutils.PG.RPUCLI_RPUNAME;
import com.teamway.cms.pgutils.PG.RPUCLI_SVCADDR;
import com.teamway.cms.pgutils.PG.CPTYPE_REGRESULT;


import com.teamway.cms.pgutils.PGHeader;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;


import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.timeout.ReadTimeoutException;

public class RegisterAuthRespHandler  extends ChannelInboundHandlerAdapter  
{
	protected Logger log = Logger.getLogger(RegisterAuthRespHandler.class);
	private Map<String, Boolean> loginCheck = new ConcurrentHashMap<String, Boolean>();
	private static int sessionId =0;
	@Override  
	public void channelRead(ChannelHandlerContext ctx, Object msg) { 
		PGPojo pojo = (PGPojo) msg; 
		
		log.info(pojo.toString());

		String ipaddress =	ctx.channel().remoteAddress().toString().replaceAll("/","");
		if(pojo.getHeader().getCode() == PG.REGISTER_REQ){
			if(loginCheck.containsKey(ipaddress)){
				ctx.writeAndFlush(PGUtil.newInstancePGObject(PG.REGISTER_RES, getNewSessionId(), pojo.getHeader().getSeqNum(), new byte[]{PG.CPTYPE_MESSAGECODE,PG.CPTYPE_REGRESULT}, new Object[]{ new CPTYPE_MESSAGECODE(-1,"already logined !".getBytes()), new CPTYPE_REGRESULT(3) }));
			}else{
				loginCheck.put(ipaddress, true);

				RPUCLI_RPUNAME rpu_info = (RPUCLI_RPUNAME) pojo.getAttrs().get(0).getAttrDataObject(RPUCLI_RPUNAME.class);
				//子设备信息
				System.out.println(rpu_info.iSubDevIdNum);
				
				byte[] data= pojo.getAttrs().get(0).getData();
				for(int i=0; i < rpu_info.iSubDevIdNum;i++)
				{
					DEVINFO info = (DEVINFO)PGUtil.byteArrayToObject(data, 308+40*i, DEVINFO.class);
					
					try {
						System.out.println(String.format("%x", info.iSubDevId)+"  "+ new String(info.szSubDevDesc, "gbk").replaceAll("\0", ""));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				} 

				RPUCLI_SVCADDR addr_info = (RPUCLI_SVCADDR) pojo.getAttrs().get(1).getAttrDataObject(RPUCLI_SVCADDR.class);
				
				RPUCLI_CONNPASS pass = (RPUCLI_CONNPASS) pojo.getAttrs().get(2).getAttrDataObject(RPUCLI_CONNPASS.class);

				//TODO  check user / password
				ctx.writeAndFlush(ctx.writeAndFlush(PGUtil.newInstancePGObject(PG.REGISTER_RES, getNewSessionId(), pojo.getHeader().getSeqNum(), new byte[]{PG.CPTYPE_MESSAGECODE,PG.CPTYPE_REGRESULT}, new Object[]{ new CPTYPE_MESSAGECODE(0,"login success !".getBytes()), new CPTYPE_REGRESULT(0) })));
			}
		}else{
			if(!loginCheck.containsKey(ipaddress)){
				PGHeader head = pojo.getHeader();
				ctx.writeAndFlush(PGUtil.newInstancePGObject(head.getCode(),head.getSessionId(), head.getSeqNum(), new byte[]{PG.CPTYPE_MESSAGECODE}, new Object[]{ new CPTYPE_MESSAGECODE(-1,"no login !".getBytes()) }));
			}
			ctx.fireChannelRead(msg);
		}
	}  

	@Override  
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {  
		if (cause instanceof ReadTimeoutException) {
			System.out.println("\nDisconnecting due to no inbound traffic\n");
		} else {
			cause.printStackTrace();
		}

		try{
			ctx.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}


		//	ctx.fireExceptionCaught(cause);
	}  


	public int getNewSessionId() {  
		this.sessionId++; 
		if(this.sessionId == 65535){
			this.sessionId = 0;
		}
		return  this.sessionId;
	} 

}
