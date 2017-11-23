package com.teamway.cms.cmsserver;

import org.apache.log4j.Logger;

import com.teamway.cms.pgserver.PGDecoder;
import com.teamway.cms.pgserver.PGEncoder;
import com.teamway.cms.streamclient.TcpClient;
import com.teamway.cms.streamclient.TcpClientHandler;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;

public class SendClientProto {

	private static final Logger logger = Logger.getLogger(SendClientProto.class);

	public static Bootstrap bootstrap = getBootstrap();

	public static final Bootstrap getBootstrap(){
		EventLoopGroup group = new NioEventLoopGroup();
		Bootstrap b = new Bootstrap();
		b.group(group).channel(NioSocketChannel.class);
		b.handler(new ChannelInitializer<Channel>() {
			@Override
			protected void initChannel(Channel ch) throws Exception {
				ChannelPipeline pipeline = ch.pipeline();
				pipeline.addLast(new CustomProtobufDecoder(),new CustomProtobufEncoder());
				pipeline.addLast(new SendClientProtoHander());
			}
		});
//		b.option(ChannelOption.SO_KEEPALIVE, true);
		return b;
	}

	public static final Channel getChannel(String host,int port){
		Channel channel = null;
		try {
			channel = bootstrap.connect(host, port).sync().channel();
		} catch (Exception e) {
			logger.error(String.format("连接Server(IP[%s],PORT[%s])失败", host,port),e);
			return null;
		}
		return channel;
	}

	public static void sendMsg(Channel channel,Object msg) throws Exception {
		if(channel!=null){
			channel.writeAndFlush(msg).sync();
		}else{
			logger.warn("消息发送失败,连接尚未建立!");
		}
	}
	
	public static void sendMsg(ChannelHandlerContext ctx,Object msg) throws Exception {
		if(ctx!=null){
			ctx.writeAndFlush(msg).sync();
		}else{
			logger.warn("消息发送失败,连接尚未建立!");
		}
	}
}
