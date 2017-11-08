package com.teamway.netty.httpdemo.server;


import java.net.InetSocketAddress;

import com.teamway.netty.httpdemo.codec.HttpXmlRequestDecoder;
import com.teamway.netty.httpdemo.codec.HttpXmlResponseEncoder;
import com.teamway.netty.httpdemo.model.Order;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpRequestDecoder;
import io.netty.handler.codec.http.HttpResponseEncoder;

/**
 * ${DESCRIPTION}
 *
 * @author gaven
 * @create 2017-01-08 20:15
 */
public class HttpXmlServer {

    public void run(final int port) throws Exception {
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        try {
            ServerBootstrap b = new ServerBootstrap();
            b.group(bossGroup, workerGroup)
                    .channel(NioServerSocketChannel.class)
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        protected void initChannel(SocketChannel ch)
                                throws Exception {
                            ch.pipeline().addLast("http-decoder",
                                    new HttpRequestDecoder());
                            ch.pipeline().addLast("http-aggregator",
                                    new HttpObjectAggregator(65536));
                            ch.pipeline()
                                    .addLast(
                                            "xml-decoder",
                                            new HttpXmlRequestDecoder(
                                                    Order.class, true));
                            ch.pipeline().addLast("http-encoder",
                                    new HttpResponseEncoder());
                            ch.pipeline().addLast("xml-encoder",
                                    new HttpXmlResponseEncoder());
                            ch.pipeline().addLast("xmlServerHandler",
                                    new HttpXmlServerHandler());
                        }
                    });
            ChannelFuture future = b.bind(new InetSocketAddress(port)).sync();
            System.out.println("HTTP订购服务器启动，网址是 : " + "http://localhost:"
                    + port);
            future.channel().closeFuture().sync();
        } finally {
            bossGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        }
    }

    public static void main(String[] args) throws Exception {
        int port = 8080;
        if (args.length > 0) {
            try {
                port = Integer.parseInt(args[0]);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        new HttpXmlServer().run(port);
    }
}
