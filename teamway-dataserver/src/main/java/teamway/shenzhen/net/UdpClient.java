package teamway.shenzhen.net;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

/**
 * UDP客户端程序，用于对服务端发送数据，并接收服务端的回应信息
 */
public class UdpClient implements Runnable {
	private byte[] buffer = new byte[1024];

	private static DatagramSocket ds = null;

	/**
	 * 测试客户端发包和接收回应信息的方法
	 */
	public static void main(String[] args) throws Exception {
		for (int i = 0; i < 1000; i++) {
			new Thread(new UdpClient()).start();
			Thread.currentThread().sleep(2000);
		}
		// 关闭连接
		try {
			ds.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 构造函数，创建UDP客户端
	 */
	public UdpClient() throws Exception {
		ds = new DatagramSocket(); // 邦定本地端口作为客户端
	}

	/**
	 * 向指定的服务端发送数据信息
	 */
	public final void send(final String host, final int port, final byte[] bytes) throws IOException {
		DatagramPacket dp = new DatagramPacket(bytes, bytes.length, InetAddress.getByName(host), port);
		ds.send(dp);
	}

	/**
	 * 接收从指定的服务端发回的数据
	 */
	public final byte[] receive() throws Exception {
		DatagramPacket dp = new DatagramPacket(buffer, buffer.length);
		ds.receive(dp);
		byte[] data = new byte[dp.getLength()];
		System.arraycopy(dp.getData(), 0, data, 0, dp.getLength());
		return data;
	}

	@Override
	public void run() {
		try {
			UdpClient client = new UdpClient();
			String serverHost = "127.0.0.1";
			int serverPort = 3344;
			client.send(serverHost, serverPort, ("你好，亲爱的!").getBytes());
			byte[] bt = client.receive();
			System.out.println("服务端回应数据：" + new String(bt));
			client.send(serverHost,serverPort,"bye bye! ".getBytes());
			System.out.println("服务端回应数据：" + new String(client.receive()));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
