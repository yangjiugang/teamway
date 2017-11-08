package com.teamway.netty.pojodemo.client;

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
import io.netty.handler.codec.serialization.ClassResolvers;
import io.netty.handler.codec.serialization.ObjectDecoder;
import io.netty.handler.codec.serialization.ObjectEncoder;

public class PojoClient {
	private String host;
	private int port;

	public PojoClient(String host, int port) {
		this.host = host;
		this.port = port;
	}

	public void send() throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();

		try {
			Bootstrap b = new Bootstrap();
			b.group(group).channel(NioSocketChannel.class).option(ChannelOption.TCP_NODELAY, true)
					.handler(new ChannelInitializer<SocketChannel>() {

						@Override
						protected void initChannel(SocketChannel ch) throws Exception {
							ChannelPipeline p = ch.pipeline();
							p.addLast(new ObjectEncoder());
							p.addLast(new ObjectDecoder(Integer.MAX_VALUE, ClassResolvers.cacheDisabled(null)));
							p.addLast(new PojoClientHandler());
						}
					});
			ChannelFuture f = b.connect(Constants.HOST, Constants.PORT).sync();
			f.channel().closeFuture().sync();
		} finally {
			group.shutdownGracefully();
		}
	}

	public static void main(String[] args) throws Exception {
		new PojoClient(Constants.HOST, Constants.PORT).send();
	}
}
