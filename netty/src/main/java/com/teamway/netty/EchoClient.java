package com.teamway.netty;

import java.net.InetSocketAddress;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;

public class EchoClient {
	private final String host;
	private final int port;

	public EchoClient() {
		this(0);
	}

	public EchoClient(int port) {
		this("localhost", port);
	}

	public EchoClient(String host, int port) {
		this.host = host;
		this.port = port;
	}

	public void start() throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();
		Bootstrap b = new Bootstrap();
		b.group(group).channel(NioSocketChannel.class).remoteAddress(new InetSocketAddress(this.host, this.port))
				.handler(new ChannelInitializer<SocketChannel>() {

					@Override
					protected void initChannel(SocketChannel ch) throws Exception {
						System.out.println("connected...");
						ch.pipeline().addLast(new EchoClientHandler());
					}
				});
		System.out.println("created..");
		ChannelFuture cf = b.connect().sync();// 异步连接服务器
		System.out.println("connected..."); // 连接完成
		cf.channel().closeFuture().sync(); // 异步等待关闭连接channel
		System.out.println("closed.."); // 关闭完成
//		group.shutdownGracefully().sync(); // 释放线程池资源
	}
	
	public static void main(String[] args) throws Exception {
		new EchoClient("127.0.0.1",65535).start();
	}
	
}
