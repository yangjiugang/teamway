package com.shenzhen.teamway.task;
/**
 * 
 * @author gaven
 *Spring能够支持这种方式，归功于两个类：
org.springframework.scheduling.timer.MethodInvokingTimerTaskFactoryBean
org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean
这两个类分别对应spring支持的两种实现任务调度的方式，即前文提到到java自带的timer task方式和Quartz方式。这里我只写MethodInvokingJobDetailFactoryBean的用法，使用该类的好处是,我们的任务类不再需要继承自任何类，而是普通的pojo

 *
 */
public class Job2 {
	public void doJob2() {
		System.out.println("不继承QuartzJobBean方式-调度进行中...");
	}
}
