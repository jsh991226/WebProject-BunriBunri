package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class commonDAO {
	public int cntRows(String tableName) {
		Connection conn = DatabaseUtil.getConnection(); 
		String SQL = "SELECT count(*) FROM " + tableName; 
		PreparedStatement pstmt = null;
		ResultSet results = null;
		try {
			int count = -1;
			pstmt = conn.prepareStatement(SQL);
			results = pstmt.executeQuery();
            if(results.next()){
            	count = results.getInt(1);
            }
			System.out.println(tableName+"테이블 rows 개수 : " + count);
			return count;
		}catch( Exception e) {
			System.out.println(tableName + " cntrows 실패 : " + e);
			return -1;
		} finally {
			if (results != null) try { results.close(); } catch(Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
		}
		
		
	}

}
