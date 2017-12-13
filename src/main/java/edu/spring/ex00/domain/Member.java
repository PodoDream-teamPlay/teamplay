package edu.spring.ex00.domain;

import java.util.Date;

public class Member {
	
	private String userid;
	private String password;
	private String email;
	private int dance;
	private int ballad;
	private int hiphop;
	private int trot;
	private int indi;
	private Date memdate;
	private int point;
	public Member() {}

	
	
	public Member(String userid, String password, String email, int dance, int ballad, int hiphop, int trot, int indi,
			Date memdate, int point) {
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
		this.point = point;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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

	public int getDance() {
		return dance;
	}

	public void setDance(int dance) {
		this.dance = dance;
	}

	public int getBallad() {
		return ballad;
	}

	public void setBallad(int ballad) {
		this.ballad = ballad;
	}

	public int getHiphop() {
		return hiphop;
	}

	public void setHiphop(int hiphop) {
		this.hiphop = hiphop;
	}

	public int getTrot() {
		return trot;
	}

	public void setTrot(int trot) {
		this.trot = trot;
	}

	public int getIndi() {
		return indi;
	}

	public void setIndi(int indi) {
		this.indi = indi;
	}

	public Date getMemdate() {
		return memdate;
	}

	public void setMemdate(Date memdate) {
		this.memdate = memdate;
	}



	@Override
	public String toString() {
		return "Member [userid=" + userid + ", password=" + password + ", email=" + email + ", dance=" + dance
				+ ", ballad=" + ballad + ", hiphop=" + hiphop + ", trot=" + trot + ", indi=" + indi + ", memdate="
				+ memdate + ", point=" + point + "]";
	}


	
	
	
}
