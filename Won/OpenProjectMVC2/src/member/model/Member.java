package member.model;

public class Member {

	private int idx;
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String email;
	private String contactNumber;
	private String address;
	private String photo;
	
	public Member() {}
	
	
	@Override
	public String toString() {
		return "Member [idx=" + idx + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userNickname=" + userNickname + ", email=" + email + ", contactNumber=" + contactNumber
				+ ", address=" + address + ", photo=" + photo + "]";
	}


	public Member(int idx, String userId, String userPw, String userName, String userNickname, String email,
			String contactNumber, String address, String photo) {
		super();
		this.idx = idx;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNickname = userNickname;
		this.email = email;
		this.contactNumber = contactNumber;
		this.address = address;
		this.photo = photo;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}



}
