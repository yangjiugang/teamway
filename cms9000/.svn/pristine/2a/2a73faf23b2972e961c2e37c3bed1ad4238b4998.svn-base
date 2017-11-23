package com.teamway.cms.pgserver;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * @author Administrator
 * 收到下面各RPU发送过来的PG包，交给队列，有一个消费者线程去处理  处理方式   1-返回结果   2-存储数据库 
 */
public class PgRecvQueue {
	private static PgRecvQueue instance;
	private static BlockingQueue<TaskBean> recvQueue = new LinkedBlockingQueue<TaskBean>(100);
	 
	private PgRecvQueue (){}
	
	public static synchronized PgRecvQueue getInstance() {
		if (instance == null) {
			instance = new PgRecvQueue();
		}
		return instance;
	}
	
    public void put(TaskBean bean) throws InterruptedException {
    	bean.setTimestamp(System.currentTimeMillis());
    	recvQueue.put(bean);
    }
   
    public TaskBean get() throws InterruptedException {
        return recvQueue.take();
    }	
}