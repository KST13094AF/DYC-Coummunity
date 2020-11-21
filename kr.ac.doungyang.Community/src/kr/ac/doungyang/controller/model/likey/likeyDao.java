package kr.ac.doungyang.controller.model.likey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class likeyDao {
	private Connection conn;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public likeyDao() {
		
	}
	
	/* Connection Pool */
	public Connection getConnection() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/doungyang");
			conn = ds.getConnection();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/* Connection Pool 반납 */
	private void closeJdbc(Connection conn, Statement pstmt, ResultSet rs) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int likey(likeyDto lDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("INSERT INTO likey").append(" VALUES(?, ?, ?, ?)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, lDto.getNum());
			pstmt.setString(2, lDto.getId());
			pstmt.setString(3, lDto.getEvalid());
			pstmt.setString(4, lDto.getIp());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public void delete(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("DELETE FROM").append(" likey where id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
}
