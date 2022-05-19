package member.mv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {
	public Connection conn = null;
	public Statement stmt = null;
	public ResultSet rs = null;
	public PreparedStatement psmt;

	public Connection getConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클 접속 주소:유저 아이디:비밀번호 이 3의 정보가 맞으면 커넥션 타입의 객체를 리턴해준다
			conn = DriverManager.getConnection("jdbc:oracle:thin:@dbdeuxist01_high?TNS_ADMIN=C:\\\\Dev\\\\Wallet_DBdeuxist01", "admin", "Yd0534212460");
			System.out.println("연결성공!");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}

	public void disconnect() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			
			if(psmt !=null) {
				psmt.close();
			}
			
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
