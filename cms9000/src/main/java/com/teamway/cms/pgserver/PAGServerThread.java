package com.teamway.cms.pgserver;

public class PAGServerThread implements Runnable {
	private int port;
	public PAGServerThread(int port) {
		this.port = port;
	}
	@Override
	public void run() {
		PAGServer server = new PAGServer();  
		try {
			server.run(port);
		} catch (Exception e) {
			e.printStackTrace();
		}  
	}
}