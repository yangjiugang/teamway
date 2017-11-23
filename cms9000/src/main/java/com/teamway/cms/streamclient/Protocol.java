package com.teamway.cms.streamclient;

public interface Protocol {
	
	//实时流播放请求
	public static final int  REQ_START_REAL_VIDEO =  1280;
	public static final int  RSP_START_REAL_VIDEO =  1281;
	
	//实时流停止请求
	public static final int  REQ_STOP_REAL_VIDEO =  1282;
	public static final int  RSP_STOP_REAL_VIDEO =  1283;
	
	//录像请求
	public static final int  REQ_START_RECORD_PLAY_VIDEO =  1284;
	public static final int  RSP_START_RECORD_PLAY_VIDEO =  1285;
	
	//录像停止
	public static final int  REQ_STOP_RECORD_PLAY_VIDEO =  1286;
	public static final int  RSP_STOP_RECORD_PLAY_VIDEO =  1287;
	
	
	//Attr Type
	public static final int TYPE_REAL_VIDEO_INFO = 1;
	public static final int TYPE_RECORD_VIDEO_INFO = 2;
	public static final int TYPE_RSP_MSG = 3;
	
	public class REQ_START_VIDEO_INFO{
		public REQ_START_VIDEO_INFO(){
			
		}
		public int iChannel;
		public int videoFlag;
		public int videoCodec;
		public byte[] szIp = new byte[32];
		public int iPort;
		public byte[] szUserName = new byte[32];
		public byte[] szPassWord = new byte[32];
		public byte[] szDestIp = new byte[32];
		public int iDestPort;
		
		public REQ_START_VIDEO_INFO(int iChannel,int videoFlag,int videoCodec,byte[] szIp,int iPort,byte[] szUserName,byte[] szPassWord,byte[] szDestIp,int iDestPort){
			this.iChannel = iChannel;
			this.videoFlag = videoFlag;
			this.videoCodec = videoCodec;
		
			this.iPort = iPort;
			System.arraycopy(szIp, 0, this.szIp, 0, szIp.length);
			
			System.arraycopy(szUserName, 0, this.szUserName, 0, szUserName.length);
			System.arraycopy(szPassWord, 0, this.szPassWord, 0, szPassWord.length);
			System.arraycopy(szDestIp, 0, this.szDestIp, 0, szDestIp.length);
			
			this.iDestPort = iDestPort;
		}
	};
	
	public class RSP_START_VIDEO_INFO{
		public RSP_START_VIDEO_INFO(){
			
		}
		public int msgCode;
		public int msgLength;
		public byte[] msg;
		
		public RSP_START_VIDEO_INFO(int msgCode,byte[] msg){
			this.msgCode = msgCode;
			//this.msg = msg;
			System.arraycopy(msg, 0, this.msg, 0, msg.length);
			this.msgLength = msg.length;
		}
	};
	
	
	public class REQ_STOP_VIDEO_INFO{
		public REQ_STOP_VIDEO_INFO(){
			
		}
		public int iChannel;
		public int videoFlag;
		public int videoCodec;
		public byte[] szIp = new byte[32];
		public int iPort;
		public byte[] szUserName = new byte[32];
		public byte[] szPassWord = new byte[32];
		public byte[] szDestIp = new byte[32];
		public int iDestPort;
		
		public REQ_STOP_VIDEO_INFO(int iChannel,int videoFlag,int videoCodec,byte[] szIp,int iPort,byte[] szUserName,byte[] szPassWord,byte[] szDestIp,int iDestPort){
			this.iChannel = iChannel;
			this.videoFlag = videoFlag;
			this.videoCodec = videoCodec;
			//this.szIp = szIp;
			this.iPort = iPort;
			//this.szUserName = szUserName;
			//this.szPassWord = szPassWord;
			//this.szDestIp = szDestIp;
			this.iDestPort = iDestPort;
			
			System.arraycopy(szIp, 0, this.szIp, 0, szIp.length);
			
			System.arraycopy(szUserName, 0, this.szUserName, 0, szUserName.length);
			System.arraycopy(szPassWord, 0, this.szPassWord, 0, szPassWord.length);
			System.arraycopy(szDestIp, 0, this.szDestIp, 0, szDestIp.length);
		}
	};
	

	public class RSP_STOP_VIDEO_INFO{
		public RSP_STOP_VIDEO_INFO(){
			
		}
		public int msgCode;
		public int msgLength;
		public byte[] msg;
		
		public RSP_STOP_VIDEO_INFO(int msgCode,byte[] msg){
			this.msgCode = msgCode;
			//this.msg = msg;
			System.arraycopy(msg, 0, this.msg, 0, msg.length);
			this.msgLength = msg.length;
		}
	};
	
	
	public class REQ_RECORD_START_PLAY_INFO{
		public REQ_RECORD_START_PLAY_INFO(){
			
		}
		public byte[] szIp = new byte[32];
		public int iPort;
		public byte[] szUserName = new byte[32];
		public byte[] szPassWord = new byte[32];
		
		public byte[] szDestIp = new byte[32];
		public int iDestPort;
		
		public byte[] szfileName = new byte[64];
		public byte[] szUrl = new byte[128];
		public float option;
		public byte[] szStartTime = new byte[32];
		
		public REQ_RECORD_START_PLAY_INFO(byte[] szIp,int iPort,byte[] szUserName,byte[] szPassWord,byte[] szDestIp,int iDestPort,byte[] szfileName,byte[] szUrl,float option, byte[] szStartTime){

			System.arraycopy(szIp, 0, this.szIp, 0, szIp.length);
			this.iPort = iPort;
	
			System.arraycopy(szUserName, 0, this.szUserName, 0, szUserName.length);
		
			System.arraycopy(szPassWord, 0, this.szPassWord, 0, szPassWord.length);
	
			System.arraycopy(szDestIp, 0, this.szDestIp, 0, szDestIp.length);
			this.iDestPort = iDestPort;
		
			System.arraycopy(szfileName, 0, this.szfileName, 0, szfileName.length);
		
			System.arraycopy(szUrl, 0, this.szUrl, 0, szUrl.length);
			this.option = option;
			
			System.arraycopy(szStartTime, 0, this.szStartTime, 0, szStartTime.length);
		}
	};
	

	public class RSP_RECORD_START_PLAY_INFO{
		public RSP_RECORD_START_PLAY_INFO(){
			
		}
		public int msgCode;
		public int msgLength;
		public byte[] msg;
		
		public RSP_RECORD_START_PLAY_INFO(int msgCode,byte[] msg){
			this.msgCode = msgCode;
			this.msg = msg;
			this.msgLength = msg.length;
		}
	};

	
	public class REQ_RECORD_STOP_PLAY_INFO{
		public REQ_RECORD_STOP_PLAY_INFO(){
			
		}
		public byte[] szIp = new byte[32];
		public int iPort;
		public byte[] szUserName = new byte[32];
		public byte[] szPassWord = new byte[32];
		public byte[] szDestIp = new byte[32];
		public int iDestPort;
		public byte[] szfileName = new byte[64];
		public byte[] szUrl = new byte[128];
		
		public REQ_RECORD_STOP_PLAY_INFO(byte[] szIp,int iPort,byte[] szUserName,byte[] szPassWord,byte[] szDestIp,int iDestPort,byte[] szfileName,byte[] szUrl){
			
			System.arraycopy(szIp, 0, this.szIp, 0, szIp.length);
			System.arraycopy(szUserName, 0, this.szUserName, 0, szUserName.length);
			System.arraycopy(szPassWord, 0, this.szPassWord, 0, szPassWord.length);
			System.arraycopy(szfileName, 0, this.szfileName, 0, szfileName.length);
			System.arraycopy(szUrl, 0, this.szUrl, 0, szUrl.length);
			System.arraycopy(szDestIp, 0, this.szDestIp, 0, szDestIp.length);
	
			this.iPort = iPort;
			this.iDestPort = iDestPort;
		
		}
	};
	

	public class RSP_RECORD_STOP_PLAY_INFO{
		public RSP_RECORD_STOP_PLAY_INFO(){
			
		}
		public int msgCode;
		public int msgLength;
		public byte[] msg;
		
		public RSP_RECORD_STOP_PLAY_INFO(int msgCode,byte[] msg){
			this.msgCode = msgCode;
			this.msg = msg;
			this.msgLength = msg.length;
		}
	};
	
	
	
	
}
