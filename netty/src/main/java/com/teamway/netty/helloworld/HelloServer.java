package com.teamway.netty.helloworld;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teamway.netty.common.Constants;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

public class HelloServer {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private int port;

	private String host;

	public HelloServer(String host, int port) {
		this.host = host;
		this.port = port;
	}

	public void run() throws Exception {

		EventLoopGroup bossGroup = new NioEventLoopGroup();
		EventLoopGroup workerGroup = new NioEventLoopGroup();

		try {
			ServerBootstrap b = new ServerBootstrap();
			b.group(bossGroup, workerGroup).channel(NioServerSocketChannel.class).option(ChannelOption.SO_BACKLOG, 1024)
					.childHandler(new ChannelInitializer<SocketChannel>() {

						@Override
						protected void initChannel(SocketChannel ch) throws Exception {

							ChannelPipeline p = ch.pipeline();
							p.addLast(new StringEncoder());
							p.addLast(new StringDecoder());
							p.addLast(new HelloServerHandler());

						}
					});
			// ChannelFuture future = b.bind(new InetSocketAddress(port)).sync();
			// future.channel().closeFuture().sync();
			// 绑定请求数据
			ChannelFuture f = b.bind(Constants.HOST, Constants.PORT).sync();
			logger.info("server bind port:{}", port);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			bossGroup.shutdownGracefully();
			workerGroup.shutdownGracefully();
		}
	}

	public static void main(String[] args) throws Exception {
		new HelloServer(Constants.HOST,Constants.PORT).run();
	}
}
