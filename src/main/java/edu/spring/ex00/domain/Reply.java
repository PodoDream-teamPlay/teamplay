package edu.spring.ex00.domain;

import java.util.Date;

public class Reply {

	private int rno; // 댓글 번호 
	private int bno; // 게시글 번호(몇 번 게시글에 대한 댓글)
	private String rtext; // 댓글 내용
	private String replier; // 댓글 작성자 아이디 
	private Date regdate; // 댓글 작성(수정) 시간 
	
	
	//대댓글은 만약에 하려면 
	//private int replyno; //얘가 rno를 셀프참조할수있게하고, 테이블에도 있어야겠지? 
	
	
	public Reply() {}


	public Reply(int rno, int bno, String rtext, String replier, Date regdate) {
		super();
		this.rno = rno; 
		this.bno = bno;
		this.rtext = rtext;
		this.replier = replier;
		this.regdate = regdate;
	}


	public int getRno() {
		return rno;
	}


	public void setRno(int rno) {
		this.rno = rno;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getRtext() {
		return rtext;
	}


	public void setRtext(String rtext) {
		this.rtext = rtext;
	}


	public String getReplier() {
		return replier;
	}


	public void setReplier(String replier) {
		this.replier = replier;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "Reply{"
				+ "rno: " + rno
				+ ", bno: " + bno
				+ ", rtext: " + rtext
				+ ", replier: " + replier
				+ ", regdate: " + regdate
				+ "}";
	}
	
	
	
}
