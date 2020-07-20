package model;

import java.util.Date;

public class BuyComment {
	private int idx;
	private String user_id;
	private String content;
	private Date reg_date;
	
	// 생성자
	public BuyComment(int idx, String user_id, String content, Date reg_date) {
		this.idx = idx;
		this.user_id = user_id;
		this.content = content;
		this.reg_date = reg_date;
	}
	
	// Getter & Setter
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "BuyComment [idx=" + idx + ", 작성자=" + user_id + ", 댓글내용=" + content + ", 작성일=" + reg_date + "]";
	}
	
}
