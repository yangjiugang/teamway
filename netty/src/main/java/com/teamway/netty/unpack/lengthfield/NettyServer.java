package com.teamway.netty.unpack.lengthfield;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teamway.netty.common.Constants;
import com.teamway.netty.unpack.model.Message;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;

/**
 * @author Ricky Fung
 */
public class NettyServer {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public void bind(int port) throws InterruptedException {

        EventLoopGroup bossGroup = new NioEventLoopGroup(1);
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        try {
            ServerBootstrap b = new ServerBootstrap();
            b.group(bossGroup, workerGroup)
                    .channel(NioServerSocketChannel.class)
                    .option(ChannelOption.SO_BACKLOG, 128)
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        public void initChannel(SocketChannel ch) throws Exception {

                            ChannelPipeline p = ch.pipeline();
                            p.addLast(new MessageDecoder(1<<20, 10, 4));
                            p.addLast(new MessageEncoder());
                            p.addLast(new ServerHandler());
                        }
                    });

            // Bind and start to accept incoming connections.
            ChannelFuture future = b.bind(port).sync(); // (7)

            logger.info("server bind port:{}", port);

            // Wait until the server socket is closed.
            future.channel().closeFuture().sync();

        } finally {
            bossGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        }
    }

    private class ServerHandler extends SimpleChannelInboundHandler<Message> {

        @Override
        protected void channelRead0(ChannelHandlerContext ctx, Message msg) throws Exception {

            logger.info("server read msg:{}", msg);

            Message resp = new Message(msg.getMagicType(), msg.getType(), msg.getRequestId(), "Hello world from server");
            ctx.writeAndFlush(resp);
        }
    }

    public static void main(String[] args) throws Exception {

        new NettyServer().bind(Constants.PORT);
    }
}
