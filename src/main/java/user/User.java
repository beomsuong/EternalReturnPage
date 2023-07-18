package user;

public class User {

	
	private String userName;
	private int userMMR; //유저 개인의 MMR을 서버로 부터 받아와 저장한다
	private String userEmail;
	private String userPassword;
	private String userID;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserMMR() {
		return userMMR;
	}
	public void setUserMMR(int userMMR) {
		this.userMMR = userMMR;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
}
