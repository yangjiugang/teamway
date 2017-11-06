package om.teamway.timetask;

import java.util.Timer;
import java.util.TimerTask;

/** 
5. *  
6. * 于第一种方式相比，优势 1>当启动和去取消任务时可以控制 2>第一次执行任务时可以指定你想要的delay时间 
7. *  
8. * 在实现时，Timer类可以调度任务，TimerTask则是通过在run()方法里实现具体任务。 Timer实例可以调度多任务，它是线程安全的。 
9. * 当Timer的构造器被调用时，它创建了一个线程，这个线程可以用来调度任务。 下面是代码： 
10. *  
11. * @author gaven
12. *  
13. */  

public class Task2 {
	public static void main(String[] args) {
		
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				int j =0;
				for(int i = 0; i<100;i++) {
					System.out.println("this is timetask2 !!"+"-----task"+i);
					if(j==99) {
						 this.cancel();
					}
					j++;
				}
			}
		};
		Timer timer = new Timer();
		long delay = 0;
		long intevalPeriod = 1 * 1000;
		timer.scheduleAtFixedRate(task, delay, intevalPeriod);  
	}
}
