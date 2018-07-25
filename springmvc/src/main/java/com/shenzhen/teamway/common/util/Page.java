/**
 * 
 */
package com.shenzhen.teamway.common.util;

import java.io.Serializable;


public class Page implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer page; 		//当前页
	private Integer rows; 		//页行数
	private Integer total; 		//总页数	
	private String sord;		//排序方式
	private String sidx;       //排序字段名
	private Integer records;	//总记录、总行数
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
		if(rows > 0) {
			int c = records / rows;
			this.total = records % rows > 0 ? c + 1 : c;
		}
	}
	public String getLimit() { // 获取分页参数
		StringBuilder sb = new StringBuilder();
		sb.append((page - 1) * rows).append(",").append(rows);
		return sb.toString();
	}
	
	public Page() {
		this.page = 1;
		this.rows = 35;
	}
	
}
