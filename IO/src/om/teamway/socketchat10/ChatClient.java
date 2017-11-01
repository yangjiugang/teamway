package om.teamway.socketchat10;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class ChatClient extends Frame
{
	TextArea ta = new TextArea();
	TextField tf = new TextField();
	public void launchFrame() throws Exception
	{
		this.add(ta, BorderLayout.CENTER);
		this.add(tf, BorderLayout.SOUTH);
		tf.addActionListener(
			new ActionListener() 
			{
				public void actionPerformed(ActionEvent ae)
				{
					try {
						String sSend = tf.getText();
						if(sSend.trim().length() == 0) return;
						ChatClient.this.send(sSend);
						tf.setText("");
						ta.append(sSend + "\n");
					}
					catch (Exception e) { e.printStackTrace(); }
				}
			}
			);
		
		this.addWindowListener(
			new WindowAdapter() 
			{
				public void windowClosing(WindowEvent e)
				{
					System.exit(0);
				}
			}
			);
		setBounds(300,300,300,400);
		setVisible(true);
		tf.requestFocus();
	}
	
	Socket s = null;
	
	public ChatClient() throws Exception
	{
		s = new Socket("127.0.0.1", 8888);
		launchFrame();
		(new Thread(new ReceiveThread())).start();
	}
	
	public void send(String str) throws Exception
	{
		DataOutputStream dos = new DataOutputStream(s.getOutputStream());
		dos.writeUTF(str);
	}
	
	public void disconnect() throws Exception
	{
		s.close();
	}
	
	public static void main(String[] args) throws Exception
	{
		BufferedReader br = new BufferedReader (
								new InputStreamReader(System.in));
		ChatClient cc = new ChatClient();
		String str = br.readLine();
		while(str != null && str.length() != 0)
		{
			cc.send(str);
			str = br.readLine();
		}
		cc.disconnect();
	}
	
	class ReceiveThread implements Runnable
	{
		public void run()
		{
			if(s == null) return;
			try {
				DataInputStream dis = new DataInputStream(s.getInputStream());
				String str = dis.readUTF();
				while (str != null && str.length() != 0)
				{
					//System.out.println(str);
					ChatClient.this.ta.append(str + "\n");
					str = dis.readUTF();
				}
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
			
		}
	}
}