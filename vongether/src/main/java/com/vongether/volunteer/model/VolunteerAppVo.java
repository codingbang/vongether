package com.vongether.volunteer.model;

import java.sql.Date;

public class VolunteerAppVo {
	private int appNo;
	private String appName;
	private String appPlace;
	private Date appBegintm;
	private Date appEndtm;
	private String mId;
	public int getAppNo() {
		return appNo;
	}
	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getAppPlace() {
		return appPlace;
	}
	public void setAppPlace(String appPlace) {
		this.appPlace = appPlace;
	}
	public Date getAppBegintm() {
		return appBegintm;
	}
	public void setAppBegintm(Date appBegintm) {
		this.appBegintm = appBegintm;
	}
	public Date getAppEndtm() {
		return appEndtm;
	}
	public void setAppEndtm(Date appEndtm) {
		this.appEndtm = appEndtm;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
}
