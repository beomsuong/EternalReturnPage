package bbs;

public class Bbs {
	private int bbsID;/*몇번째 글인지 표시*/
	private int bbsCharacterID; /* 캐릭터의 고유한 번호를 저장하여 게시판 분류에 사용 */
	private String UserID; 
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable;/*해당 글 유효 여부*/
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public int getBbsCharacterID() {
		return bbsCharacterID;
	}
	public void setBbsCharacterID(int bbsCharacterID) {
		this.bbsCharacterID = bbsCharacterID;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	
}
