package com.teamway.netty.unpack.delimiter;

import com.teamway.netty.common.Constants;

import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

public class DelimiterClient {

	public void connect(String host, int port) throws InterruptedException {

		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group)
			.channel(NioSocketChannel.class)
			.option(ChannelOption.TCP_NODELAY, true)
			.handler(new ChannelInitializer<SocketChannel>() {
				@Override
				protected void initChannel(SocketChannel ch) throws Exception {

					ChannelPipeline p = ch.pipeline();
					p.addLast(new DelimiterBasedFrameDecoder(1024, Unpooled.copiedBuffer(Constants.DELIMITER.getBytes())));
					p.addLast(new StringDecoder());
					p.addLast(new StringEncoder());

					p.addLast(new DelimiterClientHandler());
				}
			});

			ChannelFuture future = b.connect(Constants.HOST, Constants.PORT).sync();

			future.channel().closeFuture().sync();
		} finally {
			group.shutdownGracefully();
		}
	}

	public static void main(String[] args) throws Exception {

		new DelimiterClient().connect(Constants.HOST, Constants.PORT);
	}
}