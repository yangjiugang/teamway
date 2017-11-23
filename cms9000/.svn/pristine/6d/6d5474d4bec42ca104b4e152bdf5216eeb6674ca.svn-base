package com.teamway.cms.env;


public class EnvServerThread implements Runnable {

	private int port;
	public EnvServerThread(int port) {
		this.port = port;
	}
	
	@Override
	public void run() {
		try {
			new EnvServer().bind(port);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
