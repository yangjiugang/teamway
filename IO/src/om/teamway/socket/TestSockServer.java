package om.teamway.socket;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class TestSockServer {
	public static void main(String[] args) {
		InputStream in = null;
		OutputStream out = null;
		try {
			ServerSocket ss = new ServerSocket(5888);
			Socket socket = ss.accept();
			in = socket.getInputStream();
			out = socket.getOutputStream();
			DataOutputStream dos = new DataOutputStream(out);
			DataInputStream dis = new DataInputStream(in);
			String s = null;
			while ((s = dis.readUTF()) != null) {
				System.out.println(s);
				System.out.println("from: " + socket.getInetAddress());
				System.out.println("Port: " + socket.getPort());
			}
			dos.writeUTF("hi，hello");
			dis.close();
			dos.close();
			socket.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
