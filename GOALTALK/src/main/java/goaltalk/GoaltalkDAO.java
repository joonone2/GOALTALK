package goaltalk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GoaltalkDAO {

	private Connection conn;
	private ResultSet rs;
	
	public GoaltalkDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/GOALTALK";
			String dbID = "root";
			String dbPassword = "12345678";
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
				if(rs.next()) {
					return rs.getString(1);
				}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "";//데이터베이스 오류 
	}
	
	
	public int getNext() {
		String SQL = "SELECT talkID FROM GOALTALK ORDER BY talkID DESC";
		try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1 ;
				}
				return 1; //현재가 첫번째 게시물인 경우
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류 
	}
	
	public int write(String talkTitle, String userID, String talkContent) {
		String SQL = "INSERT INTO GOALTALK VALUES(?, ?, ?, ?, ?, ?)";
		try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, talkTitle);
				pstmt.setString(3, userID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, talkContent);
				pstmt.setInt(6, 1);
				return pstmt.executeUpdate();
	
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류 
	}
	
	public ArrayList<Goaltalk> getList(int pageNumber) {
		String SQL = "SELECT * FROM GOALTALK WHERE talkID < ? AND talkAvailable = 1 ORDER BY talkID DESC LIMIT 10";
		ArrayList<Goaltalk> list = new ArrayList<Goaltalk>();
		try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Goaltalk goaltalk = new Goaltalk();
					goaltalk.setTalkID(rs.getInt(1));
					goaltalk.setTalkTitle(rs.getString(2));
					goaltalk.setUserID(rs.getString(3));
					goaltalk.setTalkDate(rs.getString(4));
					goaltalk.setTalkContent(rs.getString(5));
					goaltalk.setTalkAvailable(rs.getString(6));
					
					list.add(goaltalk);
				}
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM GOALTALK WHERE talkID < ? AND talkAvailable = 1";
		try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return true;
				}
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public Goaltalk getGoaltalk(int talkID) {
		String SQL = "SELECT * FROM GOALTALK WHERE talkID = ?";
		try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, talkID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Goaltalk goaltalk = new Goaltalk();
					goaltalk.setTalkID(rs.getInt(1));
					goaltalk.setTalkTitle(rs.getString(2));
					goaltalk.setUserID(rs.getString(3));
					goaltalk.setTalkDate(rs.getString(4));
					goaltalk.setTalkContent(rs.getString(5));
					goaltalk.setTalkAvailable(rs.getString(6));
					
					return goaltalk;
				}
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int talkID, String talkTitle, String talkContent) {
		String SQL = "UPDATE GOALTALK SET talkTitle = ?, talkContent = ? WHERE talkID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, talkTitle);
			pstmt.setString(2, talkContent);
			pstmt.setInt(3, talkID);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int talkID) {
		String SQL = "UPDATE GOALTALK SET talkAvailable = 0 WHERE talkID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, talkID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	
}}
