package com.teamway.thread;

public class TestThread1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Runner1 r = new Runner1();
		r.start();

		for (int i = 0; i < 100; i++) {
			System.out.println("main thread:---------" + i);
		}
	}

}

class Runner1 extends Thread {
	@Override
	public void run() {
		super.run();
		for (int i = 0; i < 100; i++) {
			System.out.println("runnner1:" + i);
		}
	}
}
