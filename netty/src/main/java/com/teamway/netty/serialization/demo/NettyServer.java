package com.teamway.netty.serialization.demo;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teamway.netty.common.Constants;
import com.teamway.netty.serialization.model.Request;
import com.teamway.netty.serialization.model.Response;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;

/**
 * @author Ricky Fung
 */
public class NettyServer {
    private Logger logger = LoggerFactory.getLogger(getClass());

    public void bind() throws Exception {
        // 配置服务端的NIO线程组
        EventLoopGroup bossGroup = new NioEventLoopGroup(1);
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        ServerBootstrap b = new ServerBootstrap();
        b.group(bossGroup, workerGroup).channel(NioServerSocketChannel.class)
                .option(ChannelOption.SO_BACKLOG, 100)
                .handler(new LoggingHandler(LogLevel.INFO))
                .childHandler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    public void initChannel(SocketChannel ch)
                            throws IOException {
                        ch.pipeline().addLast(
                                new NettyMessageDecoder<Request>(Request.class,1<<20, 2, 4));
                        ch.pipeline().addLast(new NettyMessageEncoder(Response.class));
                        ch.pipeline().addLast(new NettyServerHandler());
                    }
                });

        // 绑定端口，同步等待成功
        ChannelFuture future = b.bind(Constants.HOST, Constants.PORT).sync();
        logger.info("Netty server start ok host:{}, port:{}"
                , Constants.HOST , Constants.PORT);

        future.channel().closeFuture().sync();
    }

    class NettyServerHandler extends SimpleChannelInboundHandler<Request> {

        @Override
        protected void channelRead0(ChannelHandlerContext context, Request request) throws Exception {

            logger.info("Rpc server receive request id:{}", request.getId());
            //处理请求
            processRpcRequest(context, request);
        }

        @Override
        public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
            logger.error("捕获异常", cause);
        }
    }

    private void processRpcRequest(final ChannelHandlerContext context, final Request request) {

        Response response = new Response();
        response.setId(request.getId());
        response.setResult("echo "+request.getMessage());
        context.writeAndFlush(response);
    }

    public static void main(String[] args) throws Exception {
        new NettyServer().bind();
    }

}
