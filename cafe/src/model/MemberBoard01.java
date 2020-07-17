package model;

import java.util.Date;

public class MemberBoard01 {
	private int idx; // 게시글 index(작성순번)
	private String userid; // 사용자 id(회원정보에서 가져와야 하며, 일치해야 함. Foreign Key)
	private String userpw; // 사용자 pw(회원정보에서 가져와야 하며, 일치해야 함. Foreign Key)
	private Date regdate; // 게시글 등록
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private int viewcount; // 게시글 조회 수
	private String filecontentaddr; // 첨부 파일 경로(Realpath).
	
	// Getter & Setter
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	// Debug용 toString
	@Override
	public String toString() {
		return "MemberBoard01 [글 번호=" + idx + ", 아이디 =" + userid + ", 비밀번호 =" + userpw + ", 작성일 =" + regdate
				+ ", 제목 =" + title + ", 글 내용 =" + content + ", 조회 수 =" + viewcount + ", 업로드 된 파일 경로 ="
				+ filecontentaddr + "]";
	}
	
}
