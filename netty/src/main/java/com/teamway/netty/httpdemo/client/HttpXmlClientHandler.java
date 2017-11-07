package com.teamway.netty.httpdemo.client;

import com.teamway.netty.httpdemo.codec.HttpXmlRequest;
import com.teamway.netty.httpdemo.codec.HttpXmlResponse;
import com.teamway.netty.httpdemo.test.OrderFactory;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

/**
 * ${DESCRIPTION}
 *
 * @author Ricky Fung
 * @create 2017-01-08 20:37
 */
public class HttpXmlClientHandler extends
        SimpleChannelInboundHandler<HttpXmlResponse> {

    @Override
    public void channelActive(ChannelHandlerContext ctx) {
        HttpXmlRequest request = new HttpXmlRequest(null,
                OrderFactory.create(123));
        System.out.println("Http client write request");
        ctx.writeAndFlush(request);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        cause.printStackTrace();
        ctx.close();
    }

    @Override
    protected void channelRead0(ChannelHandlerContext channelHandlerContext, HttpXmlResponse msg) throws Exception {
        System.out.println("The client receive response of http header is : "
                + msg.getHttpResponse().headers().names());
        System.out.println("The client receive response of http body is : "
                + msg.getResult());
    }
}
