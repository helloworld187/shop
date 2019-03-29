package com.zhangli.shop.pojo;

public class Page {
	// 当前页
	private int page = 1;
	// 每页显示的数据条数
	private int rows = 4;
	// 开始的条目数
	private int start = 0;
	// 总共的页数
	private int totalPage;
	// 总共有多少条数据
	private int totalMessage;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStart() {
		return (this.page - 1) * this.rows;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getTotalPage() {
		return (int) Math.ceil(this.totalMessage * 1.0 / this.rows);
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalMessage() {
		return totalMessage;
	}
	public void setTotalMessage(int totalMessage) {
		this.totalMessage = totalMessage;
	}
	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", start=" + start + ", totalPage=" + totalPage
				+ ", totalMessage=" + totalMessage + "]";
	}
	

}
