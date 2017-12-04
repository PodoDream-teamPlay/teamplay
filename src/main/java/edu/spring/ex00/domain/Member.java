package edu.spring.ex00.domain;

import java.util.Date;

public class Member {
	
	private String userid;
	private String password;
	private String email;
	private String dance;
	private String ballad;
	private String hiphop;
	private String trot;
	private String indi;
	private Date memdate;

	public Member() {}

	public Member(String userid, String password, String email, String dance, String ballad, String hiphop, String trot,
			String indi, Date memdate) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.dance = dance;
		this.ballad = ballad;
		this.hiphop = hiphop;
		this.trot = trot;
		this.indi = indi;
		this.memdate = memdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDance() {
		return dance;
	}

	public void setDance(String dance) {
		this.dance = dance;
	}

	public String getBallad() {
		return ballad;
	}

	public void setBallad(String ballad) {
		this.ballad = ballad;
	}

	public String getHiphop() {
		return hiphop;
	}

	public void setHiphop(String hiphop) {
		this.hiphop = hiphop;
	}

	public String getTrot() {
		return trot;
	}

	public void setTrot(String trot) {
		this.trot = trot;
	}

	public String getIndi() {
		return indi;
	}

	public void setIndi(String indi) {
		this.indi = indi;
	}

	public Date getMemdate() {
		return memdate;
	}

	public void setMemdate(Date memdate) {
		this.memdate = memdate;
	}
	
	
}
