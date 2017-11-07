package com.teamway.netty;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;

public class EchoServer {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private int port;

	public EchoServer(int port) {
		this.port = port;
	}

	public void start() throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();

		ServerBootstrap sb = new ServerBootstrap();
		sb.group(group) // 绑定线程池
				.channel(NioServerSocketChannel.class)// 使用指定的channel
				.localAddress(this.port)// 监听端口
				.childHandler(new ChannelInitializer<SocketChannel>() {

					@Override
					protected void initChannel(SocketChannel ch) throws Exception {
						// TODO Auto-generated method stub
						System.out.println("connected...; Client:" + ch.remoteAddress());
						ch.pipeline().addLast(new EchoServerHandler()); // 客户端触发操作
					}
				});
		ChannelFuture cf = sb.bind().sync(); // 服务器异步创建绑定
		System.out.println(EchoServer.class + " started and listen on " + cf.channel().localAddress());
		cf.channel().closeFuture().sync(); // 关闭服务器通道

		// group.shutdownGracefully().sync(); // 释放线程池资源

	}

	public static void main(String[] args) throws Exception {
		// new EchoServer(Constants.PORT).run();
		new EchoServer(65535).start(); // 启动

	}
}
