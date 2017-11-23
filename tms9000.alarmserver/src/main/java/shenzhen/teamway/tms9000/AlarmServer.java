package shenzhen.teamway.tms9000;

import java.net.InetSocketAddress;

import org.apache.thrift.TProcessor;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.server.TNonblockingServer;
import org.apache.thrift.server.TServer;
import org.apache.thrift.transport.TFramedTransport;
import org.apache.thrift.transport.TNonblockingServerSocket;
import org.apache.thrift.transport.TTransportException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AlarmServer {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public static final int SERVER_PORT = 10730;
	public static final String ADDRESS = "127.0.0.1";

	public void startServer() {
		logger.info("alarmServer TNonblockingServer start.....");
		try {
			InetSocketAddress inetSocketAddress = new InetSocketAddress(ADDRESS, SERVER_PORT);
			TProcessor tProcessor = new AlarmService.Processor<AlarmService.Iface>(new AlarmServiceImpl());
			TNonblockingServerSocket tNonblockingServerSocket = new TNonblockingServerSocket(inetSocketAddress);
			TNonblockingServer.Args tnArgs = new TNonblockingServer.Args(tNonblockingServerSocket);
			tnArgs.processor(tProcessor);
			tnArgs.transportFactory(new TFramedTransport.Factory());
			tnArgs.protocolFactory(new TBinaryProtocol.Factory());
			// 使用非阻塞式IO，服务端和客户端需要指定TFramedTransport数据传输的方式
			TServer server = new TNonblockingServer(tnArgs);
			server.serve();
		} catch (TTransportException e) {
			logger.info("Server start error!!!");
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		AlarmServer alarmServer = new AlarmServer();
		alarmServer.startServer();
	}

}
