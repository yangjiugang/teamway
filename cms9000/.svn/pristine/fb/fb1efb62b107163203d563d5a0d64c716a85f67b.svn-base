package com.teamway.cms.pgserver;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.List;

import com.teamway.cms.pgutils.ByteUtil;



import java.io.BufferedInputStream;  

public class VideoUdpThread implements Runnable {
	private String key; 
	private long  offset = 0;
	private long  index = 0;
	public String getChannel() {
		return key;
	}
	public void setChannel(String key) {
		this.key = key;
	}

	@Override
	public void run() {

		String fileName="c:/video.pg";  

		try  
		{  
			DataInputStream in = new DataInputStream( new BufferedInputStream(new FileInputStream(fileName)) );  
			byte[] buf= new  byte[4096];
			while(true)
			{
			
				
				//ByteUtil.putLong(buf, index, 0);
				if(!SendVideoDataToClient(key,buf,1024)){
					break;
				}
				//index++;
				
//				if(in.read(buf,0,12) == 12){
//					short length = ByteUtil.getShort(buf, 10);
//					in.read(buf,12,length-12);
//					if(!SendVideoDataToClient(key,buf,length)){
//						break;
//					}
//				}else{
//					in.close();  
//					in = new DataInputStream( new BufferedInputStream(new FileInputStream(fileName)) ); 
//				}
				
				Thread.sleep(5);
			}
			//System.out.println("�߳��˳�");
			//in.close();  
		} catch (Exception e)  
		{  
			e.printStackTrace();  
		}  
	}


	private boolean SendVideoDataToClient(String c,byte[] video_data,int length)
	{
		if(PAGServer.videoClient.containsKey(key)){
			List<VideoClientPojo> clients = PAGServer.videoClient.get(key);
			if(clients==null||clients.size()==0){
				return false;
			}
			synchronized (clients){
				for(VideoClientPojo addr : clients){
				
					offset += length;
					System.out.println(key+"  "+offset);
					send_data(addr.getClient_udp_ip(),addr.getClient_udp_port(),video_data,length);
					
					if(offset >1000000000){
						try {
							Thread.sleep(1000);
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						return false;
					}
				}
			}
		}else{
			return false;
		}
		return true;
	}


	private void send_data(String ipaddr,int port,byte[] video_data, int length){

		if(video_data!=null){
			InetAddress addr = null;
			try {
				DatagramSocket sendSocket = new DatagramSocket(); 
				addr = InetAddress.getByName(ipaddr);
				DatagramPacket sendPacket = new DatagramPacket(video_data, length,addr,port);
				sendSocket.send(sendPacket); 
				sendSocket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}

	}

}
