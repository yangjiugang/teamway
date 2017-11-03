package teamway.shenzhen.net;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;


public class UDPServerImpl implements UDPServer{

	@Override
	public boolean initServer(int port, int buffer) {
		try {
			DatagramSocket socket = new DatagramSocket(port);
			DatagramPacket packet = null;
			byte[] data = null;
			int count = 0;
			System.out.println("***服务器端启动，等待发送数据***");
			while (true) {
				data = new byte[buffer];// 创建字节数组，指定接收的数据包的大小
				packet = new DatagramPacket(data, data.length);
				socket.receive(packet);// 此方法在接收到数据报之前会一直阻塞
				Thread thread = new Thread(new UDPThread(socket, packet));
				thread.start();
				count++;
				System.out.println("服务器端被连接过的次数：" + count);
				InetAddress address = packet.getAddress();
				System.out.println("当前客户端的IP为：" + address.getHostAddress());

			}
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public NetData receive() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean send(NetData data) {
		// TODO Auto-generated method stub
		return false;
	}

}
