package kr.ac.doungyang.Community.model.coments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class commentDao {
	private Connection conn;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public commentDao() {
		
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
	
	public ArrayList<commentDto> getComments(int bbsId){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<commentDto> list = new ArrayList<commentDto>();
		query.append("SELECT * FROM").append(" comments where bbsid = ?").append(" ORDER BY num");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				commentDto cDto = new commentDto();
				cDto.setNum(rs.getInt("num"));
				cDto.setBbsid(rs.getInt("bbsid"));
				cDto.setId(rs.getString("id"));
				cDto.setDate(rs.getTimestamp("date"));
				cDto.setParent(rs.getInt("parent"));
				cDto.setContents(rs.getString("content"));
				cDto.setRecomm(rs.getInt("recomm"));
				list.add(cDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public commentDto getBestComment(int bbsId){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		commentDto cDto = new commentDto();
		
		query.append("SELECT * FROM").append(" comments where bbsid = ?").append(" AND recomm >= 10").append(" ORDER BY num");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cDto.setNum(rs.getInt("num"));
				cDto.setBbsid(rs.getInt("bbsid"));
				cDto.setId(rs.getString("id"));
				cDto.setDate(rs.getTimestamp("date"));
				cDto.setParent(rs.getInt("parent"));
				cDto.setContents(rs.getString("content"));
				cDto.setRecomm(rs.getInt("recomm"));
				return cDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public int write(commentDto cDto){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("INSERT INTO").append(" comments VALUES").append("(0, ?, ?, now(), ?, ?, 0)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, cDto.getBbsid());
			pstmt.setString(2, cDto.getId());
			pstmt.setInt(3, cDto.getParent());
			pstmt.setString(4, cDto.getContents());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int delete(int number){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("DELETE FROM").append(" comments").append(" WHERE num = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);	
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public void bbsDelete(int number){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("DELETE FROM").append(" comments").append(" WHERE bbsid = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);	
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
	
	public void userDelete(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("DELETE FROM").append(" comments").append(" WHERE id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
	
	public int update(String content, int number){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("UPDATE comments").append(" SET content=?").append(" WHERE num = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, content);
			pstmt.setInt(2, number);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public void recommed(String number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE comments").append(" SET recomm = recomm+1").append(" WHERE num = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
	
	public int getUserComment(String userId) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT COUNT(*)").append(" FROM comments where id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return count;
	}
	
	public ArrayList<commentDto> getBbsId(String userId) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<commentDto> list = new ArrayList<commentDto>();
		
		query.append("SELECT *").append(" FROM comments where id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				commentDto cDto = new commentDto();
				cDto.setNum(rs.getInt("num"));
				cDto.setBbsid(rs.getInt("bbsid"));
				cDto.setId(rs.getString("id"));
				cDto.setDate(rs.getTimestamp("date"));
				cDto.setContents(rs.getString("content"));
				cDto.setRecomm(rs.getInt("recomm"));
				list.add(cDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
}

