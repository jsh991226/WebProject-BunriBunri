package userlist;



import java.sql.Connection;

 
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.commonDAO;
import util.DatabaseUtil; 
public class userlistDAO extends commonDAO{ 
	public int join(String userID, String userPW, String userNICK, String userEMAIL) { 
		PreparedStatement pstmt=null;
		Connection conn = DatabaseUtil.getConnection(); 
		String SQL = "INSERT INTO USERLIST VALUES (?,?,?,?,?,?,?,?,?)"; 
		try {
			if (idCheck(userID) == true) {
				return -2;
			}
			if (nickCheck(userNICK) == true) {
				return -3;
			}
			if (emailCheck(userEMAIL) == true) {
				return -4;
			}
			
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			int temp =  cntRows("USERLIST")+1;
			pstmt.setString(1, (temp+"")); 
			pstmt.setString(2, userID);
			pstmt.setString(3, userPW);
			pstmt.setString(4, userNICK);
			pstmt.setString(5, userEMAIL);
			pstmt.setString(6, "0");
			pstmt.setString(7, "1");
			pstmt.setString(8, "YYYYMMDD");
			pstmt.setString(9, "null");
			System.out.println(temp+"번째 사용자 추가 완료");
			return pstmt.executeUpdate();
			} catch (Exception e) { 
				e.printStackTrace(); 
				
			} finally {
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
				if (conn != null) try { conn.close(); } catch(Exception e) {}
				
			} 
			 return -1; 
				
	} 
	public int login(String userID, String userPW) { 
		String SQL = "SELECT user_pw FROM userlist where user_id='" + userID+"'"; 
		PreparedStatement pstmt = null;
		ResultSet results = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			if (idCheck(userID) == true) {
				results = pstmt.executeQuery();
				while(results.next()) {
					if ( userPW.equals(results.getString("user_pw"))) {
						System.out.println(results.getString("user_pw"));
						return 1;
					}
				}
			}else {
				System.out.println("아이디 없음 거름");
				return -1;					
			}

		} catch (Exception e) { 
			e.printStackTrace(); 
			
		} finally {
			if (results != null) try { results.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}  
		return -1; 
				
	} 	
	
	
	public String getNICK(String userID) {
		Connection conn = DatabaseUtil.getConnection(); 
		String nick = "0";
		String SQL = "SELECT user_nick FROM userlist where user_id='" + userID+"'"; 
		PreparedStatement pstmt = null;
		ResultSet results = null;
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			if (idCheck(userID) == true) {
				results = pstmt.executeQuery();
				while(results.next()) {
					nick = results.getString("user_nick");
					return nick;
				}
			}else {
				System.out.println("아이디 없음 거름");
				return nick;					
			}

		} catch (Exception e) { 
			e.printStackTrace(); 
			
		} finally {
			if (results != null) try { results.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}   
		return nick; 
						
		
	}
	
	
	public boolean idCheck(String userID) {
		String SQL = "SELECT user_id FROM userlist"; 
		ResultSet results = null;
		PreparedStatement pstmt = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			results = pstmt.executeQuery();
			while(results.next()) {
				if(results.getString("user_id").toLowerCase().equals(userID.toLowerCase())) {
					return true;
				}
			}
		} catch( Exception e) {
			e.printStackTrace();
			
		} finally {
			if (results != null) try { results.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}   
		return false;
	}
	boolean emailCheck(String userEMAIL) {
		String SQL = "SELECT user_email FROM userlist"; 
		PreparedStatement pstmt = null;
		ResultSet results = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			results = pstmt.executeQuery();
			while(results.next()) {
				if(results.getString("user_email").toLowerCase().equals(userEMAIL.toLowerCase())) {
					return true;
				}
			}
		} catch( Exception e) {
			e.printStackTrace();
			
		} finally {
			if (results != null) try { results.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}   
		return false;
	}
	boolean nickCheck(String userNICK) {
		String SQL = "SELECT user_nick FROM userlist"; 
		PreparedStatement pstmt = null;
		ResultSet results = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			results = pstmt.executeQuery();
			while(results.next()) {
				if(results.getString("user_nick").toLowerCase().equals(userNICK.toLowerCase())) {
					return true;
				}
			}
		} catch( Exception e) {
			e.printStackTrace();
			
		} finally {
			if (results != null) try { results.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}   
		return false;
	}	
	
	
	
	
}
		
	


