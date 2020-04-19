package any_community.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import any_community.vo.CommunityBean;

public class CommunityDAO {

	private CommunityDAO() {
	}

	private static CommunityDAO instance = new CommunityDAO();

	public static CommunityDAO getInstance() {
		return instance;
	}

	Connection con = null;

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 글쓰기
	public int writeArticle(CommunityBean cb) {
		int insertCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO any_community VALUES (null,?,?,?,?,?,now())";
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
			String sql = "SELECT COUNT(*) FROM any_community";
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
	public ArrayList<CommunityBean> selectArticleList(int page, int limit) {
		ArrayList<CommunityBean> articleList = new ArrayList<CommunityBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * 10;
		
		try {
			String sql = "SELECT *, time(date) AS time FROM any_community ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommunityBean cb = new CommunityBean();
				cb.setNum(rs.getInt("num"));
				cb.setNickname(rs.getString("nickname"));
				cb.setSubject(rs.getString("subject"));
				cb.setContent(rs.getString("content"));
				cb.setReadcount(rs.getInt("readcount"));
				cb.setFile(rs.getString("file"));
				cb.setDate(rs.getDate("date"));
				cb.setTime(rs.getString("time"));
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

	// 조회수 증가
	public int updateReadcount(int num) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE any_community SET readcount=readcount+1 WHERE num=?";
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
	
	// 글 상세보기
	public CommunityBean selectArticle(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CommunityBean cb = null;
		
		try {
			String sql = "SELECT *, time(date) AS time FROM any_community WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cb = new CommunityBean();
				cb.setNum(rs.getInt("num"));
				cb.setNickname(rs.getString("nickname"));
				cb.setSubject(rs.getString("subject"));
				cb.setContent(rs.getString("content"));
				cb.setReadcount(rs.getInt("readcount"));
				cb.setFile(rs.getString("file"));
				cb.setDate(rs.getDate("date"));
				cb.setTime(rs.getString("time"));
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
	public int updateArticle(CommunityBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE any_community SET subject=?,content=? where num=?";
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
			String sql = "DELETE FROM any_community WHERE num=?";
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

	// 동일 게시물에대한 추천여부 체크
	public int recCheck(int num, String nickname) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT count(*) FROM any_rec WHERE post_num=? and nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nickname);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	// 추천
	public int recUpdate(int num, String nickname) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		
		try {
			String sql = "INSERT INTO any_rec VALUES(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nickname);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	// 추천 취소
	public int recDelete(int num, String nickname) {
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		
		try {
			String sql = "DELETE FROM any_rec WHERE post_num=? and nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nickname);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}

	// 추천수 구하기
	public int recCount(int num) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT count(*) FROM any_rec WHERE post_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return count;
	}
	


	

	


}
