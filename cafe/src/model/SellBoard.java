package model;

import java.util.Date;

public class SellBoard {
	private int idx; // 게시글 index(작성순번)
	private String user_id; // 사용자 id(회원정보에서 가져와야 하며, 일치해야 함. Foreign Key)
	private String title; // 게시글 제목
	private String item_catagory; // 제품 대분류
	private String content; // 게시글 내용
	private Date reg_date; // 게시글 작성일
	private int viewcount; // 게시글 조회 수
	private String filecontentaddr; // 첨부 파일 경로(Realpath).
	
	// 생성자
	public SellBoard(int idx, String user_id, String title, String item_catagory, String content, Date reg_date,
			int viewcount, String filecontentaddr) {
		this.idx = idx;
		this.user_id = user_id;
		this.title = title;
		this.item_catagory = item_catagory;
		this.content = content;
		this.reg_date = reg_date;
		this.viewcount = viewcount;
		this.filecontentaddr = filecontentaddr;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getItem_catagory() {
		return item_catagory;
	}

	public void setItem_catagory(String item_catagory) {
		this.item_catagory = item_catagory;
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

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public String getFilecontentaddr() {
		return filecontentaddr;
	}

	public void setFilecontentaddr(String filecontentaddr) {
		this.filecontentaddr = filecontentaddr;
	}


	@Override
	public String toString() {
		return "BuyBoard [idx=" + idx + ", 사용자 아이디=" + user_id + ", 제목=" + title + ", 제품 대분류=" + item_catagory
				+ ", 게시글 내용=" + content + ", 작성일=" + reg_date + ", 조회수=" + viewcount + ", 첨부파일="
				+ filecontentaddr + "]";
	}
	
}
