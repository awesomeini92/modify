package coding_free.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import coding_free.vo.CodingFreeBean;

public class CodingFreeDAO {

	private CodingFreeDAO() {
	}

	private static CodingFreeDAO instance = new CodingFreeDAO();

	public static CodingFreeDAO getInstance() {
		return instance;
	}

	Connection con = null;

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 글쓰기
	public int writeArticle(CodingFreeBean cb) {
		int insertCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO coding_free VALUES (null,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cb.getNickname());
			pstmt.setString(2, cb.getSubject());
			pstmt.setString(3, cb.getContent());
			pstmt.setInt(4, 0);
			pstmt.setString(5, cb.getFile());
			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return insertCount;
	}

	// 페이징
	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM coding_free";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}

	// 리스트 가져오기
	public ArrayList<CodingFreeBean> selectArticleList(int page, int limit) {
		ArrayList<CodingFreeBean> articleList = new ArrayList<CodingFreeBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * 10;
		
		try {
			String sql = "SELECT * FROM coding_free ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CodingFreeBean cb = new CodingFreeBean();
				cb.setNum(rs.getInt("num"));
				cb.setNickname(rs.getString("nickname"));
				cb.setSubject(rs.getString("subject"));
				cb.setContent(rs.getString("content"));
				cb.setReadcount(rs.getInt("readcount"));
				cb.setFile(rs.getString("file"));
				cb.setDate(rs.getDate("date"));
				articleList.add(cb);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}

	// 글 상세보기
	public CodingFreeBean selectArticle(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CodingFreeBean cb = null;
		
		try {
			String sql = "SELECT * FROM coding_free WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cb = new CodingFreeBean();
				cb.setNum(rs.getInt("num"));
				cb.setNickname(rs.getString("nickname"));
				cb.setSubject(rs.getString("subject"));
				cb.setContent(rs.getString("content"));
				cb.setReadcount(rs.getInt("readcount"));
				cb.setFile(rs.getString("file"));
				cb.setDate(rs.getDate("date"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return cb;
	}

	// 글 수정
	public int updateArticle(CodingFreeBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE coding_free SET subject=?,content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3, article.getNum());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	// 글 삭제
	public int deleteArticle(int num) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM coding_free WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	// 조회수 증가
	public int updateReadcount(int num) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE coding_free SET readcount=readcount+1 WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
}
