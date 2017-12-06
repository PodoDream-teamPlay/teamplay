package edu.spring.ex00.domain;

import java.util.Date;

public class Get {
	
	private int gid;
	private String userid;
	private String mid;
	private int gprice;
	private Date gdate;
	
	public Get() {}

	public Get(int gid, String userid, String mid, int gprice, Date gdate) {
		super();
		this.gid = gid;
		this.userid = userid;
		this.mid = mid;
		this.gprice = gprice;
		this.gdate = gdate;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
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

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public Date getGdate() {
		return gdate;
	}

	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}
	
	
	
}
