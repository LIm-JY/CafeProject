package board.model;

import java.util.Date;

public class Board {
	
	private int idx;
	private String user_id;
	private String title;
	private String item_category;
	private String content;
	private Date reg_date;
	private int view_count;
	private String file_content_addr;
	
	// 기본 생성자
	public Board() {}
	
	// 생성자(요소를 사용하여)
	public Board(
			int idx, 
			String user_id, 
			String title, 
			String item_category, 
			String content, 
			Date reg_date,
			int view_count, 
			String file_content_addr) 
	{
		super();
		this.idx = idx;
		this.user_id = user_id;
		this.title = title;
		this.item_category = item_category;
		this.content = content;
		this.reg_date = reg_date;
		this.view_count = view_count;
		this.file_content_addr = file_content_addr;
	}
	
	@Override
	public String toString() {
		return "Board [idx=" + idx + ", 아이디=" + user_id + ", 제목=" + title + ", 대분류=" + item_category
				+ ", 내용=" + content + ", 작성일=" + reg_date + ", 조회수=" + view_count
				+ ", 첨부파일경로=" + file_content_addr + "]";
	}

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

	public String getItem_category() {
		return item_category;
	}

	public void setItem_category(String item_category) {
		this.item_category = item_category;
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

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getFile_content_addr() {
		return file_content_addr;
	}

	public void setFile_content_addr(String file_content_addr) {
		this.file_content_addr = file_content_addr;
	}
		
}

