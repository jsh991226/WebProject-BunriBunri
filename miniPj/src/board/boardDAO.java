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

public class boardDAO extends commonDAO{

	public List<Board> load() throws Exception { 
		Connection conn = DatabaseUtil.getConnection(); 
		List<Board> result = new ArrayList<Board>();
		String SQL = "SELECT * FROM board order by b_id desc"; 
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			//ArrayList<String> result = new ArrayList<String>();
            if(rs.next()){
                do{
                	Board bd = new Board();
                	bd.setB_id(rs.getString(1));
                	bd.setGrp_id(rs.getString(2));
                	bd.setGrp_order(rs.getString(3));
                	bd.setUser_id(rs.getString(4));
                	bd.setTitle(rs.getString(5));
                	bd.setDate(rs.getString(6));
                	bd.setContent(rs.getString(7));
                	bd.setView(rs.getString(8));
                	bd.setReplyCnt(getReplyCount(rs.getString(1))+"");
                	result.add(bd);
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
	
	public int getReplyCount(String b_id) {
		String SQL = "SELECT count(*) FROM reply where b_id="+b_id;
		ResultSet results = null;
		PreparedStatement pstmt = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			results = pstmt.executeQuery();
			int cnt = 0;
            if(results.next()){
            	cnt = results.getInt(1);
            }
			return cnt;
		} catch( Exception e) {
			e.printStackTrace();
			
		} finally {
			if (results != null) try { results.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}
			
		}
		return 0;
	}
		
	
	
	public String getNICK(String userID) {
		String nick = "0";
		String SQL = "SELECT user_nick FROM userlist where user_id='" + userID+"'"; 
		ResultSet results = null;
		PreparedStatement pstmt = null;
		Connection conn = DatabaseUtil.getConnection(); 
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
	
	
	
	
	public String postLoad(String postNum, boolean viewCheck) { 
		int viewNum = 0;
		String SQL = "SELECT * FROM board where b_id = " + postNum ; 
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(SQL);
			int vcTemp;
			rs = pstmt.executeQuery();
			String result = "";
            if(rs.next()){
                do{
                	if (viewCheck == false ) vcTemp = (rs.getInt(8)+1);
                	else  vcTemp = (rs.getInt(8));
                	result = rs.getString(1)+"|"+rs.getString(2)+"|"+rs.getString(3)+"|"+rs.getString(4)+"|"+rs.getString(5)+"|"+rs.getString(6)+"|"+rs.getString(7)+"|"+vcTemp;
                	if (viewCheck == false ) viewNum = rs.getInt(8)+1;
                }while(rs.next());
            }
            if (viewCheck == false ) {
                String SQLU = "UPDATE board SET view = "+(viewNum)+" WHERE b_id ="+postNum;
                PreparedStatement pstmtUpdate = conn.prepareStatement(SQLU);
                int rs2 = pstmtUpdate.executeUpdate();       
            }
            return result;
		} catch (Exception e) { 
			e.printStackTrace(); 
		}  finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
			if (conn != null) try { conn.close(); } catch(Exception e) {}

		}
		return null;  
	}	
	
	public int write(String boardTitle, String boardContent, String userNICK) {
		String SQL = "INSERT INTO BOARD VALUES (?,?,?,?,?,?,?,?)"; 
		//b_id, grp_id, grp_order, user_id, title, date, content, view
		System.out.println(userNICK +"의 게시물");
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월 dd일 HH시 mm분");
		Connection conn = DatabaseUtil.getConnection(); 
		Date time = new Date();
		String nowDate = format.format(time);
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			int temp =  cntRows("board")+1;
			pstmt.setInt(1, temp); 
			pstmt.setInt(2, temp); 
			pstmt.setString(3, "0");
			pstmt.setString(4, userNICK);
			pstmt.setString(5, boardTitle);
			pstmt.setString(6, nowDate);
			pstmt.setString(7, boardContent);
			pstmt.setInt(8, 0);
			System.out.println(temp+"번째 게시물 추가 완료");
			return pstmt.executeUpdate();
			} catch (Exception e) { 
				e.printStackTrace(); 
				
			}  finally {
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
				if (conn != null) try { conn.close(); } catch(Exception e) {}

			} 
		
		return -1; 
				
	} 
	
	

	

}
