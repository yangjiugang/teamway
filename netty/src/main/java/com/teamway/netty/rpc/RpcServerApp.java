package com.teamway.netty.rpc;

import java.util.concurrent.locks.LockSupport;

import com.teamway.netty.rpc.server.NettyRpcServer;

/**
 * ${DESCRIPTION}
 *
 * @author Ricky Fung
 */
public class RpcServerApp {

    private String address = "127.0.0.1:9666";

    public static void main(String[] args) throws InterruptedException {

        new RpcServerApp().run();
    }

    public void run() {

        NettyRpcServer server = new NettyRpcServer();
        server.start(address);

        //服务器启动完毕
        System.out.println("************服务器启动完成***********");

        LockSupport.park();

        //服务器关闭
        server.shutdown();
        System.out.println("************服务器关闭***********");
    }
}
