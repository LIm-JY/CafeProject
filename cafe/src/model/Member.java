package model;

public class Member {
	private int idx;
	private String user_id;
	private String user_pw;
	private String user_nickname;
	private String email;
	private String contact_number;
	private String address;
	
	
	// 생성자
	public Member(int idx, String user_id, String user_pw, String user_nickname, String email, String contact_number,
			String address) {
		this.idx = idx;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nickname = user_nickname;
		this.email = email;
		this.contact_number = contact_number;
		this.address = address;
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


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getUser_nickname() {
		return user_nickname;
	}


	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getContact_number() {
		return contact_number;
	}


	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Member [idx=" + idx + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_nickname="
				+ user_nickname + ", email=" + email + ", contact_number=" + contact_number + ", address=" + address
				+ "]";
	}
	
}
