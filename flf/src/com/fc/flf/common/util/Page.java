package com.fc.flf.common.util;

import java.io.Serializable;

public class Page implements Serializable {

	private static final long serialVersionUID = 1L;
	// 当前页
	private int curPage = 1;
	// 页行数
	private int pageSize = 10;
	// 总页数
	private int pageCount = 1;
	// 总行数
	private int rowCount;
	// 排序字段名
	private String sort;
	// 排序方式
	private boolean order;
	
	public int getCurPage() {
		return curPage;
	}
	
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getPageCount() {
		return pageCount;
	}
	
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	public int getRowCount() {
		return rowCount;
	}
	
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
		if(pageSize > 0) {
			int c = rowCount / pageSize;
			this.pageCount = rowCount % pageSize > 0 ? c + 1 : c;
		}
	}
	
	public String getSort() {
		return sort;
	}
	
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public boolean isOrder() {
		return order;
	}
	
	public void setOrder(boolean order) {
		this.order = order;
	}

	public String getLimit() { // 获取分页参数
		StringBuilder sb = new StringBuilder();
		sb.append((curPage - 1) * pageSize).append(",").append(pageSize);
		return sb.toString();
	}

}
