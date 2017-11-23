package shenzhen.teamway.tms9000;

import java.io.IOException;
import java.util.concurrent.CountDownLatch;

import org.apache.thrift.async.AsyncMethodCallback;
import org.apache.thrift.async.TAsyncClientManager;
import org.apache.thrift.protocol.TCompactProtocol;
import org.apache.thrift.protocol.TProtocolFactory;
import org.apache.thrift.transport.TNonblockingSocket;
import org.apache.thrift.transport.TNonblockingTransport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import shenzhen.teamway.tms9000.AlarmService.AsyncClient.addAlarmLog_call;

public class AlarmClient {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public static final String SERVER_IP = "1270.0.1";
	public static final int SERVER_PORT = 10730;
	public static final int TIMEOUT = 30000;

	public void startClient(AlarmModel model) {
		try {
			TAsyncClientManager clientManager = new TAsyncClientManager();
			TNonblockingTransport transport = new TNonblockingSocket(SERVER_IP, SERVER_PORT, TIMEOUT);

			TProtocolFactory tPFactory = new TCompactProtocol.Factory();
			AlarmService.AsyncClient asyncClient = new AlarmService.AsyncClient(tPFactory, clientManager, transport);
			logger.info("Client start....");

			CountDownLatch latch = new CountDownLatch(1);
			AsynCallback callBack = new AsynCallback(latch);
			logger.info("call method addAlarmLog start ....");
			// asyncClient.addAlarmLog(model, callBack);
			System.out.println("call method sayHello .... end");
			// boolean wait = latch.await(30, TimeUnit.SECONDS);
			// System.out.println("latch.await =:" + wait);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public class AsynCallback implements AsyncMethodCallback<addAlarmLog_call> {
		private CountDownLatch latch;

		public AsynCallback(CountDownLatch latch) {
			this.latch = latch;
		}

		@Override
		public void onComplete(addAlarmLog_call arg0) {
			System.out.println("onComplete");
			try {
				Thread.sleep(1000L * 1);
				System.out.println("AsynCall result =:" + arg0.getResult().toString());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				latch.countDown();
			}

		}

		@Override
		public void onError(Exception arg0) {
			System.out.println("onError :" + arg0.getMessage());
			latch.countDown();

		}

	}

}
