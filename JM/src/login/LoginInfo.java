package login;

public class LoginInfo {
private String uid;
private String upw;
@Override
public String toString() {
	return "LoginInfo [uid=" + uid + ", upw=" + upw + "]";
}
public LoginInfo(String uid, String upw) {
	super();
	this.uid = uid;
	this.upw = upw;
}
public String getUid() {
	return uid;
}
public void setUid(String uid) {
	this.uid = uid;
}
public String getUpw() {
	return upw;
}
public void setUpw(String upw) {
	this.upw = upw;
}

}
