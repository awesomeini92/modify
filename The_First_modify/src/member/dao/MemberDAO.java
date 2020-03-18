package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.vo.MemberBean;

import static db.JdbcUtil.*;

public class MemberDAO {
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	// ---------------------------------------------------
	Connection con = null;

	// 메소드 (수정필요)
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int selectLoginMember(MemberBean member) {
		int loginResult = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT password FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // ID 가 존재할 경우
				if(rs.getString(1).equals(member.getPassword())) { // 패스워드가 일치할 경우
					loginResult = 1;
				} else { // 패스워드가 일치하지 않을 경우
					loginResult = -1;
				}
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginResult;
	}

	public int insertMember(MemberBean member) {
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO member VALUES(?,?,?,?,now(),0,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
//			pstmt.setString(3, member.getNickname());
			pstmt.setString(3, member.getId());
			pstmt.setString(4, member.getEmail());
//			pstmt.setInt(5, member.getCp());
//			pstmt.setInt(6, member.getLevel());			
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	
	// 이메일 인증관련 메소드 (수정필요)
	public String getUserEmail(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnetion();
			sql = "SELECT email FROM member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}
	
	public boolean getUserEmailChecked(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnetion();
			sql = "SELECT emailChecked FROM member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getBoolean(1); // 이메일 등록 여부 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}

	public boolean setUserEmailChecked(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnetion();
			sql = "UPDATE member SET emailChecked = true WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true; // 이메일 등록 설정 성공
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 이메일 등록 설정 실패
	}
	
	
}
























