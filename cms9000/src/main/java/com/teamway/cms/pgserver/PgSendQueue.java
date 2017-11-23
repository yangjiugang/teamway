package com.teamway.cms.pgserver;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;



/**
 * @author Administrator
 * 发送给RPU的消息队列   
 */
public class PgSendQueue {
	private static PgSendQueue instance;
	private static BlockingQueue<TaskBean> sendQueue = new LinkedBlockingQueue<TaskBean>(100);
	 
	private PgSendQueue (){}
	
	public static synchronized PgSendQueue getInstance() {
		if (instance == null) {
			instance = new PgSendQueue();
		}
		return instance;
	}
	
    public void put(TaskBean bean) throws InterruptedException {
    	bean.setTimestamp(System.currentTimeMillis());
    	sendQueue.put(bean);
    }
   
    public TaskBean get() throws InterruptedException {
        return sendQueue.take();
    }	
}