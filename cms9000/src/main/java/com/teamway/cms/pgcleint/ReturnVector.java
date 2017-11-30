package com.teamway.cms.pgcleint;

import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Vector;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

import com.teamway.cms.pgserver.PgRecvQueue;
import com.teamway.cms.pgserver.TaskBean;

/**
 * @author Administrator
 * PG 返回队列
 */
public class ReturnVector {
	final List<TaskBean> list = new Vector<>();
	private static ReturnVector instance;
	private ReturnVector (){
		Timer t = new Timer();

		t.schedule(new TimerTask(){

			@Override
			public void run() 
			{
				//System.out.println("定时清理任务...");
				Iterator<TaskBean> iter = list.iterator(); 
				while (iter.hasNext()) {    
					TaskBean item = iter.next();
					if( (item.getTimestamp() + 1000*15) < System.currentTimeMillis())
						iter.remove();
				}	
			}
		}, 5*1000, 5*1000);
	}


	public static synchronized ReturnVector getInstance() {
		if (instance == null) {
			instance = new ReturnVector();
		}
		return instance;
	}


	public void put(TaskBean e){
		list.add(e);
	}

	public TaskBean check(TaskBean bean,int timeout) throws InterruptedException {
		TaskBean obj = null;
		int times = 0;
		for(;;)
		{
			Thread.sleep(5);
			Iterator<TaskBean> iter = list.iterator(); 
			boolean flag = false;
			while (iter.hasNext()) {    
				TaskBean item = iter.next();  				
				if ( item.getKey().equals(bean.getKey()) && item.getPg().getHeader().getCode()== bean.getPg().getHeader().getCode()+1
						&& item.getPg().getHeader().getSessionId()== bean.getPg().getHeader().getSessionId()  
						&& item.getPg().getHeader().getSeqNum()== bean.getPg().getHeader().getSeqNum() )
				{
					obj = item;
					iter.remove();
					flag = true;
					break;
				}    
			}
			times+=5;
			if(times >= timeout)
				break;
			if(flag)
				break;
		}

		return obj;
	}



}
