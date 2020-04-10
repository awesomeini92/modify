package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.xml.internal.ws.Closeable;

import member.vo.MemberBean;
import member.vo.SHA256;

import static db.JdbcUtil.*;

public class KakaoDAO {
	private KakaoDAO() {}
	private static KakaoDAO instance = new KakaoDAO();
	public static KakaoDAO getInstance() {
		return instance;
	}
	
	Connection con = null;
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertKakao(MemberBean member) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,null,?,now()";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getEmail());
			pstmt.setInt(5, 0); // CP
			pstmt.setInt(6, 1); // level
			pstmt.setInt(7, 1); // false
			insertCount = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return insertCount;
	}
	
	public int kakaoLogin(MemberBean member) {
		int loginResult = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT password FROM member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(member.getPassword())) {
					loginResult = 1;
				}else {
					loginResult = -1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return loginResult;
	}

	public MemberBean getMember(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean mb = null;
		try {
			String sql = "SELECT * FROM member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mb = new MemberBean();
				mb.setId(rs.getString("id"));
			}
		} catch (Exception e) {
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return mb;
	}


}
