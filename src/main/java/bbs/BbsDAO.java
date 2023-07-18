package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/Bser";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext(int characterID) { //다음 글 번호를 찾는 함수
		String SQL = "SELECT bbsID FROM BBS where bbscharacterID = ? ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,characterID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(int characterID, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext(characterID));
			pstmt.setInt(2, characterID);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}


	
	public ArrayList<Bbs> view(int characterID) { //캐릭터별로 글을 불러온다
	    String SQL = "SELECT * FROM Bbs WHERE characterID LIKE ?";
	    ArrayList<Bbs> BbsList = new ArrayList<Bbs>();
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1,"%"+ characterID+"%" );  
	        rs = pstmt.executeQuery();
	        while(rs.next()) {
	            Bbs bbs = new Bbs();
	            bbs.setBbsID(rs.getInt(1));
	            bbs.setBbsCharacterID(rs.getInt(2));
	            bbs.setUserID(rs.getString(3));
	            bbs.setBbsDate(rs.getString(4));
	            bbs.setBbsContent(rs.getString(5));
	            bbs.setBbsAvailable(rs.getInt(6));
	            
	            BbsList.add(bbs);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return BbsList;  
	}
	///아래부터는 수정 예정임

}
