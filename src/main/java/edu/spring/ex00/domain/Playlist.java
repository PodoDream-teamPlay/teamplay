package edu.spring.ex00.domain;

import java.util.Date;

public class Playlist {
	
	private int pid;
	private String userid;
	private String mid;
	private Date pdate;

	public Playlist() {}

	public Playlist(int pid, String userid, String mid, Date pdate) {
		super();
		this.pid = pid;
		this.userid = userid;
		this.mid = mid;
		this.pdate = pdate;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	
}
