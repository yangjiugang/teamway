package com.teamway.cms.pgcleint;

import org.apache.log4j.Logger;

import com.teamway.cms.pgserver.PGDecoder;
import com.teamway.cms.pgserver.PGEncoder;
import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;
import com.teamway.cms.webcontroller.PublicCtl;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.timeout.ReadTimeoutHandler;


public class RpuClient {

	protected Logger log = Logger.getLogger(RpuClient.class);
    
	private String host;
	private int port;
	private SocketChannel socketChannel;
	
	public RpuClient(String host, int port) {
		this.host = host;
		this.port = port;
		try {
			connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void connect() throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group).channel(NioSocketChannel.class)
			.option(ChannelOption.TCP_NODELAY, true)
			.handler(new ChannelInitializer<SocketChannel>() {
				@Override
				public void initChannel(SocketChannel ch) throws Exception 
				{	
					ch.pipeline().addLast(new PGDecoder());
					ch.pipeline().addLast(new PGEncoder());
					ch.pipeline().addLast(new ReadTimeoutHandler(60));
					ch.pipeline().addLast(new RpuClientHandler());
				}
			});

			log.info("connect to rpu ["+host+":"+port+"] ...");
			ChannelFuture f = b.connect(host, port).sync();
			if(f.isSuccess()){
				setSocketChannel((SocketChannel)f.channel());
				log.info("connect to rpu ["+host+":"+port+"] success!");
			}else{
				group.shutdownGracefully();
			}
			//f.channel().closeFuture().sync();
		} catch(Exception e){
			e.printStackTrace();
			group.shutdownGracefully();
		}
		//finally {
		//	group.shutdownGracefully();
		//}
	}

	public SocketChannel getSocketChannel() {
		return socketChannel;
	}

	public void setSocketChannel(SocketChannel socketChannel) {
		this.socketChannel = socketChannel;
	}

	public static void startConnect( String host,int port)
	{
		RpuClientThread th = new RpuClientThread(host,port);
		Thread t = new Thread(th);
		t.start();
	}
	
	public static void runSendToRpuThread()
	{
		SendToRpuThread th = new SendToRpuThread();
		Thread t = new Thread(th);
		t.start();
	}
	
	public static void runRecvProcessThread()
	{
		RecvProcessThread th = new RecvProcessThread();
		Thread t = new Thread(th);
		t.start();
	}
	
	public static void runRpuOnlineCheckThread()
	{
		Thread t = new Thread(new RpuOnlineCheckThread());
		t.start();
	}
	

	
	
}
