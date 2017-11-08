package com.teamway.netty.rpc;

import java.util.concurrent.TimeUnit;

import com.teamway.netty.rpc.client.NettyRpcClient;
import com.teamway.netty.rpc.core.InvokeCallback;
import com.teamway.netty.rpc.model.Request;
import com.teamway.netty.rpc.model.Response;
import com.teamway.netty.rpc.model.RpcType;
import com.teamway.netty.rpc.util.IdGenerator;

/**
 * ${DESCRIPTION}
 *
 * @author Ricky Fung
 */
public class RpcClientApp {

    private String address = "127.0.0.1:9666";

    public static void main(String[] args) throws InterruptedException {

        new RpcClientApp().run();
    }

    public void run() throws InterruptedException {

        RpcType type = RpcType.ASYNC;

        NettyRpcClient client = new NettyRpcClient();
        client.start();

        System.out.println("***************客户端RPC调用开始***************");

        for(int i=0; i<100; i++){

            Request request = new Request();
            request.setId(IdGenerator.getId().toString());

            switch (type) {
                case SYNC:
                    request.setType(RpcType.SYNC);
                    invokeSync(client, request);
                    break;
                case ASYNC:
                    request.setType(RpcType.ASYNC);
                    invokeAsync(client, request, new InvokeCallback() {
                        public void onSuccess(Object result) {
                            System.out.println("async onSuccess result:"+result);
                        }

                        public void onFailure(Throwable err) {
                            System.out.println("async onFailure err:"+err);
                        }
                    });
                    break;
                case ONE_WAY:
                    request.setType(RpcType.ONE_WAY);
                    invokeOneway(client, request);
                    break;
                default:
            }
        }

        System.out.println("***************客户端RPC调用结束***************");

        TimeUnit.SECONDS.sleep(3);

        client.shutdown();

        System.out.println("***************客户端已关闭***************");
    }

    private void invokeSync(NettyRpcClient client, Request req){
        try {
            Response response = client.sendSync(address, req, 1000, TimeUnit.MILLISECONDS);
            System.out.println("send request:"+req.getId()+", receive response id:"+response.getId()+",result:"+response.getResult());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void invokeOneway(NettyRpcClient client, Request req){
        try {
            client.sendOneway(address, req, 1000, TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void invokeAsync(NettyRpcClient client, Request req, InvokeCallback callback){
        try {
            client.sendAsync(address, req, 1000, TimeUnit.MILLISECONDS, callback);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
