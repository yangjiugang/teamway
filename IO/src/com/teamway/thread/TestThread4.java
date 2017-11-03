package com.teamway.thread;

public class TestThread4 {
	public static void main(String[] args) {
		Runner4 r = new Runner4();
		Thread thread = new Thread(r);
		thread.start();
		for (int i = 0; i < 100000; i++) {
			if (i % 10000 == 0 & i > 0)
				System.out.println("in thread main i=" + i);
		}
		System.out.println("Thread main is over");
		r.shutdown();
	}
}

class Runner4 implements Runnable {
	private boolean flag = true;

	@Override
	public void run() {
		int i = 0;
		while (flag == true) {
			System.out.println(" " + i++);
		}

	}

	public void shutdown() {
		flag = false;
	}
}