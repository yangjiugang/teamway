package com.teamway.cms.pgcleint;

import org.apache.log4j.Logger;

import com.teamway.cms.pgserver.PgSendQueue;
import com.teamway.cms.pgserver.TaskBean;

public class SendToRpuThread  implements Runnable{
	protected Logger log = Logger.getLogger(SendToRpuThread.class);
	
	@SuppressWarnings("static-access")
	@Override
	public void run() {
		while(true){
			try {
				TaskBean bean = PgSendQueue.getInstance().get();
				RpuConnectMap.getInstance().sendToRpu(bean.getKey(), bean.getPg());
			} catch (InterruptedException e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}
		}
	}

	
}
