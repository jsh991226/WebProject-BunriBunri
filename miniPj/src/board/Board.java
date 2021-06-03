package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import userlist.userlistDAO;
import util.DatabaseUtil;

public class Board  extends userlistDAO{
	//result.add(rs.getString(1)+"|"+rs.getString(2)+"|"+rs.getString(3)+"|"+getNICK(rs.getString(4))+"|"+rs.getString(5)+"|"+rs.getString(6)+"|"+rs.getString(7)+"|"+rs.getString(8));
	// 게시물 번호 , 그룹 번호, 그룹 순서, 유저 아이디, 제목, 날짜, 내용, 조회수
	private String b_id;
	private String grp_id;
	private String grp_order;
	private String user_id;
	private String title;
	private String date;
	private String content;
	private String view;
	private String replyCnt;
	private String Image;
	
	
	public String getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(String replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getGrp_id() {
		return grp_id;
	}
	public void setGrp_id(String grp_id) {
		this.grp_id = grp_id;
	}
	public String getGrp_order() {
		return grp_order;
	}
	public void setGrp_order(String grp_order) {
		this.grp_order = grp_order;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String Image) {
		this.Image = Image;
	}
	public String cutTitle(int len, String title) {
		String result ="";
		if (title.length()>=len) {
			result = title.substring(0, len);
			result+="...";
		}else {
			result=title;
		}
		return result;
	}
	
	
	
	public String getUser_nick() {
		String nick = "0";
		String SQL = "SELECT user_nick FROM userlist where user_id='" + getUser_id()+"'"; 
		Connection conn = DatabaseUtil.getConnection(); 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			if (idCheck(getUser_id()) == true) {
				ResultSet results = pstmt.executeQuery();
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
			
		} return nick; 

	}		
	
	
	
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
	
}
