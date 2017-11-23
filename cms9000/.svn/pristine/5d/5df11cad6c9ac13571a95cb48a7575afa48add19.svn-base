package com.teamway.cms.cmsserver;

public class CmsServerThread implements Runnable {
	private int port;
	public CmsServerThread(int port) {
		this.port = port;
	}
	public void run() {
		try {
			new CmsServer().bind(port);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}