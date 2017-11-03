package com.teamway.udp;

// http://www.cnblogs.com/cocohxq/archive/2012/09/28/2707104.html
import java.io.*;
import java.net.*;

//发送的类
class Send implements Runnable {
	private DatagramSocket ds;
	private int recePort;// 接收端的端口。即要把数据发送到那个端口

	public Send(DatagramSocket ds, int port) {
		this.ds = ds;
		this.recePort = port;
	}

	public void run() {
		try {
			BufferedReader bufr = new BufferedReader(new InputStreamReader(
					System.in));
			String line = null;
			while ((line = bufr.readLine()) != null) {
				if ("886".equals(line)) {
					break;
				}
				byte[] buf = line.getBytes();
				// 我们把数据发往目标端口，
				DatagramPacket dp = new DatagramPacket(buf, buf.length,
						InetAddress.getByName("127.0.0.1"), this.recePort);
				ds.send(dp);
			}
		} catch (Exception e) {
			throw new RuntimeException("send failure");
		}
	}
}

class Rece implements Runnable {
	private DatagramSocket ds;

	public Rece(DatagramSocket ds) {
		this.ds = ds;
	}

	public void run() {
		try {
			while (true) {
				byte[] buf = new byte[1024];
				DatagramPacket dp = new DatagramPacket(buf, buf.length);
				ds.receive(dp);
				String ip = dp.getAddress().getHostAddress();
				int port = dp.getPort();
				String data = new String(dp.getData(), 0, dp.getLength());
				System.out.println("来自ip为：" + ip + " 端口为：" + port + "的信息为："
						+ data);
			}
		} catch (Exception e) {
			throw new RuntimeException("Rece failure");
		}
	}
}

class ChatDemoA {
	public static void main(String[] args) throws Exception {
		DatagramSocket sendSocket = new DatagramSocket();
		DatagramSocket receSocket = new DatagramSocket(10000);// 侦听10000端口
		new Thread(new Send(sendSocket, 10001)).start();// 把数据发往10001端口
		new Thread(new Rece(receSocket)).start();
	}
}

class ChatDemoB {
	public static void main(String[] args) throws Exception {
		DatagramSocket sendSocket = new DatagramSocket();
		DatagramSocket receSocket = new DatagramSocket(10001);// 侦听10001端口
		new Thread(new Send(sendSocket, 10000)).start();// 把数据发住10000商品
		new Thread(new Rece(receSocket)).start();
	}
}
