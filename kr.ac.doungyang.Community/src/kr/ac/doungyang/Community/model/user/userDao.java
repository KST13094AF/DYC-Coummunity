package kr.ac.doungyang.Community.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class userDao {
	private Connection conn;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public userDao() {
		
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
	
	/* 회원가입 처리  */
	public int join(userDto user) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO user1").append(" VALUES (?, ?, ?, ?, ?, 0,'noname2.png')");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getNumber());
			pstmt.setString(4, user.getMajor());
			pstmt.setString(5, user.getEmail());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int joinEmail(String email) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT email FROM").append(" user1 eamil = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeJdbc(conn, pstmt, rs);
		}
		return 0;
	}
	
	/* 로그인 처리 */
	public int login(String id, String pw) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT pw").append(" FROM user1").append(" WHERE ID = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("pw").equals(pw))
					result = 1;
				else
					result = 0;
			} else
				result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	/* 비밀번호 찾기 처리 */
	public int getForgetInfo(String id, String email) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT *").append(" FROM user1").append(" WHERE id = ? AND email = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = 1;
			else 
				result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	/* 비밀번호 찾기 비밀번호 변경 처리 */
	public int setForgetInfo(String id, String pw) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE user1").append(" SET pw = ?").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	/* 프로필 파일 이미지 업로드 */
	public int setProfile(String id, String file) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE user1").append(" SET profile = ?").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, file);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	/* 내정보 수정 비밀번호 확인 처리 */
	public int checkPw(String id, String pw) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT pw").append(" FROM user1").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("pw").equals(pw))
					result = 1;
			} else
				result = 0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	/* 내 정보 처리  */
	public userDto getUserInfo(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		userDto uDto = new userDto();
		query.append("SELECT *").append(" FROM user1").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uDto.setId(rs.getString("id"));
				uDto.setMajor(rs.getString("major"));
				uDto.setNumber(rs.getString("number"));
				uDto.setEmail(rs.getString("email"));
				uDto.setManer(rs.getInt("maner"));
				uDto.setProfile(rs.getString("profile"));
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return uDto;
	}
	
	/* 유저 전공 가져오기  */
	public userDto getMajor(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		userDto uDto = new userDto();
		
		query.append("Select major, maner, profile").append(" FROM user1").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uDto.setMajor(rs.getString("major"));
				uDto.setManer(rs.getInt("maner"));
				uDto.setProfile(rs.getString("profile"));
				return uDto;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	/* 유저 프로필사진 가져오기  */
	public String getProfile(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("SELECT profile").append(" FROM user1").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	/* 유저 전공 가져오기  */
	public String getUserMajor(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT major").append(" FROM user1").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString("major");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	/* 유저 좋아요  */
	public void recommed(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE user1").append(" SET maner = maner+1").append(" WHERE id = ?");
		
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
	
	/* 유저 싫어요  */
	public void disRecommed(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("UPDATE user1").append(" SET maner = maner-1").append(" WHERE id = ?");
		
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
	
	/* 유저 프로필  */
	public String getUserProfile(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		query.append("SELECT profile").append(" FROM user1").append(" WHERE id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				return rs.getString("profile");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	/* 회원정보 삭제  */
	public int deleteUser(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("DELETE FROM").append(" user1 where id = ? ");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
}
