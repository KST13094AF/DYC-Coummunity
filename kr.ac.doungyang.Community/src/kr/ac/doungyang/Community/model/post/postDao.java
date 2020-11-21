package kr.ac.doungyang.Community.model.post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class postDao {
	private Connection conn;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public postDao() {
		
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
	
	public ArrayList<postDto> recivePost(String id, int limit) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<postDto> list = new ArrayList<>();
		query.append("SELECT * FROM").append(" (SELECT * FROM post").append(" WHERE (fromid, date) in").append(" (SELECT fromid, max(date)")
		.append(" as date from post").append(" WHERE toid=?").append(" AND available = 1").append(" GROUP BY fromid)").append(" ORDER BY date DESC)t")
		.append(" GROUP BY t.fromid").append(" limit ?");;
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				postDto pDto = new postDto();
				pDto.setNum(rs.getInt("num"));
				pDto.setToid(rs.getString("toid"));
				pDto.setFromid(rs.getString("fromid"));
				pDto.setContent(rs.getString("content"));
				pDto.setDate(rs.getTimestamp("date"));
				pDto.setLook(rs.getInt("look"));
				list.add(pDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<postDto> sendPost(String id, int limit) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<postDto> list = new ArrayList<>();
		query.append("SELECT * FROM").append(" (SELECT * FROM post").append(" WHERE (toid, date) in").append(" (SELECT toid, max(date)")
		.append(" as date from post").append(" WHERE fromid=?").append(" AND available = 1").append(" GROUP BY toid)").append(" ORDER BY date DESC)t")
		.append(" GROUP BY t.toid").append(" limit ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				postDto pDto = new postDto();
				pDto.setNum(rs.getInt("num"));
				pDto.setToid(rs.getString("toid"));
				pDto.setFromid(rs.getString("fromid"));
				pDto.setContent(rs.getString("content"));
				pDto.setDate(rs.getTimestamp("date"));
				pDto.setLook(rs.getInt("look"));
				list.add(pDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<postDto> userPost(String toid, String fromid) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<postDto> list = new ArrayList<>();
		query.append("SELECT * FROM").append(" post WHERE toid=?").append(" AND fromid=? AND available=1").append(" OR toid=? AND fromid=? AND available=1");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, toid);
			pstmt.setString(2, fromid);
			pstmt.setString(3, fromid);
			pstmt.setString(4, toid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				postDto pDto = new postDto();
				pDto.setNum(rs.getInt("num"));
				pDto.setToid(rs.getString("toid"));
				pDto.setFromid(rs.getString("fromid"));
				pDto.setContent(rs.getString("content"));
				pDto.setDate(rs.getTimestamp("date"));
				pDto.setLook(rs.getInt("look"));
				list.add(pDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public int writePost(postDto pDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO post").append(" VALUES(0, ?, ?, ?, now(), 1, 1)");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, pDto.getToid());
			pstmt.setString(2, pDto.getFromid());
			pstmt.setString(3, pDto.getContent());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public void readPost(String toid, String fromid) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE post").append(" SET look = 0").append(" WHERE toid = ? AND fromid = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, toid);
			pstmt.setString(2, fromid);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
	
	public int deletePost(String fromid, int number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE post").append(" SET available = 0").append(" WHERE fromid = ? AND num = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, fromid);
			pstmt.setInt(2, number);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int deletePost(String toid, String fromid) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE post").append(" SET available = 0").append(" WHERE toid = ? AND fromid = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, toid);
			pstmt.setString(2, fromid);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int userDeletePost(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE post").append(" SET available = 0").append(" WHERE toid = ? OR fromid = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
}
