package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseGroupScheduleEvent implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int groupScheduleId;
	private String eventContent;
	private int eventOrderNo;
	private int trafficTools;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGroupScheduleId() {
		return groupScheduleId;
	}
	public void setGroupScheduleId(int groupScheduleId) {
		this.groupScheduleId = groupScheduleId;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public int getEventOrderNo() {
		return eventOrderNo;
	}
	public void setEventOrderNo(int eventOrderNo) {
		this.eventOrderNo = eventOrderNo;
	}
	public int getTrafficTools() {
		return trafficTools;
	}
	public void setTrafficTools(int trafficTools) {
		this.trafficTools = trafficTools;
	}
	
}