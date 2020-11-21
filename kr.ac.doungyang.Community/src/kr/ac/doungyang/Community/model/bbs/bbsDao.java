package kr.ac.doungyang.Community.model.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class bbsDao {
	private Connection conn;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public bbsDao() {
		
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
	
	public int getRecode(String columnn, String major) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT COUNT(*)").append(" FROM bbs1 where ").append(columnn).append("= ?").append(" AND available = 1");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
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
	
	public int getSearchRecodeNum(String major, String id) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT COUNT(*)").append(" FROM bbs1 where major= ?").append(" AND id= ?").append(" AND available = 1");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
			pstmt.setString(2, id);
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
	
	public int getBestRecode(String major) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT COUNT(*)").append(" FROM bbs1 where").append(" major = ?").append(" AND recomm >= 10").append(" AND available = 1");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
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
	
	public int getCertifiedRecode(String major) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT COUNT(*)").append(" FROM bbs1 where").append(" major = ?").append(" AND lookup >= 10").append(" AND available = 1");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
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
	
	public int getNext(int number, String major) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT num").append(" FROM bbs1 where num =").append(" (SELECT min(num)").append(" FROM bbs1 where num").append(" > ?")
		.append(" AND major = ?").append(" AND available = 1)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			pstmt.setString(2, major);
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
	
	public int getPre(int number, String major) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT num").append(" FROM bbs1 where num =").append(" (SELECT max(num)").append(" FROM bbs1 where num").append(" < ?")
		.append(" AND major = ?").append(" AND available = 1)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			pstmt.setString(2, major);
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
	
	public String getMajor(int number) {
		String major = null;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT major").append(" FROM bbs1 where num = ?").append(" AND available = 1");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				major = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return major;
	}
	
	public int getUserRecode(String userId) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT COUNT(*)").append(" FROM bbs1 where id = ?").append(" AND available = 1");
		
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
	
	public int getSearchRecode(String search, String major) {
		int count = 0;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT COUNT(*)").append(" FROM bbs1").append(" WHERE title like ?").append(" AND available = 1").append(" AND major=?")
		.append(" OR content like ?").append(" AND available = 1").append(" AND major=?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, major);
			pstmt.setString(3, "%"+search+"%");
			pstmt.setString(4, major);
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
	
	public ArrayList<bbsDto> getMain(String major){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE major=? AND available = 1").append(" ORDER BY num DESC").append(" LIMIT 5");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				bDto.setDis(rs.getInt("dis"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<bbsDto> getBbsList(int page, String major){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		int startRow = (page - 1) * 20;
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE major=? AND available = 1").append(" ORDER BY num DESC").append(" LIMIT ?, 20");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				bDto.setDis(rs.getInt("dis"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<bbsDto> getMyBbsList(int page, String id){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		int startRow = (page - 1) * 20;
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE id=? AND available = 1").append(" ORDER BY num DESC").append(" LIMIT ?, 20");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<bbsDto> getMyBbsList(int page, String id, String major){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		int startRow = (page - 1) * 20;
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE id=?").append(" AND available = 1").append(" AND major = ?")
		.append(" ORDER BY num DESC").append(" LIMIT ?, 20");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, major);
			pstmt.setInt(3, startRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<bbsDto> getBestList(int page, String major){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		int startRow = (page - 1) * 20;
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE major=? AND available = 1").append(" AND recomm >= 10").
		append(" ORDER BY num DESC").append(" LIMIT ?, 20");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				bDto.setDis(rs.getInt("dis"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<bbsDto> getCertifiedList(int page, String major){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		int startRow = (page - 1) * 20;
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE major=? AND available = 1").append(" AND lookup >= 100").
		append(" ORDER BY num DESC").append(" LIMIT ?, 20");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, major);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				bDto.setDis(rs.getInt("dis"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public bbsDto getMyCommentList(int number){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		bbsDto bDto = new bbsDto();
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE num = ? AND available = 1").append(" ORDER BY num DESC");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				return bDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public ArrayList<bbsDto> getSearchBbs(int page, String search, String major){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		int startRow = (page - 1) * 20;
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE title like ? AND available = 1  AND major = ?").append(" OR content like ?").append(" AND available = 1")
		.append(" AND major = ?")
		.append(" ORDER BY num DESC").append(" LIMIT ?, 20");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, major);
			pstmt.setString(3, "%"+search+"%");
			pstmt.setString(4, major);
			pstmt.setInt(5, startRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				bDto.setDis(rs.getInt("dis"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public int write(bbsDto bDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO").append(" bbs1 VALUES").append("(0, ?, ?, ?, ?, ?, now(), 0, 0, 0, 0, 1)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, bDto.getId());
			pstmt.setString(2, bDto.getClassType());
			pstmt.setString(3, bDto.getMajor());
			pstmt.setString(4, bDto.getTitle());
			pstmt.setString(5, bDto.getContent());
			result = pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public bbsDto read(int number){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		bbsDto bDto = new bbsDto();
		
		query.append("SELECT *").append(" FROM bbs1").append(" WHERE num = ?").append(" AND available = 1");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setClassType(rs.getString("class"));
				bDto.setMajor(rs.getString("major"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setComments(rs.getInt("comments"));
				bDto.setLookup(rs.getInt("lookup"));
				bDto.setRecomm(rs.getInt("recomm"));
				bDto.setDis(rs.getInt("dis"));
				return bDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public int update(bbsDto bDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE bbs1").append(" SET class=?").append(", title=?, content=?, date=now()").append(" where num = ? and id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, bDto.getClassType());
			pstmt.setString(2, bDto.getTitle());
			pstmt.setString(3, bDto.getContent());
			pstmt.setInt(4, bDto.getNum());
			pstmt.setString(5, bDto.getId());
			result = pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public void userDelete(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE bbs1").append(" SET available = 0").append(" WHERE id = ?");
		
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
	
	public int delete(int number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE bbs1").append(" SET available = 0").append(" WHERE num = ?");
		
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
	
	public void lookup(int number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE bbs1").append(" SET lookup = lookup+1").append(" WHERE num = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
	
	public void recommed(String number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE bbs1").append(" SET recomm = recomm+1").append(" WHERE num = ?");
		
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
	
	public void disRecommed(String number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE bbs1").append(" SET dis = dis-1").append(" WHERE num = ?");
		
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
	
	public void comment(int number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE bbs1").append(" SET comments = comments+1").append(" WHERE num = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
	
	public void disComment(int number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE bbs1").append(" SET comments = comments-1").append(" WHERE num = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
	
	public int exist(int number) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("SELECT * FROM").append(" bbs1").append(" WHERE num = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = 1;
			else
				result = 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result; 
	}
}
