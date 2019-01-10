package com.vongether.board.model;

public class BoardVO {
	private int bNo;
	private String bTitle;
	private String bContent;
	private int bHitcount;
	private String bRegdate;
	private String mId;
	private int rCount;//댓글수
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbHitcount() {
		return bHitcount;
	}
	public void setbHitcount(int bHitcount) {
		this.bHitcount = bHitcount;
	}
	public String getbRegdate() {
		return bRegdate;
	}
	public void setbRegdate(String bRegdate) {
		this.bRegdate = bRegdate;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	
	
}
