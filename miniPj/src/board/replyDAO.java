package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import common.commonDAO;
import util.DatabaseUtil;

public class replyDAO extends commonDAO{
	public int write(String postNum, String replyContent, String user_id) {
		String SQL = "INSERT INTO REPLY VALUES (?,?,?,?,?,?)"; 
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월 dd일 HH시 mm분");
		Connection conn = DatabaseUtil.getConnection(); 
		Date time = new Date();
		String nowDate = format.format(time);
		PreparedStatement pstmt = null;
		//r_id 리플번호, b_id 게시물번호, user_id, r_grp_id 리플그룹 자기게시물이면 자기 번호, r_order 리플순서 자기댓글이면 0, content 내용, date
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0); 
			pstmt.setString(2, postNum); 
			pstmt.setString(3, user_id);
			pstmt.setString(4, replyContent);
			pstmt.setString(5, nowDate);
			pstmt.setInt(6, -1);
			return pstmt.executeUpdate();
			} catch (Exception e) { 
				e.printStackTrace(); 
				
			} finally {
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
				if (conn != null) try { conn.close(); } catch(Exception e) {}

			}   return -1; 
				
	} 
	
	public int delete(String postNum, String user_id, String replyID) {
		String SQL = "DELETE FROM reply WHERE r_id = " + replyID;
		Connection conn = DatabaseUtil.getConnection(); 
		PreparedStatement pstmt = null;
		//r_id 리플번호, b_id 게시물번호, user_id, r_grp_id 리플그룹 자기게시물이면 자기 번호, r_order 리플순서 자기댓글이면 0, content 내용, date
		
		try {
			pstmt = conn.prepareStatement(SQL);
			System.out.println("지우는중" + replyID);
			return pstmt.executeUpdate();
			} catch (Exception e) { 
				e.printStackTrace(); 
				
			} finally {
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
				if (conn != null) try { conn.close(); } catch(Exception e) {}

			}   return -1; 
			
	}

	
	public List<reply> load(String postNum) { 
		List<reply> result = new ArrayList<reply>();
		String SQL = "SELECT * FROM reply where b_id = "+postNum +" AND r_group = -1"; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			//r_id  b_id  user_id  r_grp_id r_order content date 
			//ArrayList<String> result = new ArrayList<String>();
            if(rs.next()){
                do{
                	reply rp = new reply();
                	rp.setR_id(rs.getString(1));
                	rp.setB_id(rs.getString(2));
                	rp.setUser_id(rs.getString(3));
                	rp.setContent(rs.getString(4));
                	rp.setDate(rs.getString(5));
                	result.add(rp);
                }while(rs.next());
            }
    
            return result;
		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}  
		return result;  
	}	
	
	
	public int reWrite(String postNum, String replyID, String replyContent, String user_id) {
		String SQL = "INSERT INTO REPLY VALUES (?,?,?,?,?,?)"; 
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월 dd일 HH시 mm분");
		Connection conn = DatabaseUtil.getConnection(); 
		Date time = new Date();
		String nowDate = format.format(time);
		PreparedStatement pstmt = null;
		//r_id 리플번호, b_id 게시물번호, user_id, r_grp_id 리플그룹 자기게시물이면 자기 번호, r_order 리플순서 자기댓글이면 0, content 내용, date
		System.out.println("답글 테스트 로그");
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0); 
			pstmt.setString(2, postNum); 
			pstmt.setString(3, user_id);
			pstmt.setString(4, replyContent);
			pstmt.setString(5, nowDate);
			pstmt.setString(6, replyID);
			//System.out.println(temp+"댓글");
			return pstmt.executeUpdate();
			} catch (Exception e) { 
				e.printStackTrace(); 
				
			} finally {
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
				if (conn != null) try { conn.close(); } catch(Exception e) {}

			}   return -1; 
				
	} 
	public List<reply> reLoad(String postNum, String replyID) { 
		List<reply> result = new ArrayList<reply>();
		String SQL = "SELECT * FROM reply where b_id = "+postNum +" AND r_group = "+replyID; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			//r_id  b_id  user_id  r_grp_id r_order content date 
			//ArrayList<String> result = new ArrayList<String>();
            if(rs.next()){
                do{
                	reply rp = new reply();
                	rp.setR_id(rs.getString(1));
                	rp.setB_id(rs.getString(2));
                	rp.setUser_id(rs.getString(3));
                	rp.setContent(rs.getString(4));
                	rp.setDate(rs.getString(5));
                	result.add(rp);
                }while(rs.next());
            }
    
            return result;
		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}  
		return result;  
	}	
		
	
	
	
	
	
	
	


}
