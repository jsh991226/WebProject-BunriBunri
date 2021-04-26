package board;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import userlist.userlistDAO;
import util.DatabaseUtil;

public class reply extends userlistDAO{
	//r_id  b_id  user_id  r_grp_id r_order content date 
	private String r_id;
	private String b_id;
	private String user_id;
	private String r_grp_id;
	private String r_order;
	private String content;
	private String date;
	
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getUser_nick() {
		String nick = "0";
		String SQL = "SELECT user_nick FROM userlist where user_id='" + getUser_id()+"'"; 
		Connection conn = DatabaseUtil.getConnection(); 
		ResultSet results = null;
		PreparedStatement pstmt = null;		
		try {
			pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			if (idCheck(getUser_id()) == true) {
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
			
		} 
		
		return nick; 

	}	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getR_grp_id() {
		return r_grp_id;
	}
	public void setR_grp_id(String r_grp_id) {
		this.r_grp_id = r_grp_id;
	}
	public String getR_order() {
		return r_order;
	}
	public void setR_order(String r_order) {
		this.r_order = r_order;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content.replaceAll("<br/>", "\n");
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
