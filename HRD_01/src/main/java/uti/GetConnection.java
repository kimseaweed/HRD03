package uti;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConnection {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe",
					"C##system",
					"1234"
				);
		return conn;
				
	}
	
	public static void getClose(Connection conn,PreparedStatement pstmt, ResultSet rs) throws SQLException {
		if(conn!=null) {conn.close();}
		if(pstmt!=null) {pstmt.close();}
		if(rs!=null) {rs.close();}
		
	}

}
