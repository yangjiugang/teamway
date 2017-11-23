package com.teamway.cms.pgserver;

import com.teamway.cms.pgutils.PGPojo;

public class TaskBean {
	@Override
	public String toString() {
		return "TaskBean [key=" + key + ", pg=" + pg + ", timestamp=" + timestamp + "]";
	}
	private String key;
	private PGPojo pg;
	private long   timestamp;
	
	
	public TaskBean(String key, PGPojo pg) {
		super();
		this.key = key;
		this.pg = pg;
		this.timestamp =System.currentTimeMillis();
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public PGPojo getPg() {
		return pg;
	}
	public void setPg(PGPojo pg) {
		this.pg = pg;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
}
