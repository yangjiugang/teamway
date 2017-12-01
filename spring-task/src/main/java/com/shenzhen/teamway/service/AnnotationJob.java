package com.shenzhen.teamway.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component("annotationJob")
public class AnnotationJob {
	/**
	 * @Scheduled 有三个参数
	 * cron：指定cron表达式
	 * fixedDelay 即表示从上一个任务完成开始到下一个任务开始的间隔，单位是毫秒。
	 * fixedRate：即从上一个任务开始到下一个任务开始的间隔，单位是毫秒。
	 */
	@Scheduled(fixedRate = 2000)
	public  void job2() {
		System.out.println("this is a annotationJob starting.......");
		
	}

}
