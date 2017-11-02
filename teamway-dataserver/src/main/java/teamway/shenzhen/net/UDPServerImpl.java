package teamway.shenzhen.net;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.ArrayUtils;


public class UDPServerImpl implements UDPServer{

	private DatagramSocket socket = null;
	private DatagramPacket packet = null;
	private byte[] data = null;
	Map<String,ReceiveData> dataInfo = new HashMap<String,ReceiveData>();
	@Override
	public boolean initServer(int port, int buffer) {
		try {
			 this.socket = new DatagramSocket(port);
//			 packet = null;
			 this.data = new byte[buffer]; // 创建字节数组，指定接收的数据包的大小
			System.out.println("***服务器端启动，等待发送数据***");
//			this.receive();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}

	@Override
	public NetData receive() {
		try {
			System.out.println("当前时间："+formateDate(new Date()));
			int count = 0;
			String bf = "";//记录客户端每次连接的IP端口号
			while(true) {
				packet = new DatagramPacket(data, data.length);
				socket.receive(packet);// 此方法在接收到数据报之前会一直阻塞
				System.out.println(formateDate(new Date())+"：     "+"收到IP：" + packet.getAddress().getHostAddress()+"端口:"+packet.getPort()+"发来的消息");
				System.out.println("服务器端被连接过的次数：" + count);
				byte[] temp = new byte[packet.getLength()];
				System.arraycopy(packet.getData(),0,temp,0,packet.getLength());//拷贝数组中的有效数据
				int port = packet.getPort();
				 bf  = new StringBuffer().append(packet.getAddress().getHostAddress()).append(packet.getPort()).toString();
				//判断数据是否收到过该主机的数据包
				if(dataInfo.containsKey(bf)) {
					//将发送的数据追加到数据列表中
					ReceiveData rd = dataInfo.get(bf);
					byte[] ndata = rd.getData();
					ndata = ArrayUtils.addAll(ndata, temp);
//					System.arraycopy(temp, 0, ndata, ndata.length, packet.getLength());
					rd.setData(ndata);
					rd.setReceiveTime(new Date());
					rd.setReceiveCount(rd.getReceiveCount()+1);
					dataInfo.put(bf, rd);
				}else {
					ReceiveData receiveData = new ReceiveData();
					receiveData.setAddr(packet.getAddress());
					receiveData.setData(temp);
					receiveData.setPort(port);
					receiveData.setReceiveTime(new Date());
					dataInfo.put(bf, receiveData);
				}
				System.out.println("当前客户端连接服务端的次数为："+dataInfo.get(bf).getReceiveCount());
				//循环判断各客户端是否断开连接
				Iterator<Entry<String, ReceiveData>> iterator = dataInfo.entrySet().iterator();
				while(iterator.hasNext()) {
					Map.Entry<String, ReceiveData> entry =(Entry<String, ReceiveData>) iterator.next();
					String key = entry.getKey();
					ReceiveData rdata = entry.getValue();
					//判断是否超过60秒没收到数据
					long time = (new Date().getTime() - rdata.getReceiveTime().getTime())/1000;
					if(time>60) {
						System.out.println(formateDate(new Date())+":   "+"1分钟没有收到ip："+rdata.getAddr().getHostAddress()+" "+"端口："+rdata.getPort()+"的客户端的请求数据,可能已离线！");
						dataInfo.remove(key);
					}
				}
				count++;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean send(NetData data) {
		try {
			DatagramPacket dp = new DatagramPacket(data.getData(), data.getData().length, data.getAddr(), data.getPort());
			socket.send(dp);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String formateDate(Date date) {
		SimpleDateFormat sf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sf.format(date);
		
	}

	public static void main(String[] args) {
		UDPServerImpl udpServer = new UDPServerImpl();
		udpServer.initServer(3344, 1024);
		udpServer.receive();
	}
	
}
