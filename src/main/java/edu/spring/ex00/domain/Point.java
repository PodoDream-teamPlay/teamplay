package edu.spring.ex00.domain;

import java.util.Date;

public class Point {

	Point() {}
	private int pnum;
	private String userid;
	private Date ptime;
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public Point(int pnum, String userid, Date ptime) {
		super();
		this.pnum = pnum;
		this.userid = userid;
		this.ptime = ptime;
	}
	
	
	
	
}
