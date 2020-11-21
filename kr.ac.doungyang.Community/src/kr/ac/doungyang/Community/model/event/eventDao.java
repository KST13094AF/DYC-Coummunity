package kr.ac.doungyang.Community.model.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class eventDao {
	private Connection conn;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public eventDao() {
		
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
	
	public int insertEvent(eventDto eDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO event").append(" VALUES (0, ?, ?, ?, 1)");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, eDto.getBbsid());
			pstmt.setString(2, eDto.getToid());
			pstmt.setString(3, eDto.getFromid());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int insertEvent(String toid, String fromid) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO event").append(" VALUES (0, null, ?, ?, 2)");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, toid);
			pstmt.setString(2, fromid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public ArrayList<eventDto> getEmailEevent(String id){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<eventDto> list = new ArrayList<eventDto>();
		query.append("SELECT * FROM event").append(" WHERE toid = ? AND available = 2");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				eventDto eDto = new eventDto();
				eDto.setNum(rs.getInt("num"));
				eDto.setToid(rs.getString("toid"));
				eDto.setFromid(rs.getString("fromid"));
				list.add(eDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<eventDto> getEevent(String id){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<eventDto> list = new ArrayList<eventDto>();
		query.append("SELECT * FROM event").append(" WHERE toid = ? AND available = 1");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				eventDto eDto = new eventDto();
				eDto.setNum(rs.getInt("num"));
				eDto.setBbsid(rs.getInt("bbsid"));
				eDto.setToid(rs.getString("toid"));
				eDto.setFromid(rs.getString("fromid"));
				list.add(eDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public void eventRead(int number, String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE event").append(" SET available = 0 where bbsid = ? AND toid = ? AND available = 1");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
	}
	
	public void emailEventRead(String toid, String fromid) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE event").append(" SET available = 0 where toid = ? AND fromid = ? AND available = 2");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, toid);
			pstmt.setString(2, fromid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
	}
}
