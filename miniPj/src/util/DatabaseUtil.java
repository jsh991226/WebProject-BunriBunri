package util;
import java.sql.Connection; 
import java.sql.DriverManager; 
public class DatabaseUtil { 
	public static Connection getConnection() { //데이터베이스와 연결상태 관리 
		try { 
			String dbURL = "jdbc:mysql://localhost:3308/bunripj?useSSL=false&serverTimezone=UTC&userUnicode=true&characterEncoding=UTF-8"; 
			String dbID = "root"; String dbPassword = "riBunriBun"; 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			System.out.println("DB CONNECT 완료");
			return DriverManager.getConnection(dbURL, dbID, dbPassword); 
		} catch (Exception e) { 
			e.printStackTrace(); 
			} return null; 
		} 
}


