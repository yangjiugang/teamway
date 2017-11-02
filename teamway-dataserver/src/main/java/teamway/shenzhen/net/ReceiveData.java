package teamway.shenzhen.net;

import java.util.Date;

public class ReceiveData extends NetData {
	private Date receiveTime; // 最近一次收到数据包时间
	private int receiveCount = 0; // 客户端连接次数

	public Date getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	public int getReceiveCount() {
		return receiveCount;
	}

	public void setReceiveCount(int receiveCount) {
		this.receiveCount = receiveCount;
	}

}
