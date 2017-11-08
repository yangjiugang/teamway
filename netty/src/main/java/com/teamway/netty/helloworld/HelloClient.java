package com.teamway.netty.helloworld;

import com.teamway.netty.common.Constants;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

public class HelloClient {
	private String host;
	private int port;

	public HelloClient(String host, int port) {
		this.host = host;
		this.port = port;
	}

	public void send() throws InterruptedException {
		EventLoopGroup group = new NioEventLoopGroup(10);
		try {
			Bootstrap b = new Bootstrap();
			b.group(group).channel(NioSocketChannel.class).option(ChannelOption.TCP_NODELAY, true)
					.handler(new ChannelInitializer<SocketChannel>() {

						@Override
						protected void initChannel(SocketChannel ch) throws Exception {
							ChannelPipeline p = ch.pipeline();
							p.addLast(new StringEncoder());
							p.addLast(new StringDecoder());
							p.addLast(new HelloClientHandel());
						}
					});
			ChannelFuture f = b.connect(Constants.HOST, Constants.PORT).sync();
			f.channel().close().sync();
		} finally {
			group.shutdownGracefully();
		}
	}

	public static void main(String[] args) throws InterruptedException {
		new HelloClient(Constants.HOST,Constants.PORT).send();
	}
}
