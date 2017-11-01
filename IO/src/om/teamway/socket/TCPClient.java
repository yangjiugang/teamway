package om.teamway.socket;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

public class TCPClient {

	public static void main(String[] args) {
		try {
			Socket socket = new Socket("127.0.0.1", 6666);
			OutputStream os = socket.getOutputStream();
			DataOutputStream dos  = new DataOutputStream(os);
			Thread.sleep(30000);
			dos.writeUTF("hello server!");
			dos.flush();
			dos.close();
			socket.close();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
