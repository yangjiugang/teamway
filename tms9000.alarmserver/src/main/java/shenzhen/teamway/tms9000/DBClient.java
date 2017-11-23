package shenzhen.teamway.tms9000;

import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TFramedTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;

public class DBClient {

	public static final String SERVER_ADDRESS = "192.168.12.161";
	public static final int SERVER_PORT = 10745;
	public static final int TIME_OUT = 30000;
	
	public static final String DB_SERVER_ADDRESS = "192.168.12.201";
	public static final int  DB_SERVER_PORT = 3306;
	

	public boolean startDBClient(String sql) {
		boolean flag = false;
		TTransport transport = null;
		try {
			transport = new TFramedTransport(new TSocket(SERVER_ADDRESS,SERVER_PORT,TIME_OUT));
			TProtocol protocol = new TBinaryProtocol(transport);
			DbService.Client client = new DbService.Client(protocol);
			transport.open();
			client.initDB(DB_SERVER_ADDRESS, DB_SERVER_PORT, "root", "teamway123456", "tms9000", 2, 200);
			flag = client.executeNoneQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	/*public static void main(String[] args) {
		String sql = "INSERT INTO log_operator (log_type, log_info,log_time)VALUES('1','测试第一条日志',NOW()) ";
		DBClient client = new DBClient();
		client.startDBClient(sql);
	}*/
}
