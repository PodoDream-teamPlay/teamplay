package edu.spring.ex00.domain;

import java.util.Date;

public class Playlist {
	
	private int pid;
	private String userid;
	private String mids;
	private Date pdate;
	private String ptitle;

	public Playlist() {}

	public Playlist(int pid, String userid, String mids, Date pdate, String ptitle) {
		super();
		this.pid = pid;
		this.userid = userid;
		this.mids = mids;
		this.pdate = pdate;
		this.ptitle = ptitle;
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

	public String getMids() {
		return mids;
	}

	public void setMids(String mids) {
		this.mids = mids;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	
}
