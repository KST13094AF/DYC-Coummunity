package kr.ac.doungyang.Community.model.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class noticeDao {
	private Connection conn;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public noticeDao() {
		
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
	
	public ArrayList<noticeDto> getMain(){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<noticeDto> list = new ArrayList<noticeDto>();
		
		query.append("SELECT *").append(" FROM notice").append(" WHERE available = 1 ORDER BY num DESC").append(" LIMIT 5");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				noticeDto nDto = new noticeDto();
				nDto.setNum(rs.getInt("num"));
				nDto.setId(rs.getString("id"));
				nDto.setClassType(rs.getString("class"));
				nDto.setTitle(rs.getString("title"));
				nDto.setContent(rs.getString("content"));
				nDto.setDate(rs.getTimestamp("date"));
				nDto.setLookup(rs.getInt("lookup"));
				list.add(nDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
}
