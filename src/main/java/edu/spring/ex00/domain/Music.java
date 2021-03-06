package edu.spring.ex00.domain;

import java.util.Date;

public class Music {
	private int mid;
	private String malbumart; // ★ 앨범자켓이미지 넣을 변수 추가 
	private String mtitle;
	private String martist;
	private Date mdate;
	private String mgenre;
	private String malbum;
	private int mcount;
	private String mlyrics;
	private String mvideo;

	public Music() {}

	public Music(int mid, String malbumart, String mtitle, String martist, Date mdate, String mgenre, String malbum,
			int mcount, String mlyrics, String mvideo) {
		super();
		this.mid = mid;
		this.malbumart = malbumart;
		this.mtitle = mtitle;
		this.martist = martist;
		this.mdate = mdate;
		this.mgenre = mgenre;
		this.malbum = malbum;
		this.mcount = mcount;
		this.mlyrics = mlyrics;
		this.mvideo = mvideo;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMalbumart() {
		return malbumart;
	}

	public void setMalbumart(String malbumart) {
		this.malbumart = malbumart;
	}

	public String getMtitle() {
		return mtitle;
	}

	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}

	public String getMartist() {
		return martist;
	}

	public void setMartist(String martist) {
		this.martist = martist;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public String getMgenre() {
		return mgenre;
	}

	public void setMgenre(String mgenre) {
		this.mgenre = mgenre;
	}

	public String getMalbum() {
		return malbum;
	}

	public void setMalbum(String malbum) {
		this.malbum = malbum;
	}

	public int getMcount() {
		return mcount;
	}

	public void setMcount(int mcount) {
		this.mcount = mcount;
	}

	public String getMlyrics() {
		return mlyrics;
	}

	public void setMlyrics(String mlyrics) {
		this.mlyrics = mlyrics;
	}

	public String getMvideo() {
		return mvideo;
	}

	public void setMvideo(String mvideo) {
		this.mvideo = mvideo;
	}
	
	
}
