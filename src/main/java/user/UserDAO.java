package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/Bser";
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword ) {
		String SQL="SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;//로그인 성공
				}
				else
					return 0; //비밀번호 오류
			}
			return -1;
		}catch (Exception e){
			e.printStackTrace();
		}
		return -2;//데이터베이스 오류
	}
	public String getMMR(String userID) {
		String SQL="SELECT userMMR FROM USER WHERE userID = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			
					return rs.getString(1);//로그인 성공
				
			}
			return "error";
		}catch (Exception e){
			e.printStackTrace();
		}
		return "error2";//데이터베이스 오류
	}
	public String getName(String userID) {
		String SQL="SELECT userName FROM USER WHERE userID = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {		
					return rs.getString(1);//로그인 성공
			}
			return "error";
		}catch (Exception e){
			e.printStackTrace();
		}
		return "error2";//데이터베이스 오류
	}
	public int join(User user) {
		String SQL="INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
}
