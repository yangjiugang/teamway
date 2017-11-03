package com.teamway.thread;

public class TestThread2 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Runner2 r = new Runner2();
		Thread t1 = new Thread(r);
		Thread t2 = new Thread(r);
		t1.start();
		t2.start();
	}

}

class Runner2 implements Runnable {
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 30; i++) {
			System.out.println("No. " + i);
		}
	}
}