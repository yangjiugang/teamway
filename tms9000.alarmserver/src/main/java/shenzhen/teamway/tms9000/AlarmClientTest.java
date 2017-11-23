package shenzhen.teamway.tms9000;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TFramedTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;

import shenzhen.teamway.tms9000.AlarmModel;
import shenzhen.teamway.tms9000.AlarmService;
import shenzhen.teamway.tms9000.TimedOutException;

public class AlarmClientTest {
	public static final String SERVER_ADDRESS = "127.0.0.1";
	public static final int SERVER_PORT = 10730;
	public static final int TIME_OUT = 30000;

	public void startClient(AlarmModel model) {
		TTransport transport = null;
		try {
			transport = new TFramedTransport(new TSocket(SERVER_ADDRESS, SERVER_PORT, TIME_OUT));
			TProtocol protocol = new TBinaryProtocol(transport);
			AlarmService.Client client = new AlarmService.Client(protocol);
			transport.open();
			client.addAlarmLog(model);
			System.out.println("client add a log info ....");
		} catch (TTransportException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TimedOutException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (null != transport) {
				transport.close();
			}
		}
	}
	public static void main(String[] args) {
		AlarmClientTest test = new AlarmClientTest();
		AlarmModel model = new AlarmModel();
		model.setLogInfo("测试警告信息目录");
		model.setLogType(1);
		model.setLogTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		test.startClient(model);
	}
}
