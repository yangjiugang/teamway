package com.teamway.netty.pojodemo.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.serialization.ClassResolvers;
import io.netty.handler.codec.serialization.ObjectDecoder;
import io.netty.handler.codec.serialization.ObjectEncoder;
import com.teamway.netty.common.Constants;

public class PojoServer {

	private Logger logger = LoggerFactory.getLogger(getClass());

	private int port;

	public PojoServer(int port) {
		this.port = port;
	}

	public void run() throws Exception {

		EventLoopGroup bossgroup = new NioEventLoopGroup();
		EventLoopGroup workergroup = new NioEventLoopGroup();

		try {
			ServerBootstrap b = new ServerBootstrap();
			b.group(bossgroup, workergroup).channel(NioServerSocketChannel.class).option(ChannelOption.SO_BACKLOG, 1024)
					.childHandler(new ChannelInitializer<Channel>() {

						@Override
						protected void initChannel(Channel ch) throws Exception {
							ChannelPipeline p = ch.pipeline();
							p.addLast(new ObjectEncoder());
							p.addLast(new ObjectDecoder(Integer.MAX_VALUE, ClassResolvers.cacheDisabled(null)));
							p.addLast(new PojoServerHandler());
						}

					});
			ChannelFuture f = b.bind(port).sync();
			logger.info("server bind port:{}", port);
			f.channel().closeFuture().sync();
		} finally {
			bossgroup.shutdownGracefully();
			workergroup.shutdownGracefully();
		}
	}

	public static void main(String[] args) throws Exception {
		new PojoServer(Constants.PORT).run();;
	}
}
