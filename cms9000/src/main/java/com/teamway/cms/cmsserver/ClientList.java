package com.teamway.cms.cmsserver;

import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.apache.log4j.Logger;

import com.teamway.cms.streamclient.TcpClient;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;

public class ClientList {

	private static final Logger logger = Logger.getLogger(ClientList.class);
	final List<ChannelHandlerContext> list = new Vector<ChannelHandlerContext>();
	private static ClientList instance;
	private ClientList (){

	}

	public static synchronized ClientList getInstance() {
		if (instance == null) {
			instance = new ClientList();
		}
		return instance;
	}


	public void put(ChannelHandlerContext e){
		list.add(e);
	}

	public void report(RspObjectModel msg)
	{
		Iterator<ChannelHandlerContext> iter = list.iterator(); 
		while (iter.hasNext()) {    
			ChannelHandlerContext ctx = iter.next();  				
			//String[] arr = item.split(":");
			//String ip = arr[0];
			//int port =  Integer.parseInt(arr[1]);

			//Channel cc = TcpClient.getChannel(ip,port);
			//if(cc != null){
			//	try {
					try {
						SendClientProto.sendMsg(ctx, msg);
					} catch (Exception e) {
						iter.remove();
						e.printStackTrace();
					}
			//	} catch (Exception e) {
			//		iter.remove();
		    //			logger.error(e);
			//	}
			//}else{
			//	iter.remove();
			//}	   
		}
	}



}
