package com.teamway.netty.unpack.delimiter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teamway.netty.common.Constants;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class DelimiterServerHandler extends ChannelInboundHandlerAdapter {
    private Logger logger = LoggerFactory.getLogger(getClass());

    private int count = 0;
    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg)
            throws Exception {

        count++;
        String body = (String) msg;
        logger.info("server read msg:{}, count:{}", body, count);

        String response = "hello from server"+ Constants.DELIMITER;
        ctx.writeAndFlush(response);

    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause)
            throws Exception {
        logger.error("server caught exception", cause);
        ctx.close();
    }

}