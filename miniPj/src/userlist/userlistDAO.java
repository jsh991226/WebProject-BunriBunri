package userlist;


import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil; 
public class userlistDAO { 
	Connection conn = DatabaseUtil.getConnection(); 
	public int join(String userID, String userPW, String userNICK, String userEMAIL) { 
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
			
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
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
				
			} return -1; 
				
	} 
	public int login(String userID, String userPW) { 
		System.out.println("테스트");
		String SQL = "SELECT user_pw FROM userlist where user_id='" + userID+"'"; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			if (idCheck(userID) == true) {
				ResultSet results = pstmt.executeQuery();
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
			
		} return -1; 
				
	} 	
	
	
	public boolean idCheck(String userID) {
		String SQL = "SELECT user_id FROM userlist"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			ResultSet results = pstmt.executeQuery();
			while(results.next()) {
				if(results.getString("user_id").toLowerCase().equals(userID.toLowerCase())) {
					return true;
				}
			}
		} catch( Exception e) {
			e.printStackTrace();
			
		}
		return false;
	}
	boolean emailCheck(String userEMAIL) {
		String SQL = "SELECT user_email FROM userlist"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			ResultSet results = pstmt.executeQuery();
			while(results.next()) {
				if(results.getString("user_email").toLowerCase().equals(userEMAIL.toLowerCase())) {
					return true;
				}
			}
		} catch( Exception e) {
			e.printStackTrace();
			
		}
		return false;
	}
	boolean nickCheck(String userNICK) {
		String SQL = "SELECT user_nick FROM userlist"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			ResultSet results = pstmt.executeQuery();
			while(results.next()) {
				if(results.getString("user_nick").toLowerCase().equals(userNICK.toLowerCase())) {
					return true;
				}
			}
		} catch( Exception e) {
			e.printStackTrace();
			
		}
		return false;
	}	
	
	
	
	int cntRows(String tableName) {
		String SQL = "SELECT count(*) FROM " + tableName; 
		try {
			int count = -1;
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet results = pstmt.executeQuery();
            if(results.next()){
            	count = results.getInt(1);
            }
			System.out.println(tableName+"테이블 rows 개수 : " + count);
			return count;
		}catch( Exception e) {
			System.out.println(tableName + " cntrows 실패 : " + e);
			return -1;
		}
		
		
	}
	
}
		
	


