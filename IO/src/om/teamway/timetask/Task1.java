package om.teamway.timetask;

public class Task1 {
	/** 
	2. * 普通thread 
	3. * 这是最常见的，创建一个thread，然后让它在while循环里一直运行着， 
	4. * 通过sleep方法来达到定时任务的效果。这样可以快速简单的实现，代码如下： 
	5. * @author gaven
	6. * 
	7. */ 

	public static void main(String[] args) {
		
		final long timeInterval = 1000;
		
		Runnable runable = new Runnable() {
			public void run() {
				while((true)) {
					//-- code for task to run 
					System.out.println("Hello !!");
					// end
					
					try {
						Thread.sleep(2000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
		};
		Thread  thread = new Thread(runable);
		thread.start();
		
	}

}
