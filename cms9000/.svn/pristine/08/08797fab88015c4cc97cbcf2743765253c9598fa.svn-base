package com.teamway.cms.pgserver;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.teamway.cms.cmsserver.CmsServerThread;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.AdaptiveRecvByteBufAllocator;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.timeout.ReadTimeoutHandler;

public class PAGServer {
	public static final int DEFAULT_PORT = 8090;
	public static Map<String, List<VideoClientPojo>> videoClient = new ConcurrentHashMap<String, List<VideoClientPojo>>();

	public void run(int port) throws Exception {  
		EventLoopGroup bossGroup = new NioEventLoopGroup();  
		EventLoopGroup workerGroup = new NioEventLoopGroup();  
		try {  
			ServerBootstrap b = new ServerBootstrap();  
			b.group(bossGroup, workerGroup).channel(NioServerSocketChannel.class)  
			.childHandler(new ChannelInitializer<SocketChannel>() {  
				@Override  
				public void initChannel(SocketChannel ch)  
						throws Exception {
					ch.pipeline().addLast( new ReadTimeoutHandler(100));
					ch.pipeline().addLast( new PGDecoder(),new PGEncoder(),new RegisterAuthRespHandler(),new HeartBeatRespHandler(),new PGServerInHandler()); 
				}  
			}).option(ChannelOption.SO_BACKLOG, 128).childOption(ChannelOption.SO_LINGER, 0).childOption(ChannelOption.RCVBUF_ALLOCATOR, new AdaptiveRecvByteBufAllocator(1024, 4096, 65535))
			.childOption(ChannelOption.SO_KEEPALIVE, true);  

			ChannelFuture f = b.bind(port).sync();  

			f.channel().closeFuture().sync();  
		}catch(Exception ex){
			System.out.println("Exception:");
			ex.printStackTrace();
		}
		finally {  
			workerGroup.shutdownGracefully();  
			bossGroup.shutdownGracefully();  
		}  
	}  

	public static void start(int port) throws Exception {
		Thread thread =new Thread(new PAGServerThread(port));
		thread.start();
	}


}
